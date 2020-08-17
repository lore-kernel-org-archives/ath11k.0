Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 12/16] wireless: mediatek: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:33 +0530
Message-Id: <20200817090637.26887-13-allen.cryptic@gmail.com>
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
 drivers/net/wireless/mediatek/mt76/mac80211.c      |  2 +-
 drivers/net/wireless/mediatek/mt76/mt76.h          |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   |  6 +++---
 drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c   | 10 +++++-----
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  | 14 ++++++--------
 drivers/net/wireless/mediatek/mt76/tx.c            |  4 ++--
 drivers/net/wireless/mediatek/mt76/usb.c           | 12 ++++++------
 drivers/net/wireless/mediatek/mt7601u/dma.c        | 12 ++++++------
 11 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 3d4bf72700a5..1f62f069a0dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -439,7 +439,7 @@ mt76_alloc_device(struct device *pdev, unsigned int size,
 	for (i = 0; i < ARRAY_SIZE(dev->q_rx); i++)
 		skb_queue_head_init(&dev->rx_skb[i]);
 
-	tasklet_init(&dev->tx_tasklet, mt76_tx_tasklet, (unsigned long)dev);
+	tasklet_setup(&dev->tx_tasklet, mt76_tx_tasklet);
 
 	dev->wq = alloc_ordered_workqueue("mt76", 0);
 	if (!dev->wq) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index af35bc388ae2..1ab52fc37a1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -899,7 +899,7 @@ void mt76_stop_tx_queues(struct mt76_dev *dev, struct ieee80211_sta *sta,
 			 bool send_bar);
 void mt76_txq_schedule(struct mt76_phy *phy, enum mt76_txq_id qid);
 void mt76_txq_schedule_all(struct mt76_phy *phy);
-void mt76_tx_tasklet(unsigned long data);
+void mt76_tx_tasklet(struct tasklet_struct *t);
 void mt76_release_buffered_frames(struct ieee80211_hw *hw,
 				  struct ieee80211_sta *sta,
 				  u16 tids, int nframes,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
index 7a41cdf1c4ae..ab6771c6d2a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
@@ -64,9 +64,9 @@ mt7603_add_buffered_bc(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	data->count[mvif->idx]++;
 }
 
-void mt7603_pre_tbtt_tasklet(unsigned long arg)
+void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 {
-	struct mt7603_dev *dev = (struct mt7603_dev *)arg;
+	struct mt7603_dev *dev = from_tasklet(dev, t, mt76.pre_tbtt_tasklet);
 	struct mt76_queue *q;
 	struct beacon_bc_data data = {};
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index 94196599797e..a5aaa790692a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -533,8 +533,7 @@ int mt7603_register_device(struct mt7603_dev *dev)
 	spin_lock_init(&dev->ps_lock);
 
 	INIT_DELAYED_WORK(&dev->mt76.mac_work, mt7603_mac_work);
-	tasklet_init(&dev->mt76.pre_tbtt_tasklet, mt7603_pre_tbtt_tasklet,
-		     (unsigned long)dev);
+	tasklet_setup(&dev->mt76.pre_tbtt_tasklet, mt7603_pre_tbtt_tasklet);
 
 	/* Check for 7688, which only has 1SS */
 	dev->mphy.antenna_mask = 3;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index c86305241e66..582d356382ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -255,7 +255,7 @@ void mt7603_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 void mt7603_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta);
 
-void mt7603_pre_tbtt_tasklet(unsigned long arg);
+void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t);
 
 void mt7603_update_channel(struct mt76_dev *mdev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
index 133f93a6ed1b..c081a1c0449c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
@@ -98,9 +98,9 @@ static irqreturn_t mt7615_irq_handler(int irq, void *dev_instance)
 	return IRQ_HANDLED;
 }
 
-static void mt7615_irq_tasklet(unsigned long data)
+static void mt7615_irq_tasklet(struct tasklet_struct *t)
 {
-	struct mt7615_dev *dev = (struct mt7615_dev *)data;
+	struct mt7615_dev *dev = from_tasklet(dev, t, irq_tasklet);
 	u32 intr, mask = 0;
 
 	mt76_wr(dev, MT_INT_MASK_CSR, 0);
@@ -206,7 +206,7 @@ int mt7615_mmio_probe(struct device *pdev, void __iomem *mem_base,
 
 	dev = container_of(mdev, struct mt7615_dev, mt76);
 	mt76_mmio_init(&dev->mt76, mem_base);
-	tasklet_init(&dev->irq_tasklet, mt7615_irq_tasklet, (unsigned long)dev);
+	tasklet_setup(&dev->irq_tasklet, mt7615_irq_tasklet);
 
 	dev->reg_map = map;
 	dev->ops = ops;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c b/drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c
index ff6a9e4daac0..d45c5bcda72f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c
@@ -609,10 +609,11 @@ static void mt76x02_dfs_check_event_window(struct mt76x02_dev *dev)
 	}
 }
 
-static void mt76x02_dfs_tasklet(unsigned long arg)
+static void mt76x02_dfs_tasklet(struct tasklet_struct *t)
 {
-	struct mt76x02_dev *dev = (struct mt76x02_dev *)arg;
-	struct mt76x02_dfs_pattern_detector *dfs_pd = &dev->dfs_pd;
+	struct mt76x02_dfs_pattern_detector *dfs_pd = from_tasklet(dfs_pd, t,
+								   dfs_tasklet);
+	struct mt76x02_dev *dev = container_of(dfs_pd, typeof(*dev), dfs_pd);
 	u32 engine_mask;
 	int i;
 
@@ -860,8 +861,7 @@ void mt76x02_dfs_init_detector(struct mt76x02_dev *dev)
 	INIT_LIST_HEAD(&dfs_pd->seq_pool);
 	dev->mt76.region = NL80211_DFS_UNSET;
 	dfs_pd->last_sw_check = jiffies;
-	tasklet_init(&dfs_pd->dfs_tasklet, mt76x02_dfs_tasklet,
-		     (unsigned long)dev);
+	tasklet_setup(&dfs_pd->dfs_tasklet, mt76x02_dfs_tasklet);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index bacb1f10a699..5a3db4edc265 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -11,9 +11,9 @@
 #include "mt76x02_mcu.h"
 #include "trace.h"
 
-static void mt76x02_pre_tbtt_tasklet(unsigned long arg)
+static void mt76x02_pre_tbtt_tasklet(struct tasklet_struct *t)
 {
-	struct mt76x02_dev *dev = (struct mt76x02_dev *)arg;
+	struct mt76x02_dev *dev = from_tasklet(dev, t, mt76.pre_tbtt_tasklet);
 	struct mt76_queue *q = dev->mt76.q_tx[MT_TXQ_PSD].q;
 	struct beacon_bc_data data = {};
 	struct sk_buff *skb;
@@ -151,9 +151,9 @@ static void mt76x02_process_tx_status_fifo(struct mt76x02_dev *dev)
 		mt76x02_send_tx_status(dev, &stat, &update);
 }
 
-static void mt76x02_tx_tasklet(unsigned long data)
+static void mt76x02_tx_tasklet(struct tasklet_struct *t)
 {
-	struct mt76x02_dev *dev = (struct mt76x02_dev *)data;
+	struct mt76x02_dev *dev = from_tasklet(dev, t, mt76.tx_tasklet);
 
 	mt76x02_mac_poll_tx_status(dev, false);
 	mt76x02_process_tx_status_fifo(dev);
@@ -197,10 +197,8 @@ int mt76x02_dma_init(struct mt76x02_dev *dev)
 	if (!status_fifo)
 		return -ENOMEM;
 
-	tasklet_init(&dev->mt76.tx_tasklet, mt76x02_tx_tasklet,
-		     (unsigned long)dev);
-	tasklet_init(&dev->mt76.pre_tbtt_tasklet, mt76x02_pre_tbtt_tasklet,
-		     (unsigned long)dev);
+	tasklet_setup(&dev->mt76.tx_tasklet, mt76x02_tx_tasklet);
+	tasklet_setup(&dev->mt76.pre_tbtt_tasklet, mt76x02_pre_tbtt_tasklet);
 
 	spin_lock_init(&dev->txstatus_fifo_lock);
 	kfifo_init(&dev->txstatus_fifo, status_fifo, fifo_size);
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 3afd89ecd6c9..89d99755cf6c 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -585,9 +585,9 @@ void mt76_txq_schedule_all(struct mt76_phy *phy)
 }
 EXPORT_SYMBOL_GPL(mt76_txq_schedule_all);
 
-void mt76_tx_tasklet(unsigned long data)
+void mt76_tx_tasklet(struct tasklet_struct *t)
 {
-	struct mt76_dev *dev = (struct mt76_dev *)data;
+	struct mt76_dev *dev = from_tasklet(dev, t, tx_tasklet);
 
 	mt76_txq_schedule_all(&dev->phy);
 	if (dev->phy2)
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index dcab5993763a..fa63753976c9 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -669,9 +669,9 @@ mt76u_process_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		mt76_rx_poll_complete(dev, MT_RXQ_MAIN, NULL);
 }
 
-static void mt76u_rx_tasklet(unsigned long data)
+static void mt76u_rx_tasklet(struct tasklet_struct *t)
 {
-	struct mt76_dev *dev = (struct mt76_dev *)data;
+	struct mt76_dev *dev = from_tasklet(dev, t, usb.rx_tasklet);
 	int i;
 
 	rcu_read_lock();
@@ -792,9 +792,9 @@ int mt76u_resume_rx(struct mt76_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt76u_resume_rx);
 
-static void mt76u_tx_tasklet(unsigned long data)
+static void mt76u_tx_tasklet(struct tasklet_struct *t)
 {
-	struct mt76_dev *dev = (struct mt76_dev *)data;
+	struct mt76_dev *dev = from_tasklet(dev, t, tx_tasklet);
 	struct mt76_queue_entry entry;
 	struct mt76_sw_queue *sq;
 	struct mt76_queue *q;
@@ -1133,8 +1133,8 @@ int mt76u_init(struct mt76_dev *dev,
 	mt76u_ops.rmw = ext ? mt76u_rmw_ext : mt76u_rmw;
 	mt76u_ops.write_copy = ext ? mt76u_copy_ext : mt76u_copy;
 
-	tasklet_init(&usb->rx_tasklet, mt76u_rx_tasklet, (unsigned long)dev);
-	tasklet_init(&dev->tx_tasklet, mt76u_tx_tasklet, (unsigned long)dev);
+	tasklet_setup(&usb->rx_tasklet, mt76u_rx_tasklet);
+	tasklet_setup(&dev->tx_tasklet, mt76u_tx_tasklet);
 	INIT_WORK(&usb->stat_work, mt76u_tx_status_data);
 
 	usb->data_len = usb_maxpacket(udev, usb_sndctrlpipe(udev, 0), 1);
diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c b/drivers/net/wireless/mediatek/mt7601u/dma.c
index f6a0454abe04..abeffeb388b7 100644
--- a/drivers/net/wireless/mediatek/mt7601u/dma.c
+++ b/drivers/net/wireless/mediatek/mt7601u/dma.c
@@ -212,9 +212,9 @@ static void mt7601u_complete_rx(struct urb *urb)
 	spin_unlock_irqrestore(&dev->rx_lock, flags);
 }
 
-static void mt7601u_rx_tasklet(unsigned long data)
+static void mt7601u_rx_tasklet(struct tasklet_struct *t)
 {
-	struct mt7601u_dev *dev = (struct mt7601u_dev *) data;
+	struct mt7601u_dev *dev = from_tasklet(dev, t, rx_tasklet);
 	struct mt7601u_dma_buf_rx *e;
 
 	while ((e = mt7601u_rx_get_pending_entry(dev))) {
@@ -266,9 +266,9 @@ static void mt7601u_complete_tx(struct urb *urb)
 	spin_unlock_irqrestore(&dev->tx_lock, flags);
 }
 
-static void mt7601u_tx_tasklet(unsigned long data)
+static void mt7601u_tx_tasklet(struct tasklet_struct *t)
 {
-	struct mt7601u_dev *dev = (struct mt7601u_dev *) data;
+	struct mt7601u_dev *dev = from_tasklet(dev, t, tx_tasklet);
 	struct sk_buff_head skbs;
 	unsigned long flags;
 
@@ -507,8 +507,8 @@ int mt7601u_dma_init(struct mt7601u_dev *dev)
 {
 	int ret = -ENOMEM;
 
-	tasklet_init(&dev->tx_tasklet, mt7601u_tx_tasklet, (unsigned long) dev);
-	tasklet_init(&dev->rx_tasklet, mt7601u_rx_tasklet, (unsigned long) dev);
+	tasklet_setup(&dev->tx_tasklet, mt7601u_tx_tasklet);
+	tasklet_setup(&dev->rx_tasklet, mt7601u_rx_tasklet);
 
 	ret = mt7601u_alloc_tx(dev);
 	if (ret)
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
