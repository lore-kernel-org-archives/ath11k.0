Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9d-0002vY-PR
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 10/12] ath11k: qmi: cleanup info messages
Date: Tue, 16 Jun 2020 17:00:53 +0300
Message-Id: <1592316055-24958-11-git-send-email-kvalo@codeaurora.org>
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

Use simplified format, just like ath10k uses, which is easier to read.

Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index bbdbf1ed19dc..c890f85ffd5c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1772,11 +1772,11 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		strlcpy(ab->qmi.target.fw_build_id, resp.fw_build_id,
 			sizeof(ab->qmi.target.fw_build_id));
 
-	ath11k_info(ab, "qmi target: chip_id: 0x%x, chip_family: 0x%x, board_id: 0x%x, soc_id: 0x%x\n",
+	ath11k_info(ab, "qmi chip_id 0x%x chip_family 0x%x board_id 0x%x soc_id 0x%x\n",
 		    ab->qmi.target.chip_id, ab->qmi.target.chip_family,
 		    ab->qmi.target.board_id, ab->qmi.target.soc_id);
 
-	ath11k_info(ab, "qmi fw_version: 0x%x fw_build_timestamp: %s fw_build_id: %s",
+	ath11k_info(ab, "qmi fw_version 0x%x fw_build_timestamp %s fw_build_id %s",
 		    ab->qmi.target.fw_version,
 		    ab->qmi.target.fw_build_timestamp,
 		    ab->qmi.target.fw_build_id);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
