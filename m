Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcuZ8-0005oD-L5
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 16:33:07 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48AE5607DE
 for <ath11k@lists.infradead.org>; Mon, 17 Jun 2019 16:33:04 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/5] ath11k: this statement may fall through
 [-Wimplicit-fallthrough=]
Date: Mon, 17 Jun 2019 19:32:56 +0300
Message-Id: <1560789179-3857-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
References: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
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

With W=1 GCC warns:

drivers/net/wireless/ath/ath11k/core.c:757:14: warning: this statement may fall through [-Wimplicit-fallthrough=]
vers/net/wireless/ath/ath11k/mac.c:1332:25: warning: this statement may fall through [-Wimplicit-fallthrough=]
drivers/net/wireless/ath/ath11k/dp.c:133:6: warning: this statement may fall through [-Wimplicit-fallthrough=]

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 drivers/net/wireless/ath/ath11k/dp.c   | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index be4f86a0f83b..26fdcb161965 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -755,6 +755,7 @@ static void ath11k_core_restart(struct work_struct *work)
 			break;
 		case ATH11K_STATE_RESTARTED:
 			ar->state = ATH11K_STATE_WEDGED;
+			/* fall through */
 		case ATH11K_STATE_WEDGED:
 			ath11k_warn(sc,
 				    "device is wedged, will not restart radio %d\n", i);
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 0aec840fc360..be10e98b0bcd 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -138,6 +138,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 			break;
 		}
 		/* follow through when ring_num >= 3 */
+		/* fall through */
 	case HAL_REO_EXCEPTION:
 	case HAL_REO_REINJECT:
 	case HAL_REO_CMD:
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ab71e121e107..fd133813636e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1330,7 +1330,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
 
 		arg->peer_he_mcs_count++;
-		/* drop through */
+		/* fall through */
 
 	default:
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
