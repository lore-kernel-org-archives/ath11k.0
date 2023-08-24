Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32C1C3DA6F
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 07:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c9d8DsYTqFrjKgruJHKW6c4pgG5TTgNeChA77Da2Ehg=; b=KCjTjPKEk4Th+c
	5q38L6f7L4idscA1Vji8HkmEp3l1enI5CM2Ja4tnaoU3n7DLYngcrPhWx65TjnRa1eKig8Zl4mIRZ
	G68l8JnZS0xQRBj7M5tvVaNzuBMYQmY2E6R3Bhj8xPXXYU8McgpcO8XcPWj2DjE7q1LI0XT5g4hHt
	OKl/qVykWVdXkKafjS+qssYJlOD1GXXamQystEpQOqsJM0+LhcIRxXV5zOnji4/rFAEpzojuUTJ4A
	DrpfVXwx2fJRrqgo59cXJlSqiDn9p3haQcVeu+GJiVV86Y5+bJ2RsNa50kNTXdJd5/mxz/huFCVaW
	bvpAr4uq4z3jj9NhpUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5BF-002TQx-2c;
	Thu, 24 Aug 2023 07:55:01 +0000
Received: from forward100c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5BB-002TPZ-0Y
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 07:55:00 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1e2b:0:640:94b5:0])
	by forward100c.mail.yandex.net (Yandex) with ESMTP id BC170600E1;
	Thu, 24 Aug 2023 10:54:50 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id nsFdET9WwmI0-GTj9EgxE;
	Thu, 24 Aug 2023 10:54:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692863690;
	bh=gRxIt5Uc0nHGnrNXrZxMBAiIJgwTs4LCIPesCrXLLdY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=jAIcYWqMJU2dYQ4uxo6zyyzgGClzws7W3ZNuwpf3h6Fx1gq1csdF28/xsTLg12FEb
	 CtYsOhB+k18Vxibb3oUBgxddU1voo/QnlKmf7VQhsRmqo1KnVvG1pCemfik61q9qEi
	 fQbU7NYlruEqmgzQEiAJkclTcVnH+P9KvfEbP80g=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath11k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/5] wifi: ath11k: drop redundant check in ath11k_dp_rx_mon_dest_process()
Date: Thu, 24 Aug 2023 10:50:44 +0300
Message-ID: <20230824075121.121144-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_005458_566950_10F8EAA3 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

In 'ath11k_dp_rx_mon_dest_process()', 'mon_dst_srng' points to
a member of 'srng_list', which is a fixed-size array inside
'struct ath11k_hal'. This way, if 'ring_id' is valid (i. e.
between 0 and HAL_SRNG_RING_ID_MAX - 1 inclusive), 'mon_dst_srng'
can't be NULL and so relevant check may be dropped.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 1e488eed282b..3f315547878a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5097,13 +5097,6 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
 
 	mon_dst_srng = &ar->ab->hal.srng_list[ring_id];
 
-	if (!mon_dst_srng) {
-		ath11k_warn(ar->ab,
-			    "HAL Monitor Destination Ring Init Failed -- %p",
-			    mon_dst_srng);
-		return;
-	}
-
 	spin_lock_bh(&pmon->mon_lock);
 
 	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
