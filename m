Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B42EC83005
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3J5IwB1rmLTGqjN5yg5t7U60Hud+PuccxhXrpUnYGtI=; b=LGRPwbZGKK178D
	2XRhpURHRsHfzqIEoyMq8krQXN8jMQ08iLqZB+thm8z91nCF1VjrwiipJWpLRbxctXm4HRgDUMbqS
	GSQXov8Cv0GKnkRTfLcvRv+duBezu8iDSZcPmBUw7iZTtJLAnglvh6xEHPLX9y4llfc7LgHfYcD4F
	r5EpGlKfeG+qzmOpGBWXi58bzuf4Z2HZdP3orLlCsfxzSwA+rAuDaDoo2dPp0HTkaWiIdg5sAnFf9
	EO85G/hA+vye3+YLaLewI+P5Cl+NYbjMMw405fkGfvX3qeis2nEFEFEm9sU7gv4fnACNJ46NiPotx
	h/xz7ItyZbLdwaCe0enA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d30-00DFih-26;
	Fri, 09 Jun 2023 14:25:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2x-00DFVn-0b
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:25:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03866612E3
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74E2C4339B;
	Fri,  9 Jun 2023 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320698;
	bh=GMDcx3Ui6MfcwriDfeTNh70csPJBCOa3YpkhYfNWWLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQDk+fbRfqXPUUrFBlo8kqucX0eRD6OgcpFlKYqggzM3IEM+WLNobqjLay1Eb5R/K
	 MmjR5cCFRg5JWd1YJ1zQhjXPXPwlc299Rj5RSaQ5OMbSfdfjU//oXD1mWnBEWNPwVU
	 Ypp+aSaJISKJLGwmyUxhY/aQymfs4Lby23dO72sQPHU1KKwoKnvAi54Tok1WXi5eEW
	 wpLtRUuhv+FUF8V1fZik20Cl7Kt0bNe6x0x0avlpE3b06qzGdO0Rq2XHo7F6/D7O72
	 E+biTHKfGb5FlOHabmDg613JUgDFLDb0Cd5UM5aMgpwi+A21+vygeHXbBsoJHOctXg
	 gDbM895yDNVrQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 14/15] wifi: ath11k: htc: cleanup debug messages
Date: Fri,  9 Jun 2023 17:24:39 +0300
Message-Id: <20230609142440.24643-15-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072459_327896_43D16081 
X-CRM114-Status: GOOD (  12.51  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Cleanup HTC debug messages to follow the preferred style and try to make them
more readable. Also add a few more and remove unnecessary.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/htc.c | 34 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index deace873da85..2c2e425c8665 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -46,7 +46,6 @@ static struct sk_buff *ath11k_htc_build_tx_ctrl_skb(void *ab)
 	skb_cb = ATH11K_SKB_CB(skb);
 	memset(skb_cb, 0, sizeof(*skb_cb));
 
-	ath11k_dbg(ab, ATH11K_DBG_HTC, "%s: skb %p\n", __func__, skb);
 	return skb;
 }
 
@@ -96,7 +95,7 @@ int ath11k_htc_send(struct ath11k_htc *htc,
 		spin_lock_bh(&htc->tx_lock);
 		if (ep->tx_credits < credits) {
 			ath11k_dbg(ab, ATH11K_DBG_HTC,
-				   "insufficient credits ep %d required %d available %d\n",
+				   "ep %d insufficient credits required %d total %d\n",
 				   eid, credits, ep->tx_credits);
 			spin_unlock_bh(&htc->tx_lock);
 			ret = -EAGAIN;
@@ -104,7 +103,7 @@ int ath11k_htc_send(struct ath11k_htc *htc,
 		}
 		ep->tx_credits -= credits;
 		ath11k_dbg(ab, ATH11K_DBG_HTC,
-			   "ep %d consumed %d credits (total %d)\n",
+			   "ep %d credits consumed %d total %d\n",
 			   eid, credits, ep->tx_credits);
 		spin_unlock_bh(&htc->tx_lock);
 	}
@@ -119,6 +118,9 @@ int ath11k_htc_send(struct ath11k_htc *htc,
 		goto err_credits;
 	}
 
+	ath11k_dbg(ab, ATH11K_DBG_HTC, "tx skb %p eid %d paddr %pad\n",
+		   skb, skb_cb->eid, &skb_cb->paddr);
+
 	ret = ath11k_ce_send(htc->ab, skb, ep->ul_pipe_id, ep->eid);
 	if (ret)
 		goto err_unmap;
@@ -132,7 +134,7 @@ int ath11k_htc_send(struct ath11k_htc *htc,
 		spin_lock_bh(&htc->tx_lock);
 		ep->tx_credits += credits;
 		ath11k_dbg(ab, ATH11K_DBG_HTC,
-			   "ep %d reverted %d credits back (total %d)\n",
+			   "ep %d credits reverted %d total %d\n",
 			   eid, credits, ep->tx_credits);
 		spin_unlock_bh(&htc->tx_lock);
 
@@ -167,7 +169,7 @@ ath11k_htc_process_credit_report(struct ath11k_htc *htc,
 		ep = &htc->endpoint[report->eid];
 		ep->tx_credits += report->credits;
 
-		ath11k_dbg(ab, ATH11K_DBG_HTC, "ep %d got %d credits (total %d)\n",
+		ath11k_dbg(ab, ATH11K_DBG_HTC, "ep %d credits got %d total %d\n",
 			   report->eid, report->credits, ep->tx_credits);
 
 		if (ep->ep_ops.ep_tx_credits) {
@@ -287,7 +289,7 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 	struct ath11k_htc_hdr *hdr;
 	struct ath11k_htc_ep *ep;
 	u16 payload_len;
-	u32 trailer_len = 0;
+	u32 message_id, trailer_len = 0;
 	size_t min_len;
 	u8 eid;
 	bool trailer_present;
@@ -322,6 +324,9 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 	trailer_present = (FIELD_GET(HTC_HDR_FLAGS, hdr->htc_info)) &
 			  ATH11K_HTC_FLAG_TRAILER_PRESENT;
 
+	ath11k_dbg(ab, ATH11K_DBG_HTC, "rx ep %d skb %p trailer_present %d\n",
+		   eid, skb, trailer_present);
+
 	if (trailer_present) {
 		u8 *trailer;
 
@@ -354,7 +359,12 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 	if (eid == ATH11K_HTC_EP_0) {
 		struct ath11k_htc_msg *msg = (struct ath11k_htc_msg *)skb->data;
 
-		switch (FIELD_GET(HTC_MSG_MESSAGEID, msg->msg_svc_id)) {
+		message_id = FIELD_GET(HTC_MSG_MESSAGEID, msg->msg_svc_id);
+
+		ath11k_dbg(ab, ATH11K_DBG_HTC, "rx ep %d skb %p message_id %d\n",
+			   eid, skb, message_id);
+
+		switch (message_id) {
 		case ATH11K_HTC_MSG_READY_ID:
 		case ATH11K_HTC_MSG_CONNECT_SERVICE_RESP_ID:
 			/* handle HTC control message */
@@ -393,8 +403,6 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 		goto out;
 	}
 
-	ath11k_dbg(ab, ATH11K_DBG_HTC, "rx completion ep %d skb %p\n",
-		   eid, skb);
 	ep->ep_ops.ep_rx_complete(ab, skb);
 
 	/* poll tx completion for interrupt disabled CE's */
@@ -564,7 +572,7 @@ int ath11k_htc_wait_target(struct ath11k_htc *htc)
 	htc->target_credit_size = credit_size;
 
 	ath11k_dbg(ab, ATH11K_DBG_HTC,
-		   "Target ready! transmit resources: %d size:%d\n",
+		   "target ready total_transmit_credits %d target_credit_size %d\n",
 		   htc->total_transmit_credits, htc->target_credit_size);
 
 	if ((htc->total_transmit_credits == 0) ||
@@ -680,7 +688,7 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_HTC,
-		   "HTC Service %s connect response: status: 0x%lx, assigned ep: 0x%lx\n",
+		   "service %s connect response status 0x%lx assigned ep 0x%lx\n",
 		   htc_service_name(service_id),
 		   FIELD_GET(HTC_SVC_RESP_MSG_STATUS, resp_msg->flags_len),
 		   FIELD_GET(HTC_SVC_RESP_MSG_ENDPOINTID, resp_msg->flags_len));
@@ -747,7 +755,7 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 	if (disable_credit_flow_ctrl && ep->tx_credit_flow_enabled) {
 		ep->tx_credit_flow_enabled = false;
 		ath11k_dbg(ab, ATH11K_DBG_BOOT,
-			   "htc service '%s' eid %d TX flow control disabled\n",
+			   "htc service '%s' eid %d tx flow control disabled\n",
 			   htc_service_name(ep->service_id), assigned_eid);
 	}
 
@@ -773,7 +781,7 @@ int ath11k_htc_start(struct ath11k_htc *htc)
 				 ATH11K_HTC_MSG_SETUP_COMPLETE_EX_ID);
 
 	if (ab->hw_params.credit_flow)
-		ath11k_dbg(ab, ATH11K_DBG_HTC, "HTC is using TX credit flow control\n");
+		ath11k_dbg(ab, ATH11K_DBG_HTC, "using tx credit flow control\n");
 	else
 		msg->flags |= ATH11K_GLOBAL_DISABLE_CREDIT_FLOW;
 
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
