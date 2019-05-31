Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWWIl-00075U-EZ
 for ath11k@lists.infradead.org; Fri, 31 May 2019 01:25:48 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH] ath11k: fix MIMO in 11ax mode
Date: Thu, 30 May 2019 18:25:36 -0700
Message-Id: <1559265936-32158-1-git-send-email-milehu@codeaurora.org>
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Miles Hu <milehu@codeaurora.org>

HE_MUMODE and HE_SOUNDING_MODE WMI commands are
mandatory to enable 11ax MU-MIMO.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 72 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 51 +++++++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d127513..5c4cff6 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3532,6 +3532,69 @@ ath11k_mac_setup_vdev_create_params(struct ath11k_vif *arvif,
 	}
 }
 
+static u32
+ath11k_mac_prepare_he_mode(struct ath11k_pdev *pdev, u32 viftype)
+{
+	struct ath11k_pdev_cap *pdev_cap = &pdev->cap;
+	struct ath11k_band_cap *cap_band = NULL;
+	u32 *hecap_phy_ptr = NULL;
+	u32 hemode = 0;
+
+	if (pdev->cap.supported_bands & WMI_HOST_WLAN_2G_CAP)
+		cap_band = &pdev_cap->band[NL80211_BAND_2GHZ];
+	else
+		cap_band = &pdev_cap->band[NL80211_BAND_5GHZ];
+
+	hecap_phy_ptr = &cap_band->he_cap_phy_info[0];
+
+	hemode = FIELD_PREP(HE_MODE_SU_TX_BFEE, HE_SU_BFEE_ENABLE) |
+		FIELD_PREP(HE_MODE_SU_TX_BFER, HECAP_PHY_SUBFMR_GET(hecap_phy_ptr)) |
+		FIELD_PREP(HE_MODE_UL_MUMIMO, HECAP_PHY_ULMUMIMO_GET(hecap_phy_ptr));
+
+	/* TODO WDS and other modes */
+	if (viftype == NL80211_IFTYPE_AP) {
+		hemode |= FIELD_PREP(HE_MODE_MU_TX_BFER,
+			   HECAP_PHY_MUBFMR_GET(hecap_phy_ptr)) |
+			FIELD_PREP(HE_MODE_DL_OFDMA, HE_DL_MUOFDMA_ENABLE) |
+			FIELD_PREP(HE_MODE_UL_OFDMA, HE_UL_MUOFDMA_ENABLE);
+	} else {
+		hemode |= FIELD_PREP(HE_MODE_MU_TX_BFEE, HE_MU_BFEE_ENABLE);
+	}
+
+	return hemode;
+}
+
+static int ath11k_set_he_mu_sounding_mode(struct ath11k *ar,
+					  struct ath11k_vif *arvif)
+{
+	u32 param_id, param_value;
+	struct ath11k_base *ab = ar->ab;
+	int ret = 0;
+
+	param_id = WMI_VDEV_PARAM_SET_HEMU_MODE;
+	param_value = ath11k_mac_prepare_he_mode(ar->pdev, arvif->vif->type);
+	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+					    param_id, param_value);
+	if (ret) {
+		ath11k_warn(ab, "failed to set vdev %d HE MU mode: %d param_value %x\n",
+			    arvif->vdev_id, ret, param_value);
+		return ret;
+	}
+	param_id = WMI_VDEV_PARAM_SET_HE_SOUNDING_MODE;
+	param_value =
+		FIELD_PREP(HE_VHT_SOUNDING_MODE, HE_VHT_SOUNDING_MODE_ENABLE) |
+		FIELD_PREP(HE_TRIG_NONTRIG_SOUNDING_MODE,
+			   HE_TRIG_NONTRIG_SOUNDING_MODE_ENABLE);
+	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+					    param_id, param_value);
+	if (ret) {
+		ath11k_warn(ab, "failed to set vdev %d HE MU mode: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+	return ret;
+}
+
 static int ath11k_add_interface(struct ieee80211_hw *hw,
 				struct ieee80211_vif *vif)
 {
@@ -3982,6 +4045,7 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_base *ab = ar->ab;
 	struct wmi_vdev_start_req_arg arg = {};
+	int he_support = arvif->vif->bss_conf.he_support;
 	int ret = 0;
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -4029,6 +4093,14 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 		spin_unlock_bh(&ab->data_lock);
 
 		/* TODO: Notify if secondary 80Mhz also needs radar detection */
+		if (he_support) {
+			ret = ath11k_set_he_mu_sounding_mode(ar, arvif);
+			if (ret) {
+				ath11k_warn(ar->ab, "failed to set he mode vdev %i\n",
+					    arg.vdev_id);
+				return ret;
+			}
+		}
 	}
 
 	arg.channel.passive |= !!(chandef->chan->flags & IEEE80211_CHAN_NO_IR);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 366a136..eb3723e 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -971,6 +971,7 @@ enum wmi_tlv_vdev_param {
 	WMI_VDEV_PARAM_HE_RANGE_EXT,
 	WMI_VDEV_PARAM_ENABLE_BCAST_PROBE_RESPONSE,
 	WMI_VDEV_PARAM_FILS_MAX_CHANNEL_GUARD_TIME,
+	WMI_VDEV_PARAM_SET_HE_SOUNDING_MODE = 0x87,
 	WMI_VDEV_PARAM_PROTOTYPE = 0x8000,
 	WMI_VDEV_PARAM_BSS_COLOR,
 	WMI_VDEV_PARAM_SET_HEMU_MODE,
@@ -3192,6 +3193,56 @@ struct rx_reorder_queue_remove_params {
 #define WMI_VDEV_PARAM_TXBF_SU_TX_BFER BIT(2)
 #define WMI_VDEV_PARAM_TXBF_MU_TX_BFER BIT(3)
 
+#define HECAP_PHYDWORD_0	0
+#define HECAP_PHYDWORD_1	1
+#define HECAP_PHYDWORD_2	2
+
+#define HECAP_PHY_SU_BFER		BIT(31)
+#define HECAP_PHY_SU_BFEE		BIT(0)
+#define HECAP_PHY_MU_BFER		BIT(1)
+#define HECAP_PHY_UL_MUMIMO		BIT(22)
+#define HECAP_PHY_UL_MUOFDMA		BIT(23)
+
+#define HECAP_PHY_SUBFMR_GET(hecap_phy) \
+	FIELD_GET(HECAP_PHY_SU_BFER, hecap_phy[HECAP_PHYDWORD_0])
+
+#define HECAP_PHY_SUBFME_GET(hecap_phy) \
+	FIELD_GET(HECAP_PHY_SU_BFEE, hecap_phy[HECAP_PHYDWORD_1])
+
+#define HECAP_PHY_MUBFMR_GET(hecap_phy) \
+	FIELD_GET(HECAP_PHY_MU_BFER, hecap_phy[HECAP_PHYDWORD_1])
+
+#define HECAP_PHY_ULMUMIMO_GET(hecap_phy) \
+	FIELD_GET(HECAP_PHY_UL_MUMIMO, hecap_phy[HECAP_PHYDWORD_0])
+
+#define HECAP_PHY_ULOFDMA_GET(hecap_phy) \
+	FIELD_GET(HECAP_PHY_UL_MUOFDMA, hecap_phy[HECAP_PHYDWORD_0])
+
+#define HE_MODE_SU_TX_BFEE	BIT(0)
+#define HE_MODE_SU_TX_BFER	BIT(1)
+#define HE_MODE_MU_TX_BFEE	BIT(2)
+#define HE_MODE_MU_TX_BFER	BIT(3)
+#define HE_MODE_DL_OFDMA	BIT(4)
+#define HE_MODE_UL_OFDMA	BIT(5)
+#define HE_MODE_UL_MUMIMO	BIT(6)
+
+#define HE_DL_MUOFDMA_ENABLE	1
+#define HE_UL_MUOFDMA_ENABLE	1
+#define HE_DL_MUMIMO_ENABLE	1
+#define HE_MU_BFEE_ENABLE	1
+#define HE_SU_BFEE_ENABLE	1
+
+#define HE_VHT_SOUNDING_MODE_ENABLE		1
+#define HE_SU_MU_SOUNDING_MODE_ENABLE		1
+#define HE_TRIG_NONTRIG_SOUNDING_MODE_ENABLE	1
+
+/* HE or VHT Sounding */
+#define HE_VHT_SOUNDING_MODE		BIT(0)
+/* SU or MU Sounding */
+#define HE_SU_MU_SOUNDING_MODE		BIT(2)
+/* Trig or Non-Trig Sounding */
+#define HE_TRIG_NONTRIG_SOUNDING_MODE	BIT(3)
+
 #define WMI_TXBF_STS_CAP_OFFSET_LSB	4
 #define WMI_TXBF_STS_CAP_OFFSET_MASK	0x70
 #define WMI_BF_SOUND_DIM_OFFSET_LSB	8
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
