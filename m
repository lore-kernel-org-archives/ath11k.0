Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44043C432BE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE16610CE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BE16610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvW367gSOkTENn72G0u9evFfPs2H+MRHF4yrh32Jzqs=; b=p1TVzOVk3wyiks
	aeIoIFTW0NmhPHxb3QRuN/OFZMCwVY9NiiGJPVDPVqY1JSqNLZ3semdlll9VpY5sbxHk6snli/Hxn
	t5frIVUFGe9goEMQTKMORTl3+0wiHTFk0QFuF8IOREnitGn2vZ+jvvulwZlROVwUPKxzu9vKWzcMI
	QnYJ+idfhUc2Ke132rOWUe3E9YCVRcwTHe/yEgW5UzFhUENmfhka5G1KA+coHhqys5Uuv/5BHDENF
	IirnRPRUOXVcB1GE/Cri651sEJzxrm5fKjMcROUiJjWeX5DP13Xuz8q+hwQDwetKrqnpsro63ZfmB
	esK376dYZXoBaSbO9vfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpNJ-006Apj-VJ; Wed, 25 Aug 2021 09:39:13 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpNC-006Ala-3K
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 09:39:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629884349; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Wop+K36uB00RQ8N8wL7zesMhmTejxin3L+U++FK+EC0=;
 b=YA+DwN2pbu05+zTOIATE53IWQAygR4ONQmRqOZkrElVSFxj2y5jyGDJjx1ZeHOqQP6Lr8vhe
 rbjbtZweoO+ho4UZ4RQQ2xeXvBEksOA0Zy9nG1rsaVpXx0GdqjQFkbDH0uP2/yl/aaDa55AP
 lOVpui9BzvFP4jxplnEXzfEFlWk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61260fb8fc1f4cb69232fc97 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Aug 2021 09:39:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 595DBC43617; Wed, 25 Aug 2021 09:39:04 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5805DC4361A;
 Wed, 25 Aug 2021 09:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5805DC4361A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v2 07/12] ath11k: add branch predictors in process_rx
Date: Wed, 25 Aug 2021 15:07:52 +0530
Message-Id: <1629884277-18759-8-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_023909_188879_DAF8D418 
X-CRM114-Status: GOOD (  13.01  )
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

In datapath, add branch predictors where required in the process rx().
This protects high value rx path without having performance overhead.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index e105bdc..5d805881 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2535,13 +2535,13 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 	rcu_read_lock();
 
 	ar = ab->pdevs[mac_id].ar;
-	if (!rcu_dereference(ab->pdevs_active[mac_id])) {
+	if (unlikely(!rcu_dereference(ab->pdevs_active[mac_id]))) {
 		__skb_queue_purge(msdu_list);
 		rcu_read_unlock();
 		return;
 	}
 
-	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+	if (unlikely(test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags))) {
 		__skb_queue_purge(msdu_list);
 		rcu_read_unlock();
 		return;
@@ -2549,7 +2549,7 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 
 	while ((msdu = __skb_dequeue(msdu_list))) {
 		ret = ath11k_dp_rx_process_msdu(ar, msdu, msdu_list);
-		if (ret) {
+		if (unlikely(ret)) {
 			ath11k_dbg(ab, ATH11K_DBG_DATA,
 				   "Unable to process msdu %d", ret);
 			dev_kfree_skb_any(msdu);
@@ -2604,7 +2604,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 		spin_lock_bh(&rx_ring->idr_lock);
 		msdu = idr_find(&rx_ring->bufs_idr, buf_id);
-		if (!msdu) {
+		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d\n",
 				    buf_id);
 			spin_unlock_bh(&rx_ring->idr_lock);
@@ -2623,8 +2623,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
 					desc->info0);
-		if (push_reason !=
-		    HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
+		if (unlikely(push_reason !=
+			     HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
 			dev_kfree_skb_any(msdu);
 			ab->soc_stats.hal_reo_error[dp->reo_dst_ring[ring_id].ring_id]++;
 			continue;
@@ -2659,7 +2659,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	 * head pointer so that we can reap complete MPDU in the current
 	 * rx processing.
 	 */
-	if (!done && ath11k_hal_srng_dst_num_free(ab, srng, true)) {
+	if (unlikely(!done && ath11k_hal_srng_dst_num_free(ab, srng, true))) {
 		ath11k_hal_srng_access_end(ab, srng);
 		goto try_again;
 	}
@@ -2668,7 +2668,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 	spin_unlock_bh(&srng->lock);
 
-	if (!total_msdu_reaped)
+	if (unlikely(!total_msdu_reaped))
 		goto exit;
 
 	for (i = 0; i < ab->num_radios; i++) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
