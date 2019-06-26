Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg9gn-0006eU-Hu
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 15:18:26 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B13760A05
 for <ath11k@lists.infradead.org>; Wed, 26 Jun 2019 15:18:24 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 4/4] ath11k: use kstrtoint_from_user() instead of sscanf()
Date: Wed, 26 Jun 2019 18:18:15 +0300
Message-Id: <1561562295-17402-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1561562295-17402-1-git-send-email-kvalo@codeaurora.org>
References: <1561562295-17402-1-git-send-email-kvalo@codeaurora.org>
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

Fix checkpatch warning:

drivers/net/wireless/ath/ath11k/debugfs_sta.c:494: Prefer kstrto<type> to single variable sscanf

As kstrtoint_from_user() can read directly from user buffer no need copy the buffer separately.

Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 4a30293bbae4..82bada5a7479 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -467,15 +467,13 @@ static const struct file_operations fops_htt_peer_stats = {
 };
 
 static ssize_t ath11k_dbg_sta_write_peer_pktlog(struct file *file,
-						const char __user *ubuf,
+						const char __user *buf,
 						size_t count, loff_t *ppos)
 {
 	struct ieee80211_sta *sta = file->private_data;
 	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
 	struct ath11k *ar = arsta->arvif->ar;
-	u8 buf[32] = {0};
 	int ret, enable;
-	ssize_t rc;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -484,18 +482,9 @@ static ssize_t ath11k_dbg_sta_write_peer_pktlog(struct file *file,
 		goto out;
 	}
 
-	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
-	if (rc < 0) {
-		ret = rc;
+	ret = kstrtoint_from_user(buf, count, 0, &enable);
+	if (ret)
 		goto out;
-	}
-	buf[rc] = '\0';
-
-	ret = sscanf(buf, "%d", &enable);
-	if (ret != 1) {
-		ret = -EINVAL;
-		goto out;
-	}
 
 	ar->debug.pktlog_peer_valid = enable;
 	memcpy(ar->debug.pktlog_peer_addr, sta->addr, ETH_ALEN);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
