Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIsQ1-0005xh-8f
 for ath11k@lists.infradead.org; Mon, 30 Mar 2020 11:17:27 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Avoid mgmt tx count underflow
Date: Mon, 30 Mar 2020 16:47:08 +0530
Message-Id: <1585567028-9242-1-git-send-email-srirrama@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>

The mgmt tx count reference is incremented/decremented on every mgmt tx and on
tx completion event from firmware.
In case of an unexpected mgmt tx completion event from firmware,
the counter would underflow. Avoid this by decrementing
only when the tx count is greater than 0.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e7ce369..d999c47 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3740,8 +3740,9 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
 
 	ieee80211_tx_status_irqsafe(ar->hw, msdu);
 
-	WARN_ON_ONCE(atomic_read(&ar->num_pending_mgmt_tx) == 0);
-	atomic_dec(&ar->num_pending_mgmt_tx);
+	/* WARN when we received this event without doing any mgmt tx */
+	if (atomic_dec_if_positive(&ar->num_pending_mgmt_tx) < 0)
+		WARN_ON_ONCE(1);
 
 	return 0;
 }
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
