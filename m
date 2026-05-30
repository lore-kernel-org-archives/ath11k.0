Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5307CD5BD0
	for <ath11k@archiver.kernel.org>; Sat, 30 May 2026 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dF/ov+B2LMDoBsqviZzmq1HcSMdYOweJxIZb1W1we7g=; b=0ajCHHw26YdXCMY7nDlqZaA2ui
	Gj2tdavOmdy/CZ6dK16AGHcTX1SCImT7hQrysQjbuLo9rDMEUZ8+csv9CGCKYEkDaiym4fEi0TADy
	U46ByFxONlGeEASTxUolNWdslrTyxSjx6Ej/DQC5gbR2vjJcIEf7isYSZRSn3VaQ1KSmd/W4Tkq5L
	1e0W6cXxzhDy8+Wl0j6JLYVuOQHiiOSVYRwG/LoZR3JP1dpHw2WVMWKzXIWTO+SWnE0nwirh2D9ed
	p9IZitEXhURiBYzKjHE/CwZzdG0iAl4T3FxBxAQ7cpHzB6aJAycmJqCQwWHh6n7qruE8PNgh9QPUz
	HK0M9IJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTI5w-00000008hKe-0lqW;
	Sat, 30 May 2026 11:43:12 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTI5t-00000008hJt-01f4
	for ath11k@lists.infradead.org;
	Sat, 30 May 2026 11:43:11 +0000
Received: from ubuntu-jammy.. (unknown [82.22.40.93])
	by mail.ispras.ru (Postfix) with ESMTPSA id 96D8F45F79A1;
	Sat, 30 May 2026 11:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 96D8F45F79A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1780141380;
	bh=dF/ov+B2LMDoBsqviZzmq1HcSMdYOweJxIZb1W1we7g=;
	h=From:To:Cc:Subject:Date:From;
	b=lOKFzkNf+8uNjflP5RmWxBGKR4y+3GuP/z8wn8rBnEXDfIa4oObZuyPSzZw62hsji
	 X3NmxL2roFI5LxSiAg/VipmEnpe3S63An+dKbFl6i8t04lB1K1a7w939NEcWhBeRZk
	 pJ5T7qwFNM8PtnzwjM7D6GvRa5jd4ggbl6Q//OkY=
From: Dmitry Morgun <d.morgun@ispras.ru>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Dmitry Morgun <d.morgun@ispras.ru>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath11k: fix potential buffer underflow in ath11k_hal_rx_msdu_list_get()
Date: Sat, 30 May 2026 11:42:52 +0000
Message-Id: <20260530114252.42615-1-d.morgun@ispras.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_044309_597987_AB6419A5 
X-CRM114-Status: GOOD (  10.70  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

When the first entry in msdu_details has a zero buffer address,
the code accesses msdu_details[i - 1] with i == 0, causing a
buffer underflow.

Fix similarly to ath12k_wifi7_hal_rx_msdu_list_get() by adding
a separate check for i == 0 before the main condition to prevent
the out-of-bounds access.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Dmitry Morgun <d.morgun@ispras.ru>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 2a413e3a0..c9f520c2a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4565,6 +4565,9 @@ static void ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
 	msdu_details = &msdu_link->msdu_link[0];
 
 	for (i = 0; i < HAL_RX_NUM_MSDU_DESC; i++) {
+		if (!i && FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
+				    msdu_details[i].buf_addr_info.info0) == 0)
+			break;
 		if (FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
 			      msdu_details[i].buf_addr_info.info0) == 0) {
 			msdu_desc_info = &msdu_details[i - 1].rx_msdu_info;
-- 
2.34.1


