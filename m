Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBRLL-0005Dd-6D
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 23:30:07 +0000
From: greearb@candelatech.com
Subject: [PATCH 2/2] ath11k:  Add firmware_info file to debugfs
Date: Thu, 27 Aug 2020 16:30:02 -0700
Message-Id: <20200827233002.21483-2-greearb@candelatech.com>
In-Reply-To: <20200827233002.21483-1-greearb@candelatech.com>
References: <20200827233002.21483-1-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

This shows the fwcfg file name so that users don't have to guess,
as well as some other info about the firmware and radio.

directory: QCA6390/hw2.0
fwcfg:     fwcfg-pci-0000:14:00.0.txt
bus:       0000:14:00.0
version:   0x101c06cc
hw_rev:    6390-hw2
board:     board.bin

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath11k/debug.c | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 2ac0df8aee26..38ffcae67ab5 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -398,6 +398,59 @@ static const struct file_operations fops_pdev_stats = {
 	.llseek = default_llseek,
 };
 
+static ssize_t ath11k_read_fwinfo(struct file *file,
+				  char __user *user_buf,
+				  size_t count, loff_t *ppos)
+{
+	struct ath11k_base *ab = file->private_data;
+	char *buf;
+	unsigned int len = 0, buf_len = 1000;
+	ssize_t ret_cnt;
+
+	buf = kzalloc(buf_len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* TODO:  Locking? */
+
+	len = snprintf(buf, buf_len, "directory: %s\nfwcfg:     fwcfg-%s-%s.txt\nbus:       %s",
+		       ab->hw_params.fw.dir,
+		       ath11k_bus_str(ab->hif.bus), dev_name(ab->dev), dev_name(ab->dev));
+
+	/* Just to be safe */
+	buf[buf_len - 1] = 0;
+	len = strlen(buf);
+
+	len += snprintf(buf + len, buf_len - len, "\nversion:   0x%0x\nhw_rev:    ",
+			ab->qmi.target.fw_version);
+	switch (ab->hw_rev) {
+	case ATH11K_HW_QCA6390_HW11:
+		len += snprintf(buf + len, buf_len - len, "6390-hw1\n");
+		break;
+	case ATH11K_HW_QCA6390_HW20:
+		len += snprintf(buf + len, buf_len - len, "6390-hw2\n");
+		break;
+	case ATH11K_HW_IPQ8074:
+		len += snprintf(buf + len, buf_len - len, "8074\n");
+		break;
+	}
+
+	len += snprintf(buf + len, buf_len - len, "board:     %s\n",
+			ab->fw_board_name);
+
+	ret_cnt = simple_read_from_buffer(user_buf, count, ppos, buf, len);
+
+	kfree(buf);
+	return ret_cnt;
+}
+
+static const struct file_operations fops_fwinfo_services = {
+	.read = ath11k_read_fwinfo,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 static int ath11k_open_vdev_stats(struct inode *inode, struct file *file)
 {
 	struct ath11k *ar = inode->i_private;
@@ -1201,6 +1254,9 @@ int ath11k_debug_register(struct ath11k *ar)
 				    &ar->dfs_block_radar_events);
 	}
 
+	debugfs_create_file("firmware_info", 0400, ar->debug.debugfs_pdev, ab,
+			    &fops_fwinfo_services);
+
 	return 0;
 }
 
-- 
2.26.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
