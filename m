Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifgYG-0004QS-Nh
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 08:44:01 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: fix pdev when invoking
 ath11k_wmi_send_twt_enable_cmd()
Date: Fri, 13 Dec 2019 09:43:53 +0100
Message-Id: <20191213084353.31257-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

The code currently uses the wrong pdev id when enabling TWT.

Fixes: e65a616f4e74 ("ath11k: add TWT support")

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index fec268b9b711..b229b0b3e0bd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1917,9 +1917,9 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_TWT) {
 		if (info->twt_requester || info->twt_responder)
-			ath11k_wmi_send_twt_enable_cmd(ar, ar->pdev_idx);
+			ath11k_wmi_send_twt_enable_cmd(ar, ar->pdev->pdev_id);
 		else
-			ath11k_wmi_send_twt_disable_cmd(ar, ar->pdev_idx);
+			ath11k_wmi_send_twt_disable_cmd(ar, ar->pdev->pdev_id);
 		if (vif->type == NL80211_IFTYPE_AP)
 			ath11k_debugfs_twt(arvif, info->twt_requester);
 	}
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
