Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1B8-0000pu-2u
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:27:19 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A70EE60AA8
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:27:16 +0000 (UTC)
Subject: [PATCH 09/15] ath11k: move fops_pktlog_filter to correct place
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:27:14 +0300
Message-ID: <156534283428.30736.4384925111786719487.stgit@x230>
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

It was placed in a confusing location, fix that. No functional changes.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 2ebdd8fd9e81..dc247b41390d 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -963,6 +963,12 @@ static ssize_t ath11k_read_pktlog_filter(struct file *file,
 	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
 }
 
+static const struct file_operations fops_pktlog_filter = {
+	.read = ath11k_read_pktlog_filter,
+	.write = ath11k_write_pktlog_filter,
+	.open = simple_open
+};
+
 static ssize_t ath11k_write_simulate_radar(struct file *file,
 					   const char __user *user_buf,
 					   size_t count, loff_t *ppos)
@@ -977,12 +983,6 @@ static ssize_t ath11k_write_simulate_radar(struct file *file,
 	return count;
 }
 
-static const struct file_operations fops_pktlog_filter = {
-	.read = ath11k_read_pktlog_filter,
-	.write = ath11k_write_pktlog_filter,
-	.open = simple_open
-};
-
 static const struct file_operations fops_simulate_radar = {
 	.write = ath11k_write_simulate_radar,
 	.open = simple_open


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
