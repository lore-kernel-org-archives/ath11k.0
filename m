Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49032C433EF
	for <ath11k@archiver.kernel.org>; Tue,  8 Feb 2022 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EMnRjhqEprTyECcHfFYcq6+GGAfIwH7tTVKpLuRP2s=; b=BqyzAEGziGYLpZ
	3fCbyx8j/a3k8z9yfzau4mYm9j2wmrSHSr+uKV8EQzQ/Z4cldEvrrCJoeEGD0CAsU9BRhgbRVcpaD
	qEO14OwVdC14Q/f81YItp4hVmqO0EFFc+tULXpc3dkI9YRzAIv07iHLU2veFbpJDttI1lbbzYe9Qk
	08eTp3H0jg/KXOOZ0IiqlsnxTqsGzx9iO7eUpqHOPnMjvWcuYxL3aI1mWy6RkJfiql0h1ZAbwnnB/
	L/lKoCBMPFqsPYXy8Zn5wBapqAkXJTua8XMCu27CiuBX2ZohuXroLmZR42lnAzSwG/k2v/f2TYm92
	NHBFSdeI/NIResqPxFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHLdG-00CsyD-Uo; Tue, 08 Feb 2022 08:13:50 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHLdB-00Css5-Kn
 for ath11k@lists.infradead.org; Tue, 08 Feb 2022 08:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644308025; x=1675844025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=MjsClt5qbvH9wL2OjFDC59rox4SWMJ1Y6bx3F7fBCFA=;
 b=FCScrTM6ArYD/Hm4nCDGSiRJzQBCqk4NDFk25ynJvZbZW1o11t+QgSnZ
 XdzbSUiK7SiaaW5/deknlbg1kFhax8MUutZ0Fa/hdvjTPtMWcEnZRtxaY
 LcrFjshm+8MefXBNo60/FDahmDKo7s9QJgd9KVVDa9NzibHYsDccvgxWn 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Feb 2022 00:13:45 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 00:13:45 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 00:13:44 -0800
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 00:13:43 -0800
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 6/6] ath11k: support GTK rekey offload
Date: Tue, 8 Feb 2022 16:13:26 +0800
Message-ID: <1644308006-22784-7-git-send-email-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644308006-22784-1-git-send-email-quic_cjhuang@quicinc.com>
References: <1644308006-22784-1-git-send-email-quic_cjhuang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_001345_779693_41E9FC41 
X-CRM114-Status: GOOD (  16.99  )
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

Host sets GTK related info to firmware before WoW is enabled, and
gets rekey replay_count and then disables GTK rekey when WoW quits.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.h |   8 ++
 drivers/net/wireless/ath/ath11k/mac.c  |  32 +++++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 119 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h  |  49 ++++++++++
 drivers/net/wireless/ath/ath11k/wow.c  |  46 +++++++++-
 5 files changed, 253 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 3a3fd3f87f84..3447330ef28e 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -230,6 +230,13 @@ struct ath11k_arp_ns_offload {
 	u8  mac_addr[ETH_ALEN];
 };
 
+struct ath11k_rekey_data {
+	u8 kck[NL80211_KCK_LEN];
+	u8 kek[NL80211_KCK_LEN];
+	u64 replay_ctr;
+	bool enable_offload;
+};
+
 struct ath11k_vif {
 	u32 vdev_id;
 	enum wmi_vdev_type vdev_type;
@@ -285,6 +292,7 @@ struct ath11k_vif {
 	struct dentry *debugfs_twt;
 #endif /* CONFIG_ATH11K_DEBUGFS */
 	struct ath11k_arp_ns_offload arp_ns_offload;
+	struct ath11k_rekey_data rekey_data;
 };
 
 struct ath11k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 609b4975efea..8af265de9f0d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2757,6 +2757,7 @@ static void ath11k_bss_assoc(struct ieee80211_hw *hw,
 	}
 
 	arvif->is_up = true;
+	arvif->rekey_data.enable_offload = false;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
 		   "mac vdev %d up (associated) bssid %pM aid %d\n",
@@ -2814,6 +2815,8 @@ static void ath11k_bss_disassoc(struct ieee80211_hw *hw,
 
 	arvif->is_up = false;
 
+	memset(&arvif->rekey_data, 0, sizeof(arvif->rekey_data));
+
 	cancel_delayed_work_sync(&arvif->connection_loss_work);
 }
 
@@ -8175,6 +8178,34 @@ static void ath11k_mac_op_ipv6_changed(struct ieee80211_hw *hw,
 	ath11k_generate_ns_mc_addr(ar, offload);
 }
 
+static void ath11k_mac_op_set_rekey_data(struct ieee80211_hw *hw,
+					 struct ieee80211_vif *vif,
+					 struct cfg80211_gtk_rekey_data *data)
+{
+	struct ath11k *ar = hw->priv;
+	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
+	struct ath11k_rekey_data *rekey_data = &arvif->rekey_data;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "Set rekey data vdev_id %d\n",
+		   arvif->vdev_id);
+	mutex_lock(&ar->conf_mutex);
+
+	memcpy(rekey_data->kck, data->kck, NL80211_KCK_LEN);
+	memcpy(rekey_data->kek, data->kek, NL80211_KEK_LEN);
+
+	/* supplicant works on big-endian, converts to cpu-endian */
+	rekey_data->replay_ctr = be64_to_cpu(get_unaligned((u64 *)data->replay_ctr));
+	arvif->rekey_data.enable_offload = true;
+
+	ath11k_dbg_dump(ar->ab, ATH11K_DBG_MAC, "KCK", NULL,
+			rekey_data->kck, NL80211_KCK_LEN);
+	ath11k_dbg_dump(ar->ab, ATH11K_DBG_MAC, "KEK", NULL,
+			rekey_data->kck, NL80211_KEK_LEN);
+	ath11k_dbg_dump(ar->ab, ATH11K_DBG_MAC, "replay ctr", NULL,
+			&rekey_data->replay_ctr, sizeof(rekey_data->replay_ctr));
+	mutex_unlock(&ar->conf_mutex);
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
 	.start                          = ath11k_mac_op_start,
@@ -8189,6 +8220,7 @@ static const struct ieee80211_ops ath11k_ops = {
 	.hw_scan                        = ath11k_mac_op_hw_scan,
 	.cancel_hw_scan                 = ath11k_mac_op_cancel_hw_scan,
 	.set_key                        = ath11k_mac_op_set_key,
+	.set_rekey_data	                = ath11k_mac_op_set_rekey_data,
 	.sta_state                      = ath11k_mac_op_sta_state,
 	.sta_set_4addr                  = ath11k_mac_op_sta_set_4addr,
 	.sta_set_txpwr			= ath11k_mac_op_sta_set_txpwr,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 094308d568d7..2185da7abb69 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7765,6 +7765,56 @@ static void ath11k_wmi_twt_add_dialog_event(struct ath11k_base *ab,
 	kfree(tb);
 }
 
+static void
+ath11k_wmi_gtk_offload_status_event(struct ath11k_base *ab,
+				    struct sk_buff *skb)
+{
+	const void **tb;
+	const struct wmi_gtk_offload_status_event *ev;
+	struct ath11k_vif *arvif;
+	__be64 replay_ctr_be;
+	u64    replay_ctr;
+	int ret;
+
+	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_GTK_OFFLOAD_STATUS_EVENT];
+	if (!ev) {
+		ath11k_warn(ab, "failed to fetch gtk offload status ev");
+		kfree(tb);
+		return;
+	}
+
+	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, ev->vdev_id);
+	if (!arvif) {
+		ath11k_warn(ab, "failed to get arvif for vdev_id:%d\n",
+			    ev->vdev_id);
+		kfree(tb);
+		return;
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_WMI, "gtk offload event refresh_cnt:%d\n",
+		   ev->refresh_cnt);
+	ath11k_dbg_dump(ab, ATH11K_DBG_WMI, "gtk offload event replay_cnt",
+			NULL, ev->replay_ctr.counter, GTK_REPLAY_COUNTER_BYTES);
+
+	replay_ctr =  ev->replay_ctr.word1;
+	replay_ctr = (replay_ctr << 32) | ev->replay_ctr.word0;
+	arvif->rekey_data.replay_ctr = replay_ctr;
+	/* supplicant expects big-endian replay counter */
+	replay_ctr_be = cpu_to_be64(replay_ctr);
+
+	ieee80211_gtk_rekey_notify(arvif->vif, arvif->bssid,
+				   (void *)&replay_ctr_be, GFP_KERNEL);
+
+	kfree(tb);
+}
+
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
@@ -7896,6 +7946,9 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	case WMI_DIAG_EVENTID:
 		ath11k_wmi_diag_event(ab, skb);
 		break;
+	case WMI_GTK_OFFLOAD_STATUS_EVENTID:
+		ath11k_wmi_gtk_offload_status_event(ab, skb);
+		break;
 	/* TODO: Add remaining events */
 	default:
 		ath11k_dbg(ab, ATH11K_DBG_WMI, "Unknown eventid: 0x%x\n", id);
@@ -8728,3 +8781,69 @@ int ath11k_wmi_arp_ns_offload(struct ath11k *ar,
 
 	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
 }
+
+int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
+				 struct ath11k_vif *arvif, bool enable)
+{
+	struct wmi_gtk_rekey_offload_cmd *cmd;
+	struct ath11k_rekey_data *rekey_data = &arvif->rekey_data;
+	int len;
+	struct sk_buff *skb;
+	__le64 replay_ctr;
+
+	len = sizeof(*cmd);
+	skb =  ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_gtk_rekey_offload_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_GTK_OFFLOAD_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+
+	cmd->vdev_id = arvif->vdev_id;
+
+	if (enable) {
+		cmd->flags = GTK_OFFLOAD_ENABLE_OPCODE;
+
+		/* the length in rekey_data and cmd is equal */
+		memcpy(cmd->kck, rekey_data->kck, sizeof(cmd->kck));
+		ath11k_ce_byte_swap(cmd->kck, GTK_OFFLOAD_KEK_BYTES);
+		memcpy(cmd->kek, rekey_data->kek, sizeof(cmd->kek));
+		ath11k_ce_byte_swap(cmd->kek, GTK_OFFLOAD_KEK_BYTES);
+
+		replay_ctr = cpu_to_le64(rekey_data->replay_ctr);
+		memcpy(cmd->replay_ctr, &replay_ctr,
+		       sizeof(replay_ctr));
+		ath11k_ce_byte_swap(cmd->replay_ctr, GTK_REPLAY_COUNTER_BYTES);
+	} else {
+		cmd->flags = GTK_OFFLOAD_DISABLE_OPCODE;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "offload gtk rekey vdev: %d %d\n",
+		   arvif->vdev_id, enable);
+	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+}
+
+int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
+				 struct ath11k_vif *arvif)
+{
+	struct wmi_gtk_rekey_offload_cmd *cmd;
+	int len;
+	struct sk_buff *skb;
+
+	len = sizeof(*cmd);
+	skb =  ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_gtk_rekey_offload_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_GTK_OFFLOAD_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+
+	cmd->vdev_id = arvif->vdev_id;
+	cmd->flags = GTK_OFFLOAD_REQUEST_STATUS_OPCODE;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "get gtk rekey vdev_id: %d\n",
+		   arvif->vdev_id);
+	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b3b547c20375..6073233973cb 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5840,6 +5840,51 @@ struct wmi_set_arp_ns_offload_cmd {
 	 */
 } __packed;
 
+#define GTK_OFFLOAD_OPCODE_MASK             0xFF000000
+#define GTK_OFFLOAD_ENABLE_OPCODE           0x01000000
+#define GTK_OFFLOAD_DISABLE_OPCODE          0x02000000
+#define GTK_OFFLOAD_REQUEST_STATUS_OPCODE   0x04000000
+
+#define GTK_OFFLOAD_KEK_BYTES       16
+#define GTK_OFFLOAD_KCK_BYTES       16
+#define GTK_REPLAY_COUNTER_BYTES    8
+#define WMI_MAX_KEY_LEN             32
+#define IGTK_PN_SIZE                6
+
+struct wmi_replayc_cnt {
+	union {
+		u8 counter[GTK_REPLAY_COUNTER_BYTES];
+		struct {
+			u32 word0;
+			u32 word1;
+		} __packed;
+	} __packed;
+} __packed;
+
+struct wmi_gtk_offload_status_event {
+	u32 vdev_id;
+	u32 flags;
+	u32 refresh_cnt;
+	struct wmi_replayc_cnt replay_ctr;
+	u8 igtk_key_index;
+	u8 igtk_key_length;
+	u8 igtk_key_rsc[IGTK_PN_SIZE];
+	u8 igtk_key[WMI_MAX_KEY_LEN];
+	u8 gtk_key_index;
+	u8 gtk_key_length;
+	u8 gtk_key_rsc[GTK_REPLAY_COUNTER_BYTES];
+	u8 gtk_key[WMI_MAX_KEY_LEN];
+} __packed;
+
+struct wmi_gtk_rekey_offload_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 flags;
+	u8 kek[GTK_OFFLOAD_KEK_BYTES];
+	u8 kck[GTK_OFFLOAD_KCK_BYTES];
+	u8 replay_ctr[GTK_REPLAY_COUNTER_BYTES];
+} __packed;
+
 int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			u32 cmd_id);
 struct sk_buff *ath11k_wmi_alloc_skb(struct ath11k_wmi_base *wmi_sc, u32 len);
@@ -6014,4 +6059,8 @@ int ath11k_wmi_send_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
 				       u32 filter_bitmap, bool enable);
 int ath11k_wmi_arp_ns_offload(struct ath11k *ar,
 			      struct ath11k_vif *arvif, bool enable);
+int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
+				 struct ath11k_vif *arvif, bool enable);
+int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
+				 struct ath11k_vif *arvif);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index a57f2ff9196d..cdb154fd9367 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -17,7 +17,9 @@
 
 static const struct wiphy_wowlan_support ath11k_wowlan_support = {
 	.flags = WIPHY_WOWLAN_DISCONNECT |
-		 WIPHY_WOWLAN_MAGIC_PKT,
+		 WIPHY_WOWLAN_MAGIC_PKT |
+		 WIPHY_WOWLAN_SUPPORTS_GTK_REKEY |
+		 WIPHY_WOWLAN_GTK_REKEY_FAILURE,
 	.pattern_min_len = WOW_MIN_PATTERN_SIZE,
 	.pattern_max_len = WOW_MAX_PATTERN_SIZE,
 	.max_pkt_offset = WOW_MAX_PKT_OFFSET,
@@ -578,6 +580,41 @@ static int ath11k_wow_arp_ns_offload(struct ath11k *ar, bool enable)
 	return 0;
 }
 
+static int ath11k_gtk_rekey_offload(struct ath11k *ar, bool enable)
+{
+	struct ath11k_vif *arvif;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif->vdev_type != WMI_VDEV_TYPE_STA ||
+		    !arvif->is_up ||
+		    !arvif->rekey_data.enable_offload)
+			continue;
+
+		/* get rekey info before disable rekey offload */
+		if (!enable) {
+			ret = ath11k_wmi_gtk_rekey_getinfo(ar, arvif);
+			if (ret) {
+				ath11k_warn(ar->ab, "failed to request rekey info vdev %i, ret %d\n",
+					    arvif->vdev_id, ret);
+				return ret;
+			}
+		}
+
+		ret = ath11k_wmi_gtk_rekey_offload(ar, arvif, enable);
+
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to offload gtk reky vdev %i: enable %d, ret %d\n",
+				    arvif->vdev_id, enable, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int ath11k_wow_protocol_offload(struct ath11k *ar, bool enable)
 {
 	int ret;
@@ -589,6 +626,13 @@ static int ath11k_wow_protocol_offload(struct ath11k *ar, bool enable)
 		return ret;
 	}
 
+	ret = ath11k_gtk_rekey_offload(ar, enable);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to offload gtk rekey %d %d\n",
+			    enable, ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.32.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
