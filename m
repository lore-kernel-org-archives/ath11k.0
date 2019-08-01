Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht56W-0004Q5-Fa
 for ath11k@lists.infradead.org; Thu, 01 Aug 2019 07:02:25 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: fix wmi service ready ext tlv parsing
Date: Thu,  1 Aug 2019 12:31:56 +0530
Message-Id: <1564642916-4728-1-git-send-email-akolli@codeaurora.org>
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

The current ath11k driver failed to parse
wmi_tlv_svc_rdy_ext_parse if there is change in
wmi_mac_phy_capabilities length with below error.

ath11k c000000.wifi1: failed to extract mac caps, idx :0
ath11k c000000.wifi1: failed to parse tlv -22

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 14 +++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.h |  1 -
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 83310d6b6a0e..e46ba532a6a1 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -310,7 +310,7 @@ static int ath11k_pull_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	if (phy_id >= hal_reg_caps->num_phy)
 		return -EINVAL;
 
-	mac_phy_caps = &wmi_mac_phy_caps[phy_idx];
+	mac_phy_caps = wmi_mac_phy_caps + phy_idx;
 
 	pdev->pdev_id = mac_phy_caps->pdev_id;
 	pdev_cap->supported_bands = mac_phy_caps->supported_bands;
@@ -2837,6 +2837,15 @@ static int ath11k_wmi_tlv_mac_phy_caps_parse(struct ath11k_base *soc,
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
@@ -2970,8 +2979,6 @@ static int ath11k_wmi_tlv_svc_rdy_ext_parse(struct ath11k_base *ab,
 			svc_rdy_ext->hw_mode_done = true;
 		} else if (!svc_rdy_ext->mac_phy_done) {
 			svc_rdy_ext->n_mac_phy_caps = 0;
-			svc_rdy_ext->mac_phy_caps =
-					(struct wmi_mac_phy_capabilities *)ptr;
 			ret = ath11k_wmi_tlv_iter(ab, ptr, len,
 						  ath11k_wmi_tlv_mac_phy_caps_parse,
 						  svc_rdy_ext);
@@ -3012,6 +3019,7 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 		return ret;
 	}
 
+	kfree(svc_rdy_ext.mac_phy_caps);
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 7d933eafd3cd..8b75b7f9aef1 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2241,7 +2241,6 @@ struct wmi_hw_mode_capabilities {
 #define WMI_MAX_HECAP_PHY_SIZE                 (3)
 
 struct wmi_mac_phy_capabilities {
-	u32 tlv_header;
 	u32 hw_mode_id;
 	u32 pdev_id;
 	u32 phy_id;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
