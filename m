Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY7jU-0002c3-Ah
 for ath11k@lists.infradead.org; Tue, 04 Jun 2019 11:36:01 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Fix the rate mask value for legacy and peer fixed rate
Date: Tue,  4 Jun 2019 17:07:19 +0530
Message-Id: <1559648239-16220-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

The rate mask value is changed from 0xff to oxffff (u8 to u32)
in the firmware for the legacy fixed rate and peer fixed rate
setting in the set bitrate command.
Hence this patch is fixing the same in the driver.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 +++---
 drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e2aa60..f490d7ccc2e2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4454,7 +4454,7 @@ static int
 ath11k_mac_get_single_legacy_rate(struct ath11k *ar,
 				  enum nl80211_band band,
 				  const struct cfg80211_bitrate_mask *mask,
-				  u8 *rate, u8 *nss)
+				  u32 *rate, u8 *nss)
 {
 	int rate_idx;
 	u16 bitrate;
@@ -4484,7 +4484,7 @@ ath11k_mac_get_single_legacy_rate(struct ath11k *ar,
 }
 
 static int ath11k_mac_set_fixed_rate_params(struct ath11k_vif *arvif,
-					    u8 rate, u8 nss, u8 sgi, u8 ldpc)
+					    u32 rate, u8 nss, u8 sgi, u8 ldpc)
 {
 	struct ath11k *ar = arvif->ar;
 	u32 vdev_param;
@@ -4584,7 +4584,7 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	enum nl80211_band band;
 	const u8 *ht_mcs_mask;
 	const u16 *vht_mcs_mask;
-	u8 rate;
+	u32 rate;
 	u8 nss;
 	u8 sgi;
 	u8 ldpc;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 366a136e53ac..fe89f761ccc3 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4926,7 +4926,7 @@ enum wmi_ap_ps_peer_param {
 #define WMI_CIPHER_AES_GMAC 0xa
 
 /* Value to disable fixed rate setting */
-#define WMI_FIXED_RATE_NONE	(0xff)
+#define WMI_FIXED_RATE_NONE	(0xffff)
 
 #define ATH11K_RC_VERSION_OFFSET	28
 #define ATH11K_RC_PREAMBLE_OFFSET	8
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
