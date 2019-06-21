Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heHYH-0001qy-7X
 for ath11k@lists.infradead.org; Fri, 21 Jun 2019 11:17:54 +0000
From: Govindaraj Saminathan <gsamin@codeaurora.org>
Subject: [PATCH] ath11k: clean up in qmi_txn_wait error code handling
Date: Fri, 21 Jun 2019 16:47:33 +0530
Message-Id: <1561115853-18202-1-git-send-email-gsamin@codeaurora.org>
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
Cc: Govindaraj Saminathan <gsamin@codeaurora.org>

qmi_txn_wait functions resp.resp.result is assigned to ret
variable and then returned from the function. The functions should
not return error codes from firmware, instead it should return -EINVAL.

Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index cb9ed9c..eb86fae 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1546,7 +1546,7 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 		ath11k_warn(ab, "Host capability request failed, result: %d, err: %d\n",
 			    resp.resp.result, resp.resp.error);
-		ret = resp.resp.result;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -1610,7 +1610,7 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
 		ath11k_warn(ab, "FW Ind register request failed, result: %d, err: %d\n",
 			    resp->resp.result, resp->resp.error);
-		ret = resp->resp.result;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -1666,7 +1666,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 		ath11k_warn(ab, "Respond mem req failed, result: %d, err: %d\n",
 			    resp.resp.result, resp.resp.error);
-		ret = resp.resp.result;
+		ret = -EINVAL;
 		goto out;
 	}
 out:
@@ -1753,7 +1753,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 		ath11k_warn(ab, "qmi targetcap req failed, result: %d, err: %d\n",
 			    resp.resp.result, resp.resp.error);
-		ret = resp.resp.result;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -1921,7 +1921,7 @@ static int ath11k_qmi_load_bdf(struct ath11k_base *ab)
 		if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 			ath11k_warn(ab, "qmi BDF download failed, result: %d, err: %d\n",
 				    resp.resp.result, resp.resp.error);
-			ret = resp.resp.result;
+			ret = -EINVAL;
 			goto out_qmi_bdf;
 		}
 	}
@@ -1970,7 +1970,7 @@ static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 		ath11k_warn(ab, "qmi M3 info request failed, result: %d, err: %d\n",
 			    resp.resp.result, resp.resp.error);
-		ret = resp.resp.result;
+		ret = -EINVAL;
 		goto out;
 	}
 out:
@@ -2021,7 +2021,7 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 		ath11k_warn(ab, "Mode request failed, mode: %d, result: %d err: %d\n",
 			    mode, resp.resp.result, resp.resp.error);
-		ret = resp.resp.result;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -2099,7 +2099,7 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 		ath11k_warn(ab, "qmi wlan config request failed, result: %d, err: %d\n",
 			    resp.resp.result, resp.resp.error);
-		ret = resp.resp.result;
+		ret = -EINVAL;
 		goto out;
 	}
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
