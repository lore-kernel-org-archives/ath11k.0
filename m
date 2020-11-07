Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Taehee Yoo <ap420073@gmail.com>
Subject: [PATCH net v2 09/21] iwlwifi: set .owner to THIS_MODULE
Date: Sat,  7 Nov 2020 17:21:40 +0000
Message-Id: <20201107172152.828-10-ap420073@gmail.com>
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

Fixes: 5ae212c9273d ("[PATCH] iwlwifi: add read rate scale table debugfs function")
Fixes: 0209dc11c769 ("[PATCH] iwlwifi: add debugfs rate scale stats")
Fixes: 712b6cf57a53 ("iwlwifi: Add debugfs to iwl core")
Fixes: 189a2b5942d6 ("iwlwifi: trigger event log from debugfs")
Fixes: 8ca151b568b6 ("iwlwifi: add the MVM driver")
Fixes: 757cf23b4b4b ("iwlwifi: mvm: add per rate tx stats")
Fixes: 2b55f43f8e47 ("iwlwifi: mvm: Add mem debugfs entry")
Fixes: 93b167c13a3a ("iwlwifi: runtime: sync FW and host clocks for logs")
Fixes: 38167459da50 ("iwlagn: show current rate scale data in debugfs")
Fixes: 87e5666c0722 ("iwlagn: transport handler can register debugfs entries")
Fixes: 16db88ba51d6 ("iwlagn: move dump_csr and dump_fh to transport layer")
Signed-off-by: Taehee Yoo <ap420073@gmail.com>
---

v1 -> v2:
 - Change headline
 - Squash patches into per-driver/subsystem

 drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c | 3 +++
 drivers/net/wireless/intel/iwlwifi/dvm/rs.c      | 3 +++
 drivers/net/wireless/intel/iwlwifi/fw/debugfs.c  | 3 +++
 drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c | 1 +
 drivers/net/wireless/intel/iwlwifi/mvm/debugfs.h | 3 +++
 drivers/net/wireless/intel/iwlwifi/mvm/rs.c      | 3 +++
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c  | 3 +++
 7 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c b/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c
index 911049201838..a1022987eccf 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/debugfs.c
@@ -34,6 +34,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {          \
 	.read = iwl_dbgfs_##name##_read,				\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 #define DEBUGFS_WRITE_FILE_OPS(name)                                    \
@@ -41,6 +42,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {          \
 	.write = iwl_dbgfs_##name##_write,                              \
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 
@@ -50,6 +52,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {          \
 	.read = iwl_dbgfs_##name##_read,                                \
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 static ssize_t iwl_dbgfs_sram_read(struct file *file,
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/rs.c b/drivers/net/wireless/intel/iwlwifi/dvm/rs.c
index 548540dd0c0f..1518dead1e47 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/rs.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/rs.c
@@ -3172,6 +3172,7 @@ static const struct file_operations rs_sta_dbgfs_scale_table_ops = {
 	.read = rs_sta_dbgfs_scale_table_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 static ssize_t rs_sta_dbgfs_stats_table_read(struct file *file,
 			char __user *user_buf, size_t count, loff_t *ppos)
@@ -3215,6 +3216,7 @@ static const struct file_operations rs_sta_dbgfs_stats_table_ops = {
 	.read = rs_sta_dbgfs_stats_table_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t rs_sta_dbgfs_rate_scale_data_read(struct file *file,
@@ -3241,6 +3243,7 @@ static const struct file_operations rs_sta_dbgfs_rate_scale_data_ops = {
 	.read = rs_sta_dbgfs_rate_scale_data_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 static void rs_add_debugfs(void *priv, void *priv_sta,
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/debugfs.c b/drivers/net/wireless/intel/iwlwifi/fw/debugfs.c
index 267ad4eddb5c..5f41c8587ac6 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/debugfs.c
@@ -122,6 +122,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {		\
 	.open = _iwl_dbgfs_##name##_open,				\
 	.llseek = generic_file_llseek,					\
 	.release = _iwl_dbgfs_release,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define FWRT_DEBUGFS_WRITE_WRAPPER(name, buflen, argtype)		\
@@ -150,6 +151,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {		\
 	.open = _iwl_dbgfs_##name##_open,				\
 	.llseek = generic_file_llseek,					\
 	.release = _iwl_dbgfs_release,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define _FWRT_DEBUGFS_WRITE_FILE_OPS(name, buflen, argtype)		\
@@ -160,6 +162,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {		\
 	.open = _iwl_dbgfs_##name##_open,				\
 	.llseek = generic_file_llseek,					\
 	.release = _iwl_dbgfs_release,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define FWRT_DEBUGFS_READ_FILE_OPS(name, bufsz)				\
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
index 3395c4675988..d4b9ef8b25ee 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.c
@@ -1981,6 +1981,7 @@ static const struct file_operations iwl_dbgfs_mem_ops = {
 	.write = iwl_dbgfs_mem_write,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 void iwl_mvm_sta_add_debugfs(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.h b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.h
index a83d252c0602..5bf4f7801b83 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.h
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs.h
@@ -63,6 +63,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {		\
 	.read = iwl_dbgfs_##name##_read,				\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define MVM_DEBUGFS_WRITE_WRAPPER(name, buflen, argtype)		\
@@ -87,6 +88,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {		\
 	.read = iwl_dbgfs_##name##_read,				\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 #define _MVM_DEBUGFS_WRITE_FILE_OPS(name, buflen, argtype)		\
@@ -95,4 +97,5 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {		\
 	.write = _iwl_dbgfs_##name##_write,				\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/rs.c b/drivers/net/wireless/intel/iwlwifi/mvm/rs.c
index ed7382e7ea17..853c3969c956 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/rs.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/rs.c
@@ -3909,6 +3909,7 @@ static const struct file_operations rs_sta_dbgfs_scale_table_ops = {
 	.read = rs_sta_dbgfs_scale_table_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 static ssize_t rs_sta_dbgfs_stats_table_read(struct file *file,
 			char __user *user_buf, size_t count, loff_t *ppos)
@@ -3956,6 +3957,7 @@ static const struct file_operations rs_sta_dbgfs_stats_table_ops = {
 	.read = rs_sta_dbgfs_stats_table_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t rs_sta_dbgfs_drv_tx_stats_read(struct file *file,
@@ -4046,6 +4048,7 @@ static const struct file_operations rs_sta_dbgfs_drv_tx_stats_ops = {
 	.write = rs_sta_dbgfs_drv_tx_stats_write,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t iwl_dbgfs_ss_force_read(struct file *file,
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
index d2e69ad53b27..250b7883703c 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
@@ -2476,6 +2476,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {		\
 	.read = iwl_dbgfs_##name##_read,				\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 #define DEBUGFS_WRITE_FILE_OPS(name)                                    \
@@ -2483,6 +2484,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {          \
 	.write = iwl_dbgfs_##name##_write,                              \
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 #define DEBUGFS_READ_WRITE_FILE_OPS(name)				\
@@ -2491,6 +2493,7 @@ static const struct file_operations iwl_dbgfs_##name##_ops = {		\
 	.read = iwl_dbgfs_##name##_read,				\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 struct iwl_dbgfs_tx_queue_priv {
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
