Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiuZt-0007IW-K8
 for ath11k@lists.infradead.org; Wed, 10 Jun 2020 06:51:20 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: fix wmi peer flags in peer assoc command
Date: Wed, 10 Jun 2020 12:20:41 +0530
Message-Id: <1591771841-25503-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org

Currently need ptk/gtk wmi peer flags in wmi peer assoc cmd
are set based on the rsnie and wpaie of the bss from the bss list.
Since this bss list is not updated with current BSSID for AP mode,
we may not find bss from the bss list. Which results in ptk/gtk peer
flags are not set in the wmi peer assoc cmd. Due to this EAPOL frames
are going in data rates instead of management rates.

Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  2 ++
 drivers/net/wireless/ath/ath11k/mac.c  | 21 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c  |  6 +++---
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e04f0e7..bcc223d 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -221,6 +221,8 @@ struct ath11k_vif {
 	int num_legacy_stations;
 	int rtscts_prot_mode;
 	int txpower;
+	bool rsnie_present;
+	bool wpaie_present;
 };
 
 struct ath11k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2836a0f..195b45e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -698,6 +698,8 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
+	struct ieee80211_mgmt *mgmt;
+	u8 *ies;
 	int ret;
 
 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
@@ -709,6 +711,17 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 		return -EPERM;
 	}
 
+	ies = bcn->data + ieee80211_get_hdrlen_from_skb(bcn);
+	ies += sizeof(mgmt->u.beacon);
+
+	if (cfg80211_find_ie(WLAN_EID_RSN, ies, (skb_tail_pointer(bcn) - ies)))
+		arvif->rsnie_present = true;
+
+	if (cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT,
+				    WLAN_OUI_TYPE_MICROSOFT_WPA,
+				    ies, (skb_tail_pointer(bcn) - ies)))
+		arvif->wpaie_present = true;
+
 	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn);
 
 	kfree_skb(bcn);
@@ -798,6 +811,7 @@ static void ath11k_peer_assoc_h_crypto(struct ath11k *ar,
 	struct ieee80211_bss_conf *info = &vif->bss_conf;
 	struct cfg80211_chan_def def;
 	struct cfg80211_bss *bss;
+	struct ath11k_vif *arvif = (struct ath11k_vif *)vif->drv_priv;
 	const u8 *rsnie = NULL;
 	const u8 *wpaie = NULL;
 
@@ -808,7 +822,12 @@ static void ath11k_peer_assoc_h_crypto(struct ath11k *ar,
 
 	bss = cfg80211_get_bss(ar->hw->wiphy, def.chan, info->bssid, NULL, 0,
 			       IEEE80211_BSS_TYPE_ANY, IEEE80211_PRIVACY_ANY);
-	if (bss) {
+
+	if (arvif->rsnie_present || arvif->wpaie_present) {
+		arg->need_ptk_4_way = true;
+		if (arvif->wpaie_present)
+			arg->need_gtk_2_way = true;
+	} else if (bss) {
 		const struct cfg80211_bss_ies *ies;
 
 		rcu_read_lock();
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c2a9723..ac97bc4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1692,10 +1692,10 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 	 */
 	if (param->auth_flag)
 		cmd->peer_flags |= WMI_PEER_AUTH;
-	if (param->need_ptk_4_way)
+	if (param->need_ptk_4_way) {
 		cmd->peer_flags |= WMI_PEER_NEED_PTK_4_WAY;
-	else
-		cmd->peer_flags &= ~WMI_PEER_NEED_PTK_4_WAY;
+		cmd->peer_flags &= ~WMI_PEER_AUTH;
+	}
 	if (param->need_gtk_2_way)
 		cmd->peer_flags |= WMI_PEER_NEED_GTK_2_WAY;
 	/* safe mode bypass the 4-way handshake */
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
