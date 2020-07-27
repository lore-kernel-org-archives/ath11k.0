Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k08x5-0006E2-Vv
 for ath11k@lists.infradead.org; Mon, 27 Jul 2020 19:38:24 +0000
Date: Mon, 27 Jul 2020 14:44:15 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] ath11k: Use fallthrough pseudo-keyword
Message-ID: <20200727194415.GA1275@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath11k/core.c  |  2 +-
 drivers/net/wireless/ath/ath11k/dp.c    |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c |  3 +--
 drivers/net/wireless/ath/ath11k/mac.c   | 22 +++++++++++-----------
 4 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 905cd8beaf28..2fbcb2259fd9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -706,7 +706,7 @@ static void ath11k_core_restart(struct work_struct *work)
 			break;
 		case ATH11K_STATE_RESTARTED:
 			ar->state = ATH11K_STATE_WEDGED;
-			/* fall through */
+			fallthrough;
 		case ATH11K_STATE_WEDGED:
 			ath11k_warn(ab,
 				    "device is wedged, will not restart radio %d\n", i);
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 1d64c3c51ac9..141a046b9269 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -159,7 +159,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 			break;
 		}
 		/* follow through when ring_num >= 3 */
-		/* fall through */
+		fallthrough;
 	case HAL_REO_EXCEPTION:
 	case HAL_REO_REINJECT:
 	case HAL_REO_CMD:
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 791d971784ce..97137507a0bd 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3709,8 +3709,7 @@ static bool ath11k_dp_rx_h_reo_err(struct ath11k *ar, struct sk_buff *msdu,
 		 * instead, it is good to drop such packets in mac80211
 		 * after incrementing the replay counters.
 		 */
-
-		/* fall through */
+		fallthrough;
 	default:
 		/* TODO: Review other errors and process them to mac80211
 		 * as appropriate.
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 07d3e031c75a..648eabadc094 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1138,13 +1138,13 @@ ath11k_peer_assoc_h_vht_limit(u16 tx_mcs_set,
 			idx_limit = -1;
 
 		switch (idx_limit) {
-		case 0: /* fall through */
-		case 1: /* fall through */
-		case 2: /* fall through */
-		case 3: /* fall through */
-		case 4: /* fall through */
-		case 5: /* fall through */
-		case 6: /* fall through */
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+		case 5:
+		case 6:
 		case 7:
 			mcs = IEEE80211_VHT_MCS_SUPPORT_0_7;
 			break;
@@ -1156,7 +1156,7 @@ ath11k_peer_assoc_h_vht_limit(u16 tx_mcs_set,
 			break;
 		default:
 			WARN_ON(1);
-			/* fall through */
+			fallthrough;
 		case -1:
 			mcs = IEEE80211_VHT_MCS_NOT_SUPPORTED;
 			break;
@@ -1339,7 +1339,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
 
 		arg->peer_he_mcs_count++;
-		/* fall through */
+		fallthrough;
 
 	default:
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
@@ -2114,7 +2114,7 @@ void __ath11k_mac_scan_finish(struct ath11k *ar)
 		} else if (ar->scan.roc_notify) {
 			ieee80211_remain_on_channel_expired(ar->hw);
 		}
-		/* fall through */
+		fallthrough;
 	case ATH11K_SCAN_STARTING:
 		ar->scan.state = ATH11K_SCAN_IDLE;
 		ar->scan_channel = NULL;
@@ -4368,7 +4368,7 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 		break;
 	case NL80211_IFTYPE_MESH_POINT:
 		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH_11S;
-		/* fall through */
+		fallthrough;
 	case NL80211_IFTYPE_AP:
 		arvif->vdev_type = WMI_VDEV_TYPE_AP;
 		break;
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
