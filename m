Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haGlM-0005da-Eb
 for ath11k@lists.infradead.org; Mon, 10 Jun 2019 09:38:49 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: cleanup in core and qmi components
Date: Mon, 10 Jun 2019 15:08:23 +0530
Message-Id: <1560159503-5765-1-git-send-email-periyasa@codeaurora.org>
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

Removed unused define ATH11K_TARGET_NAME and ATH11K_FW_READY_TIMEOUT_HZ.
Modify the api name from ath11k_qmi_firmware_indication() to
ath11k_core_qmi_firmware_ready() because its a core module functionality.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 4 ++--
 drivers/net/wireless/ath/ath11k/core.h | 6 +-----
 drivers/net/wireless/ath/ath11k/qmi.c  | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index e3e6b64..928d47b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -582,7 +582,7 @@ static int ath11k_core_start(struct ath11k_base *sc,
 	return ret;
 }
 
-int ath11k_qmi_firmware_indication(struct ath11k_base *ab)
+int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 {
 	int ret;
 
@@ -644,7 +644,7 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *sc)
 
 	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &sc->dev_flags);
 
-	ret = ath11k_qmi_firmware_indication(sc);
+	ret = ath11k_core_qmi_firmware_ready(sc);
 	if (ret)
 		goto err_hal_srng_deinit;
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 6fc2942..7ebb5a4 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -22,10 +22,6 @@
 
 #define SM(_v, _f) (((_v) << _f##_LSB) & _f##_MASK)
 
-#define ATH11K_TARGET_NAME "q6v5-wcss"
-
-#define ATH11K_FW_READY_TIMEOUT_HZ (5 * HZ)
-
 #define ATH11K_TX_MGMT_NUM_PENDING_MAX	512
 
 /* Map from pdev index to hw mac index */
@@ -813,7 +809,7 @@ struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
 					     const u8 *addr);
 struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab,
 						  int peer_id);
-int ath11k_qmi_firmware_indication(struct ath11k_base *ab);
+int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab);
 int ath11k_core_init(struct ath11k_base *ath11k);
 void ath11k_core_deinit(struct ath11k_base *ath11k);
 struct ath11k_base *ath11k_core_alloc(struct device *dev);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 79c6dde..cb9ed9c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2388,7 +2388,7 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 				break;
 			}
 
-			ath11k_qmi_firmware_indication(ab);
+			ath11k_core_qmi_firmware_ready(ab);
 			ab->qmi.cal_done = 1;
 			set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
