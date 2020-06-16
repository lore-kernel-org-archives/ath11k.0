Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9u-0002tv-CI
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:02:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 12/12] ath11k: remove define ATH11K_QMI_DEFAULT_CAL_FILE_NAME
Date: Tue, 16 Jun 2020 17:00:55 +0300
Message-Id: <1592316055-24958-13-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
References: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
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

It's just a duplicate of ATH11K_DEFAULT_CAL_FILE.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 5 ++---
 drivers/net/wireless/ath/ath11k/qmi.h | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index c890f85ffd5c..f5c4d69fbb98 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1810,11 +1810,10 @@ ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 		ath11k_core_free_bdf(ab, &bd);
 		break;
 	case ATH11K_QMI_FILE_TYPE_CALDATA:
-		fw_entry = ath11k_core_firmware_request(ab,
-							ATH11K_QMI_DEFAULT_CAL_FILE_NAME);
+		fw_entry = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
 		if (ret) {
 			ath11k_warn(ab, "failed to load %s: %d\n",
-				    ATH11K_QMI_DEFAULT_CAL_FILE_NAME, ret);
+				    ATH11K_DEFAULT_CAL_FILE, ret);
 			goto out;
 		}
 
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index a7a0a189cbe4..3307be5be687 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -22,7 +22,6 @@
 #define ATH11K_QMI_RESP_LEN_MAX			8192
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	32
 #define ATH11K_QMI_CALDB_SIZE			0x480000
-#define ATH11K_QMI_DEFAULT_CAL_FILE_NAME	"caldata.bin"
 
 #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
 #define QMI_WLFW_FW_MEM_READY_IND_V01		0x0037
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
