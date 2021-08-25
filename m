Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1E7C4320A
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76194610CE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76194610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZubOVYYJv1p0aE3FEfDsag/YS97tyrI0NNOtUgErTnY=; b=IXKpL6iEFOqHxE
	E9V0D+Ygxl3lzDXt3pJnyDs5gTf8yvPvjFo0eb9NOJBydOrpeaNU6/9Bip0nrY4YPcTneb4qamiS4
	FzQdr+Xnsl0/LbEWX+8+JciM+/wl6R6gZ9dGfgo7RrmISolEUpJM+FI2dGiZrlDzYNY62CceOlDDh
	O9OhXAFJ563JDkhXR9geONH7HnTK0DvuCIS+gpe35EDiPW1+9BfXxsjXlX39szMHaZXJSk9c9SIhz
	yHnNO81o4qpyzMzvRlxRDfpaOT3Nq8gZ2PqRxJPg2Mpi/de1P6MXR87J0QGharK+tKevW1SXzNZ8i
	VQQ+X361jNlJchrqF30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpNr-006BEH-Fc; Wed, 25 Aug 2021 09:39:47 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpNZ-006AjK-4I
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 09:39:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629884371; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rRhc9UiQlQEzgehQC70OG6a+Apmw4TczCeFXF3SHDLM=;
 b=ne90o+QlRQ4H3jFJ9idc7Sen3ihrMs6G4zoesk2nNHdbgIdWok5eWelJ/9XicHnsLa6JZ1TM
 CvvuJErEYXuB4mTCwzxHfsGLF5mFMFKWLabc8owi48LYZbaLMtzlGAtOO+S6VEoY+k8YOwnU
 UzYkMEi8Wo/RbZQ7SE3rkK1sIjA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61260fc64d644b7d1c88772e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Aug 2021 09:39:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AB7C3C4361C; Wed, 25 Aug 2021 09:39:18 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E40F1C43616;
 Wed, 25 Aug 2021 09:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E40F1C43616
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
Subject: [PATCH v2 12/12] ath11k: avoid unnecessary lock contention in
 tx_completion path
Date: Wed, 25 Aug 2021 15:07:57 +0530
Message-Id: <1629884277-18759-13-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_023932_151744_A6B31574 
X-CRM114-Status: GOOD (  12.66  )
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

Avoid unnecessary idr_find calls before the idr_remove calls.
Because idr_remove gives the valid ptr if id is valid otherwise
return NULL ptr. So removed the idr_find before idr_remove in tx
completion path. Also no need to disable the bottom half preempt
if it is already in the bottom half context, so modify the
spin_lock_bh to spin_lock in the data tx completion path.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2

Co-developed-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index ab9ccf0..3e0efad 100644
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
 
@@ -584,16 +580,15 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			continue;
 		}
 
-		spin_lock_bh(&tx_ring->tx_idr_lock);
-		msdu = idr_find(&tx_ring->txbuf_idr, msdu_id);
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
