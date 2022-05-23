Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B14C433EF
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UuXo36vwviQei+eu4Ae7aRf6oUykYgNiVVltSQm+ZY=; b=IK4FZGV24Tt4of
	FZWgeeG6smtPhWRSJZuhkNxO1OHhz1/oJSYyibXHoby1hCmeFr4iHSdnKnLHzkQuDSIhWHQFeZy3y
	t/xAWtdWHPxWChm/3PMX4Y/Hbp8C+IH2wtzvepk/fh73neVs5xOmMesLPKKrVHlteReYucD3G1pIC
	ThGsSoj0HNxQNF2vaxUP45fVnMMV/XYsdnj1xX2XOk9CohfNjsbneTqxoCmV/ZyS58Yng2dtfNA2J
	JJOXqHhBUAlPASAaFHNWsX0t7izA2lHzQ8e+XOTOjoTnZZcMKzjWHOUGDS9r7vAoCVURB6LVzc6+0
	9BAYLj5gjU/0SyP1qJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt55s-0039dF-OJ; Mon, 23 May 2022 10:15:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2oo-002AAA-Pl
 for ath11k@bombadil.infradead.org; Mon, 23 May 2022 07:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=JCAUOHMQ/PDpE33q21+DGv5BHFFj/450/8Dxcn6nGt8=; b=RNf+yrH/FgYP6Vv5X3iNnsf4ep
 Y9JhJNXr0COhwRmpHdSr0YhhpAotTIaDuDU1j8ynPcN2swEt4F1UCIWkYkf+uBkD0KPPgrafNcssj
 q2veGd8vyW74REwxCA31oU+cvUVzHCrGe3MUlMqdZuIAmRqpb2DzB3oy27c+TEvUz9OJJsswtTCsm
 x2OnV8DGU+Gn5dArKtWjLRxsjCGBCbnNeIEepEBzUC5VR5nXv1tDp3WG6pVSWtI7u9C54nX3+wyJz
 S7RYJ/00CuBVO7iIU9aP1LVslnTMwrRf7c/xhK5qwvOnjYy3pYcigE4urxxiyRZk8mqnU2C5Qxzci
 I3QxF9Vg==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt19T-000seF-K5
 for ath11k@lists.infradead.org; Mon, 23 May 2022 06:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653285767; x=1684821767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JCAUOHMQ/PDpE33q21+DGv5BHFFj/450/8Dxcn6nGt8=;
 b=AjcuG6+bvxBZcKfNm/Fxpz2vBbSYa2P39mh7oN2g7fQluBty7ZMJbasN
 uW1t0WfN/Oi+pOJwx5rxGy4fFON66+Mqzl13g+7zjZggcDFkz8Xg47iyE
 MyjmJgTmyyDmWcmvMT48+C6YeHOlDbVNm4lB13NxqVtKvtBfWOkL5dRBM s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 May 2022 23:01:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 23:01:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:27 -0700
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:26 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>, John Crispin <john@phrozen.org>
Subject: [PATCH 4/9] ath11k: MBSSID configuration during vdev create/start
Date: Sun, 22 May 2022 23:01:03 -0700
Message-ID: <20220523060108.23982-5-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220523060108.23982-1-quic_alokad@quicinc.com>
References: <20220523060108.23982-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070248_503379_78D7FE31 
X-CRM114-Status: GOOD (  17.30  )
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

Configure multiple BSSID flags and index of the transmitting interface
in vdev create/start commands depending on the service bit
WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT.

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Co-developed-by: John Crispin <john@phrozen.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 70 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.c |  5 ++
 drivers/net/wireless/ath/ath11k/wmi.h | 22 +++++++++
 3 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 075a307797d8..8f629e54a53d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5938,17 +5938,62 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw)
 	atomic_set(&ar->num_pending_mgmt_tx, 0);
 }
 
-static void
-ath11k_mac_setup_vdev_create_params(struct ath11k_vif *arvif,
-				    struct vdev_create_params *params)
+static int ath11k_mac_setup_vdev_params_mbssid(struct ath11k_vif *arvif,
+					       u32 *flags, u32 *tx_vdev_id)
+{
+	struct ath11k *ar = arvif->ar;
+	struct ath11k_vif *tx_arvif;
+	struct ieee80211_vif *tx_vif;
+
+	*tx_vdev_id = 0;
+	tx_vif = arvif->vif->mbssid_tx_vif;
+	if (!tx_vif) {
+		*flags = WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP;
+		return 0;
+	}
+
+	tx_arvif = (void *)tx_vif->drv_priv;
+
+	if (arvif->vif->bss_conf.nontransmitted) {
+		if (ar->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
+			return -EINVAL;
+
+		*flags = WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP;
+		*tx_vdev_id = ath11k_vif_to_arvif(tx_vif)->vdev_id;
+	} else if (tx_arvif == arvif) {
+		*flags = WMI_HOST_VDEV_FLAGS_TRANSMIT_AP;
+	} else {
+		return -EINVAL;
+	}
+
+	if (arvif->vif->bss_conf.ema_ap)
+		*flags |= WMI_HOST_VDEV_FLAGS_EMA_MODE;
+
+	return 0;
+}
+
+static int ath11k_mac_setup_vdev_create_params(struct ath11k_vif *arvif,
+					       struct vdev_create_params *params)
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_pdev *pdev = ar->pdev;
+	int ret;
 
 	params->if_id = arvif->vdev_id;
 	params->type = arvif->vdev_type;
 	params->subtype = arvif->vdev_subtype;
 	params->pdev_id = pdev->pdev_id;
+	params->mbssid_flags = 0;
+	params->mbssid_tx_vdev_id = 0;
+
+	if (!test_bit(WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT,
+		      ar->ab->wmi_ab.svc_map)) {
+		ret = ath11k_mac_setup_vdev_params_mbssid(arvif,
+							  &params->mbssid_flags,
+							  &params->mbssid_tx_vdev_id);
+		if (ret)
+			return ret;
+	}
 
 	if (pdev->cap.supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		params->chains[NL80211_BAND_2GHZ].tx = ar->num_tx_chains;
@@ -5963,6 +6008,7 @@ ath11k_mac_setup_vdev_create_params(struct ath11k_vif *arvif,
 		params->chains[NL80211_BAND_6GHZ].tx = ar->num_tx_chains;
 		params->chains[NL80211_BAND_6GHZ].rx = ar->num_rx_chains;
 	}
+	return 0;
 }
 
 static u32
@@ -6279,7 +6325,12 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
 		vif->hw_queue[i] = i % (ATH11K_HW_MAX_QUEUES - 1);
 
-	ath11k_mac_setup_vdev_create_params(arvif, &vdev_param);
+	ret = ath11k_mac_setup_vdev_create_params(arvif, &vdev_param);
+	if (ret) {
+		ath11k_warn(ab, "failed to create vdev parameters %d: %d\n",
+			    arvif->vdev_id, ret);
+		goto err;
+	}
 
 	ret = ath11k_wmi_vdev_create(ar, vif->addr, &vdev_param);
 	if (ret) {
@@ -6705,6 +6756,17 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 	arg.pref_tx_streams = ar->num_tx_chains;
 	arg.pref_rx_streams = ar->num_rx_chains;
 
+	arg.mbssid_flags = 0;
+	arg.mbssid_tx_vdev_id = 0;
+	if (test_bit(WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT,
+		     ar->ab->wmi_ab.svc_map)) {
+		ret = ath11k_mac_setup_vdev_params_mbssid(arvif,
+							  &arg.mbssid_flags,
+							  &arg.mbssid_tx_vdev_id);
+		if (ret)
+			return ret;
+	}
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		arg.ssid = arvif->u.ap.ssid;
 		arg.ssid_len = arvif->u.ap.ssid_len;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index b71f68d675f1..d0716f6208b2 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -720,6 +720,9 @@ int ath11k_wmi_vdev_create(struct ath11k *ar, u8 *macaddr,
 	cmd->vdev_subtype = param->subtype;
 	cmd->num_cfg_txrx_streams = WMI_NUM_SUPPORTED_BAND_MAX;
 	cmd->pdev_id = param->pdev_id;
+	cmd->mbssid_flags = param->mbssid_flags;
+	cmd->mbssid_tx_vdev_id = param->mbssid_tx_vdev_id;
+
 	ether_addr_copy(cmd->vdev_macaddr.addr, macaddr);
 
 	ptr = skb->data + sizeof(*cmd);
@@ -936,6 +939,8 @@ int ath11k_wmi_vdev_start(struct ath11k *ar, struct wmi_vdev_start_req_arg *arg,
 	cmd->cac_duration_ms = arg->cac_duration_ms;
 	cmd->regdomain = arg->regdomain;
 	cmd->he_ops = arg->he_ops;
+	cmd->mbssid_flags = arg->mbssid_flags;
+	cmd->mbssid_tx_vdev_id = arg->mbssid_tx_vdev_id;
 
 	if (!restart) {
 		if (arg->ssid) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 842c074c7efa..c572774b9659 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -137,6 +137,14 @@ enum {
 	WMI_AUTORATE_3200NS_GI = BIT(11),
 };
 
+enum {
+	WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP       = 0x00000001,
+	WMI_HOST_VDEV_FLAGS_TRANSMIT_AP         = 0x00000002,
+	WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP     = 0x00000004,
+	WMI_HOST_VDEV_FLAGS_EMA_MODE            = 0x00000008,
+	WMI_HOST_VDEV_FLAGS_SCAN_MODE_VAP       = 0x00000010,
+};
+
 /*
  * wmi command groups.
  */
@@ -2091,6 +2099,10 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
 	WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT = 249,
+	WMI_TLV_REQUEST_CTRL_PATH_STATS_REQUEST = 250,
+	WMI_TLV_SERVICE_TPC_STATS_EVENT = 251,
+	WMI_TLV_SERVICE_NO_INTERBAND_MCC_SUPPORT = 252,
+	WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT = 253,
 
 	/* The second 128 bits */
 	WMI_MAX_EXT_SERVICE = 256,
@@ -2571,6 +2583,8 @@ struct vdev_create_params {
 		u8 rx;
 	} chains[NUM_NL80211_BANDS];
 	u32 pdev_id;
+	u32 mbssid_flags;
+	u32 mbssid_tx_vdev_id;
 };
 
 struct wmi_vdev_create_cmd {
@@ -2581,6 +2595,8 @@ struct wmi_vdev_create_cmd {
 	struct wmi_mac_addr vdev_macaddr;
 	u32 num_cfg_txrx_streams;
 	u32 pdev_id;
+	u32 mbssid_flags;
+	u32 mbssid_tx_vdev_id;
 } __packed;
 
 struct wmi_vdev_txrx_streams {
@@ -2644,6 +2660,9 @@ struct wmi_vdev_start_request_cmd {
 	u32 he_ops;
 	u32 cac_duration_ms;
 	u32 regdomain;
+	u32 min_data_rate;
+	u32 mbssid_flags;
+	u32 mbssid_tx_vdev_id;
 } __packed;
 
 #define MGMT_TX_DL_FRM_LEN		     64
@@ -2813,6 +2832,9 @@ struct wmi_vdev_start_req_arg {
 	u32 pref_rx_streams;
 	u32 pref_tx_streams;
 	u32 num_noa_descriptors;
+	u32 min_data_rate;
+	u32 mbssid_flags;
+	u32 mbssid_tx_vdev_id;
 };
 
 struct peer_create_params {
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
