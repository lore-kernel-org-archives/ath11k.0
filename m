Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcrFg-0001rx-F1
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 13:00:51 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: set additional values inside
 wmi_peer_assoc_complete_cmd
Date: Mon, 17 Jun 2019 15:00:42 +0200
Message-Id: <20190617130042.31734-1-john@phrozen.org>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <c_milehu@qti.qualcomm.com>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

The firmware can take 2 additional values for he_mac_cap that were not
set yet.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 drivers/net/wireless/ath/ath11k/wmi.c | 4 +++-
 drivers/net/wireless/ath/ath11k/wmi.h | 5 ++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index acd9a0c3e910..e9965983c2a1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1267,6 +1267,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 	       sizeof(arg->peer_he_cap_phyinfo));
 	memcpy(&arg->peer_he_ops, &vif->bss_conf.he_operation,
 	       sizeof(arg->peer_he_ops));
+	arg->peer_he_cap_macinfo_internal = 0x0;
 
 	if (he_cap->he_cap_elem.phy_cap_info[6] &
 	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index ba44ba148435..66455a2d8cb5 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1707,7 +1707,9 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 	cmd->peer_phymode = param->peer_phymode;
 
 	/* Update 11ax capabilities */
-	cmd->peer_he_cap_info = param->peer_he_cap_macinfo;
+	cmd->peer_he_cap_info = param->peer_he_cap_macinfo[0];
+	cmd->peer_he_cap_info_ext = param->peer_he_cap_macinfo[1];
+	cmd->peer_he_cap_info_internal = param->peer_he_cap_macinfo_internal;
 	cmd->peer_he_ops = param->peer_he_ops;
 	memcpy(&cmd->peer_he_cap_phy, &param->peer_he_cap_phyinfo,
 	       sizeof(param->peer_he_cap_phyinfo));
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index f1d87ef1c691..8feae5c31ee3 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3971,7 +3971,8 @@ struct peer_assoc_params {
 	u8 peer_mac[ETH_ALEN];
 
 	bool he_flag;
-	u32 peer_he_cap_macinfo;
+	u32 peer_he_cap_macinfo[2];
+	u32 peer_he_cap_macinfo_internal;
 	u32 peer_he_ops;
 	u32 peer_he_cap_phyinfo[WMI_HOST_MAX_HECAP_PHY_SIZE];
 	u32 peer_he_mcs_count;
@@ -4007,6 +4008,8 @@ struct  wmi_peer_assoc_complete_cmd {
 	u32 peer_he_ops;
 	u32 peer_he_cap_phy[WMI_MAX_HECAP_PHY_SIZE];
 	u32 peer_he_mcs;
+	u32 peer_he_cap_info_ext;
+	u32 peer_he_cap_info_internal;
 } __packed;
 
 struct wmi_stop_scan_cmd {
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
