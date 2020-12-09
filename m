Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmpnA-0001Gv-MS
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 03:05:25 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] mac80211: fix a mistake check for rx_stats update
Date: Wed,  9 Dec 2020 11:06:29 +0800
Message-Id: <1607483189-3891-1-git-send-email-wgong@codeaurora.org>
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
To: ath11k@lists.infradead.org, ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

It should be !is_multicast_ether_addr() in ieee80211_rx_h_sta_process()
for the rx_stats update, below commit remove the !, this patch is to
change it back.

It lead the rx rate "iw wlan0 station dump" become invalid for some
scene when IEEE80211_HW_USES_RSS is set, and the rx rate become valid
with this patch for the scene.

Fixed: 09a740ce352e ("mac80211: receive and process S1G beacons")

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index ebd01ca9d2e6..dafde71af50e 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1762,7 +1762,7 @@ ieee80211_rx_h_sta_process(struct ieee80211_rx_data *rx)
 	} else if (rx->sdata->vif.type == NL80211_IFTYPE_OCB) {
 		sta->rx_stats.last_rx = jiffies;
 	} else if (!ieee80211_is_s1g_beacon(hdr->frame_control) &&
-		   is_multicast_ether_addr(hdr->addr1)) {
+		   !is_multicast_ether_addr(hdr->addr1)) {
 		/*
 		 * Mesh beacons will update last_rx when if they are found to
 		 * match the current local configuration when processed.
-- 
2.23.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
