Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNBGx-0001Ln-Nr
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 08:46:12 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: mac: fix parenthesis alignment
Date: Tue, 29 Sep 2020 11:46:00 +0300
Message-Id: <1601369160-1252-1-git-send-email-kvalo@codeaurora.org>
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

Commit 6aea26ce5a4c ("mac80211: rework tx encapsulation offload API")
introduced a new checkpatch warning:

drivers/net/wireless/ath/ath11k/mac.c:4354: Alignment should match open parenthesis

Fix that.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index e0cac9b61af8..2d8994463b18 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4351,7 +4351,7 @@ static int ath11k_set_he_mu_sounding_mode(struct ath11k *ar,
 }
 
 static void ath11k_mac_op_update_vif_offload(struct ieee80211_hw *hw,
-					    struct ieee80211_vif *vif)
+					     struct ieee80211_vif *vif)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
