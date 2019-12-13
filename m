Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifkGB-0003uJ-Gf
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 12:41:33 +0000
Date: Fri, 13 Dec 2019 15:39:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] ath11k: driver for Qualcomm IEEE 802.11ax devices
Message-ID: <20191213123915.pyjq7fhpq5lllkum@kili.mountain>
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
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org

Hello Kalle Valo,

The patch d5c65159f289: "ath11k: driver for Qualcomm IEEE 802.11ax
devices" from Nov 23, 2019, leads to the following static checker
warning:

	drivers/net/wireless/ath/ath11k/debugfs_sta.c:197 ath11k_update_per_peer_stats_from_txcompl()
	error: uninitialized symbol 'rate_idx'.

drivers/net/wireless/ath/ath11k/debugfs_sta.c
   126  void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
   127                                                 struct sk_buff *msdu,
   128                                                 struct hal_tx_status *ts)
   129  {
   130          struct ath11k_base *ab = ar->ab;
   131          struct ath11k_per_peer_tx_stats *peer_stats = &ar->cached_stats;
   132          struct ath11k_peer *peer;
   133          struct ath11k_sta *arsta;
   134          struct ieee80211_sta *sta;
   135          u16 rate;
   136          u8 rate_idx;
                ^^^^^^^^^^^

   137          int ret;
   138  
   139          rcu_read_lock();
   140          spin_lock_bh(&ab->base_lock);
   141          peer = ath11k_peer_find_by_id(ab, ts->peer_id);
   142          if (!peer || !peer->sta) {
   143                  ath11k_warn(ab, "failed to find the peer\n");
   144                  spin_unlock_bh(&ab->base_lock);
   145                  rcu_read_unlock();
   146                  return;
   147          }
   148  
   149          sta = peer->sta;
   150          arsta = (struct ath11k_sta *)sta->drv_priv;
   151  
   152          memset(&arsta->txrate, 0, sizeof(arsta->txrate));
   153  
   154          if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11A ||
   155              ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11B) {
   156                  ret = ath11k_mac_hw_ratecode_to_legacy_rate(ts->mcs,
   157                                                              ts->pkt_type,
   158                                                              &rate_idx,
   159                                                              &rate);
   160                  if (ret < 0) {
   161                          spin_unlock_bh(&ab->base_lock);
   162                          rcu_read_unlock();
   163                          return;
   164                  }
   165                  arsta->txrate.legacy = rate;
   166          } else if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11N) {
   167                  if (ts->mcs > 7) {
   168                          ath11k_warn(ab, "Invalid HT mcs index %d\n", ts->mcs);
   169                          spin_unlock_bh(&ab->base_lock);
   170                          rcu_read_unlock();
   171                          return;
   172                  }
   173  
   174                  arsta->txrate.mcs = ts->mcs + 8 * (arsta->last_txrate.nss - 1);
   175                  arsta->txrate.flags = RATE_INFO_FLAGS_MCS;
   176                  if (ts->sgi)
   177                          arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;

"rate_idx" is not initialized on the else paths.

   178          } else if (ts->pkt_type == HAL_TX_RATE_STATS_PKT_TYPE_11AC) {
   179                  if (ts->mcs > 9) {
   180                          ath11k_warn(ab, "Invalid VHT mcs index %d\n", ts->mcs);
   181                          spin_unlock_bh(&ab->base_lock);
   182                          rcu_read_unlock();
   183                          return;
   184                  }
   185  
   186                  arsta->txrate.mcs = ts->mcs;
   187                  arsta->txrate.flags = RATE_INFO_FLAGS_VHT_MCS;
   188                  if (ts->sgi)
   189                          arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
   190          } else {
   191                  /*TODO: update HE rates */
   192          }
   193  
   194          arsta->txrate.nss = arsta->last_txrate.nss;
   195          arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(ts->bw);
   196  
   197          ath11k_accumulate_per_peer_tx_stats(arsta, peer_stats, rate_idx);
                                                                       ^^^^^^^^
UBSan will complain about this at run time as well.

   198          spin_unlock_bh(&ab->base_lock);
   199          rcu_read_unlock();
   200  }

regards,
dan carpenter

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
