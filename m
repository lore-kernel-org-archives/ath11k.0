Return-Path: <SRS0=2hxC=FW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981D9C4361B
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 19:20:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D77A23B83
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 19:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D77A23B83
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KAm4D8rMsSsI/2PNRA9paDasmdOdhNBrWDt24HXbARE=; b=F5fdytVEQrN2V5v2i1triE0FPt
	IoyfikiwsjV+E//jytDVecWcQ2fmDaYTvZr1DGOdmUMzqGd3q4zd5HX2OZLfFHUFQYAcBrGJjzCs8
	EopQMUrWdlO7I3Ryu80w+0b2w+DuT+d8+D5W2xmhcNScoYsymqgqZmH+q+VK2TzhX8PB/pTEIDJP9
	cTVu9U6WmAyl2fH055kIhDajzIccG6FpijLXOfRVLWqOyx1VoC/VuAofY746stYj4cTDBD6xkbtWf
	18IX0Vfy++ETKmjnviLUXp5Y4pQKdVObxHTTaSAL70k1FmGkvXwktE9iFeofwiStV408dBbAsDh1n
	43/L1r9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqLIg-00062Z-IB; Fri, 18 Dec 2020 19:20:26 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqLIe-00062C-0w
 for ath11k@lists.infradead.org; Fri, 18 Dec 2020 19:20:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608319224; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=10T2syzErUleVhsAEgvjTpR6XMvt+TKXBY3rAUoTk6U=;
 b=HAid71LpzFQJs/Hdj26N+xsEarNPOaSd9oXOftBlWxZq4000jy0TRRvi4JqWythjo2Z95bMf
 Q494U3qT9cytjyoU44wRcLPLYRHap1DDgLJTCEnHtjMnOAEIXim52bD6oiyCWN0838AjXiKe
 SNX/YyxiOt2Z6qRq6/5uiZR7NCE=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fdcc99e0564dfefcd7fb555 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 15:24:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8DFC3C43461; Fri, 18 Dec 2020 15:24:13 +0000 (UTC)
Received: from periyasa-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: periyasa)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 38E03C433C6;
 Fri, 18 Dec 2020 15:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38E03C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=periyasa@codeaurora.org
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: Update tx descriptor search index properly
Date: Fri, 18 Dec 2020 20:54:01 +0530
Message-Id: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_142024_303383_3AC28F38 
X-CRM114-Status: GOOD (  15.45  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Tx descriptor search index field should be updated with hw peer id
and not by AST Hash. Incorrect search index causes throughput degradation
in all the platforms. so updated the search index field with hw peer id,
which is a common change applicable for all the platforms.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h   | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 8 ++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.c  | 1 +
 drivers/net/wireless/ath/ath11k/hal_tx.c | 2 ++
 drivers/net/wireless/ath/ath11k/hal_tx.h | 1 +
 drivers/net/wireless/ath/ath11k/peer.c   | 9 +++++++--
 drivers/net/wireless/ath/ath11k/peer.h   | 3 ++-
 7 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 9db375b..8d29845 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -200,6 +200,7 @@ struct ath11k_vif {
 	u32 beacon_interval;
 	u32 dtim_period;
 	u16 ast_hash;
+	u16 ast_idx;
 	u16 tcl_metadata;
 	u8 hal_addr_search_flags;
 	u8 search_type;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 42328a0..2d90b80 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1652,6 +1652,7 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 	u8 mac_addr[ETH_ALEN];
 	u16 peer_mac_h16;
 	u16 ast_hash;
+	u16 hw_peer_id;
 
 	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "dp_htt rx msg type :0x%0x\n", type);
 
@@ -1672,7 +1673,7 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 					 resp->peer_map_ev.info1);
 		ath11k_dp_get_mac_addr(resp->peer_map_ev.mac_addr_l32,
 				       peer_mac_h16, mac_addr);
-		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, 0);
+		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, 0, 0);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_MAP2:
 		vdev_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_VDEV_ID,
@@ -1685,7 +1686,10 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 				       peer_mac_h16, mac_addr);
 		ast_hash = FIELD_GET(HTT_T2H_PEER_MAP_INFO2_AST_HASH_VAL,
 				     resp->peer_map_ev.info2);
-		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, ast_hash);
+		hw_peer_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO1_HW_PEER_ID,
+				       resp->peer_map_ev.info1);
+		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, ast_hash,
+				      hw_peer_id);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_UNMAP:
 	case HTT_T2H_MSG_TYPE_PEER_UNMAP2:
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 6a3fcea..1a0b9be 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -165,6 +165,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	ti.pkt_offset = 0;
 	ti.lmac_id = ar->lmac_id;
 	ti.bss_ast_hash = arvif->ast_hash;
+	ti.bss_ast_idx = arvif->ast_idx;
 	ti.dscp_tid_tbl_idx = 0;
 
 	if (skb->ip_summed == CHECKSUM_PARTIAL &&
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
index a755aa8..569e790 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
@@ -71,6 +71,8 @@ void ath11k_hal_tx_cmd_desc_setup(struct ath11k_base *ab, void *cmd,
 	tcl_cmd->info3 = FIELD_PREP(HAL_TCL_DATA_CMD_INFO3_DSCP_TID_TABLE_IDX,
 				    ti->dscp_tid_tbl_idx) |
 			 FIELD_PREP(HAL_TCL_DATA_CMD_INFO3_SEARCH_INDEX,
+				    ti->bss_ast_idx) |
+			 FIELD_PREP(HAL_TCL_DATA_CMD_INFO3_CACHE_SET_NUM,
 				    ti->bss_ast_hash);
 	tcl_cmd->info4 = 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.h b/drivers/net/wireless/ath/ath11k/hal_tx.h
index d4760a2..c291e59 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.h
@@ -29,6 +29,7 @@ struct hal_tx_info {
 	u32 flags1; /* %HAL_TCL_DATA_CMD_INFO2_ */
 	u16 addr_search_flags; /* %HAL_TCL_DATA_CMD_INFO0_ADDR(X/Y)_ */
 	u16 bss_ast_hash;
+	u16 bss_ast_idx;
 	u8 tid;
 	u8 search_type; /* %HAL_TX_ADDR_SEARCH_ */
 	u8 lmac_id;
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index b69e7eb..f49abefa 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -118,7 +118,7 @@ void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id)
 }
 
 void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
-			   u8 *mac_addr, u16 ast_hash)
+			   u8 *mac_addr, u16 ast_hash, u16 hw_peer_id)
 {
 	struct ath11k_peer *peer;
 
@@ -132,6 +132,7 @@ void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
 		peer->vdev_id = vdev_id;
 		peer->peer_id = peer_id;
 		peer->ast_hash = ast_hash;
+		peer->hw_peer_id = hw_peer_id;
 		ether_addr_copy(peer->addr, mac_addr);
 		list_add(&peer->list, &ab->peers);
 		wake_up(&ab->peer_mapping_wq);
@@ -309,7 +310,11 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	peer->pdev_idx = ar->pdev_idx;
 	peer->sta = sta;
-	arvif->ast_hash = peer->ast_hash;
+
+	if (arvif->vif->type == NL80211_IFTYPE_STATION) {
+		arvif->ast_hash = peer->ast_hash;
+		arvif->ast_idx = peer->hw_peer_id;
+	}
 
 	peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
 	peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index 8553ed0..619db00 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -14,6 +14,7 @@ struct ath11k_peer {
 	int peer_id;
 	u16 ast_hash;
 	u8 pdev_idx;
+	u16 hw_peer_id;
 
 	/* protected by ab->data_lock */
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
@@ -31,7 +32,7 @@ struct ath11k_peer {
 
 void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id);
 void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
-			   u8 *mac_addr, u16 ast_hash);
+			   u8 *mac_addr, u16 ast_hash, u16 hw_peer_id);
 struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
 				     const u8 *addr);
 struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
