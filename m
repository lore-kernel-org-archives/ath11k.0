Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout-p-201.mailbox.org ([80.241.56.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWqP-00063R-Rl
 for ath11k@lists.infradead.org; Wed, 02 Dec 2020 18:27:15 +0000
Date: Wed, 2 Dec 2020 19:27:05 +0100
From: Devin Bayer <dev@doubly.so>
Subject: [PATCH] add ath11k MODULE_FIRMWARE macros
Message-ID: <20201202182705.dhkml4nb4rf2vwav@orac>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-wireless@vger.kernel.org, kvalo@codeaurora.org

Hello,

I am trying to get the ath11k driver to work with VyOS and during the
build it tries to discover the firmware blobs which drivers require.

This doesn't work with ath11k because it doesn't use the MODULE_FIRMWARE
macro. This patch fixes that.

Thanks,
Devin

Signed-off-by: Devin Bayer <dev@doubly.so>
---
 drivers/net/wireless/ath/ath11k/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index af59c23fea56..2add42ce729b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -991,3 +991,9 @@ EXPORT_SYMBOL(ath11k_core_resume);
 
 MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11ax wireless LAN cards.");
 MODULE_LICENSE("Dual BSD/GPL");
+
+/* QCA639x 2.0 firmware files */
+MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_BOARD_API2_FILE);
+MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_AMSS_FILE);
+MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_M3_FILE);
+
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
