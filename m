Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 01/16] wireless: ath5k: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:22 +0530
Message-Id: <20200817090637.26887-2-allen.cryptic@gmail.com>
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
 drivers/net/wireless/ath/ath5k/base.c   | 24 ++++++++++++------------
 drivers/net/wireless/ath/ath5k/rfkill.c |  7 +++----
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath5k/base.c b/drivers/net/wireless/ath/ath5k/base.c
index 65a4c142640d..2781dcd534a9 100644
--- a/drivers/net/wireless/ath/ath5k/base.c
+++ b/drivers/net/wireless/ath/ath5k/base.c
@@ -1536,12 +1536,12 @@ ath5k_set_current_imask(struct ath5k_hw *ah)
 }
 
 static void
-ath5k_tasklet_rx(unsigned long data)
+ath5k_tasklet_rx(struct tasklet_struct *t)
 {
 	struct ath5k_rx_status rs = {};
 	struct sk_buff *skb, *next_skb;
 	dma_addr_t next_skb_addr;
-	struct ath5k_hw *ah = (void *)data;
+	struct ath5k_hw *ah = from_tasklet(ah, t, rxtq);
 	struct ath_common *common = ath5k_hw_common(ah);
 	struct ath5k_buf *bf;
 	struct ath5k_desc *ds;
@@ -1784,10 +1784,10 @@ ath5k_tx_processq(struct ath5k_hw *ah, struct ath5k_txq *txq)
 }
 
 static void
-ath5k_tasklet_tx(unsigned long data)
+ath5k_tasklet_tx(struct tasklet_struct *t)
 {
 	int i;
-	struct ath5k_hw *ah = (void *)data;
+	struct ath5k_hw *ah = from_tasklet(ah, t, txtq);
 
 	for (i = 0; i < AR5K_NUM_TX_QUEUES; i++)
 		if (ah->txqs[i].setup && (ah->ah_txq_isr_txok_all & BIT(i)))
@@ -2176,9 +2176,9 @@ ath5k_beacon_config(struct ath5k_hw *ah)
 	spin_unlock_bh(&ah->block);
 }
 
-static void ath5k_tasklet_beacon(unsigned long data)
+static void ath5k_tasklet_beacon(struct tasklet_struct *t)
 {
-	struct ath5k_hw *ah = (struct ath5k_hw *) data;
+	struct ath5k_hw *ah = from_tasklet(ah, t, beacontq);
 
 	/*
 	 * Software beacon alert--time to send a beacon.
@@ -2447,9 +2447,9 @@ ath5k_calibrate_work(struct work_struct *work)
 
 
 static void
-ath5k_tasklet_ani(unsigned long data)
+ath5k_tasklet_ani(struct tasklet_struct *t)
 {
-	struct ath5k_hw *ah = (void *)data;
+	struct ath5k_hw *ah = from_tasklet(ah, t, ani_tasklet);
 
 	ah->ah_cal_mask |= AR5K_CALIBRATION_ANI;
 	ath5k_ani_calibration(ah);
@@ -3069,10 +3069,10 @@ ath5k_init(struct ieee80211_hw *hw)
 		hw->queues = 1;
 	}
 
-	tasklet_init(&ah->rxtq, ath5k_tasklet_rx, (unsigned long)ah);
-	tasklet_init(&ah->txtq, ath5k_tasklet_tx, (unsigned long)ah);
-	tasklet_init(&ah->beacontq, ath5k_tasklet_beacon, (unsigned long)ah);
-	tasklet_init(&ah->ani_tasklet, ath5k_tasklet_ani, (unsigned long)ah);
+	tasklet_setup(&ah->rxtq, ath5k_tasklet_rx);
+	tasklet_setup(&ah->txtq, ath5k_tasklet_tx);
+	tasklet_setup(&ah->beacontq, ath5k_tasklet_beacon);
+	tasklet_setup(&ah->ani_tasklet, ath5k_tasklet_ani);
 
 	INIT_WORK(&ah->reset_work, ath5k_reset_work);
 	INIT_WORK(&ah->calib_work, ath5k_calibrate_work);
diff --git a/drivers/net/wireless/ath/ath5k/rfkill.c b/drivers/net/wireless/ath/ath5k/rfkill.c
index 270a319f3aeb..855ed7fc720d 100644
--- a/drivers/net/wireless/ath/ath5k/rfkill.c
+++ b/drivers/net/wireless/ath/ath5k/rfkill.c
@@ -73,9 +73,9 @@ ath5k_is_rfkill_set(struct ath5k_hw *ah)
 }
 
 static void
-ath5k_tasklet_rfkill_toggle(unsigned long data)
+ath5k_tasklet_rfkill_toggle(struct tasklet_struct *t)
 {
-	struct ath5k_hw *ah = (void *)data;
+	struct ath5k_hw *ah = from_tasklet(ah, t, rf_kill.toggleq);
 	bool blocked;
 
 	blocked = ath5k_is_rfkill_set(ah);
@@ -90,8 +90,7 @@ ath5k_rfkill_hw_start(struct ath5k_hw *ah)
 	ah->rf_kill.gpio = ah->ah_capabilities.cap_eeprom.ee_rfkill_pin;
 	ah->rf_kill.polarity = ah->ah_capabilities.cap_eeprom.ee_rfkill_pol;
 
-	tasklet_init(&ah->rf_kill.toggleq, ath5k_tasklet_rfkill_toggle,
-		(unsigned long)ah);
+	tasklet_setup(&ah->rf_kill.toggleq, ath5k_tasklet_rfkill_toggle);
 
 	ath5k_rfkill_disable(ah);
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
