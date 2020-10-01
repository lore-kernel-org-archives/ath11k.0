Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuzS-0006Bi-Jk
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 09:35:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 7/8] ath11k: enable idle power save mode
Date: Thu,  1 Oct 2020 12:34:49 +0300
Message-Id: <1601544890-13450-8-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
References: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Carl Huang <cjhuang@codeaurora.org>

Host sends wmi command to allow hardware enter idle power
save mode in ath11k_mac_op_start function.

hw parameter idle_ps indicates whether idle power save is supported.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 3 +++
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 9 +++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index e94d760b21a0..ebd6886a8c18 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -64,6 +64,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 					BIT(NL80211_IFTYPE_MESH_POINT),
 		.supports_monitor = true,
 		.supports_shadow_regs = false,
+		.idle_ps = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -100,6 +101,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 					BIT(NL80211_IFTYPE_MESH_POINT),
 		.supports_monitor = true,
 		.supports_shadow_regs = false,
+		.idle_ps = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -135,6 +137,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 					BIT(NL80211_IFTYPE_AP),
 		.supports_monitor = false,
 		.supports_shadow_regs = true,
+		.idle_ps = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 8e908bcd491e..1dda4257e6d7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -160,6 +160,7 @@ struct ath11k_hw_params {
 	u16 interface_modes;
 	bool supports_monitor;
 	bool supports_shadow_regs;
+	bool idle_ps;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 76e218e53fe7..d42858d1a578 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4208,6 +4208,15 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx],
 			   &ab->pdevs[ar->pdev_idx]);
 
+	/* allow device to enter IMPS */
+	if (ab->hw_params.idle_ps) {
+		ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_IDLE_PS_CONFIG,
+						1, pdev->pdev_id);
+		if (ret) {
+			ath11k_err(ab, "failed to enable idle ps: %d\n", ret);
+			goto err;
+		}
+	}
 	return 0;
 
 err:
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
