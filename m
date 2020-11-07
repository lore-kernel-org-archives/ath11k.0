Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Taehee Yoo <ap420073@gmail.com>
Subject: [PATCH net v2 18/21] b43legacy: set .owner to THIS_MODULE
Date: Sat,  7 Nov 2020 17:21:49 +0000
Message-Id: <20201107172152.828-19-ap420073@gmail.com>
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

Fixes: 75388acd0cd8 ("[B43LEGACY]: add mac80211-based driver for legacy BCM43xx devices")
Signed-off-by: Taehee Yoo <ap420073@gmail.com>
---

v1 -> v2:
 - Change headline

 drivers/net/wireless/broadcom/b43legacy/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/b43legacy/debugfs.c b/drivers/net/wireless/broadcom/b43legacy/debugfs.c
index e7e4293c01f2..7c6e7cfeb822 100644
--- a/drivers/net/wireless/broadcom/b43legacy/debugfs.c
+++ b/drivers/net/wireless/broadcom/b43legacy/debugfs.c
@@ -318,6 +318,7 @@ static ssize_t b43legacy_debugfs_write(struct file *file,
 			.read	= b43legacy_debugfs_read,		\
 			.write	= b43legacy_debugfs_write,		\
 			.llseek = generic_file_llseek,			\
+			.owner = THIS_MODULE,				\
 		},						\
 		.file_struct_offset = offsetof(struct b43legacy_dfsentry, \
 					       file_##name),	\
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
