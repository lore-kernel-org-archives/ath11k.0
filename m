Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNu3h-00039K-QS
 for ath11k@lists.infradead.org; Tue, 07 May 2019 06:58:39 +0000
Received: from localhost.localdomain (37-136-65-53.rev.dnainternet.fi
 [37.136.65.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E5C960744
 for <ath11k@lists.infradead.org>; Tue,  7 May 2019 06:58:36 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/2] ath11k: qmi: fix frame size warnings
Date: Tue,  7 May 2019 09:58:32 +0300
Message-Id: <1557212312-11990-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1557212312-11990-1-git-send-email-kvalo@codeaurora.org>
References: <1557212312-11990-1-git-send-email-kvalo@codeaurora.org>
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

GCC warned:

drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_respond_fw_mem_request':
drivers/net/wireless/ath/ath11k/qmi.c:1678:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_wlanfw_wlan_cfg_send':
drivers/net/wireless/ath/ath11k/qmi.c:2094:1: warning: the frame size of 1136 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Fix that by allocating bigger structures dynamically.  Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 67 ++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index aca717ca1955..b862fa93bba8 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1624,37 +1624,40 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 
 static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 {
-	struct qmi_wlanfw_respond_mem_req_msg_v01 req;
+	struct qmi_wlanfw_respond_mem_req_msg_v01 *req;
 	struct qmi_wlanfw_respond_mem_resp_msg_v01 resp;
 	struct qmi_txn txn = {};
 	int ret = 0, i;
 
-	memset(&req, 0, sizeof(req));
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
 	memset(&resp, 0, sizeof(resp));
 
-	req.mem_seg_len = ab->qmi.mem_seg_count;
+	req->mem_seg_len = ab->qmi.mem_seg_count;
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_respond_mem_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
 
-	for (i = 0; i < req.mem_seg_len ; i++) {
+	for (i = 0; i < req->mem_seg_len ; i++) {
 		if (!ab->qmi.target_mem[i].paddr || !ab->qmi.target_mem[i].size) {
 			ath11k_warn(ab, "qmi invalid mem request for target\n");
 			ret = -EINVAL;
 			goto out;
 		}
 
-		req.mem_seg[i].addr = ab->qmi.target_mem[i].paddr;
-		req.mem_seg[i].size = ab->qmi.target_mem[i].size;
-		req.mem_seg[i].type = ab->qmi.target_mem[i].type;
+		req->mem_seg[i].addr = ab->qmi.target_mem[i].paddr;
+		req->mem_seg[i].size = ab->qmi.target_mem[i].size;
+		req->mem_seg[i].type = ab->qmi.target_mem[i].type;
 	}
 
 	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_RESPOND_MEM_REQ_V01,
 			       QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN,
-			       qmi_wlanfw_respond_mem_req_msg_v01_ei, &req);
+			       qmi_wlanfw_respond_mem_req_msg_v01_ei, req);
 	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to respond memory request, err = %d\n",
 			    ret);
@@ -1674,6 +1677,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 		goto out;
 	}
 out:
+	kfree(req);
 	return ret;
 }
 
@@ -2021,7 +2025,7 @@ static int ath11k_qmi_wlanfw_mode_send(struct ath11k_base *ab,
 
 static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 {
-	struct qmi_wlanfw_wlan_cfg_req_msg_v01 req;
+	struct qmi_wlanfw_wlan_cfg_req_msg_v01 *req;
 	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp;
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
@@ -2030,36 +2034,40 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 
 	ce_cfg	= (struct ce_pipe_config *)ab->qmi.ce_cfg.tgt_ce;
 	svc_cfg	= (struct service_to_pipe *)ab->qmi.ce_cfg.svc_to_ce_map;
-	memset(&req, 0, sizeof(req));
+
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
 	memset(&resp, 0, sizeof(resp));
 
-	req.host_version_valid = 1;
-	strlcpy(req.host_version, ATH11K_HOST_VERSION_STRING,
-		sizeof(req.host_version));
+	req->host_version_valid = 1;
+	strlcpy(req->host_version, ATH11K_HOST_VERSION_STRING,
+		sizeof(req->host_version));
 
-	req.tgt_cfg_valid = 1;
+	req->tgt_cfg_valid = 1;
 	/* This is number of CE configs */
-	req.tgt_cfg_len = ((ab->qmi.ce_cfg.tgt_ce_len) /
+	req->tgt_cfg_len = ((ab->qmi.ce_cfg.tgt_ce_len) /
 				(sizeof(struct ce_pipe_config))) - 1;
-	for (ret = 0; ret <= req.tgt_cfg_len ; ret++) {
-		req.tgt_cfg[ret].pipe_num = ce_cfg[ret].pipenum;
-		req.tgt_cfg[ret].pipe_dir = ce_cfg[ret].pipedir;
-		req.tgt_cfg[ret].nentries = ce_cfg[ret].nentries;
-		req.tgt_cfg[ret].nbytes_max = ce_cfg[ret].nbytes_max;
-		req.tgt_cfg[ret].flags = ce_cfg[ret].flags;
+	for (ret = 0; ret <= req->tgt_cfg_len ; ret++) {
+		req->tgt_cfg[ret].pipe_num = ce_cfg[ret].pipenum;
+		req->tgt_cfg[ret].pipe_dir = ce_cfg[ret].pipedir;
+		req->tgt_cfg[ret].nentries = ce_cfg[ret].nentries;
+		req->tgt_cfg[ret].nbytes_max = ce_cfg[ret].nbytes_max;
+		req->tgt_cfg[ret].flags = ce_cfg[ret].flags;
 	}
 
-	req.svc_cfg_valid = 1;
+	req->svc_cfg_valid = 1;
 	/* This is number of Service/CE configs */
-	req.svc_cfg_len = (ab->qmi.ce_cfg.svc_to_ce_map_len) /
+	req->svc_cfg_len = (ab->qmi.ce_cfg.svc_to_ce_map_len) /
 				(sizeof(struct service_to_pipe));
-	for (ret = 0; ret < req.svc_cfg_len; ret++) {
-		req.svc_cfg[ret].service_id = svc_cfg[ret].service_id;
-		req.svc_cfg[ret].pipe_dir = svc_cfg[ret].pipedir;
-		req.svc_cfg[ret].pipe_num = svc_cfg[ret].pipenum;
+	for (ret = 0; ret < req->svc_cfg_len; ret++) {
+		req->svc_cfg[ret].service_id = svc_cfg[ret].service_id;
+		req->svc_cfg[ret].pipe_dir = svc_cfg[ret].pipedir;
+		req->svc_cfg[ret].pipe_num = svc_cfg[ret].pipenum;
 	}
-	req.shadow_reg_valid = 0;
-	req.shadow_reg_v2_valid = 0;
+	req->shadow_reg_valid = 0;
+	req->shadow_reg_v2_valid = 0;
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_wlan_cfg_resp_msg_v01_ei, &resp);
@@ -2090,6 +2098,7 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	}
 
 out:
+	kfree(req);
 	return ret;
 }
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
