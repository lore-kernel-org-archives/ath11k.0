Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYeI-0002jj-2k
 for ath11k@lists.infradead.org; Tue, 26 Nov 2019 11:04:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 03/10] ath11k: fix wmi service ready ext tlv parsing
Date: Tue, 26 Nov 2019 11:04:49 +0000
Message-ID: <0101016ea762a1ec-0099c5b1-2401-4627-8e9d-0e781ab6be45-000000@us-west-2.amazonses.com>
In-Reply-To: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
References: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Anilkumar Kolli <akolli@codeaurora.org>

The current ath11k driver failed to parse
wmi_tlv_svc_rdy_ext_parse if there is change in
wmi_mac_phy_capabilities length with below error.

ath11k c000000.wifi1: failed to extract mac caps, idx :0
ath11k c000000.wifi1: failed to parse tlv -22

This is needed to get firmware version
WLAN.HK.2.0.0.1-00240-QCAHKSWPL_SILICONZ-1 working.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 14 +++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.h |  1 -
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2c3c973f5f7c..ccebf7ce420a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -310,7 +310,7 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	if (phy_id >= hal_reg_caps->num_phy)
 		return -EINVAL;
 
-	mac_phy_caps = &wmi_mac_phy_caps[phy_idx];
+	mac_phy_caps = wmi_mac_phy_caps + phy_idx;
 
 	pdev->pdev_id = mac_phy_caps->pdev_id;
 	pdev_cap->supported_bands = mac_phy_caps->supported_bands;
@@ -2959,6 +2959,15 @@ static int ath11k_wmi_tlv_mac_phy_caps_parse(struct ath11k_base *soc,
 	if (svc_rdy_ext->n_mac_phy_caps >= svc_rdy_ext->tot_phy_id)
 		return -ENOBUFS;
 
+	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
+	if (!svc_rdy_ext->n_mac_phy_caps) {
+		svc_rdy_ext->mac_phy_caps = kzalloc((svc_rdy_ext->tot_phy_id) * len,
+						    GFP_ATOMIC);
+		if (!svc_rdy_ext->mac_phy_caps)
+			return -ENOMEM;
+	}
+
+	memcpy(svc_rdy_ext->mac_phy_caps + svc_rdy_ext->n_mac_phy_caps, ptr, len);
 	svc_rdy_ext->n_mac_phy_caps++;
 	return 0;
 }
@@ -3092,8 +3101,6 @@ static int ath11k_wmi_tlv_svc_rdy_ext_parse(struct ath11k_base *ab,
 			svc_rdy_ext->hw_mode_done = true;
 		} else if (!svc_rdy_ext->mac_phy_done) {
 			svc_rdy_ext->n_mac_phy_caps = 0;
-			svc_rdy_ext->mac_phy_caps =
-					(struct wmi_mac_phy_capabilities *)ptr;
 			ret = ath11k_wmi_tlv_iter(ab, ptr, len,
 						  ath11k_wmi_tlv_mac_phy_caps_parse,
 						  svc_rdy_ext);
@@ -3134,6 +3141,7 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 		return ret;
 	}
 
+	kfree(svc_rdy_ext.mac_phy_caps);
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 7d5690c65279..6a0468094694 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2276,7 +2276,6 @@ struct wmi_hw_mode_capabilities {
 #define WMI_MAX_HECAP_PHY_SIZE                 (3)
 
 struct wmi_mac_phy_capabilities {
-	u32 tlv_header;
 	u32 hw_mode_id;
 	u32 pdev_id;
 	u32 phy_id;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
