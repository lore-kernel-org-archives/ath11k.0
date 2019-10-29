Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLP2-0001xF-23
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 06:54:54 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 2/2] ath11k: qmi clean up in ath11k_qmi_wlanfw_wlan_cfg_send()
Date: Tue, 29 Oct 2019 12:24:28 +0530
Message-Id: <1572332068-2611-2-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1572332068-2611-1-git-send-email-akolli@codeaurora.org>
References: <1572332068-2611-1-git-send-email-akolli@codeaurora.org>
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

Use pipe_id id instead of ret in for loop.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.h  |  9 +++++++--
 drivers/net/wireless/ath/ath11k/qmi.c | 28 +++++++++++++---------------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 9f25bad504e9..6f56c4d2ce10 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -57,7 +57,12 @@
 
 struct ath11k_base;
 
-/* Establish a mapping between a service/direction and a pipe. */
+/*
+ * Establish a mapping between a service/direction and a pipe.
+ * Configuration information for a Copy Engine pipe and services.
+ * Passed from Host to Target through QMI message and must be in
+ * little endian format.
+ */
 struct service_to_pipe {
 	__le32 service_id;
 	__le32 pipedir;
@@ -66,7 +71,7 @@ struct service_to_pipe {
 
 /*
  * Configuration information for a Copy Engine pipe.
- * Passed from Host to Target during startup (one per CE).
+ * Passed from Host to Target through QMI message during startup (one per CE).
  *
  * NOTE: Structure is shared between Host software and Target firmware!
  */
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 88e626f2a844..dffb8629f14b 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2035,7 +2035,7 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
 	struct qmi_txn txn = {};
-	int ret = 0;
+	int ret = 0, pipe_num;
 
 	ce_cfg	= (struct ce_pipe_config *)ab->qmi.ce_cfg.tgt_ce;
 	svc_cfg	= (struct service_to_pipe *)ab->qmi.ce_cfg.svc_to_ce_map;
@@ -2052,24 +2052,22 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 
 	req->tgt_cfg_valid = 1;
 	/* This is number of CE configs */
-	req->tgt_cfg_len = ((ab->qmi.ce_cfg.tgt_ce_len) /
-				(sizeof(struct ce_pipe_config))) - 1;
-	for (ret = 0; ret <= req->tgt_cfg_len ; ret++) {
-		req->tgt_cfg[ret].pipe_num = ce_cfg[ret].pipenum;
-		req->tgt_cfg[ret].pipe_dir = ce_cfg[ret].pipedir;
-		req->tgt_cfg[ret].nentries = ce_cfg[ret].nentries;
-		req->tgt_cfg[ret].nbytes_max = ce_cfg[ret].nbytes_max;
-		req->tgt_cfg[ret].flags = ce_cfg[ret].flags;
+	req->tgt_cfg_len = ab->qmi.ce_cfg.tgt_ce_len;
+	for (pipe_num = 0; pipe_num <= req->tgt_cfg_len ; pipe_num++) {
+		req->tgt_cfg[pipe_num].pipe_num = ce_cfg[pipe_num].pipenum;
+		req->tgt_cfg[pipe_num].pipe_dir = ce_cfg[pipe_num].pipedir;
+		req->tgt_cfg[pipe_num].nentries = ce_cfg[pipe_num].nentries;
+		req->tgt_cfg[pipe_num].nbytes_max = ce_cfg[pipe_num].nbytes_max;
+		req->tgt_cfg[pipe_num].flags = ce_cfg[pipe_num].flags;
 	}
 
 	req->svc_cfg_valid = 1;
 	/* This is number of Service/CE configs */
-	req->svc_cfg_len = (ab->qmi.ce_cfg.svc_to_ce_map_len) /
-				(sizeof(struct service_to_pipe));
-	for (ret = 0; ret < req->svc_cfg_len; ret++) {
-		req->svc_cfg[ret].service_id = svc_cfg[ret].service_id;
-		req->svc_cfg[ret].pipe_dir = svc_cfg[ret].pipedir;
-		req->svc_cfg[ret].pipe_num = svc_cfg[ret].pipenum;
+	req->svc_cfg_len = ab->qmi.ce_cfg.svc_to_ce_map_len;
+	for (pipe_num = 0; pipe_num < req->svc_cfg_len; pipe_num++) {
+		req->svc_cfg[pipe_num].service_id = svc_cfg[pipe_num].service_id;
+		req->svc_cfg[pipe_num].pipe_dir = svc_cfg[pipe_num].pipedir;
+		req->svc_cfg[pipe_num].pipe_num = svc_cfg[pipe_num].pipenum;
 	}
 	req->shadow_reg_valid = 0;
 	req->shadow_reg_v2_valid = 0;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
