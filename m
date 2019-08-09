Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1C0-00012q-AW
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:28:13 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D76F26118C
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:28:10 +0000 (UTC)
Subject: [PATCH 15/15] ath11k: debug_htt_stats: move fops structs close to
 the functions
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:28:08 +0300
Message-ID: <156534288863.30736.6802391040553041619.stgit@x230>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
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
To: ath11k@lists.infradead.org

For readibility fops structures should be right after the actual functions,
move them in correct place.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c |   32 +++++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
index 4e2894ee3cc6..838c17f3dad2 100644
--- a/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debug_htt_stats.c
@@ -4203,6 +4203,14 @@ static ssize_t ath11k_write_htt_stats_type(struct file *file,
 	return ret;
 }
 
+static const struct file_operations fops_htt_stats_type = {
+	.read = ath11k_read_htt_stats_type,
+	.write = ath11k_write_htt_stats_type,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 static int ath11k_prep_htt_stats_cfg_params(struct ath11k *ar, u8 type,
 					    const u8 *mac_addr,
 					    struct htt_ext_stats_cfg_params *cfg_params)
@@ -4345,6 +4353,14 @@ static ssize_t ath11k_read_htt_stats(struct file *file,
 	return simple_read_from_buffer(user_buf, count, ppos, buf, length);
 }
 
+static const struct file_operations fops_dump_htt_stats = {
+	.open = ath11k_open_htt_stats,
+	.release = ath11k_release_htt_stats,
+	.read = ath11k_read_htt_stats,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 static ssize_t ath11k_read_htt_stats_reset(struct file *file,
 					   char __user *user_buf,
 					   size_t count, loff_t *ppos)
@@ -4396,22 +4412,6 @@ static ssize_t ath11k_write_htt_stats_reset(struct file *file,
 	return ret;
 }
 
-static const struct file_operations fops_htt_stats_type = {
-	.read = ath11k_read_htt_stats_type,
-	.write = ath11k_write_htt_stats_type,
-	.open = simple_open,
-	.owner = THIS_MODULE,
-	.llseek = default_llseek,
-};
-
-static const struct file_operations fops_dump_htt_stats = {
-	.open = ath11k_open_htt_stats,
-	.release = ath11k_release_htt_stats,
-	.read = ath11k_read_htt_stats,
-	.owner = THIS_MODULE,
-	.llseek = default_llseek,
-};
-
 static const struct file_operations fops_htt_stats_reset = {
 	.read = ath11k_read_htt_stats_reset,
 	.write = ath11k_write_htt_stats_reset,


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
