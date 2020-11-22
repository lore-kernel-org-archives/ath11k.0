Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgtL1-0003VE-At
 for ath11k@lists.infradead.org; Sun, 22 Nov 2020 17:39:48 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ath11k: Fix an error handling path
Date: Sun, 22 Nov 2020 18:39:43 +0100
Message-Id: <20201122173943.1366167-1-christophe.jaillet@wanadoo.fr>
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
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, gseset@codeaurora.org, mkenna@codeaurora.org, slakkavalli@datto.com, gsamin@codeaurora.org, pradeepc@codeaurora.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, ath11k@lists.infradead.org

If 'kzalloc' fails, we must return an error code.

While at it, remove a useless initialization of 'err' which could hide the
issue.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index c2b165158225..99a88ca83dea 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1585,15 +1585,17 @@ static int ath11k_qmi_fw_ind_register_send(struct ath11k_base *ab)
 	struct qmi_wlanfw_ind_register_resp_msg_v01 *resp;
 	struct qmi_handle *handle = &ab->qmi.handle;
 	struct qmi_txn txn;
-	int ret = 0;
+	int ret;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
 	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
-	if (!resp)
+	if (!resp) {
+		ret = -ENOMEM;
 		goto resp_out;
+	}
 
 	req->client_id_valid = 1;
 	req->client_id = QMI_WLANFW_CLIENT_ID;
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
