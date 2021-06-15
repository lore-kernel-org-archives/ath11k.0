Return-Path: <SRS0=wUnC=LJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A4BC48BE5
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E160061350
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E160061350
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mX5mV8j5LvMiAL4cahPTFvyXd5YlR57YuxlMLt6lR4=; b=h0WJCWNwcG5w6P
	UCvPpYrF/z/GZVfqESCpLd2PExWZXZ2ENIXiJc9arJOWr4RJX8mskYOzEO4eNcyEDXuxOscZOmQFZ
	bB9A2J/JZniZPbPz06n1I34yDCpB/C6Z0wKjYduihhZkkpYWJjDgxu1bwMlH4rZueQ4jPYIyJbcJx
	rf3UvwltVm+ZiEdHCjSLAq20BrSfdBsSCDyhK5m5+w0QTLecZh9+LF7jp1kDOTeuSbDqj6VpuCXeq
	UopfS9MbHSn5gIJ0X6w27pt1brlxWnZiToIYyivPs+VhpwrHVkdV2ZoVvQszhJ7B05foeEsxCxw76
	WnGi87dce7vRgWDKuDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHni-003fOs-B2; Tue, 15 Jun 2021 22:44:54 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGOV-00341R-Na
 for ath11k@lists.infradead.org; Tue, 15 Jun 2021 21:14:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623791687; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zIqQOZ4s7YOII1b8KU8ODDrMglqW4IFDBtoWvB5qoYI=;
 b=mf2q/rxCXb12o+4103KQ+2GV5Sf2jDmxTl0XcQqpYQCaHBXXFC8RyzRucOC7imFA/Vo0pBXY
 ixDJw90i3A/nKen5za53cGO5DyeZ6Yr1HT93CvlyvIFCVopCPBb6tiCryLvdVwpyV8+i7iLQ
 kRyMd0pM/v/i0Zuc+zextcDP1mo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60c91846ed59bf69cc370251 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 21:14:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8D6F6C43460; Tue, 15 Jun 2021 21:14:46 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-78-13-nat.elisa-mobile.fi
 [85.76.78.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DE517C43145;
 Tue, 15 Jun 2021 21:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE517C43145
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 07/12] ath11k: add branch predictors in process_rx
Date: Wed, 16 Jun 2021 00:14:02 +0300
Message-Id: <20210615211407.92233-8-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615211407.92233-1-jouni@codeaurora.org>
References: <20210615211407.92233-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_141447_885525_BC314867 
X-CRM114-Status: GOOD (  14.32  )
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

In datapath, add branch predictors where required in the process rx().
This protects high value rx path without having performance overhead.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 3ece90d890e5..6e9338f1b4db 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2540,13 +2540,13 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
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
@@ -2554,7 +2554,7 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 
 	while ((msdu = __skb_dequeue(msdu_list))) {
 		ret = ath11k_dp_rx_process_msdu(ar, msdu, msdu_list);
-		if (ret) {
+		if (unlikely(ret)) {
 			ath11k_dbg(ab, ATH11K_DBG_DATA,
 				   "Unable to process msdu %d", ret);
 			dev_kfree_skb_any(msdu);
@@ -2609,7 +2609,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 		spin_lock_bh(&rx_ring->idr_lock);
 		msdu = idr_find(&rx_ring->bufs_idr, buf_id);
-		if (!msdu) {
+		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d\n",
 				    buf_id);
 			spin_unlock_bh(&rx_ring->idr_lock);
@@ -2628,8 +2628,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
 					desc->info0);
-		if (push_reason !=
-		    HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION) {
+		if (unlikely(push_reason !=
+			     HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
 			dev_kfree_skb_any(msdu);
 			ab->soc_stats.hal_reo_error[dp->reo_dst_ring[ring_id].ring_id]++;
 			continue;
@@ -2664,7 +2664,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	 * head pointer so that we can reap complete MPDU in the current
 	 * rx processing.
 	 */
-	if (!done && ath11k_hal_srng_dst_num_free(ab, srng, true)) {
+	if (unlikely(!done && ath11k_hal_srng_dst_num_free(ab, srng, true))) {
 		ath11k_hal_srng_access_end(ab, srng);
 		goto try_again;
 	}
@@ -2673,7 +2673,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 	spin_unlock_bh(&srng->lock);
 
-	if (!total_msdu_reaped)
+	if (unlikely(!total_msdu_reaped))
 		goto exit;
 
 	for (i = 0; i < ab->num_radios; i++) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
