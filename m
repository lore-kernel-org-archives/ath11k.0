Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNU0-00053o-Ft
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 11:50:01 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH 5/8] ath11k: add approprite comments for no-op functions
Date: Mon, 24 Jun 2019 17:19:26 +0530
Message-Id: <1561376969-3999-5-git-send-email-mpubbise@codeaurora.org>
In-Reply-To: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
References: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

Add appropriate comments for no-op functions defined in ath11k_ops
in mac.c file.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 25f9b50..f878479 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -659,6 +659,11 @@ static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 	struct ath11k *ar = hw->priv;
 	int ret = 0;
 
+	/* mac80211 requires this op to be present and that's why
+	 * there's an empty function, this can be extended when
+	 * required.
+	 */
+
 	mutex_lock(&ar->conf_mutex);
 
 	/* TODO: Handle configuration changes as appropriate */
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
