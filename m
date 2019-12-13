Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifZjb-0003Bq-45
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 01:27:12 +0000
From: Mao Wenan <maowenan@huawei.com>
Subject: [PATCH -next] ath11k: add dependency for struct ath11k member debug
Date: Fri, 13 Dec 2019 09:24:17 +0800
Message-ID: <20191213012417.130719-1-maowenan@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, msinada@codeaurora.org, periyasa@codeaurora.org, mpubbise@codeaurora.org, julia.lawall@lip6.fr, milehu@codeaurora.org
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

If CONFIG_ATH11K, CONFIG_MAC80211_DEBUGFS are set,
and CONFIG_ATH11K_DEBUGFS is not set, below error can be found,
drivers/net/wireless/ath/ath11k/debugfs_sta.c: In function ath11k_dbg_sta_open_htt_peer_stats:
drivers/net/wireless/ath/ath11k/debugfs_sta.c:411:4: error: struct ath11k has no member named debug
  ar->debug.htt_stats.stats_req = stats_req;

It is to add the dependency for the member of struct ath11k.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 3c5f931..bcc51d7 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -408,7 +408,9 @@ ath11k_dbg_sta_open_htt_peer_stats(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	mutex_lock(&ar->conf_mutex);
+#ifdef CONFIG_ATH11K_DEBUGFS
 	ar->debug.htt_stats.stats_req = stats_req;
+#endif
 	stats_req->type = ATH11K_DBG_HTT_EXT_STATS_PEER_INFO;
 	memcpy(stats_req->peer_addr, sta->addr, ETH_ALEN);
 	ret = ath11k_dbg_htt_stats_req(ar);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
