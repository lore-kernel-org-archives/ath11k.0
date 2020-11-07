Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Taehee Yoo <ap420073@gmail.com>
Subject: [PATCH net v2 02/21] mac80211: set .owner to THIS_MODULE
Date: Sat,  7 Nov 2020 17:21:33 +0000
Message-Id: <20201107172152.828-3-ap420073@gmail.com>
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

Fixes: e9f207f0ff90 ("[MAC80211]: Add debugfs attributes.")
Fixes: 4b7679a561e5 ("mac80211: clean up rate control API")
Fixes: ec8aa669b839 ("mac80211: add the minstrel_ht rate control algorithm")
Fixes: 2cae0b6a70d6 ("mac80211: add new Minstrel-HT statistic output via csv")
Fixes: d0a77c6569ab ("mac80211: allow writing TX PN in debugfs")
Fixes: 8f20fc24986a ("[MAC80211]: embed key conf in key, fix driver interface")
Fixes: a75b4363eaaf ("mac80211: allow controlling aggregation manually")
Fixes: 9399b86c0e9a ("mac80211: add debug knobs for fair queuing")
Fixes: e322c07f8371 ("mac80211: debugfs: improve airtime_flags handler readability")
Fixes: 3ace10f5b5ad ("mac80211: Implement Airtime-based Queue Limit (AQL)")
Fixes: 276d9e82e06c ("mac80211: debugfs option to force TX status frames")
Fixes: 827b1fb44b7e ("mac80211: resume properly, add suspend/resume test")
Signed-off-by: Taehee Yoo <ap420073@gmail.com>
---

v1 -> v2:
 - Change headline
 - Squash patches into per-driver/subsystem

 net/mac80211/debugfs.c                     | 7 +++++++
 net/mac80211/debugfs_key.c                 | 3 +++
 net/mac80211/debugfs_netdev.c              | 1 +
 net/mac80211/debugfs_sta.c                 | 2 ++
 net/mac80211/rate.c                        | 1 +
 net/mac80211/rc80211_minstrel_ht_debugfs.c | 2 ++
 6 files changed, 16 insertions(+)

diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
index 90470392fdaa..abbfc1bbdb8b 100644
--- a/net/mac80211/debugfs.c
+++ b/net/mac80211/debugfs.c
@@ -46,6 +46,7 @@ static const struct file_operations name## _ops = {			\
 	.read = name## _read,						\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 #define DEBUGFS_READONLY_FILE(name, fmt, value...)		\
@@ -148,6 +149,7 @@ static const struct file_operations aqm_ops = {
 	.read = aqm_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t airtime_flags_read(struct file *file,
@@ -201,6 +203,7 @@ static const struct file_operations airtime_flags_ops = {
 	.read = airtime_flags_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t aql_txq_limit_read(struct file *file,
@@ -282,6 +285,7 @@ static const struct file_operations aql_txq_limit_ops = {
 	.read = aql_txq_limit_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 static ssize_t force_tx_status_read(struct file *file,
@@ -334,6 +338,7 @@ static const struct file_operations force_tx_status_ops = {
 	.read = force_tx_status_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 
 #ifdef CONFIG_PM
@@ -354,6 +359,7 @@ static const struct file_operations reset_ops = {
 	.write = reset_write,
 	.open = simple_open,
 	.llseek = noop_llseek,
+	.owner = THIS_MODULE,
 };
 #endif
 
@@ -537,6 +543,7 @@ static const struct file_operations stats_ ##name## _ops = {		\
 	.read = stats_ ##name## _read,					\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 };
 
 #define DEBUGFS_STATS_ADD(name)					\
diff --git a/net/mac80211/debugfs_key.c b/net/mac80211/debugfs_key.c
index 98a713475e0f..d7c0c28045ef 100644
--- a/net/mac80211/debugfs_key.c
+++ b/net/mac80211/debugfs_key.c
@@ -30,6 +30,7 @@ static const struct file_operations key_ ##name## _ops = {		\
 	.read = key_##name##_read,					\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define KEY_OPS_W(name)							\
@@ -38,6 +39,7 @@ static const struct file_operations key_ ##name## _ops = {		\
 	.write = key_##name##_write,					\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define KEY_FILE(name, format)						\
@@ -53,6 +55,7 @@ static const struct file_operations key_ ##name## _ops = {		\
 	.read = key_conf_##name##_read,					\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define KEY_CONF_FILE(name, format)					\
diff --git a/net/mac80211/debugfs_netdev.c b/net/mac80211/debugfs_netdev.c
index fe8a7a87e513..8efa31ae7334 100644
--- a/net/mac80211/debugfs_netdev.c
+++ b/net/mac80211/debugfs_netdev.c
@@ -127,6 +127,7 @@ static const struct file_operations name##_ops = {			\
 	.write = (_write),						\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define _IEEE80211_IF_FILE_R_FN(name)					\
diff --git a/net/mac80211/debugfs_sta.c b/net/mac80211/debugfs_sta.c
index 829dcad69c2c..9ce49346c32a 100644
--- a/net/mac80211/debugfs_sta.c
+++ b/net/mac80211/debugfs_sta.c
@@ -34,6 +34,7 @@ static const struct file_operations sta_ ##name## _ops = {		\
 	.read = sta_##name##_read,					\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define STA_OPS_RW(name)						\
@@ -42,6 +43,7 @@ static const struct file_operations sta_ ##name## _ops = {		\
 	.write = sta_##name##_write,					\
 	.open = simple_open,						\
 	.llseek = generic_file_llseek,					\
+	.owner = THIS_MODULE,						\
 }
 
 #define STA_FILE(name, field, format)					\
diff --git a/net/mac80211/rate.c b/net/mac80211/rate.c
index 45927202c71c..bbb691119a44 100644
--- a/net/mac80211/rate.c
+++ b/net/mac80211/rate.c
@@ -225,6 +225,7 @@ const struct file_operations rcname_ops = {
 	.read = rcname_read,
 	.open = simple_open,
 	.llseek = default_llseek,
+	.owner = THIS_MODULE,
 };
 #endif
 
diff --git a/net/mac80211/rc80211_minstrel_ht_debugfs.c b/net/mac80211/rc80211_minstrel_ht_debugfs.c
index bebb71917742..cdb51aa460a3 100644
--- a/net/mac80211/rc80211_minstrel_ht_debugfs.c
+++ b/net/mac80211/rc80211_minstrel_ht_debugfs.c
@@ -173,6 +173,7 @@ static const struct file_operations minstrel_ht_stat_fops = {
 	.read = minstrel_stats_read,
 	.release = minstrel_stats_release,
 	.llseek = no_llseek,
+	.owner = THIS_MODULE,
 };
 
 static char *
@@ -311,6 +312,7 @@ static const struct file_operations minstrel_ht_stat_csv_fops = {
 	.read = minstrel_stats_read,
 	.release = minstrel_stats_release,
 	.llseek = no_llseek,
+	.owner = THIS_MODULE,
 };
 
 void
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
