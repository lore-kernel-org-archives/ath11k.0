Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he2RC-0007F5-OR
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 19:09:35 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix string split across warnings
Date: Fri, 21 Jun 2019 00:39:14 +0530
Message-Id: <1561057754-788-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/core.c:749: quoted string split across lines
drivers/net/wireless/ath/ath11k/qmi.c:1785: quoted string split across lines

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 +++--
 drivers/net/wireless/ath/ath11k/qmi.c  | 3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 1ecbbd9..74384b3 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -644,8 +644,9 @@ static void ath11k_core_restart(struct work_struct *work)
 			ieee80211_restart_hw(ar->hw);
 			break;
 		case ATH11K_STATE_OFF:
-			ath11k_warn(sc, "cannot restart radio %d "
-				    "that hasn't been started\n", i);
+			ath11k_warn(sc,
+				    "cannot restart radio %d that hasn't been started\n",
+				    i);
 			break;
 		case ATH11K_STATE_RESTARTING:
 			break;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index cb9ed9c..45d0f06 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1781,8 +1781,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		strlcpy(ab->qmi.target.fw_build_id, resp.fw_build_id,
 			sizeof(ab->qmi.target.fw_build_id));
 
-	ath11k_info(ab, "qmi target: chip_id: 0x%x, chip_family: 0x%x,"
-			"board_id: 0x%x, soc_id: 0x%x\n",
+	ath11k_info(ab, "qmi target: chip_id: 0x%x, chip_family: 0x%x, board_id: 0x%x, soc_id: 0x%x\n",
 		    ab->qmi.target.chip_id, ab->qmi.target.chip_family,
 		    ab->qmi.target.board_id, ab->qmi.target.soc_id);
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
