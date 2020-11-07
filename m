Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Taehee Yoo <ap420073@gmail.com>
Subject: [PATCH net v2 13/21] ath10k: set .owner to THIS_MODULE
Date: Sat,  7 Nov 2020 17:21:44 +0000
Message-Id: <20201107172152.828-14-ap420073@gmail.com>
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

Fixes: 90174455ae05 ("ath10k: add support to configure pktlog filter")
Fixes: 63fb32df9786 ("ath10k: add debugfs entry to configure quiet period")
Fixes: 844fa5722712 ("ath10k: debugfs file to enable Bluetooth coexistence feature")
Fixes: 348cd95c8196 ("ath10k: add debugfs entry to enable extended tx stats")
Fixes: cc61a1bbbc0e ("ath10k: enable debugfs provision to enable Peer Stats feature")
Signed-off-by: Taehee Yoo <ap420073@gmail.com>
---

v1 -> v2:
 - Change headline
 - Squash patches into per-driver/subsystem

 drivers/net/wireless/ath/ath10k/debug.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index e8250a665433..afde3d8048e8 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1911,7 +1911,8 @@ static ssize_t ath10k_read_pktlog_filter(struct file *file, char __user *ubuf,
 static const struct file_operations fops_pktlog_filter = {
 	.read = ath10k_read_pktlog_filter,
 	.write = ath10k_write_pktlog_filter,
-	.open = simple_open
+	.open = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t ath10k_write_quiet_period(struct file *file,
@@ -1955,7 +1956,8 @@ static ssize_t ath10k_read_quiet_period(struct file *file, char __user *ubuf,
 static const struct file_operations fops_quiet_period = {
 	.read = ath10k_read_quiet_period,
 	.write = ath10k_write_quiet_period,
-	.open = simple_open
+	.open = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t ath10k_write_btcoex(struct file *file,
@@ -2039,7 +2041,8 @@ static ssize_t ath10k_read_btcoex(struct file *file, char __user *ubuf,
 static const struct file_operations fops_btcoex = {
 	.read = ath10k_read_btcoex,
 	.write = ath10k_write_btcoex,
-	.open = simple_open
+	.open = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t ath10k_write_enable_extd_tx_stats(struct file *file,
@@ -2094,7 +2097,8 @@ static ssize_t ath10k_read_enable_extd_tx_stats(struct file *file,
 static const struct file_operations fops_enable_extd_tx_stats = {
 	.read = ath10k_read_enable_extd_tx_stats,
 	.write = ath10k_write_enable_extd_tx_stats,
-	.open = simple_open
+	.open = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t ath10k_write_peer_stats(struct file *file,
@@ -2163,7 +2167,8 @@ static ssize_t ath10k_read_peer_stats(struct file *file, char __user *ubuf,
 static const struct file_operations fops_peer_stats = {
 	.read = ath10k_read_peer_stats,
 	.write = ath10k_write_peer_stats,
-	.open = simple_open
+	.open = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t ath10k_debug_fw_checksums_read(struct file *file,
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
