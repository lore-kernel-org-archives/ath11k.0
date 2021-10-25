Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA0EC433EF
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 10:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE4661029
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 10:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECE4661029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=icFR3h6lQN+PhiO5Zgs2zlf6JMtOT+anI7f8oodpJ7o=; b=F1HLl9vVZisxt0
	7okxRmNQNn1WaMzg5AwqMAXpsJtGVttWhLMuqEeVH14TgTHfEi/BR7DYz6uDzVdnl5TPGFeBKhn6K
	i7Z2+o0NjP/LIkNDLc4Y2ME9pQHzgebz7TfGWPes6j/yXgYuXijfJr/30bkKUdI1DsH/pggQoqZVu
	onFNSfboTOtFijZhHzxzwQHoISI40rkCu3Bouk8hkfrS/Bq9LgSb1lBl+G65EbecyDqiVCoIFAGhd
	LCkDu/5zR3C0oifxdTCJq1Y9CNOE++VeQy0coQ5RHRiW3KR9bjc6oXRQsAFIPfUCMdJbSSc2ACRbB
	UkOw+FuLeh3aX/TQ8+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mewuP-00G3PJ-7z; Mon, 25 Oct 2021 10:08:49 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mewuL-00G3OB-Cd
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 10:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635156525; x=1666692525;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=A5yz19X0HG7dClTVjBpPyqsAtGRxZsmTtn7aiY/s05E=;
 b=tE54qQVN+jG/R3YLPO2B2/KBzUpJXUbLcVmB3kd3g/d489J2xgq11bHf
 nTF7rfRt4Vmf/5kA6xsDO3IsQVaYUw4PcgEoWvPm4Q4EN1zO5bB+kAdAL
 JA+ysdvNzTF0TDqF9C0u47Wl3M5eOyllgU0iN8IuJ4r3X5pjdpaK2UMcK U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 03:08:43 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 03:08:42 -0700
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 03:08:40 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>, 
 Pravas Kumar Panda <kumarpan@codeaurora.org>
Subject: [PATCH] ath11k: Disabling credit flow for WMI path
Date: Mon, 25 Oct 2021 15:38:14 +0530
Message-ID: <1635156494-20059-1-git-send-email-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_030845_582666_C3045126 
X-CRM114-Status: GOOD (  22.80  )
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

Firmware credit flow control is enabled for WMI control services,
which expects available tokens should be acquired before sending a
command to the target. Also the token gets released when firmware
receives the command.

This credit-based flow limits driver to send WMI command only
when the token available which is causing WMI commands to timeout and
return -EAGAIN, whereas firmware has enough capability to process the
WMI command. To fix this Tx starvation issue, introduce the ability to
disable the credit flow for the WMI path.

The driver sends WMI configuration for disabling credit flow to firmware
by two ways.
	1. By using a global flag
		(HTC_MSG_SETUP_COMPLETE_EX_ID msg type flags)
	2. By using a local flag
		(ATH11K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL = 1 << 3)

Ath11k uses both these configurations to disable credit flow for the
WMI path completely.

Also added a hw_param member for credit flow control by which we can
enable or disable it based on per-target basis. Currently we are disabling
credit flow for IPQ8074, IPQ6018, and QCN9074 as recommended by firmware.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.4.0.1-00330-QCAHKSWPL_SILICONZ-1

Co-developed-by: Pravas Kumar Panda <kumarpan@codeaurora.org>
Signed-off-by: Pravas Kumar Panda <kumarpan@codeaurora.org>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ce.c   | 37 ++++++++++++++----
 drivers/net/wireless/ath/ath11k/ce.h   |  3 +-
 drivers/net/wireless/ath/ath11k/core.c |  5 +++
 drivers/net/wireless/ath/ath11k/htc.c  | 71 +++++++++++++++++++++++++---------
 drivers/net/wireless/ath/ath11k/htc.h  |  9 +++--
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 54 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.h  |  1 +
 8 files changed, 146 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index de8b632..5a7aacc 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -14,6 +14,7 @@ const struct ce_attr ath11k_host_ce_config_ipq8074[] = {
 		.src_nentries = 16,
 		.src_sz_max = 2048,
 		.dest_nentries = 0,
+		.send_cb = ath11k_htc_tx_completion_handler,
 	},
 
 	/* CE1: target->host HTT + HTC control */
@@ -40,6 +41,7 @@ const struct ce_attr ath11k_host_ce_config_ipq8074[] = {
 		.src_nentries = 32,
 		.src_sz_max = 2048,
 		.dest_nentries = 0,
+		.send_cb = ath11k_htc_tx_completion_handler,
 	},
 
 	/* CE4: host->target HTT */
@@ -73,6 +75,7 @@ const struct ce_attr ath11k_host_ce_config_ipq8074[] = {
 		.src_nentries = 32,
 		.src_sz_max = 2048,
 		.dest_nentries = 0,
+		.send_cb = ath11k_htc_tx_completion_handler,
 	},
 
 	/* CE8: target autonomous hif_memcpy */
@@ -89,6 +92,7 @@ const struct ce_attr ath11k_host_ce_config_ipq8074[] = {
 		.src_nentries = 32,
 		.src_sz_max = 2048,
 		.dest_nentries = 0,
+		.send_cb = ath11k_htc_tx_completion_handler,
 	},
 
 	/* CE10: target->host HTT */
@@ -142,6 +146,7 @@ const struct ce_attr ath11k_host_ce_config_qca6390[] = {
 		.src_nentries = 32,
 		.src_sz_max = 2048,
 		.dest_nentries = 0,
+		.send_cb = ath11k_htc_tx_completion_handler,
 	},
 
 	/* CE4: host->target HTT */
@@ -175,6 +180,7 @@ const struct ce_attr ath11k_host_ce_config_qca6390[] = {
 		.src_nentries = 32,
 		.src_sz_max = 2048,
 		.dest_nentries = 0,
+		.send_cb = ath11k_htc_tx_completion_handler,
 	},
 
 	/* CE8: target autonomous hif_memcpy */
@@ -220,6 +226,7 @@ const struct ce_attr ath11k_host_ce_config_qcn9074[] = {
 		.src_nentries = 32,
 		.src_sz_max = 2048,
 		.dest_nentries = 0,
+		.send_cb = ath11k_htc_tx_completion_handler,
 	},
 
 	/* CE4: host->target HTT */
@@ -489,18 +496,32 @@ static struct sk_buff *ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe
 	return skb;
 }
 
-static void ath11k_ce_send_done_cb(struct ath11k_ce_pipe *pipe)
+static void ath11k_ce_tx_process_cb(struct ath11k_ce_pipe *pipe)
 {
 	struct ath11k_base *ab = pipe->ab;
 	struct sk_buff *skb;
+	struct sk_buff_head list;
 
+	__skb_queue_head_init(&list);
 	while (!IS_ERR(skb = ath11k_ce_completed_send_next(pipe))) {
 		if (!skb)
 			continue;
 
 		dma_unmap_single(ab->dev, ATH11K_SKB_CB(skb)->paddr, skb->len,
 				 DMA_TO_DEVICE);
-		dev_kfree_skb_any(skb);
+
+		if ((!pipe->send_cb) || ab->hw_params.credit_flow) {
+			dev_kfree_skb_any(skb);
+			continue;
+		}
+
+		__skb_queue_tail(&list, skb);
+	}
+
+	while ((skb = __skb_dequeue(&list))) {
+		ath11k_dbg(ab, ATH11K_DBG_AHB, "tx ce pipe %d len %d\n",
+			   pipe->pipe_num, skb->len);
+		pipe->send_cb(ab, skb);
 	}
 }
 
@@ -636,7 +657,7 @@ static int ath11k_ce_alloc_pipe(struct ath11k_base *ab, int ce_id)
 	pipe->attr_flags = attr->flags;
 
 	if (attr->src_nentries) {
-		pipe->send_cb = ath11k_ce_send_done_cb;
+		pipe->send_cb = attr->send_cb;
 		nentries = roundup_pow_of_two(attr->src_nentries);
 		desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_SRC);
 		ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
@@ -667,9 +688,10 @@ static int ath11k_ce_alloc_pipe(struct ath11k_base *ab, int ce_id)
 void ath11k_ce_per_engine_service(struct ath11k_base *ab, u16 ce_id)
 {
 	struct ath11k_ce_pipe *pipe = &ab->ce.ce_pipe[ce_id];
+	const struct ce_attr *attr = &ab->hw_params.host_ce_config[ce_id];
 
-	if (pipe->send_cb)
-		pipe->send_cb(pipe);
+	if (attr->src_nentries)
+		ath11k_ce_tx_process_cb(pipe);
 
 	if (pipe->recv_cb)
 		ath11k_ce_recv_process_cb(pipe);
@@ -678,9 +700,10 @@ void ath11k_ce_per_engine_service(struct ath11k_base *ab, u16 ce_id)
 void ath11k_ce_poll_send_completed(struct ath11k_base *ab, u8 pipe_id)
 {
 	struct ath11k_ce_pipe *pipe = &ab->ce.ce_pipe[pipe_id];
+	const struct ce_attr *attr =  &ab->hw_params.host_ce_config[pipe_id];
 
-	if ((pipe->attr_flags & CE_ATTR_DIS_INTR) && pipe->send_cb)
-		pipe->send_cb(pipe);
+	if ((pipe->attr_flags & CE_ATTR_DIS_INTR) && attr->src_nentries)
+		ath11k_ce_tx_process_cb(pipe);
 }
 EXPORT_SYMBOL(ath11k_ce_per_engine_service);
 
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 713f766..8255b6c 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -101,6 +101,7 @@ struct ce_attr {
 	unsigned int dest_nentries;
 
 	void (*recv_cb)(struct ath11k_base *, struct sk_buff *);
+	void (*send_cb)(struct ath11k_base *, struct sk_buff *);
 };
 
 #define CE_DESC_RING_ALIGN 8
@@ -154,7 +155,7 @@ struct ath11k_ce_pipe {
 	unsigned int buf_sz;
 	unsigned int rx_buf_needed;
 
-	void (*send_cb)(struct ath11k_ce_pipe *);
+	void (*send_cb)(struct ath11k_base *, struct sk_buff *);
 	void (*recv_cb)(struct ath11k_base *, struct sk_buff *);
 
 	struct tasklet_struct intr_tq;
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index b0d6922..cbfa62e 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -80,6 +80,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.credit_flow = false,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 	},
 	{
@@ -128,6 +129,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.credit_flow = false,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 	},
 	{
@@ -175,6 +177,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.credit_flow = true,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 	},
 	{
@@ -222,6 +225,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
 		.fix_l1ss = true,
+		.credit_flow = false,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX,
 	},
 	{
@@ -269,6 +273,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
 		.fix_l1ss = false,
+		.credit_flow = true,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 	},
 };
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 54b1d34..6913b74 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -81,6 +81,8 @@ int ath11k_htc_send(struct ath11k_htc *htc,
 	struct ath11k_base *ab = htc->ab;
 	int credits = 0;
 	int ret;
+	bool credit_flow_enabled = (ab->hw_params.credit_flow &&
+				    ep->tx_credit_flow_enabled);
 
 	if (eid >= ATH11K_HTC_EP_COUNT) {
 		ath11k_warn(ab, "Invalid endpoint id: %d\n", eid);
@@ -89,7 +91,7 @@ int ath11k_htc_send(struct ath11k_htc *htc,
 
 	skb_push(skb, sizeof(struct ath11k_htc_hdr));
 
-	if (ep->tx_credit_flow_enabled) {
+	if (credit_flow_enabled) {
 		credits = DIV_ROUND_UP(skb->len, htc->target_credit_size);
 		spin_lock_bh(&htc->tx_lock);
 		if (ep->tx_credits < credits) {
@@ -126,7 +128,7 @@ int ath11k_htc_send(struct ath11k_htc *htc,
 err_unmap:
 	dma_unmap_single(dev, skb_cb->paddr, skb->len, DMA_TO_DEVICE);
 err_credits:
-	if (ep->tx_credit_flow_enabled) {
+	if (credit_flow_enabled) {
 		spin_lock_bh(&htc->tx_lock);
 		ep->tx_credits += credits;
 		ath11k_dbg(ab, ATH11K_DBG_HTC,
@@ -203,23 +205,25 @@ static int ath11k_htc_process_trailer(struct ath11k_htc *htc,
 			break;
 		}
 
-		switch (record->hdr.id) {
-		case ATH11K_HTC_RECORD_CREDITS:
-			len = sizeof(struct ath11k_htc_credit_report);
-			if (record->hdr.len < len) {
-				ath11k_warn(ab, "Credit report too long\n");
-				status = -EINVAL;
+		if (ab->hw_params.credit_flow) {
+			switch (record->hdr.id) {
+			case ATH11K_HTC_RECORD_CREDITS:
+				len = sizeof(struct ath11k_htc_credit_report);
+				if (record->hdr.len < len) {
+					ath11k_warn(ab, "Credit report too long\n");
+					status = -EINVAL;
+					break;
+				}
+				ath11k_htc_process_credit_report(htc,
+								 record->credit_report,
+								 record->hdr.len,
+								 src_eid);
+				break;
+			default:
+				ath11k_warn(ab, "Unhandled record: id:%d length:%d\n",
+					    record->hdr.id, record->hdr.len);
 				break;
 			}
-			ath11k_htc_process_credit_report(htc,
-							 record->credit_report,
-							 record->hdr.len,
-							 src_eid);
-			break;
-		default:
-			ath11k_warn(ab, "Unhandled record: id:%d length:%d\n",
-				    record->hdr.id, record->hdr.len);
-			break;
 		}
 
 		if (status)
@@ -245,6 +249,29 @@ static void ath11k_htc_suspend_complete(struct ath11k_base *ab, bool ack)
 	complete(&ab->htc_suspend);
 }
 
+void ath11k_htc_tx_completion_handler(struct ath11k_base *ab,
+				      struct sk_buff *skb)
+{
+	struct ath11k_htc *htc = &ab->htc;
+	struct ath11k_htc_ep *ep;
+	void (*ep_tx_complete)(struct ath11k_base *, struct sk_buff *);
+	u8 eid;
+
+	eid = ATH11K_SKB_CB(skb)->eid;
+	if (eid >= ATH11K_HTC_EP_COUNT)
+		return;
+
+	ep = &htc->endpoint[eid];
+	spin_lock_bh(&htc->tx_lock);
+	ep_tx_complete = ep->ep_ops.ep_tx_complete;
+	spin_unlock_bh(&htc->tx_lock);
+	if (!ep_tx_complete) {
+		dev_kfree_skb_any(skb);
+		return;
+	}
+	ep_tx_complete(htc->ab, skb);
+}
+
 void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 				      struct sk_buff *skb)
 {
@@ -607,6 +634,11 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 		disable_credit_flow_ctrl = true;
 	}
 
+	if (!ab->hw_params.credit_flow) {
+		flags |= ATH11K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL;
+		disable_credit_flow_ctrl = true;
+	}
+
 	req_msg->flags_len = FIELD_PREP(HTC_SVC_MSG_CONNECTIONFLAGS, flags);
 	req_msg->msg_svc_id |= FIELD_PREP(HTC_SVC_MSG_SERVICE_ID,
 					  conn_req->service_id);
@@ -732,7 +764,10 @@ int ath11k_htc_start(struct ath11k_htc *htc)
 	msg->msg_id = FIELD_PREP(HTC_MSG_MESSAGEID,
 				 ATH11K_HTC_MSG_SETUP_COMPLETE_EX_ID);
 
-	ath11k_dbg(ab, ATH11K_DBG_HTC, "HTC is using TX credit flow control\n");
+	if (ab->hw_params.credit_flow)
+		ath11k_dbg(ab, ATH11K_DBG_HTC, "HTC is using TX credit flow control\n");
+	else
+		msg->flags |= ATH11K_GLOBAL_DISABLE_CREDIT_FLOW;
 
 	status = ath11k_htc_send(htc, ATH11K_HTC_EP_0, skb);
 	if (status) {
diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
index 6c8a469..f429b37 100644
--- a/drivers/net/wireless/ath/ath11k/htc.h
+++ b/drivers/net/wireless/ath/ath11k/htc.h
@@ -83,8 +83,8 @@ enum ath11k_htc_conn_flags {
 	ATH11K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_ONE_HALF      = 0x1,
 	ATH11K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_THREE_FOURTHS = 0x2,
 	ATH11K_HTC_CONN_FLAGS_THRESHOLD_LEVEL_UNITY         = 0x3,
-	ATH11K_HTC_CONN_FLAGS_REDUCE_CREDIT_DRIBBLE    = 1 << 2,
-	ATH11K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL = 1 << 3
+	ATH11K_HTC_CONN_FLAGS_REDUCE_CREDIT_DRIBBLE	    = 0x4,
+	ATH11K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL	    = 0x8,
 };
 
 enum ath11k_htc_conn_svc_status {
@@ -116,6 +116,8 @@ struct ath11k_htc_conn_svc_resp {
 	u32 svc_meta_pad;
 } __packed;
 
+#define ATH11K_GLOBAL_DISABLE_CREDIT_FLOW BIT(1)
+
 struct ath11k_htc_setup_complete_extended {
 	u32 msg_id;
 	u32 flags;
@@ -305,5 +307,6 @@ int ath11k_htc_send(struct ath11k_htc *htc, enum ath11k_htc_ep_id eid,
 struct sk_buff *ath11k_htc_alloc_skb(struct ath11k_base *ar, int size);
 void ath11k_htc_rx_completion_handler(struct ath11k_base *ar,
 				      struct sk_buff *skb);
-
+void ath11k_htc_tx_completion_handler(struct ath11k_base *ab,
+				      struct sk_buff *skb);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 8f92210..7429b49 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -169,6 +169,7 @@ struct ath11k_hw_params {
 	bool supports_suspend;
 	u32 hal_desc_sz;
 	bool fix_l1ss;
+	bool credit_flow;
 	u8 max_tx_ring;
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5ae2ef4..8a33704 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -267,21 +267,39 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 {
 	struct ath11k_wmi_base *wmi_sc = wmi->wmi_ab;
 	int ret = -EOPNOTSUPP;
+	struct ath11k_base *ab = wmi_sc->ab;
 
 	might_sleep();
 
-	wait_event_timeout(wmi_sc->tx_credits_wq, ({
-		ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
+	if (ab->hw_params.credit_flow) {
+		wait_event_timeout(wmi_sc->tx_credits_wq, ({
+			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
+
+			if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH,
+					    &wmi_sc->ab->dev_flags))
+				ret = -ESHUTDOWN;
 
-		if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH, &wmi_sc->ab->dev_flags))
-			ret = -ESHUTDOWN;
+			(ret != -EAGAIN);
+			}), WMI_SEND_TIMEOUT_HZ);
+	} else {
+		wait_event_timeout(wmi->tx_ce_desc_wq, ({
+			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
-		(ret != -EAGAIN);
-	}), WMI_SEND_TIMEOUT_HZ);
+			if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH,
+					    &wmi_sc->ab->dev_flags))
+				ret = -ESHUTDOWN;
+
+			(ret != -ENOBUFS);
+			}), WMI_SEND_TIMEOUT_HZ);
+	}
 
 	if (ret == -EAGAIN)
 		ath11k_warn(wmi_sc->ab, "wmi command %d timeout\n", cmd_id);
 
+	if (ret == -ENOBUFS)
+		ath11k_warn(wmi_sc->ab, "ce desc not available for wmi command %d\n",
+			    cmd_id);
+
 	return ret;
 }
 
@@ -5813,7 +5831,30 @@ static void ath11k_wmi_op_ep_tx_credits(struct ath11k_base *ab)
 static void ath11k_wmi_htc_tx_complete(struct ath11k_base *ab,
 				       struct sk_buff *skb)
 {
+	struct ath11k_pdev_wmi *wmi = NULL;
+	u32 i;
+	u8 wmi_ep_count;
+	u8 eid;
+
+	eid = ATH11K_SKB_CB(skb)->eid;
 	dev_kfree_skb(skb);
+
+	if (eid >= ATH11K_HTC_EP_COUNT)
+		return;
+
+	wmi_ep_count = ab->htc.wmi_ep_count;
+	if (wmi_ep_count > ab->hw_params.max_radios)
+		return;
+
+	for (i = 0; i < ab->htc.wmi_ep_count; i++) {
+		if (ab->wmi_ab.wmi[i].eid == eid) {
+			wmi = &ab->wmi_ab.wmi[i];
+			break;
+		}
+	}
+
+	if (wmi)
+		wake_up(&wmi->tx_ce_desc_wq);
 }
 
 static bool ath11k_reg_is_world_alpha(char *alpha)
@@ -7199,6 +7240,7 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *ab,
 	ab->wmi_ab.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
 	ab->wmi_ab.wmi[pdev_idx].eid = conn_resp.eid;
 	ab->wmi_ab.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
+	init_waitqueue_head(&ab->wmi_ab.wmi[pdev_idx].tx_ce_desc_wq);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 0584e68..55a04f0 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2522,6 +2522,7 @@ struct ath11k_pdev_wmi {
 	enum ath11k_htc_ep_id eid;
 	const struct wmi_peer_flags_map *peer_flags;
 	u32 rx_decap_mode;
+	wait_queue_head_t tx_ce_desc_wq;
 };
 
 struct vdev_create_params {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
