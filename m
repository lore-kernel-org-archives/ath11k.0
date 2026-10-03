Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA3ACA5FED
	for <ath11k@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63yYoZXH046bBLlEvAcf7d3d/BLIj7mrMLlDLX+HIx8=; b=xq9isTwDegOrUCGhXRz2ypW1P5
	IU35RoXDd/ts6TOKlVJaiPCFO17ggCwAhokvibm3o1mV0Iv7Jps9wwx+26kJKoW7oLY4VDpmcZGv4
	wFrkBnGq9zkhZ7QJPt5d/Br3/yZeyqOUlzSCv3o/gzxqEQkocszhz5nKGPUDPC7fiMQ5cru5aBjq1
	EvMi3Y8uBswMKtN0swv3JUBTfxIpLB7cptrRlMLBf3aK6X9TjeMmb0miGtT6FEyXNH33zkak3RixV
	gYoL95q2WyNYBLgHnjMXrcKh20R7a1AM8tsTLf93Zr5z/cDQFEhGX+RxYEsTxv+w5aMsHw7xakIyK
	CrOSa5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD25k-0000000Dir6-2d8F;
	Sat, 03 Oct 2026 15:56:04 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD25g-0000000Diog-2Yjn
	for ath11k@lists.infradead.org;
	Sat, 03 Oct 2026 15:56:03 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id A93A21603C;
	Sat, 03 Oct 2026 18:55:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=63yYoZXH046bBLlEvAcf
	7d3d/BLIj7mrMLlDLX+HIx8=; b=F9iBCuzygfhJAR8j3d9tlLTz/GMsfKBg6h0l
	NxDUBBDUE0yvPiRQSneiYHnLqMWN4w0RH2mJRrByW59+JVZmUr/DUudKb1KBmfdB
	xedJgI1ZKCxuO2AyKJlEL5/oSbktsL7WtAXQuYkiHWz9cZrNCUWh3wBBhfM8RzI/
	cBQCVIiLozbJ9XquUx3r95BbzCe45r+h+MDfjoSmj/lqEfbuRqhRZC1B4LgxBcrt
	q7NsL+IGFvfoSCpNpfF3jE8/JemVkp9DWlfE+fcnGmtFSUzGb7G77MBEX5zMKIQd
	YDALeyp74osin9AgyB1YH2x79+fTJrHU5Aj+9zNH3zJ7a+jB1w==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 772681603A;
	Sat, 03 Oct 2026 18:55:48 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 18:55:48 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 4/4] wifi: ath11k: support firmware airtime fairness
Date: Sat, 3 Oct 2026 18:55:42 +0300
Message-ID: <20261003155542.96363-5-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003155542.96363-1-me@andrei-z.com>
References: <20261003155542.96363-1-me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_085600_881783_8C5B603F 
X-CRM114-Status: GOOD (  21.87  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Firmware with WMI_TLV_SERVICE_ATF schedules airtime between stations
itself, in proportion to per-station shares the host gives it in parts
per thousand. Enable it at init (resource config flag) and on each
radio, advertise NL80211_EXT_FEATURE_AIRTIME_FAIRNESS, and send the
shares of all AP stations of the radio, derived from their airtime
weights (sta_set_airtime_weight), whenever a station associates or
leaves or user space changes a weight.

The firmware schedules a station only within the share of its ATF group,
so group 0, which every station belongs to, first gets the whole radio
(WMI_ATF_SSID_GROUPING_REQUEST_CMDID, fair policy). Without the group,
the firmware passes no data at all to a station that has a share.

Both are needed: without the resource config flag the firmware takes the
shares but does not enforce them. With them, a station capped at 100/1000
under strict scheduling falls from 885 to 122 Mbit/s downlink and
recovers once uncapped, and at its full fair share it runs at full rate.

This matters most where the data path does not pass mac80211's queues,
such as NSS offload, where mac80211's own airtime scheduler never sees
the frames.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/net/wireless/ath/ath11k/core.h |   1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 105 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c  |  97 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h  |  53 +++++++++++++
 4 files changed, 256 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 31eee25c0..bb5f730c8 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -542,6 +542,7 @@ struct ath11k_per_peer_cfr_capture {
 
 struct ath11k_sta {
 	struct ath11k_vif *arvif;
+	u16 airtime_weight;
 
 	/* the following are protected by ar->data_lock */
 	u32 changed; /* IEEE80211_RC_* */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 57cc6dbdd..7a03c12d2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6732,6 +6732,16 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
+	if (test_bit(WMI_TLV_SERVICE_ATF, ab->wmi_ab.svc_map)) {
+		ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_ATF_DYNAMIC_ENABLE,
+						1, pdev->pdev_id);
+		if (ret) {
+			ath11k_err(ab, "failed to enable airtime fairness: %d\n",
+				   ret);
+			goto err;
+		}
+	}
+
 	ret = ath11k_wmi_send_dfs_phyerr_offload_enable_cmd(ar, pdev->pdev_id);
 	if (ret) {
 		ath11k_err(ab, "failed to offload radar detection: %d\n",
@@ -9985,6 +9995,90 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 	return ret;
 }
 
+#define ATH11K_ATF_PEERS_PER_CMD 32
+
+struct ath11k_mac_atf_iter {
+	struct ath11k_wmi_atf_peer_arg *peers;
+	u16 *weights;
+	u32 num, max, total;
+};
+
+static void ath11k_mac_atf_iter(void *data, struct ieee80211_sta *sta)
+{
+	struct ath11k_mac_atf_iter *it = data;
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+
+	if (it->num == it->max || !arsta->arvif ||
+	    arsta->arvif->vdev_type != WMI_VDEV_TYPE_AP)
+		return;
+
+	ether_addr_copy(it->peers[it->num].addr, sta->addr);
+	it->peers[it->num].vdev_id = arsta->arvif->vdev_id;
+	it->weights[it->num] = arsta->airtime_weight;
+	it->total += arsta->airtime_weight;
+	it->num++;
+}
+
+/* Firmware airtime fairness: give every station of the radio its share of
+ * the airtime, in proportion to its airtime weight. The firmware schedules
+ * a station only by the share of its group, so group 0 (every station's)
+ * gets the whole radio first.
+ */
+static int ath11k_mac_atf_update(struct ath11k *ar)
+{
+	struct ath11k_mac_atf_iter it = { .max = ar->max_num_stations };
+	u32 i, n;
+	int ret = 0;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (!test_bit(WMI_TLV_SERVICE_ATF, ar->ab->wmi_ab.svc_map))
+		return 0;
+
+	it.peers = kcalloc(it.max, sizeof(*it.peers), GFP_KERNEL);
+	it.weights = kcalloc(it.max, sizeof(*it.weights), GFP_KERNEL);
+	if (!it.peers || !it.weights) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ieee80211_iterate_stations_atomic(ar->hw, ath11k_mac_atf_iter, &it);
+
+	for (i = 0; i < it.num; i++)
+		it.peers[i].units = max_t(u32, 1, div_u64((u64)WMI_ATF_DENOMINATION *
+							  it.weights[i], it.total));
+
+	ret = ath11k_wmi_send_atf_group(ar, 0, WMI_ATF_DENOMINATION);
+	if (ret)
+		goto out;
+
+	for (i = 0; i < it.num; i += n) {
+		n = min_t(u32, it.num - i, ATH11K_ATF_PEERS_PER_CMD);
+		ret = ath11k_wmi_send_peer_atf_request(ar, &it.peers[i], n,
+						       i + n < it.num);
+		if (ret)
+			break;
+	}
+
+out:
+	kfree(it.weights);
+	kfree(it.peers);
+	return ret;
+}
+
+static void ath11k_mac_op_sta_set_airtime_weight(struct ieee80211_hw *hw,
+						 struct ieee80211_vif *vif,
+						 struct ieee80211_sta *sta, u16 weight)
+{
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ath11k *ar = hw->priv;
+
+	mutex_lock(&ar->conf_mutex);
+	arsta->airtime_weight = weight;
+	ath11k_mac_atf_update(ar);
+	mutex_unlock(&ar->conf_mutex);
+}
+
 static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
@@ -10012,6 +10106,7 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	    new_state == IEEE80211_STA_NONE) {
 		memset(arsta, 0, sizeof(*arsta));
 		arsta->arvif = arvif;
+		arsta->airtime_weight = IEEE80211_DEFAULT_AIRTIME_WEIGHT;
 		arsta->peer_ps_state = WMI_PEER_PS_STATE_DISABLED;
 		INIT_WORK(&arsta->update_wk, ath11k_sta_rc_update_wk);
 		INIT_WORK(&arsta->set_4addr_wk, ath11k_sta_set_4addr_wk);
@@ -10043,6 +10138,9 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		mutex_unlock(&ar->ab->tbl_mtx_lock);
 
 		ath11k_cfr_decrement_peer_count(ar, arsta);
+
+		if (vif->type == NL80211_IFTYPE_AP)
+			ath11k_mac_atf_update(ar);
 	} else if (old_state == IEEE80211_STA_AUTH &&
 		   new_state == IEEE80211_STA_ASSOC &&
 		   (vif->type == NL80211_IFTYPE_AP ||
@@ -10052,6 +10150,8 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		if (ret)
 			ath11k_warn(ar->ab, "Failed to associate station: %pM\n",
 				    sta->addr);
+		else if (vif->type == NL80211_IFTYPE_AP)
+			ath11k_mac_atf_update(ar);
 
 		spin_lock_bh(&ar->data_lock);
 		/* Set arsta bw and prev bw */
@@ -10143,6 +10243,7 @@ static const struct ieee80211_ops ath11k_ops = {
 	.sta_state                      = ath11k_mac_op_sta_state,
 	.sta_set_4addr                  = ath11k_mac_op_sta_set_4addr,
 	.sta_set_txpwr			= ath11k_mac_op_sta_set_txpwr,
+	.sta_set_airtime_weight		= ath11k_mac_op_sta_set_airtime_weight,
 	.link_sta_rc_update		= ath11k_mac_op_sta_rc_update,
 	.conf_tx                        = ath11k_mac_op_conf_tx,
 	.set_antenna			= ath11k_mac_op_set_antenna,
@@ -10684,6 +10785,10 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		wiphy_ext_feature_set(ar->hw->wiphy,
 				      NL80211_EXT_FEATURE_BEACON_PROTECTION);
 
+	if (test_bit(WMI_TLV_SERVICE_ATF, ar->ab->wmi_ab.svc_map))
+		wiphy_ext_feature_set(ar->hw->wiphy,
+				      NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
+
 	ar->hw->wiphy->mbssid_max_interfaces = TARGET_NUM_VDEVS(ab);
 	ar->hw->wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2c3e14a65..28f5d606a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4468,6 +4468,100 @@ int ath11k_wmi_set_hw_mode(struct ath11k_base *ab,
 	return 0;
 }
 
+int ath11k_wmi_send_atf_group(struct ath11k *ar, u32 group_id, u32 units)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_atf_ssid_grp_request_cmd *cmd;
+	struct wmi_atf_group_info *grp;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	int ret;
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd) + TLV_HDR_SIZE + sizeof(*grp));
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_atf_ssid_grp_request_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ATF_SSID_GRP_REQUEST) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+
+	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
+		      FIELD_PREP(WMI_TLV_LEN, sizeof(*grp));
+	grp = (struct wmi_atf_group_info *)tlv->value;
+	grp->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ATF_GROUP_INFO) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*grp) - TLV_HDR_SIZE);
+	grp->atf_group_id = group_id;
+	grp->atf_group_units = units;
+	grp->atf_group_flags = WMI_ATF_GROUP_POLICY_FAIR;
+
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_ATF_SSID_GROUPING_REQUEST_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send atf group request: %d\n", ret);
+		dev_kfree_skb(skb);
+		return ret;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "cmd atf group %u units %u\n", group_id, units);
+
+	return 0;
+}
+
+int ath11k_wmi_send_peer_atf_request(struct ath11k *ar,
+				     const struct ath11k_wmi_atf_peer_arg *peers,
+				     u32 num_peers, bool more)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_peer_atf_request_cmd *cmd;
+	struct wmi_atf_peer_info *info;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	u32 i, pdev_id = ar->pdev->pdev_id;
+	int ret, len;
+
+	len = sizeof(*cmd) + TLV_HDR_SIZE + num_peers * sizeof(*info);
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_peer_atf_request_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_ATF_REQUEST) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->num_peers = num_peers;
+	cmd->pdev_id = pdev_id;
+	cmd->atf_flags = WMI_PEER_ATF_REQ_FLAG_FULL_UPDATE |
+			 WMI_PEER_ATF_REQ_FLAG_PDEV_ID_VALID;
+	if (more)
+		cmd->atf_flags |= WMI_PEER_ATF_REQ_FLAG_PENDING_CMDS;
+
+	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
+		      FIELD_PREP(WMI_TLV_LEN, num_peers * sizeof(*info));
+	info = (struct wmi_atf_peer_info *)tlv->value;
+
+	for (i = 0; i < num_peers; i++, info++) {
+		info->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ATF_PEER_INFO) |
+				   FIELD_PREP(WMI_TLV_LEN, sizeof(*info) - TLV_HDR_SIZE);
+		ether_addr_copy(info->peer_macaddr.addr, peers[i].addr);
+		info->atf_units = peers[i].units;
+		info->vdev_id = peers[i].vdev_id;
+		info->pdev_id = pdev_id;
+	}
+
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PEER_ATF_REQUEST_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send peer atf request: %d\n", ret);
+		dev_kfree_skb(skb);
+		return ret;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "cmd peer atf request pdev %u peers %u%s\n",
+		   pdev_id, num_peers, more ? " (more)" : "");
+
+	return 0;
+}
+
 int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 {
 	struct ath11k_wmi_base *wmi_ab = &ab->wmi_ab;
@@ -4483,6 +4577,9 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 		     ab->wmi_ab.svc_map))
 		config.is_reg_cc_ext_event_supported = 1;
 
+	if (test_bit(WMI_TLV_SERVICE_ATF, ab->wmi_ab.svc_map))
+		config.flag1 |= WMI_RSRC_CFG_FLAG1_ATF_CONFIG_ENABLE;
+
 	memcpy(&wmi_ab->wlan_resource_config, &config, sizeof(config));
 
 	init_param.res_cfg = &wmi_ab->wlan_resource_config;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index ae8b4cc08..53cce7fd7 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -212,6 +212,7 @@ enum wmi_cmd_group {
 	WMI_GRP_TWT            = 0x3e,
 	WMI_GRP_MOTION_DET     = 0x3f,
 	WMI_GRP_SPATIAL_REUSE  = 0x40,
+	WMI_GRP_ATM            = 0x45,
 };
 
 #define WMI_CMD_GRP(grp_id) (((grp_id) << 12) | 0x1)
@@ -2354,6 +2355,7 @@ struct wmi_init_cmd {
 } __packed;
 
 #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 BIT(5)
+#define WMI_RSRC_CFG_FLAG1_ATF_CONFIG_ENABLE BIT(6)
 #define WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET BIT(9)
 #define WMI_RSRC_CFG_FLAG1_ACK_RSSI BIT(18)
 
@@ -3631,6 +3633,53 @@ struct ath11k_wmi_p2p_noa_info {
 
 #define WMI_BCN_TMPL_BEACON_PROTECTION_EN BIT(0)
 
+/* Airtime fairness: a share is in parts per thousand of the radio's airtime */
+#define WMI_ATF_DENOMINATION			1000
+#define WMI_PEER_ATF_REQ_FLAG_FULL_UPDATE	BIT(0)
+#define WMI_PEER_ATF_REQ_FLAG_PENDING_CMDS	BIT(1)
+#define WMI_PEER_ATF_REQ_FLAG_PDEV_ID_VALID	BIT(2)
+#define WMI_ATF_GROUP_POLICY_FAIR		0
+
+#define WMI_ATF_SSID_GROUPING_REQUEST_CMDID	WMI_TLV_CMD(WMI_GRP_ATM)
+/* Outside enum wmi_tlv_tag: its WMI_TAG_MAX sizes the TLV policy table. */
+#define WMI_TAG_ATF_SSID_GRP_REQUEST		0x346
+#define WMI_TAG_ATF_GROUP_INFO			0x347
+
+struct wmi_atf_ssid_grp_request_cmd {
+	u32 tlv_header;
+	u32 pdev_id;
+} __packed;
+
+struct wmi_atf_group_info {
+	u32 tlv_header;
+	u32 atf_group_id;
+	u32 atf_group_units;
+	u32 atf_group_flags;
+} __packed;
+
+struct wmi_peer_atf_request_cmd {
+	u32 tlv_header;
+	u32 num_peers;
+	u32 pdev_id;
+	u32 atf_flags;
+} __packed;
+
+struct wmi_atf_peer_info {
+	u32 tlv_header;
+	struct wmi_mac_addr peer_macaddr;
+	u32 atf_units;
+	u32 atf_groupid;
+	u32 atf_units_reserved;
+	u32 vdev_id;
+	u32 pdev_id;
+} __packed;
+
+struct ath11k_wmi_atf_peer_arg {
+	u8 addr[ETH_ALEN];
+	u32 vdev_id;
+	u32 units;
+};
+
 struct wmi_bcn_tmpl_cmd {
 	u32 tlv_header;
 	u32 vdev_id;
@@ -6453,6 +6502,10 @@ int ath11k_wmi_vdev_start(struct ath11k *ar, struct wmi_vdev_start_req_arg *arg,
 			  bool restart);
 int ath11k_wmi_set_peer_param(struct ath11k *ar, const u8 *peer_addr,
 			      u32 vdev_id, u32 param_id, u32 param_val);
+int ath11k_wmi_send_atf_group(struct ath11k *ar, u32 group_id, u32 units);
+int ath11k_wmi_send_peer_atf_request(struct ath11k *ar,
+				     const struct ath11k_wmi_atf_peer_arg *peers,
+				     u32 num_peers, bool more);
 int ath11k_wmi_pdev_set_param(struct ath11k *ar, u32 param_id,
 			      u32 param_value, u8 pdev_id);
 int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id,


