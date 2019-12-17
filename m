Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihFwh-0000M0-K0
 for ath11k@lists.infradead.org; Tue, 17 Dec 2019 16:43:41 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 2/2] ath11k: load appropriate board data based on board id
Date: Tue, 17 Dec 2019 17:43:29 +0100
Message-Id: <20191217164329.4151-2-john@phrozen.org>
In-Reply-To: <20191217164329.4151-1-john@phrozen.org>
References: <20191217164329.4151-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

From: Venkateswara Naralasetty <vnaralas@codeaurora.org>

This patch add support to read board id from dts and load
appropriate board data from userland.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 2377895a58ec..e80290c7c9dd 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1712,9 +1712,11 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 
 static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 {
+	struct device *dev = ab->dev;
 	struct qmi_wlanfw_cap_req_msg_v01 req;
 	struct qmi_wlanfw_cap_resp_msg_v01 resp;
 	struct qmi_txn txn = {};
+	unsigned int board_id;
 	int ret = 0;
 
 	memset(&req, 0, sizeof(req));
@@ -1753,10 +1755,14 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		ab->qmi.target.chip_family = resp.chip_info.chip_family;
 	}
 
-	if (resp.board_info_valid)
+	if (!of_property_read_u32(dev->of_node, "qcom,board_id", &board_id)) {
+		if (board_id != 0xFF)
+			ab->qmi.target.board_id = board_id;
+	} else if (resp.board_info_valid) {
 		ab->qmi.target.board_id = resp.board_info.board_id;
-	else
+	} else {
 		ab->qmi.target.board_id = 0xFF;
+	}
 
 	if (resp.soc_info_valid)
 		ab->qmi.target.soc_id = resp.soc_info.soc_id;
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
