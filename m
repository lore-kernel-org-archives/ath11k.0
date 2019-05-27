Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFSP-0006tJ-Nn
 for ath11k@lists.infradead.org; Mon, 27 May 2019 13:14:30 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Avoid frequency offset based sanity check in radar
 detection event
Date: Mon, 27 May 2019 18:44:05 +0530
Message-Id: <1558962845-12903-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Currently the detected radar is indicated to mac80211 only when the active
rx channel is indicated in the event through channel frequency and offset.
But in case there is a minor difference in this offset provided,say +/- 1,
the event will rejected.

Hence avoid having these checks to indicate radar to mac80211. Basically the
event from firmware is highly reliable and such sanity checks are not
necessary.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 4f2ac21..90d9560 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5809,12 +5809,6 @@ ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab,
 		goto exit;
 	}
 
-	if (ar->rx_channel && ar->rx_channel->center_freq != (ev->chan_freq
-	    - ev->freq_offset)) {
-		ath11k_warn(ab, "Radar detected in non-operating channel");
-		goto exit;
-	}
-
 	ath11k_dbg(ar->ab, ATH11K_DBG_REG, "DFS Radar Detected in pdev %d\n",
 		   ev->pdev_id);
 
@@ -5826,6 +5820,7 @@ ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab,
 exit:
 	kfree(tb);
 }
+
 static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
