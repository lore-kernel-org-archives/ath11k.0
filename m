Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNwfC-0001ve-Qs
 for ath11k@lists.infradead.org; Tue, 07 May 2019 09:45:32 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH] ath11k:print firmware info during boot
Date: Tue,  7 May 2019 15:15:20 +0530
Message-Id: <1557222320-22849-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

Print fw info like version, time stamp and fw build info
during boot.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 20 ++++++++++++++++----
 drivers/net/wireless/ath/ath11k/qmi.h |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index aca717c..f1b272d 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1774,14 +1774,26 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	if (resp.soc_info_valid)
 		ab->qmi.target.soc_id = resp.soc_info.soc_id;
 
-	if (resp.fw_version_info_valid)
+	if (resp.fw_version_info_valid) {
 		ab->qmi.target.fw_version = resp.fw_version_info.fw_version;
+		strlcpy(ab->qmi.target.fw_build_timestamp,
+			resp.fw_version_info.fw_build_timestamp,
+			sizeof(ab->qmi.target.fw_build_timestamp));
+	}
+
+	if (resp.fw_build_id_valid)
+		strlcpy(ab->qmi.target.fw_build_id, resp.fw_build_id,
+			sizeof(ab->qmi.target.fw_build_id));
 
 	ath11k_info(ab, "qmi target: chip_id: 0x%x, chip_family: 0x%x,"
-			"board_id: 0x%x, soc_id: 0x%x, fw_version: 0x%x\n",
+			"board_id: 0x%x, soc_id: 0x%x\n",
 		    ab->qmi.target.chip_id, ab->qmi.target.chip_family,
-		    ab->qmi.target.board_id, ab->qmi.target.soc_id,
-		    ab->qmi.target.fw_version);
+		    ab->qmi.target.board_id, ab->qmi.target.soc_id);
+
+	ath11k_info(ab, "qmi fw_version: 0x%x fw_build_timestamp: %s fw_build_id: %s",
+		    ab->qmi.target.fw_version,
+		    ab->qmi.target.fw_build_timestamp,
+		    ab->qmi.target.fw_build_id);
 
 out:
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index b017596..1781236 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -98,6 +98,7 @@ struct target_info {
 	u32 soc_id;
 	u32 fw_version;
 	char fw_build_timestamp[ATH11K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01 + 1];
+	char fw_build_id[ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01 + 1];
 };
 
 struct ath11k_qmi {
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
