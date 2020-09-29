Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJEU-0000SO-EB
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 17:16:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/8] ath11k: disable monitor mode on QCA6390
Date: Tue, 29 Sep 2020 20:15:33 +0300
Message-Id: <1601399736-3210-6-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
References: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
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

QCA6390 does not support monitor mode at the moment so disable it altogether,
using a hack as mac80211 does not support disabling it otherwise. Add a boolean
to hw_params to know if hardware supports monitor mode.

IPQ8074 continues to support monitor mode normally.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 3 +++
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 28aeb9fe602b..951dca1b66b4 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -62,6 +62,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
 					BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = true,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -96,6 +97,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
 					BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = true,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -129,6 +131,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP),
+		.supports_monitor = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 5bd3fe618dd8..a281ad3bdf04 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -158,6 +158,7 @@ struct ath11k_hw_params {
 	u8 spectral_fft_sz;
 
 	u16 interface_modes;
+	bool supports_monitor;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 491e62d66edc..9efaf6e7aacf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6241,6 +6241,14 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		goto err_free_if_combs;
 	}
 
+	if (!ab->hw_params.supports_monitor)
+		/* There's a race between calling ieee80211_register_hw()
+		 * and here where the monitor mode is enabled for a little
+		 * while. But that time is so short and in practise it make
+		 * a difference in real life.
+		 */
+		ar->hw->wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
+
 	/* Apply the regd received during initialization */
 	ret = ath11k_regd_update(ar, true);
 	if (ret) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
