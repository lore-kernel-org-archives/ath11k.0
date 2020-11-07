Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Taehee Yoo <ap420073@gmail.com>
Subject: [PATCH net v2 15/21] wil6210: set .owner to THIS_MODULE
Date: Sat,  7 Nov 2020 17:21:46 +0000
Message-Id: <20201107172152.828-16-ap420073@gmail.com>
In-Reply-To: <20201107172152.828-1-ap420073@gmail.com>
References: <20201107172152.828-1-ap420073@gmail.com>
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
To: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org
Cc: alex.aring@gmail.com, emmanuel.grumbach@intel.com, chi-hsien.lin@infineon.com, amitkarwar@gmail.com, ganapathi.bhat@nxp.com, luciano.coelho@intel.com, ath10k@lists.infradead.org, wcn36xx@lists.infradead.org, stefan@datenfreihafen.org, merez@codeaurora.org, stf_xl@wp.pl, pkshih@realtek.com, nstange@suse.de, chung-hsien.hsu@infineon.com, wright.feng@infineon.com, inaky.perez-gonzalez@intel.com, derosier@gmail.com, David.Laight@aculab.com, b43-dev@lists.infradead.org, ath11k@lists.infradead.org, arend.vanspriel@broadcom.com, johan.hedberg@gmail.com, michael.hennerich@analog.com, marcel@holtmann.org, hante.meuleman@broadcom.com, linux-wimax@intel.com, jukka.rissanen@linux.intel.com, kvalo@codeaurora.org, franky.lin@broadcom.com, huxinming820@gmail.com, linux-wireless@vger.kernel.org, linux-bluetooth@vger.kernel.org, wil6210@qti.qualcomm.com, johannes@sipsolutions.net, Larry.Finger@lwfinger.net, linux-wpan@vger.kernel.org, ap420073@gmail.com, pizza@shaftnet.org

If THIS_MODULE is not set, the module would be removed while debugfs is
being used.
It eventually makes kernel panic.

Fixes: 2be7d22f0625 ("wireless: add new wil6210 802.11ad 60GHz driver")
Fixes: 0b39aaf2f203 ("wil6210: Tx mgmt frame from debugfs")
Fixes: c5b3a6582b1e ("wil6210: Add support for setting RBUFCAP configuration")
Fixes: 3277213feb1b ("wil6210: ADDBA/DELBA flows")
Fixes: dc16427bbe65 ("wil6210: Add pmc debug mechanism memory management")
Fixes: 977c45ab5f41 ("wil6210: add debugfs to show PMC ring content")
Fixes: ff974e408334 ("wil6210: debugfs interface to send raw WMI command")
Fixes: c33407a8c504 ("wil6210: manual FW error recovery mode")
Fixes: a24a3d6abb97 ("wil6210: add TX latency statistics")
Fixes: 0c936b3c9633 ("wil6210: add support for link statistics")
Fixes: 10d599ad84a1 ("wil6210: add support for device led configuration")
Fixes: 12bace75704e ("wil6210: extract firmware capabilities from FW file")
Fixes: 13cd9f758a55 ("wil6210: extract firmware version from file header")
Fixes: fe9ee51e6a43 ("wil6210: add support for PCIe D3hot in system suspend")
Fixes: 96c93589e2df ("wil6210: initialize TX and RX enhanced DMA rings")
Signed-off-by: Taehee Yoo <ap420073@gmail.com>
---

v1 -> v2:
 - Change headline
 - Squash patches into per-driver/subsystem

 drivers/net/wireless/ath/wil6210/debugfs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/wil6210/debugfs.c b/drivers/net/wireless/ath/wil6210/debugfs.c
index 2d618f90afa7..799493739771 100644
--- a/drivers/net/wireless/ath/wil6210/debugfs.c
+++ b/drivers/net/wireless/ath/wil6210/debugfs.c
@@ -678,6 +678,7 @@ static const struct file_operations fops_ioblob = {
 	.read =		wil_read_file_ioblob,
 	.open =		simple_open,
 	.llseek =	default_llseek,
+	.owner =	THIS_MODULE,
 };
 
 static
@@ -729,6 +730,7 @@ static ssize_t wil_write_file_rxon(struct file *file, const char __user *buf,
 static const struct file_operations fops_rxon = {
 	.write = wil_write_file_rxon,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t wil_write_file_rbufcap(struct file *file,
@@ -767,6 +769,7 @@ static ssize_t wil_write_file_rbufcap(struct file *file,
 static const struct file_operations fops_rbufcap = {
 	.write = wil_write_file_rbufcap,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 /* block ack control, write:
@@ -865,6 +868,7 @@ static const struct file_operations fops_back = {
 	.read = wil_read_back,
 	.write = wil_write_back,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 /* pmc control, write:
@@ -941,12 +945,14 @@ static const struct file_operations fops_pmccfg = {
 	.read = wil_read_pmccfg,
 	.write = wil_write_pmccfg,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static const struct file_operations fops_pmcdata = {
 	.open		= simple_open,
 	.read		= wil_pmc_read,
 	.llseek		= wil_pmc_llseek,
+	.owner		= THIS_MODULE,
 };
 
 static int wil_pmcring_seq_open(struct inode *inode, struct file *file)
@@ -959,6 +965,7 @@ static const struct file_operations fops_pmcring = {
 	.release	= single_release,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
+	.owner		= THIS_MODULE,
 };
 
 /*---tx_mgmt---*/
@@ -996,6 +1003,7 @@ static ssize_t wil_write_file_txmgmt(struct file *file, const char __user *buf,
 static const struct file_operations fops_txmgmt = {
 	.write = wil_write_file_txmgmt,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 /* Write WMI command (w/o mbox header) to this file to send it
@@ -1039,6 +1047,7 @@ static ssize_t wil_write_file_wmi(struct file *file, const char __user *buf,
 static const struct file_operations fops_wmi = {
 	.write = wil_write_file_wmi,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static void wil_seq_print_skb(struct seq_file *s, struct sk_buff *skb)
@@ -1558,6 +1567,7 @@ static const struct file_operations fops_recovery = {
 	.read = wil_read_file_recovery,
 	.write = wil_write_file_recovery,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 /*---------Station matrix------------*/
@@ -1836,6 +1846,7 @@ static const struct file_operations fops_tx_latency = {
 	.read		= seq_read,
 	.write		= wil_tx_latency_write,
 	.llseek		= seq_lseek,
+	.owner		= THIS_MODULE,
 };
 
 static void wil_link_stats_print_basic(struct wil6210_vif *vif,
@@ -1999,6 +2010,7 @@ static const struct file_operations fops_link_stats = {
 	.read		= seq_read,
 	.write		= wil_link_stats_write,
 	.llseek		= seq_lseek,
+	.owner		= THIS_MODULE,
 };
 
 static int
@@ -2053,6 +2065,7 @@ static const struct file_operations fops_link_stats_global = {
 	.read		= seq_read,
 	.write		= wil_link_stats_global_write,
 	.llseek		= seq_lseek,
+	.owner		= THIS_MODULE,
 };
 
 static ssize_t wil_read_file_led_cfg(struct file *file, char __user *user_buf,
@@ -2100,6 +2113,7 @@ static const struct file_operations fops_led_cfg = {
 	.read = wil_read_file_led_cfg,
 	.write = wil_write_file_led_cfg,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 /* led_blink_time, write:
@@ -2165,6 +2179,7 @@ static const struct file_operations fops_led_blink_time = {
 	.read = wil_read_led_blink_time,
 	.write = wil_write_led_blink_time,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 /*---------FW capabilities------------*/
@@ -2189,6 +2204,7 @@ static const struct file_operations fops_fw_capabilities = {
 	.release	= single_release,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
+	.owner		= THIS_MODULE,
 };
 
 /*---------FW version------------*/
@@ -2215,6 +2231,7 @@ static const struct file_operations fops_fw_version = {
 	.release	= single_release,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
+	.owner		= THIS_MODULE,
 };
 
 /*---------suspend_stats---------*/
@@ -2275,6 +2292,7 @@ static const struct file_operations fops_suspend_stats = {
 	.read = wil_read_suspend_stats,
 	.write = wil_write_suspend_stats,
 	.open  = simple_open,
+	.owner = THIS_MODULE,
 };
 
 /*---------compressed_rx_status---------*/
@@ -2329,6 +2347,7 @@ static const struct file_operations fops_compressed_rx_status = {
 	.read = seq_read,
 	.write = wil_compressed_rx_status_write,
 	.llseek	= seq_lseek,
+	.owner = THIS_MODULE,
 };
 
 /*----------------*/
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
