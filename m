Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Taehee Yoo <ap420073@gmail.com>
Subject: [PATCH net v2 12/21] ath11k: set .owner to THIS_MODULE
Date: Sat,  7 Nov 2020 17:21:43 +0000
Message-Id: <20201107172152.828-13-ap420073@gmail.com>
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

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Taehee Yoo <ap420073@gmail.com>
---

v1 -> v2:
 - Change headline
 - Squash patches into per-driver/subsystem

 drivers/net/wireless/ath/ath11k/debugfs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 1b914e67d314..bce9f9512833 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -593,7 +593,8 @@ static ssize_t ath11k_read_enable_extd_tx_stats(struct file *file,
 static const struct file_operations fops_extd_tx_stats = {
 	.read = ath11k_read_enable_extd_tx_stats,
 	.write = ath11k_write_enable_extd_tx_stats,
-	.open = simple_open
+	.open = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t ath11k_write_extd_rx_stats(struct file *file,
@@ -686,6 +687,7 @@ static const struct file_operations fops_extd_rx_stats = {
 	.read = ath11k_read_extd_rx_stats,
 	.write = ath11k_write_extd_rx_stats,
 	.open = simple_open,
+	.owner = THIS_MODULE,
 };
 
 static int ath11k_fill_bp_stats(struct ath11k_base *ab,
@@ -1047,7 +1049,8 @@ static ssize_t ath11k_write_simulate_radar(struct file *file,
 
 static const struct file_operations fops_simulate_radar = {
 	.write = ath11k_write_simulate_radar,
-	.open = simple_open
+	.open = simple_open,
+	.owner = THIS_MODULE,
 };
 
 int ath11k_debugfs_register(struct ath11k *ar)
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
