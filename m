Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihGXs-0006x7-JS
 for ath11k@lists.infradead.org; Tue, 17 Dec 2019 17:22:06 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: htt stats module does not handle multiple skbs
Date: Tue, 17 Dec 2019 18:22:00 +0100
Message-Id: <20191217172200.7470-1-john@phrozen.org>
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

From: Miles Hu <milehu@codeaurora.org>

This patch removes the "done" check from the stats handler thus allowing
the code to parse more skbs.

Reviewed-by: John Crispin <john@phrozen.org>
Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 27b301bc1a1b..45dbffaca3bd 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4119,6 +4119,7 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 {
 	struct ath11k_htt_extd_stats_msg *msg;
 	struct debug_htt_stats_req *stats_req;
+	bool send_completion = false;
 	struct ath11k *ar;
 	u32 len;
 	u64 cookie;
@@ -4147,10 +4148,8 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 		return;
 
 	spin_lock_bh(&ar->debug.htt_stats.lock);
-	if (stats_req->done) {
-		spin_unlock_bh(&ar->debug.htt_stats.lock);
-		return;
-	}
+	if (!stats_req->done)
+		send_completion = true;
 	stats_req->done = true;
 	spin_unlock_bh(&ar->debug.htt_stats.lock);
 
@@ -4161,7 +4160,8 @@ void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
 	if (ret)
 		ath11k_warn(ab, "Failed to parse tlv %d\n", ret);
 
-	complete(&stats_req->cmpln);
+	if (send_completion)
+		complete(&stats_req->cmpln);
 }
 
 static ssize_t ath11k_read_htt_stats_type(struct file *file,
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
