Return-Path: <SRS0=wUnC=LJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B353CC48BDF
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8648361246
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8648361246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udzDzV4qPrZRdWO9q5S4iM36w05YELzvj1ewoc64VBw=; b=fux0woonicwaty
	cTwDwi2rwCPzfTv1JiZJq+YJMdVr8jsmBs7siHbAa1ZqNDobtknofJexW1BwqwaZrHbzUpFQ3N0zK
	xZCIbgFUDrWN9mPPllRYMP9rixRxX6N+zwFLrZ4oiOGTDgg/tFDXezxIrNoXjW6ufx6HStKpgokea
	caa1zLV8WxiQUgQ8rnaDcicnQV+m71cOjVNaFeo9tfjs8JTWe16Wmg8ZSeateXd/CQtehRrH5M5XO
	Ekm4uv2y9KdT9nwhLoImT7yD3bC4S35caLK9CNfHEepHmhP7zvmJiqmfV56522r3a5P3WFzSK4NMn
	NKStqerE3Jvmxc2qP0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHnt-003fZQ-3p; Tue, 15 Jun 2021 22:45:05 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGOk-0033qk-1r
 for ath11k@lists.infradead.org; Tue, 15 Jun 2021 21:15:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623791702; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=OJzxyJAbKjQ3t8h2kb3Qwx2K1ZliALJEeolpOxZGi/8=;
 b=lcOJ0+6d59K9kb/O+LaFxcY6MX5upF+T29zU0eMANJkWN03JaGC5gMqwdRTUiNL/a4wfpym6
 nSlw0xxf4RaBxLLu2vHHBCDweBsOWuoZ/4hAqHaUre8ENjBNdqr/qTu6DZrCUq+q+eKsZ1um
 ZG/lDJNNDU9KZ9tic/O+If8Zqrs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c91855abfd22a3dcdc5464 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 21:15:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5495CC43460; Tue, 15 Jun 2021 21:15:00 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-78-13-nat.elisa-mobile.fi
 [85.76.78.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 464AAC4338A;
 Tue, 15 Jun 2021 21:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 464AAC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 12/12] ath11k: avoid unnecessary lock contention in
 tx_completion path
Date: Wed, 16 Jun 2021 00:14:07 +0300
Message-Id: <20210615211407.92233-13-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615211407.92233-1-jouni@codeaurora.org>
References: <20210615211407.92233-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_141502_389105_D51BD584 
X-CRM114-Status: GOOD (  13.69  )
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

From: P Praneesh <ppranees@codeaurora.org>

Lock is not needed for the readable idr operation, so avoid spin_lock_bh
for the idr_find() call. No need to disable the bottom half preempt if
it is already in bottom half context, so modify the spin_lock_bh to
spin_lock in the data tx completion handler.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2

Co-developed-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index ab9ccf0eb274..659f9d98bc0c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -288,19 +288,18 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	struct sk_buff *msdu;
 	struct ath11k_skb_cb *skb_cb;
 
-	spin_lock_bh(&tx_ring->tx_idr_lock);
 	msdu = idr_find(&tx_ring->txbuf_idr, msdu_id);
-	if (!msdu) {
+	if (unlikely(!msdu)) {
 		ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 			    msdu_id);
-		spin_unlock_bh(&tx_ring->tx_idr_lock);
 		return;
 	}
 
 	skb_cb = ATH11K_SKB_CB(msdu);
 
+	spin_lock(&tx_ring->tx_idr_lock);
 	idr_remove(&tx_ring->txbuf_idr, msdu_id);
-	spin_unlock_bh(&tx_ring->tx_idr_lock);
+	spin_unlock(&tx_ring->tx_idr_lock);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 	dev_kfree_skb_any(msdu);
@@ -320,12 +319,10 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	struct ath11k_skb_cb *skb_cb;
 	struct ath11k *ar;
 
-	spin_lock_bh(&tx_ring->tx_idr_lock);
 	msdu = idr_find(&tx_ring->txbuf_idr, ts->msdu_id);
 	if (unlikely(!msdu)) {
 		ath11k_warn(ab, "htt tx completion for unknown msdu_id %d\n",
 			    ts->msdu_id);
-		spin_unlock_bh(&tx_ring->tx_idr_lock);
 		return;
 	}
 
@@ -334,8 +331,9 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 
 	ar = skb_cb->ar;
 
+	spin_lock(&tx_ring->tx_idr_lock);
 	idr_remove(&tx_ring->txbuf_idr, ts->msdu_id);
-	spin_unlock_bh(&tx_ring->tx_idr_lock);
+	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
@@ -584,16 +582,16 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			continue;
 		}
 
-		spin_lock_bh(&tx_ring->tx_idr_lock);
 		msdu = idr_find(&tx_ring->txbuf_idr, msdu_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 				    msdu_id);
-			spin_unlock_bh(&tx_ring->tx_idr_lock);
 			continue;
 		}
+
+		spin_lock(&tx_ring->tx_idr_lock);
 		idr_remove(&tx_ring->txbuf_idr, msdu_id);
-		spin_unlock_bh(&tx_ring->tx_idr_lock);
+		spin_unlock(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
