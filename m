Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Taehee Yoo <ap420073@gmail.com>
Subject: [PATCH net v2 21/21] Bluetooth: set .owner to THIS_MODULE
Date: Sat,  7 Nov 2020 17:21:52 +0000
Message-Id: <20201107172152.828-22-ap420073@gmail.com>
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

Fixes: 4b4148e9acc1 ("Bluetooth: Add support for setting DUT mode")
Fixes: 4b4113d6dbdb ("Bluetooth: Add debugfs entry for setting vendor diagnostic mode")
Fixes: 300acfdec916 ("Bluetooth: Introduce force_bredr_smp debugfs option for testing")
Fixes: 64dd374eac15 ("Bluetooth: Export SMP selftest result in debugfs")
Fixes: 0886aea6acd2 ("Bluetooth: Expose debug keys usage setting via debugfs")
Fixes: 134c2a89af22 ("Bluetooth: Add debugfs entry to show Secure Connections Only mode")
Fixes: b55d1abf568c ("Bluetooth: Expose quirks through debugfs")
Fixes: 6e07231a80de ("Bluetooth: Expose Secure Simple Pairing debug mode setting in debugfs")
Fixes: ac345813c4ac ("Bluetooth: Expose current identity information in debugfs")
Fixes: c2aa30db744d ("Bluetooth: debugfs option to unset MITM flag")
Fixes: 6b8d4a6a0314 ("Bluetooth: 6LoWPAN: Use connected oriented channel instead of fixed one")
Fixes: 6de50f9fdb60 ("Bluetooth: Export ECDH selftest result in debugfs")
Signed-off-by: Taehee Yoo <ap420073@gmail.com>
---

v1 -> v2:
 - Change headline
 - Squash patches into per-driver/subsystem

 net/bluetooth/6lowpan.c     | 1 +
 net/bluetooth/hci_core.c    | 2 ++
 net/bluetooth/hci_debugfs.c | 6 ++++++
 net/bluetooth/selftest.c    | 1 +
 net/bluetooth/smp.c         | 2 ++
 5 files changed, 12 insertions(+)

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index cff4944d5b66..0936184f0813 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -1214,6 +1214,7 @@ static const struct file_operations lowpan_control_fops = {
 	.write		= lowpan_control_write,
 	.llseek		= seq_lseek,
 	.release	= single_release,
+	.owner		= THIS_MODULE,
 };
 
 static void disconnect_devices(void)
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 502552d6e9af..dba8506202ff 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -116,6 +116,7 @@ static const struct file_operations dut_mode_fops = {
 	.read		= dut_mode_read,
 	.write		= dut_mode_write,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 static ssize_t vendor_diag_read(struct file *file, char __user *user_buf,
@@ -172,6 +173,7 @@ static const struct file_operations vendor_diag_fops = {
 	.read		= vendor_diag_read,
 	.write		= vendor_diag_write,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 static void hci_debugfs_create_basic(struct hci_dev *hdev)
diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index 5e8af2658e44..c9a074da16dd 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -71,6 +71,7 @@ static const struct file_operations __name ## _fops = {			      \
 	.read		= __name ## _read,				      \
 	.write		= __name ## _write,				      \
 	.llseek		= default_llseek,				      \
+	.owner		= THIS_MODULE,					      \
 }									      \
 
 #define DEFINE_INFO_ATTRIBUTE(__name, __field)				      \
@@ -284,6 +285,7 @@ static const struct file_operations use_debug_keys_fops = {
 	.open		= simple_open,
 	.read		= use_debug_keys_read,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 static ssize_t sc_only_mode_read(struct file *file, char __user *user_buf,
@@ -302,6 +304,7 @@ static const struct file_operations sc_only_mode_fops = {
 	.open		= simple_open,
 	.read		= sc_only_mode_read,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 DEFINE_INFO_ATTRIBUTE(hardware_info, hw_info);
@@ -438,6 +441,7 @@ static const struct file_operations ssp_debug_mode_fops = {
 	.open		= simple_open,
 	.read		= ssp_debug_mode_read,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 static int auto_accept_delay_set(void *data, u64 val)
@@ -726,6 +730,7 @@ static const struct file_operations force_static_address_fops = {
 	.read		= force_static_address_read,
 	.write		= force_static_address_write,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 static int white_list_show(struct seq_file *f, void *ptr)
@@ -1117,6 +1122,7 @@ static const struct file_operations force_no_mitm_fops = {
 	.read		= force_no_mitm_read,
 	.write		= force_no_mitm_write,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 DEFINE_QUIRK_ATTRIBUTE(quirk_strict_duplicate_filter,
diff --git a/net/bluetooth/selftest.c b/net/bluetooth/selftest.c
index f71c6fa65fb3..445ea247061b 100644
--- a/net/bluetooth/selftest.c
+++ b/net/bluetooth/selftest.c
@@ -194,6 +194,7 @@ static const struct file_operations test_ecdh_fops = {
 	.open		= simple_open,
 	.read		= test_ecdh_read,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 static int __init test_ecdh(void)
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index bf4bef13d935..3b91f927aab5 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -3407,6 +3407,7 @@ static const struct file_operations force_bredr_smp_fops = {
 	.read		= force_bredr_smp_read,
 	.write		= force_bredr_smp_write,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 int smp_register(struct hci_dev *hdev)
@@ -3751,6 +3752,7 @@ static const struct file_operations test_smp_fops = {
 	.open		= simple_open,
 	.read		= test_smp_read,
 	.llseek		= default_llseek,
+	.owner		= THIS_MODULE,
 };
 
 static int __init run_selftests(struct crypto_shash *tfm_cmac,
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
