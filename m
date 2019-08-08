Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4s-0008It-BI
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:36 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 13/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 qmi.h
Date: Thu,  8 Aug 2019 18:33:10 +0530
Message-Id: <1565269392-2838-14-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in qmi.h file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index ff9203d46810..f388dc6030a4 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -432,12 +432,12 @@ struct qmi_wlanfw_wlan_cfg_resp_msg_v01 {
 	struct qmi_response_type_v01 resp;
 };
 
-int ath11k_qmi_firmware_start(struct ath11k_base *sc,
+int ath11k_qmi_firmware_start(struct ath11k_base *ab,
 			      u32 mode);
-void ath11k_qmi_firmware_stop(struct ath11k_base *sc);
+void ath11k_qmi_firmware_stop(struct ath11k_base *ab);
 void ath11k_qmi_event_work(struct work_struct *work);
 void ath11k_qmi_msg_recv_work(struct work_struct *work);
-void ath11k_qmi_deinit_service(struct ath11k_base *sc);
-int ath11k_qmi_init_service(struct ath11k_base *sc);
+void ath11k_qmi_deinit_service(struct ath11k_base *ab);
+int ath11k_qmi_init_service(struct ath11k_base *ab);
 
 #endif
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
