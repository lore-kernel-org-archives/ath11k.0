Return-Path: <SRS0=PBC3=O2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D3AC433F5
	for <ath11k@archiver.kernel.org>; Wed,  6 Oct 2021 10:55:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B81EF610C7
	for <ath11k@archiver.kernel.org>; Wed,  6 Oct 2021 10:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B81EF610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pt1udPOPcdqgMTIP0MnPDZJlIbIHvKl+viWKcn+kp9o=; b=JZEhl9ztNIMN/9
	aL2qpVuRHroTbR1OvMzV3FnoALPPAhZdXnKNgCWJqKWYgA+ca5PJp87UxcskSRQb/WnI+2QrPXdHW
	kVc6GIahmJk5eoATeSvUNBHF9jXav8PoxvdCXSiwhaCqiu49CR8wWhdEaqtgEo7rlRTAaQQOkdtrg
	rjpZ4uCdKJweMSAApKB/5NwFdSTbQAIGyhjcQjfxJ6K4bib4YnY0HxGC4NSGcff4x6eyARzSPBQbb
	GZLP09WeZjlxuFQvheT11zCoubn+QSNiFD6TKqveLR4K4IlGbVZIth/W1h4ec29J7vuFHKA/YFNFV
	Q7FU7qZXwHEtWOG/+v4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY4aE-00Dujt-Aq; Wed, 06 Oct 2021 10:55:34 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY4aC-00Duj6-99
 for ath11k@lists.infradead.org; Wed, 06 Oct 2021 10:55:33 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 16B823FFE5; 
 Wed,  6 Oct 2021 10:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633517730;
 bh=8iImzst3oOFXm9Ridza0PRSEBpaLF5YlJ5ZO5d+yCY0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=eVGkOwC/tJzoy7QmH2ZnvQG/p4Wv1R6BDazR8DhPxXur8GhKxFh5IYb4bjUC6nTHE
 l3PpoHoIgwufhajOGbxSBzmVT7YOGCCHV3LtqCfSkPqdZaa6JMjlWeptir81ksbg8q
 7okq/Y0A3XbAUwgRIw3Le6GbuZmWfqSAtLQ1GKsvedYBqLMZS/MYLHcHoPrxyFc1eN
 7s7SwDq19Z5rW5N78M5f24T2cxR5I31fsDPOubH/Q5L7i/kP5PoKgAnrkasTrVsX/j
 AQvEjTtPTq5CZo40v/duepkPStREF9a87GcwwxGyu8U3wt5gXW4LxtSNMKOuYB2QmQ
 MGleUrP35rXSg==
From: Colin King <colin.king@canonical.com>
To: Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Anilkumar Kolli <akolli@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ath11k: Remove redundant assignment to variable fw_size
Date: Wed,  6 Oct 2021 11:55:29 +0100
Message-Id: <20211006105529.1011239-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_035532_479607_F9B44051 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Colin Ian King <colin.king@canonical.com>

Variable fw_size is being assigned a value that is never read and
being re-assigned a new value in the next statement. The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Fixes: 336e7b53c82f ("ath11k: clean up BDF download functions")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 8c615bc788ca..fa73118de6db 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2135,7 +2135,6 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
 
-	fw_size = bd.len;
 	fw_size = min_t(u32, ab->hw_params.fw.board_size, bd.len);
 
 	ret = ath11k_qmi_load_file_target_mem(ab, bd.data, fw_size, bdf_type);
-- 
2.32.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
