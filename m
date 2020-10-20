Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUwQf-0003nG-FR
 for ath11k@lists.infradead.org; Tue, 20 Oct 2020 18:32:17 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v2 3/4] ath11k: support TXOP duration based RTS threshold
Date: Tue, 20 Oct 2020 11:31:10 -0700
Message-Id: <20201020183111.25458-4-pradeepc@codeaurora.org>
In-Reply-To: <20201020183111.25458-1-pradeepc@codeaurora.org>
References: <20201020183111.25458-1-pradeepc@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

HE operation IE in beacons is constructed based on userspace params,
which firmware might not be aware of. This causes firmware not to
configure TXOP duration based RTS threshold which could cause mismatch
in behaviour with respect to what is being advertised in beacons. This
patch sends HE operation IE fetched from beacon to firmware using
WMI interface for configuration.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7f8dd47d2333..b44b67760e02 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1948,9 +1948,25 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_BSSID && !is_zero_ether_addr(info->bssid))
 		ether_addr_copy(arvif->bssid, info->bssid);
 
-	if (changed & BSS_CHANGED_BEACON_ENABLED)
+	if (changed & BSS_CHANGED_BEACON_ENABLED) {
 		ath11k_control_beaconing(arvif, info);
 
+		if (arvif->is_up && vif->bss_conf.he_support &&
+		    vif->bss_conf.he_oper.params) {
+			param_id = WMI_VDEV_PARAM_HEOPS_0_31;
+			param_value = vif->bss_conf.he_oper.params;
+			ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+							    param_id, param_value);
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "he oper param: %x set for VDEV: %d\n",
+				   param_value, arvif->vdev_id);
+
+			if (ret)
+				ath11k_warn(ar->ab, "Failed to set he oper params %x for VDEV %d: %i\n",
+					    param_value, arvif->vdev_id, ret);
+		}
+	}
+
 	if (changed & BSS_CHANGED_ERP_CTS_PROT) {
 		u32 cts_prot;
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
