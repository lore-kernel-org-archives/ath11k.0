Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1UcP-0003PC-09
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 12:26:22 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 1/2] mac80211: allow setting queue_len for drivers not using
 wake_tx_queue
Date: Tue, 11 Feb 2020 13:26:04 +0100
Message-Id: <20200211122605.13002-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Currently a mac80211 driver can only set the txq_limit when using
wake_tx_queue. Not all drivers use wake_tx_queue. This patch adds a new
element to wiphy allowing a driver to set a custom tx_queue_len and the
code that will apply it in case it is set. The current default is
1000 which is too low for ath11k when doing HE rates.

Signed-off-by: John Crispin <john@phrozen.org>
---
 include/net/cfg80211.h | 2 ++
 net/mac80211/iface.c   | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 0939645567e9..254080a04ee3 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4742,6 +4742,8 @@ struct wiphy {
 	u32 txq_memory_limit;
 	u32 txq_quantum;
 
+	unsigned long tx_queue_len;
+
 	u8 support_mbssid:1,
 	   support_only_he_mbssid:1;
 
diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 3c00408e9c8c..128b3468d13e 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -1834,6 +1834,10 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
 					if_setup, txqs, 1);
 		if (!ndev)
 			return -ENOMEM;
+
+		if (!local->ops->wake_tx_queue && local->hw.wiphy->tx_queue_len)
+			ndev->tx_queue_len = local->hw.wiphy->tx_queue_len;
+
 		dev_net_set(ndev, wiphy_net(local->hw.wiphy));
 
 		ndev->tstats = netdev_alloc_pcpu_stats(struct pcpu_sw_netstats);
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
