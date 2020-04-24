Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRugd-0000w4-LX
 for ath11k@lists.infradead.org; Fri, 24 Apr 2020 09:31:57 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH 1/2] mac80211: enable TKIP when using encapsulation offloading
Date: Fri, 24 Apr 2020 15:01:29 +0530
Message-Id: <1587720690-2753-2-git-send-email-murugana@codeaurora.org>
In-Reply-To: <1587720690-2753-1-git-send-email-murugana@codeaurora.org>
References: <1587720690-2753-1-git-send-email-murugana@codeaurora.org>
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
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>

TKIP was disabled on encap offload mode since if TKIP MIC error
reporting is not capable by the driver using encap offload mode,
then TKIP countermeasures wont work.

Enabling back TKIP bring-up in encap offload mode to leave the
control with the driver to disable hw encap when it is not capable
of TKIP MIC error reporting.

Fixes: 50ff477a8639 ("mac80211: add 802.11 encapsulation offloading support")
Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
---
 net/mac80211/iface.c | 7 -------
 net/mac80211/key.c   | 7 -------
 2 files changed, 14 deletions(-)

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index d069825705d6..68af8acde0f0 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -1257,13 +1257,6 @@ bool ieee80211_set_hw_80211_encap(struct ieee80211_vif *vif, bool enable)
 	    (local->hw.wiphy->frag_threshold != (u32)-1))
 		enable = false;
 
-	mutex_lock(&sdata->local->key_mtx);
-	list_for_each_entry(key, &sdata->key_list, list) {
-		if (key->conf.cipher == WLAN_CIPHER_SUITE_TKIP)
-			enable = false;
-	}
-	mutex_unlock(&sdata->local->key_mtx);
-
 	__ieee80211_set_hw_80211_encap(sdata, enable);
 
 	return enable;
diff --git a/net/mac80211/key.c b/net/mac80211/key.c
index 8f403c1bb908..25cab6fc127c 100644
--- a/net/mac80211/key.c
+++ b/net/mac80211/key.c
@@ -177,13 +177,6 @@ static int ieee80211_key_enable_hw_accel(struct ieee80211_key *key)
 		}
 	}
 
-	/* TKIP countermeasures don't work in encap offload mode */
-	if (key->conf.cipher == WLAN_CIPHER_SUITE_TKIP &&
-	    sdata->hw_80211_encap) {
-		sdata_dbg(sdata, "TKIP is not allowed in hw 80211 encap mode\n");
-		return -EINVAL;
-	}
-
 	ret = drv_set_key(key->local, SET_KEY, sdata,
 			  sta ? &sta->sta : NULL, &key->conf);
 
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
