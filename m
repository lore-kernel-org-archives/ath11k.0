Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Trh-0008TH-3h
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 07:11:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 07/11] ath11k: allocate smaller chunks of memory for firmware
Date: Fri, 14 Aug 2020 10:10:26 +0300
Message-Id: <1597389030-13887-8-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
References: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

On x86 it's sometimes difficult to allocate a large contigous DMA
memory, so instead allocate blocks of small chunk memory.

In ath11k_qmi_msg_mem_request_cb() the error handling was cleaned up to avoid
an unused variable warning. Also changed the test from (ret < 0) to just (ret)
as the functions don't return any positive values.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 42 +++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index acf7a3f2fe77..b386ab4bd806 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1640,19 +1640,30 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 
 	memset(&resp, 0, sizeof(resp));
 
-	req->mem_seg_len = ab->qmi.mem_seg_count;
+	/* For QCA6390 by default FW requests a block of ~4M contiguous
+	 * DMA memory, it's hard to allocate from OS. So host returns
+	 * failure to FW and FW will then request mulitple blocks of small
+	 * chunk size memory.
+	 */
+	if (!ab->bus_params.fixed_mem_region && ab->qmi.mem_seg_count <= 2) {
+		ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi delays mem_request %d\n",
+			   ab->qmi.mem_seg_count);
+		memset(req, 0, sizeof(*req));
+	} else {
+		req->mem_seg_len = ab->qmi.mem_seg_count;
+
+		for (i = 0; i < req->mem_seg_len ; i++) {
+			req->mem_seg[i].addr = ab->qmi.target_mem[i].paddr;
+			req->mem_seg[i].size = ab->qmi.target_mem[i].size;
+			req->mem_seg[i].type = ab->qmi.target_mem[i].type;
+		}
+	}
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_respond_mem_resp_msg_v01_ei, &resp);
 	if (ret < 0)
 		goto out;
 
-	for (i = 0; i < req->mem_seg_len ; i++) {
-		req->mem_seg[i].addr = ab->qmi.target_mem[i].paddr;
-		req->mem_seg[i].size = ab->qmi.target_mem[i].size;
-		req->mem_seg[i].type = ab->qmi.target_mem[i].type;
-	}
-
 	ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
 			       QMI_WLANFW_RESPOND_MEM_REQ_V01,
 			       QMI_WLANFW_RESPOND_MEM_REQ_MSG_V01_MAX_LEN,
@@ -2411,13 +2422,20 @@ static void ath11k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
 			   msg->mem_seg[i].type, msg->mem_seg[i].size);
 	}
 
-	if (ab->bus_params.fixed_mem_region)
+	if (ab->bus_params.fixed_mem_region) {
 		ret = ath11k_qmi_assign_target_mem_chunk(ab);
-	else
+		if (ret) {
+			ath11k_warn(ab, "qmi failed to assign target memory: %d\n",
+				    ret);
+			return;
+		}
+	} else if (msg->mem_seg_len > 2) {
 		ret = ath11k_qmi_alloc_target_mem_chunk(ab);
-	if (ret < 0) {
-		ath11k_warn(ab, "qmi failed to alloc target memory:%d\n", ret);
-		return;
+		if (ret) {
+			ath11k_warn(ab, "qmi failed to alloc target memory: %d\n",
+				    ret);
+			return;
+		}
 	}
 
 	ath11k_qmi_driver_event_post(qmi, ATH11K_QMI_EVENT_REQUEST_MEM, NULL);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
