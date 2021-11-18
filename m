Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F201C433F5
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:57:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF8561A3D
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCF8561A3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xXxX1vJ6/7mIFqH87rdIwGFyMTU+1rxdagL9KC8aPwk=; b=xjYai+AL5kclkR
	zRKHMDJZrrlpOHzIB02ckOdY1uDGx8DknaFqLuMXoZ9BeW0qNRXEPousiBF4+rxdtk+j1WE5TLPwl
	zJFaJFS+4unrVkKC7v3q1ey+oYdqOwxXVfOrQ/fao6UJrj6gGulcs+QKn5aL3i84zGuOWnFh3Xee7
	nug7LiD7gwL0FXOVNrRhqyG7064LP+3UYpXZUi6jFXsOGv/YMyW5yEbbNb0LHWOkJLhk3LqvCW8XS
	EilXJfQdiv/izb2Tu929esqq3xKxTbViz/1R0Rjb47gg99j6yXkATJpWqfhml0msN6awAzOtyhnzk
	ZymtNbQHh6mh8K9a7u9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mneAT-007OIt-M3; Thu, 18 Nov 2021 09:57:21 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mneAR-007OI3-8E
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 09:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637229439; x=1668765439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YQ1I2iXVEIu4lGtFo2nJn/TXZN894U7+hg9XGc3Lr9I=;
 b=SpMDc0yQV6UgHbO+7MPdr8UyZytCUeowmGkGalr2UNnMy+Cco8Rau1EF
 +1ADBtnw1jyTpJr02D5mjuvxGnBNrg60s9blnbAZfL/P0IdxLtLl2Bme6
 QC4WggiTbsfm9etQfYfi0GEqM94akpsWEjEM0NgEnrEFO776oPaSygpv/ Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 18 Nov 2021 01:57:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 01:57:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:57:17 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:57:16 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath11k: fix read fail for htt_stats and htt_peer_stats for
 single pdev
Date: Thu, 18 Nov 2021 04:57:00 -0500
Message-ID: <20211118095700.8149-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_015719_391851_725503F0 
X-CRM114-Status: GOOD (  19.09  )
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

The pdev id is set to 0 for single pdev configured hardware, the real
pdev id is not 0 in firmware, for example, its pdev id is 1 for 5G/6G
phy and 2 for 2G band phy. For HTT_H2T_MSG_TYPE_EXT_STATS_CFG message,
firmware parse the pdev_mask to its pdev id, ath11k set it to 0 for
single pdev, it is not correct, need set it with the real pdev id of
firmware.

Save the real pdev id report by firmware and set it correctly.

Below commands run success with this patch:
cat /sys/kernel/debug/ieee80211/phy0/ath11k/htt_stats
cat /sys/kernel/debug/ieee80211/phy0/netdev\:wls1/stations/00\:03\:7f\:75\:59\:85/htt_peer_stats

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2: rebased to latest ath.git master ath-202111170737

 drivers/net/wireless/ath/ath11k/core.h  |  5 ++
 drivers/net/wireless/ath/ath11k/dp_tx.c |  9 +++-
 drivers/net/wireless/ath/ath11k/mac.c   | 61 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.h   |  4 ++
 drivers/net/wireless/ath/ath11k/wmi.c   |  6 +++
 drivers/net/wireless/ath/ath11k/wmi.h   |  4 +-
 6 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index bbfc10fd5c6d..8054997ac581 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -711,6 +711,11 @@ struct ath11k_base {
 	/* Protects data like peers */
 	spinlock_t base_lock;
 	struct ath11k_pdev pdevs[MAX_RADIOS];
+	struct {
+		enum WMI_HOST_WLAN_BAND supported_bands;
+		u32 pdev_id;
+	} target_pdev_ids[MAX_RADIOS];
+	u8 target_pdev_count;
 	struct ath11k_pdev __rcu *pdevs_active[MAX_RADIOS];
 	struct ath11k_hal_reg_capabilities_ext hal_reg_cap[MAX_RADIOS];
 	unsigned long long free_vdev_map;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 88abd64e9047..7587e1679ec3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -9,6 +9,7 @@
 #include "debugfs_sta.h"
 #include "hw.h"
 #include "peer.h"
+#include "mac.h"
 
 static enum hal_tcl_encap_type
 ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
@@ -985,6 +986,7 @@ ath11k_dp_tx_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
 	struct ath11k_dp *dp = &ab->dp;
 	struct sk_buff *skb;
 	struct htt_ext_stats_cfg_cmd *cmd;
+	u32 pdev_id;
 	int len = sizeof(*cmd);
 	int ret;
 
@@ -998,7 +1000,12 @@ ath11k_dp_tx_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
 	memset(cmd, 0, sizeof(*cmd));
 	cmd->hdr.msg_type = HTT_H2T_MSG_TYPE_EXT_STATS_CFG;
 
-	cmd->hdr.pdev_mask = 1 << ar->pdev->pdev_id;
+	if (ab->hw_params.single_pdev_only)
+		pdev_id = ath11k_mac_get_target_pdev_id(ar);
+	else
+		pdev_id = ar->pdev->pdev_id;
+
+	cmd->hdr.pdev_mask = 1 << pdev_id;
 
 	cmd->hdr.stats_type = type;
 	cmd->cfg_param0 = cfg_params->cfg0;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 292b2b7eab11..4357ce56c5b1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -553,6 +553,67 @@ struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id)
 	return NULL;
 }
 
+struct ath11k_vif *ath11k_mac_get_vif_up(struct ath11k_base *ab)
+{
+	struct ath11k *ar;
+	struct ath11k_pdev *pdev;
+	struct ath11k_vif *arvif;
+	int i;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = &ab->pdevs[i];
+		ar = pdev->ar;
+		list_for_each_entry(arvif, &ar->arvifs, list) {
+			if (arvif->is_up)
+				return arvif;
+		}
+	}
+
+	return NULL;
+}
+
+static bool ath11k_mac_band_match(enum nl80211_band band1, enum WMI_HOST_WLAN_BAND band2)
+{
+	return (((band1 == NL80211_BAND_2GHZ) && (band2 & WMI_HOST_WLAN_2G_CAP)) ||
+		(((band1 == NL80211_BAND_5GHZ) || (band1 == NL80211_BAND_6GHZ)) &&
+		   (band2 & WMI_HOST_WLAN_5G_CAP)));
+}
+
+u8 ath11k_mac_get_target_pdev_id_from_vif(struct ath11k_vif *arvif)
+{
+	struct ath11k *ar = arvif->ar;
+	struct ath11k_base *ab = ar->ab;
+	struct ieee80211_vif *vif = arvif->vif;
+	struct cfg80211_chan_def def;
+	enum nl80211_band band;
+	u8 pdev_id = ab->target_pdev_ids[0].pdev_id;
+	int i;
+
+	if (WARN_ON(ath11k_mac_vif_chan(vif, &def)))
+		return pdev_id;
+
+	band = def.chan->band;
+
+	for (i = 0; i < ab->target_pdev_count; i++) {
+		if (ath11k_mac_band_match(band, ab->target_pdev_ids[i].supported_bands))
+			return ab->target_pdev_ids[i].pdev_id;
+	}
+
+	return pdev_id;
+}
+
+u8 ath11k_mac_get_target_pdev_id(struct ath11k *ar)
+{
+	struct ath11k_vif *arvif;
+
+	arvif = ath11k_mac_get_vif_up(ar->ab);
+
+	if (arvif)
+		return ath11k_mac_get_target_pdev_id_from_vif(arvif);
+	else
+		return ar->ab->target_pdev_ids[0].pdev_id;
+}
+
 static void ath11k_pdev_caps_update(struct ath11k *ar)
 {
 	struct ath11k_base *ab = ar->ab;
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index f6f37e8c8c6a..359e5e9ca904 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -144,6 +144,10 @@ void ath11k_mac_scan_finish(struct ath11k *ar);
 struct ath11k_vif *ath11k_mac_get_arvif(struct ath11k *ar, u32 vdev_id);
 struct ath11k_vif *ath11k_mac_get_arvif_by_vdev_id(struct ath11k_base *ab,
 						   u32 vdev_id);
+u8 ath11k_mac_get_target_pdev_id(struct ath11k *ar);
+u8 ath11k_mac_get_target_pdev_id_from_vif(struct ath11k_vif *arvif);
+struct ath11k_vif *ath11k_mac_get_vif_up(struct ath11k_base *ab);
+
 struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id);
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 614b2f6bcc8e..cfac4c7fa811 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -337,6 +337,7 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 				      struct ath11k_pdev *pdev)
 {
 	struct wmi_mac_phy_capabilities *mac_phy_caps;
+	struct ath11k_base *ab = wmi_handle->wmi_ab->ab;
 	struct ath11k_band_cap *cap_band;
 	struct ath11k_pdev_cap *pdev_cap = &pdev->cap;
 	u32 phy_map;
@@ -368,6 +369,10 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	pdev->pdev_id = mac_phy_caps->pdev_id;
 	pdev_cap->supported_bands |= mac_phy_caps->supported_bands;
 	pdev_cap->ampdu_density = mac_phy_caps->ampdu_density;
+	ab->target_pdev_ids[ab->target_pdev_count].supported_bands =
+		mac_phy_caps->supported_bands;
+	ab->target_pdev_ids[ab->target_pdev_count].pdev_id = mac_phy_caps->pdev_id;
+	ab->target_pdev_count++;
 
 	/* Take non-zero tx/rx chainmask. If tx/rx chainmask differs from
 	 * band to band for a single radio, need to see how this should be
@@ -4230,6 +4235,7 @@ static int ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse(struct ath11k_base *soc,
 	svc_rdy_ext->param.num_phy = svc_rdy_ext->soc_hal_reg_caps->num_phy;
 
 	soc->num_radios = 0;
+	soc->target_pdev_count = 0;
 	phy_id_map = svc_rdy_ext->pref_hw_mode_caps.phy_id_map;
 
 	while (phy_id_map && soc->num_radios < MAX_RADIOS) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4eb06cb7f883..8e8bac1b7370 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -113,10 +113,10 @@ enum wmi_host_hw_mode_priority {
 	WMI_HOST_HW_MODE_MAX_PRI
 };
 
-enum {
+enum WMI_HOST_WLAN_BAND {
 	WMI_HOST_WLAN_2G_CAP	= 0x1,
 	WMI_HOST_WLAN_5G_CAP	= 0x2,
-	WMI_HOST_WLAN_2G_5G_CAP	= 0x3,
+	WMI_HOST_WLAN_2G_5G_CAP	= WMI_HOST_WLAN_2G_CAP | WMI_HOST_WLAN_5G_CAP,
 };
 
 /* Parameters used for WMI_VDEV_PARAM_AUTORATE_MISC_CFG command.

base-commit: 63ec871bc50a306aac550e2d85f697ca2d5f5deb
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
