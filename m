Return-Path: <SRS0=LT8G=NY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA1EC432BE
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E2160FC0
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12E2160FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRyEFsLt3REa7Ssprt7jnJhNv8rlHoBzbciXkUxWYDY=; b=H2bm0bmeHKsXr0
	q/ecnBcg8o6VL4wBuxU0WgA7Pw0PQiAphU0WhGMz3+7sXM8h9K7+x18tXmNJQS+zedKZz9j/E4ci9
	CoHrYZNDBiyuNXXynXudjClWBVsaCKn4ymJJ6JpzQu6zPYi0bwZNpl+FkUdDT7hdet9EK5oCf80M8
	8jiX0PJkAVFizUIaYG73EYOcERS6RPQI+7Dhd0b8yoAK4LlGaRvlu2rCc0NcIwPcwFbbfrcsQVtw/
	jOGUZmpKSqMK5YTB8JgN3VZTHGBUF/53AIhIOy18KFdbeVXLRKXugj/RKmpfIgX2/lhPq5BpQWfvD
	Jj4eO3HDKxLOHW8HTKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfNm-008ZHX-5L; Thu, 02 Sep 2021 05:35:26 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfNf-008Ytm-FF
 for ath11k@lists.infradead.org; Thu, 02 Sep 2021 05:35:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630560920; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=W7rFEcH37IDpOVDKlM3eyR7PAzy8WsNeHhyvYN4n3U8=;
 b=xfDJ1raWEistbtvAMjYM8uKO0ZOEi0cPVQcHOikytU0u00xsUDLYeAtWcnGYF21i3eJ3Ifdb
 kmZjEJ2aaHAeYV13rd8lhfe3KDhdEk/JQZ2n1gZCKqek7KXlx2OLFfzspLZgwENLsZgoKu3T
 tOm8Q+bFo3Koq72cCnxKhSyeado=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6130629140d2129ac13b1720 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 05:35:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 33B85C4360D; Thu,  2 Sep 2021 05:35:13 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CF87C4361A;
 Thu,  2 Sep 2021 05:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3CF87C4361A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v3 12/12] ath11k: avoid unnecessary lock contention in
 tx_completion path
Date: Thu,  2 Sep 2021 11:03:40 +0530
Message-Id: <1630560820-21905-13-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
References: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223520_882208_C18FF50A 
X-CRM114-Status: GOOD (  13.19  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Avoid unnecessary idr_find calls before the idr_remove calls. Because
idr_remove gives the valid ptr if id is valid otherwise return NULL ptr.
So removed the idr_find before idr_remove in tx completion path. Also no
need to disable the bottom half preempt if it is already in the
bottom half context, so modify the spin_lock_bh to spin_lock in the
data tx completion path.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2

Co-developed-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 602184b..05bd86f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -288,20 +288,18 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	struct sk_buff *msdu;
 	struct ath11k_skb_cb *skb_cb;
 
-	spin_lock_bh(&tx_ring->tx_idr_lock);
-	msdu = idr_find(&tx_ring->txbuf_idr, msdu_id);
-	if (!msdu) {
+	spin_lock(&tx_ring->tx_idr_lock);
+	msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
+	spin_unlock(&tx_ring->tx_idr_lock);
+
+	if (unlikely(!msdu)) {
 		ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 			    msdu_id);
-		spin_unlock_bh(&tx_ring->tx_idr_lock);
 		return;
 	}
 
 	skb_cb = ATH11K_SKB_CB(msdu);
 
-	idr_remove(&tx_ring->txbuf_idr, msdu_id);
-	spin_unlock_bh(&tx_ring->tx_idr_lock);
-
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	dev_kfree_skb_any(msdu);
 
@@ -320,12 +318,13 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	struct ath11k_skb_cb *skb_cb;
 	struct ath11k *ar;
 
-	spin_lock_bh(&tx_ring->tx_idr_lock);
-	msdu = idr_find(&tx_ring->txbuf_idr, ts->msdu_id);
+	spin_lock(&tx_ring->tx_idr_lock);
+	msdu = idr_remove(&tx_ring->txbuf_idr, ts->msdu_id);
+	spin_unlock(&tx_ring->tx_idr_lock);
+
 	if (unlikely(!msdu)) {
 		ath11k_warn(ab, "htt tx completion for unknown msdu_id %d\n",
 			    ts->msdu_id);
-		spin_unlock_bh(&tx_ring->tx_idr_lock);
 		return;
 	}
 
@@ -334,9 +333,6 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 
 	ar = skb_cb->ar;
 
-	idr_remove(&tx_ring->txbuf_idr, ts->msdu_id);
-	spin_unlock_bh(&tx_ring->tx_idr_lock);
-
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
 
@@ -579,16 +575,16 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			continue;
 		}
 
-		spin_lock_bh(&tx_ring->tx_idr_lock);
-		msdu = idr_find(&tx_ring->txbuf_idr, msdu_id);
+		spin_lock(&tx_ring->tx_idr_lock);
+		msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 				    msdu_id);
-			spin_unlock_bh(&tx_ring->tx_idr_lock);
+			spin_unlock(&tx_ring->tx_idr_lock);
 			continue;
 		}
-		idr_remove(&tx_ring->txbuf_idr, msdu_id);
-		spin_unlock_bh(&tx_ring->tx_idr_lock);
+
+		spin_unlock(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
