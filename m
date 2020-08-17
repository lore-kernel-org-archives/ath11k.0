Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 06/16] wireless: b43legacy: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:27 +0530
Message-Id: <20200817090637.26887-7-allen.cryptic@gmail.com>
In-Reply-To: <20200817090637.26887-1-allen.cryptic@gmail.com>
References: <20200817090637.26887-1-allen.cryptic@gmail.com>
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
To: kvalo@codeaurora.org, kuba@kernel.org, jirislaby@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org, chunkeey@googlemail.com, Larry.Finger@lwfinger.net, stas.yakovlev@gmail.com, helmut.schaa@googlemail.com, pkshih@realtek.com, yhchuang@realtek.com, dsd@gentoo.org, kune@deine-taler.de
Cc: brcm80211-dev-list.pdl@broadcom.com, keescook@chromium.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, brcm80211-dev-list@cypress.com, b43-dev@lists.infradead.org, Allen Pais <allen.lkml@gmail.com>, Romain Perier <romain.perier@gmail.com>, ath11k@lists.infradead.org

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/wireless/broadcom/b43legacy/main.c | 8 +++-----
 drivers/net/wireless/broadcom/b43legacy/pio.c  | 7 +++----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43legacy/main.c b/drivers/net/wireless/broadcom/b43legacy/main.c
index 2eaf481f03f1..15d592cf056c 100644
--- a/drivers/net/wireless/broadcom/b43legacy/main.c
+++ b/drivers/net/wireless/broadcom/b43legacy/main.c
@@ -1275,9 +1275,9 @@ static void handle_irq_ucode_debug(struct b43legacy_wldev *dev)
 }
 
 /* Interrupt handler bottom-half */
-static void b43legacy_interrupt_tasklet(unsigned long data)
+static void b43legacy_interrupt_tasklet(struct tasklet_struct *t)
 {
-	struct b43legacy_wldev *dev = (struct b43legacy_wldev *)data;
+	struct b43legacy_wldev *dev = from_tasklet(dev, t, isr_tasklet);
 	u32 reason;
 	u32 dma_reason[ARRAY_SIZE(dev->dma_reason)];
 	u32 merged_dma_reason = 0;
@@ -3741,9 +3741,7 @@ static int b43legacy_one_core_attach(struct ssb_device *dev,
 	wldev->wl = wl;
 	b43legacy_set_status(wldev, B43legacy_STAT_UNINIT);
 	wldev->bad_frames_preempt = modparam_bad_frames_preempt;
-	tasklet_init(&wldev->isr_tasklet,
-		     b43legacy_interrupt_tasklet,
-		     (unsigned long)wldev);
+	tasklet_setup(&wldev->isr_tasklet, b43legacy_interrupt_tasklet);
 	if (modparam_pio)
 		wldev->__using_pio = true;
 	INIT_LIST_HEAD(&wldev->list);
diff --git a/drivers/net/wireless/broadcom/b43legacy/pio.c b/drivers/net/wireless/broadcom/b43legacy/pio.c
index cbb761378619..aac413d0f629 100644
--- a/drivers/net/wireless/broadcom/b43legacy/pio.c
+++ b/drivers/net/wireless/broadcom/b43legacy/pio.c
@@ -264,9 +264,9 @@ static int pio_tx_packet(struct b43legacy_pio_txpacket *packet)
 	return 0;
 }
 
-static void tx_tasklet(unsigned long d)
+static void tx_tasklet(struct tasklet_struct *t)
 {
-	struct b43legacy_pioqueue *queue = (struct b43legacy_pioqueue *)d;
+	struct b43legacy_pioqueue *queue = from_tasklet(queue, t, txtask);
 	struct b43legacy_wldev *dev = queue->dev;
 	unsigned long flags;
 	struct b43legacy_pio_txpacket *packet, *tmp_packet;
@@ -331,8 +331,7 @@ struct b43legacy_pioqueue *b43legacy_setup_pioqueue(struct b43legacy_wldev *dev,
 	INIT_LIST_HEAD(&queue->txfree);
 	INIT_LIST_HEAD(&queue->txqueue);
 	INIT_LIST_HEAD(&queue->txrunning);
-	tasklet_init(&queue->txtask, tx_tasklet,
-		     (unsigned long)queue);
+	tasklet_setup(&queue->txtask, tx_tasklet);
 
 	value = b43legacy_read32(dev, B43legacy_MMIO_MACCTL);
 	value &= ~B43legacy_MACCTL_BE;
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
