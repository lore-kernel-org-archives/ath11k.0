Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmKix-0004x6-At
 for ath11k@lists.infradead.org; Mon, 07 Dec 2020 17:55:00 +0000
Date: Mon, 7 Dec 2020 20:54:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] ath11k: unlock on error path in ath11k_mac_op_add_interface()
Message-ID: <X85sVGVP/0XvlrEJ@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, Ritesh Singh <ritesi@codeaurora.org>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

These error paths need to drop the &ar->conf_mutex before returning.

Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ebed24ec7368..12cc16003e30 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4615,13 +4615,13 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
 				    arvif->vdev_id, vif->addr);
-			return ret;
+			goto err;
 		}
 
 		ret = ath11k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						       vif->addr);
 		if (ret)
-			return ret;
+			goto err;
 
 		ar->num_peers--;
 	}
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
