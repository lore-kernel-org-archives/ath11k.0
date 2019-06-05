Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYZHk-0003vC-MX
 for ath11k@lists.infradead.org; Wed, 05 Jun 2019 17:01:13 +0000
From: Muna Sinada <msinada@codeaurora.org>
Subject: [PATCH] ath11k: fix fallthrough warnings
Date: Wed,  5 Jun 2019 10:00:36 -0700
Message-Id: <1559754036-2358-1-git-send-email-msinada@codeaurora.org>
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
Cc: Muna Sinada <msinada@codeaurora.org>

Marked expected switch case fall-through.

Fall through warnings were generated when running ath11k-check script
with --extra flag:

    drivers/net/wireless/ath/ath11k/core.c:741:14:
	warning: this statement may fall through Wimplicit-fallthrough=]
    drivers/net/wireless/ath/ath11k/dp.c:133:6:
	warning: this statement may fall through [-Wplicit-fallthrough=]

Signed-off-by: Muna Sinada <msinada@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 drivers/net/wireless/ath/ath11k/dp.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index e3e6b647888a..b5f710a7e915 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -739,6 +739,7 @@ static void ath11k_core_restart(struct work_struct *work)
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
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
