Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Taehee Yoo <ap420073@gmail.com>
Subject: [PATCH net v2 04/21] netdevsim: set .owner to THIS_MODULE
Date: Sat,  7 Nov 2020 17:21:35 +0000
Message-Id: <20201107172152.828-5-ap420073@gmail.com>
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

Fixes: 82c93a87bf8b ("netdevsim: implement couple of testing devlink health reporters")
Fixes: 424be63ad831 ("netdevsim: add UDP tunnel port offload support")
Fixes: 4418f862d675 ("netdevsim: implement support for devlink region and snapshots")
Fixes: d3cbb907ae57 ("netdevsim: add ACL trap reporting cookie as a metadata")
Signed-off-by: Taehee Yoo <ap420073@gmail.com>
---

v1 -> v2:
 - Change headline
 - Squash patches into per-driver/subsystem

 drivers/net/netdevsim/dev.c         | 2 ++
 drivers/net/netdevsim/health.c      | 1 +
 drivers/net/netdevsim/udp_tunnels.c | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
index d07061417675..e7972e88ffe0 100644
--- a/drivers/net/netdevsim/dev.c
+++ b/drivers/net/netdevsim/dev.c
@@ -96,6 +96,7 @@ static const struct file_operations nsim_dev_take_snapshot_fops = {
 	.open = simple_open,
 	.write = nsim_dev_take_snapshot_write,
 	.llseek = generic_file_llseek,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t nsim_dev_trap_fa_cookie_read(struct file *file,
@@ -188,6 +189,7 @@ static const struct file_operations nsim_dev_trap_fa_cookie_fops = {
 	.read = nsim_dev_trap_fa_cookie_read,
 	.write = nsim_dev_trap_fa_cookie_write,
 	.llseek = generic_file_llseek,
+	.owner = THIS_MODULE,
 };
 
 static int nsim_dev_debugfs_init(struct nsim_dev *nsim_dev)
diff --git a/drivers/net/netdevsim/health.c b/drivers/net/netdevsim/health.c
index 62958b238d50..21e2974660e7 100644
--- a/drivers/net/netdevsim/health.c
+++ b/drivers/net/netdevsim/health.c
@@ -261,6 +261,7 @@ static const struct file_operations nsim_dev_health_break_fops = {
 	.open = simple_open,
 	.write = nsim_dev_health_break_write,
 	.llseek = generic_file_llseek,
+	.owner = THIS_MODULE,
 };
 
 int nsim_dev_health_init(struct nsim_dev *nsim_dev, struct devlink *devlink)
diff --git a/drivers/net/netdevsim/udp_tunnels.c b/drivers/net/netdevsim/udp_tunnels.c
index 6ab023acefd6..02dc3123eb6c 100644
--- a/drivers/net/netdevsim/udp_tunnels.c
+++ b/drivers/net/netdevsim/udp_tunnels.c
@@ -124,6 +124,7 @@ static const struct file_operations nsim_udp_tunnels_info_reset_fops = {
 	.open = simple_open,
 	.write = nsim_udp_tunnels_info_reset_write,
 	.llseek = generic_file_llseek,
+	.owner = THIS_MODULE,
 };
 
 int nsim_udp_tunnels_info_create(struct nsim_dev *nsim_dev,
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
