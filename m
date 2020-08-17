Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 14/16] wireless: ralink: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:35 +0530
Message-Id: <20200817090637.26887-15-allen.cryptic@gmail.com>
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
 .../net/wireless/ralink/rt2x00/rt2400pci.c    | 14 ++++++-----
 .../net/wireless/ralink/rt2x00/rt2500pci.c    | 14 ++++++-----
 .../net/wireless/ralink/rt2x00/rt2800mmio.c   | 24 +++++++++++--------
 .../net/wireless/ralink/rt2x00/rt2800mmio.h   | 10 ++++----
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   | 10 ++++----
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    |  5 ++--
 drivers/net/wireless/ralink/rt2x00/rt61pci.c  | 20 +++++++++-------
 7 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2400pci.c b/drivers/net/wireless/ralink/rt2x00/rt2400pci.c
index c1ac933349d1..687a4686f3ae 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2400pci.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2400pci.c
@@ -1319,9 +1319,10 @@ static inline void rt2400pci_enable_interrupt(struct rt2x00_dev *rt2x00dev,
 	spin_unlock_irq(&rt2x00dev->irqmask_lock);
 }
 
-static void rt2400pci_txstatus_tasklet(unsigned long data)
+static void rt2400pci_txstatus_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    txstatus_tasklet);
 	u32 reg;
 
 	/*
@@ -1347,17 +1348,18 @@ static void rt2400pci_txstatus_tasklet(unsigned long data)
 	}
 }
 
-static void rt2400pci_tbtt_tasklet(unsigned long data)
+static void rt2400pci_tbtt_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t, tbtt_tasklet);
 	rt2x00lib_beacondone(rt2x00dev);
 	if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
 		rt2400pci_enable_interrupt(rt2x00dev, CSR8_TBCN_EXPIRE);
 }
 
-static void rt2400pci_rxdone_tasklet(unsigned long data)
+static void rt2400pci_rxdone_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    rxdone_tasklet);
 	if (rt2x00mmio_rxdone(rt2x00dev))
 		tasklet_schedule(&rt2x00dev->rxdone_tasklet);
 	else if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2500pci.c b/drivers/net/wireless/ralink/rt2x00/rt2500pci.c
index 0859adebd860..ea06041f594a 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2500pci.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2500pci.c
@@ -1447,9 +1447,10 @@ static inline void rt2500pci_enable_interrupt(struct rt2x00_dev *rt2x00dev,
 	spin_unlock_irq(&rt2x00dev->irqmask_lock);
 }
 
-static void rt2500pci_txstatus_tasklet(unsigned long data)
+static void rt2500pci_txstatus_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    txstatus_tasklet);
 	u32 reg;
 
 	/*
@@ -1475,17 +1476,18 @@ static void rt2500pci_txstatus_tasklet(unsigned long data)
 	}
 }
 
-static void rt2500pci_tbtt_tasklet(unsigned long data)
+static void rt2500pci_tbtt_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t, tbtt_tasklet);
 	rt2x00lib_beacondone(rt2x00dev);
 	if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
 		rt2500pci_enable_interrupt(rt2x00dev, CSR8_TBCN_EXPIRE);
 }
 
-static void rt2500pci_rxdone_tasklet(unsigned long data)
+static void rt2500pci_rxdone_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    rxdone_tasklet);
 	if (rt2x00mmio_rxdone(rt2x00dev))
 		tasklet_schedule(&rt2x00dev->rxdone_tasklet);
 	else if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800mmio.c b/drivers/net/wireless/ralink/rt2x00/rt2800mmio.c
index 110bb391c372..d4fb3cc6d6a3 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800mmio.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800mmio.c
@@ -210,18 +210,19 @@ static inline void rt2800mmio_enable_interrupt(struct rt2x00_dev *rt2x00dev,
 	spin_unlock_irq(&rt2x00dev->irqmask_lock);
 }
 
-void rt2800mmio_pretbtt_tasklet(unsigned long data)
+void rt2800mmio_pretbtt_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    pretbtt_tasklet);
 	rt2x00lib_pretbtt(rt2x00dev);
 	if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
 		rt2800mmio_enable_interrupt(rt2x00dev, INT_MASK_CSR_PRE_TBTT);
 }
 EXPORT_SYMBOL_GPL(rt2800mmio_pretbtt_tasklet);
 
-void rt2800mmio_tbtt_tasklet(unsigned long data)
+void rt2800mmio_tbtt_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t, tbtt_tasklet);
 	struct rt2800_drv_data *drv_data = rt2x00dev->drv_data;
 	u32 reg;
 
@@ -254,9 +255,10 @@ void rt2800mmio_tbtt_tasklet(unsigned long data)
 }
 EXPORT_SYMBOL_GPL(rt2800mmio_tbtt_tasklet);
 
-void rt2800mmio_rxdone_tasklet(unsigned long data)
+void rt2800mmio_rxdone_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    rxdone_tasklet);
 	if (rt2x00mmio_rxdone(rt2x00dev))
 		tasklet_schedule(&rt2x00dev->rxdone_tasklet);
 	else if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
@@ -264,9 +266,10 @@ void rt2800mmio_rxdone_tasklet(unsigned long data)
 }
 EXPORT_SYMBOL_GPL(rt2800mmio_rxdone_tasklet);
 
-void rt2800mmio_autowake_tasklet(unsigned long data)
+void rt2800mmio_autowake_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    autowake_tasklet);
 	rt2800mmio_wakeup(rt2x00dev);
 	if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
 		rt2800mmio_enable_interrupt(rt2x00dev,
@@ -307,9 +310,10 @@ static void rt2800mmio_fetch_txstatus(struct rt2x00_dev *rt2x00dev)
 	spin_unlock_irqrestore(&rt2x00dev->irqmask_lock, flags);
 }
 
-void rt2800mmio_txstatus_tasklet(unsigned long data)
+void rt2800mmio_txstatus_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    txstatus_tasklet);
 
 	rt2800_txdone(rt2x00dev, 16);
 
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800mmio.h b/drivers/net/wireless/ralink/rt2x00/rt2800mmio.h
index adcd9d54ac1c..05708950f24d 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800mmio.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800mmio.h
@@ -126,11 +126,11 @@ void rt2800mmio_fill_rxdone(struct queue_entry *entry,
 			    struct rxdone_entry_desc *rxdesc);
 
 /* Interrupt functions */
-void rt2800mmio_txstatus_tasklet(unsigned long data);
-void rt2800mmio_pretbtt_tasklet(unsigned long data);
-void rt2800mmio_tbtt_tasklet(unsigned long data);
-void rt2800mmio_rxdone_tasklet(unsigned long data);
-void rt2800mmio_autowake_tasklet(unsigned long data);
+void rt2800mmio_txstatus_tasklet(struct tasklet_struct *t);
+void rt2800mmio_pretbtt_tasklet(struct tasklet_struct *t);
+void rt2800mmio_tbtt_tasklet(struct tasklet_struct *t);
+void rt2800mmio_rxdone_tasklet(struct tasklet_struct *t);
+void rt2800mmio_autowake_tasklet(struct tasklet_struct *t);
 irqreturn_t rt2800mmio_interrupt(int irq, void *dev_instance);
 void rt2800mmio_toggle_irq(struct rt2x00_dev *rt2x00dev,
 			   enum dev_state state);
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00.h b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
index ecc60d8cbb01..780be81863b6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
@@ -518,11 +518,11 @@ struct rt2x00lib_ops {
 	/*
 	 * TX status tasklet handler.
 	 */
-	void (*txstatus_tasklet) (unsigned long data);
-	void (*pretbtt_tasklet) (unsigned long data);
-	void (*tbtt_tasklet) (unsigned long data);
-	void (*rxdone_tasklet) (unsigned long data);
-	void (*autowake_tasklet) (unsigned long data);
+	void (*txstatus_tasklet) (struct tasklet_struct *t);
+	void (*pretbtt_tasklet) (struct tasklet_struct *t);
+	void (*tbtt_tasklet) (struct tasklet_struct *t);
+	void (*rxdone_tasklet) (struct tasklet_struct *t);
+	void (*autowake_tasklet) (struct tasklet_struct *t);
 
 	/*
 	 * Device init handlers.
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 8c6d3099b19d..b04f76551ca4 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -1167,9 +1167,8 @@ static int rt2x00lib_probe_hw(struct rt2x00_dev *rt2x00dev)
 	 */
 #define RT2X00_TASKLET_INIT(taskletname) \
 	if (rt2x00dev->ops->lib->taskletname) { \
-		tasklet_init(&rt2x00dev->taskletname, \
-			     rt2x00dev->ops->lib->taskletname, \
-			     (unsigned long)rt2x00dev); \
+		tasklet_setup(&rt2x00dev->taskletname, \
+			     rt2x00dev->ops->lib->taskletname); \
 	}
 
 	RT2X00_TASKLET_INIT(txstatus_tasklet);
diff --git a/drivers/net/wireless/ralink/rt2x00/rt61pci.c b/drivers/net/wireless/ralink/rt2x00/rt61pci.c
index eefce76fc99b..146675ee34c4 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt61pci.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt61pci.c
@@ -2190,34 +2190,38 @@ static void rt61pci_enable_mcu_interrupt(struct rt2x00_dev *rt2x00dev,
 	spin_unlock_irq(&rt2x00dev->irqmask_lock);
 }
 
-static void rt61pci_txstatus_tasklet(unsigned long data)
+static void rt61pci_txstatus_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    txstatus_tasklet);
+
 	rt61pci_txdone(rt2x00dev);
 	if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
 		rt61pci_enable_interrupt(rt2x00dev, INT_MASK_CSR_TXDONE);
 }
 
-static void rt61pci_tbtt_tasklet(unsigned long data)
+static void rt61pci_tbtt_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t, tbtt_tasklet);
 	rt2x00lib_beacondone(rt2x00dev);
 	if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
 		rt61pci_enable_interrupt(rt2x00dev, INT_MASK_CSR_BEACON_DONE);
 }
 
-static void rt61pci_rxdone_tasklet(unsigned long data)
+static void rt61pci_rxdone_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    rxdone_tasklet);
 	if (rt2x00mmio_rxdone(rt2x00dev))
 		tasklet_schedule(&rt2x00dev->rxdone_tasklet);
 	else if (test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
 		rt61pci_enable_interrupt(rt2x00dev, INT_MASK_CSR_RXDONE);
 }
 
-static void rt61pci_autowake_tasklet(unsigned long data)
+static void rt61pci_autowake_tasklet(struct tasklet_struct *t)
 {
-	struct rt2x00_dev *rt2x00dev = (struct rt2x00_dev *)data;
+	struct rt2x00_dev *rt2x00dev = from_tasklet(rt2x00dev, t,
+						    autowake_tasklet);
 	rt61pci_wakeup(rt2x00dev);
 	rt2x00mmio_register_write(rt2x00dev,
 				  M2H_CMD_DONE_CSR, 0xffffffff);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
