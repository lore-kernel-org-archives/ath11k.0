Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knmKr-0006iw-U3
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 17:36:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 04/10] ath11k: htc: remove unused struct ath11k_htc_ops
Date: Fri, 11 Dec 2020 19:35:44 +0200
Message-Id: <1607708150-21066-5-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
References: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
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

No need for it so remove. Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/htc.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
index f0a3387567ca..848147cf81ee 100644
--- a/drivers/net/wireless/ath/ath11k/htc.h
+++ b/drivers/net/wireless/ath/ath11k/htc.h
@@ -221,10 +221,6 @@ enum ath11k_htc_ep_id {
 	ATH11K_HTC_EP_COUNT,
 };
 
-struct ath11k_htc_ops {
-	void (*target_send_suspend_complete)(struct ath11k_base *ar);
-};
-
 struct ath11k_htc_ep_ops {
 	void (*ep_tx_complete)(struct ath11k_base *, struct sk_buff *);
 	void (*ep_rx_complete)(struct ath11k_base *, struct sk_buff *);
@@ -284,8 +280,6 @@ struct ath11k_htc {
 	/* protects endpoints */
 	spinlock_t tx_lock;
 
-	struct ath11k_htc_ops htc_ops;
-
 	u8 control_resp_buffer[ATH11K_HTC_MAX_CTRL_MSG_LEN];
 	int control_resp_len;
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
