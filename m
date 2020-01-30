Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwz6u-0007aN-Ho
 for ath11k@lists.infradead.org; Thu, 30 Jan 2020 01:59:14 +0000
Received: by mail-ot1-x344.google.com with SMTP id r16so1686020otd.2
 for <ath11k@lists.infradead.org>; Wed, 29 Jan 2020 17:59:10 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] ath11k: Silence clang -Wsometimes-uninitialized in
 ath11k_update_per_peer_stats_from_txcompl
Date: Wed, 29 Jan 2020 18:59:05 -0700
Message-Id: <20200130015905.18610-1-natechancellor@gmail.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nathan Chancellor <natechancellor@gmail.com>, ci_notify@linaro.org, ath11k@lists.infradead.org

Clang warns a few times (trimmed for brevity):

../drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning:
variable 'rate_idx' is used uninitialized whenever 'if' condition is
false [-Wsometimes-uninitialized]

It is not wrong, rate_idx is only initialized in the first if block.
However, this is not necessarily an issue in practice because rate_idx
will only be used when initialized because
ath11k_accumulate_per_peer_tx_stats only uses rate_idx when flags is not
set to RATE_INFO_FLAGS_HE_MCS, RATE_INFO_FLAGS_VHT_MCS, or
RATE_INFO_FLAGS_MCS. Still, it is not good to stick uninitialized values
into another function so initialize it to zero to prevent any issues
down the line.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Link: https://github.com/ClangBuiltLinux/linux/issues/832
Reported-by: ci_notify@linaro.org
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 743760c9bcae..a5bdd16d6d46 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -136,7 +136,7 @@ void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
 	struct ath11k_sta *arsta;
 	struct ieee80211_sta *sta;
 	u16 rate;
-	u8 rate_idx;
+	u8 rate_idx = 0;
 	int ret;
 	u8 mcs;
 
-- 
2.25.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
