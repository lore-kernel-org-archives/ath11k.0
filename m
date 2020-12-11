Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knmKo-0006iw-A5
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 17:36:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 03/10] ath11k: pci: read select_window register to ensure
 write is finished
Date: Fri, 11 Dec 2020 19:35:43 +0200
Message-Id: <1607708150-21066-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
References: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

From: Carl Huang <cjhuang@codeaurora.org>

Just when resume from WoW, the write to select_window doesn't take
effect immediately, so read the register again to ensure the write
operation is finished.

Another change is to reset select_window to ZERO because this
register isn't restored after WoW, so the content of this register
becomes ZERO too.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 770cefd53290..ee1c2edefa20 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -126,6 +126,7 @@ static inline void ath11k_pci_select_window(struct ath11k_pci *ab_pci, u32 offse
 	if (window != ab_pci->register_window) {
 		iowrite32(WINDOW_ENABLE_BIT | window,
 			  ab->mem + WINDOW_REG_ADDRESS);
+		ioread32(ab->mem + WINDOW_REG_ADDRESS);
 		ab_pci->register_window = window;
 	}
 }
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
