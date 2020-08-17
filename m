Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 08/16] wireless: ipw2x00: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:29 +0530
Message-Id: <20200817090637.26887-9-allen.cryptic@gmail.com>
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
 drivers/net/wireless/intel/ipw2x00/ipw2100.c | 9 ++++-----
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 7 +++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2100.c b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
index 461e955aa259..b7fbfc77b612 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
@@ -3204,9 +3204,9 @@ static void ipw2100_tx_send_data(struct ipw2100_priv *priv)
 	}
 }
 
-static void ipw2100_irq_tasklet(unsigned long data)
+static void ipw2100_irq_tasklet(struct tasklet_struct *t)
 {
-	struct ipw2100_priv *priv = (struct ipw2100_priv *)data;
+	struct ipw2100_priv *priv = from_tasklet(priv, t, irq_tasklet);
 	struct net_device *dev = priv->net_dev;
 	unsigned long flags;
 	u32 inta, tmp;
@@ -6005,7 +6005,7 @@ static void ipw2100_rf_kill(struct work_struct *work)
 	spin_unlock_irqrestore(&priv->low_lock, flags);
 }
 
-static void ipw2100_irq_tasklet(unsigned long data);
+static void ipw2100_irq_tasklet(struct tasklet_struct *t);
 
 static const struct net_device_ops ipw2100_netdev_ops = {
 	.ndo_open		= ipw2100_open,
@@ -6135,8 +6135,7 @@ static struct net_device *ipw2100_alloc_device(struct pci_dev *pci_dev,
 	INIT_DELAYED_WORK(&priv->rf_kill, ipw2100_rf_kill);
 	INIT_DELAYED_WORK(&priv->scan_event, ipw2100_scan_event);
 
-	tasklet_init(&priv->irq_tasklet,
-		     ipw2100_irq_tasklet, (unsigned long)priv);
+	tasklet_setup(&priv->irq_tasklet, ipw2100_irq_tasklet);
 
 	/* NOTE:  We do not start the deferred work for status checks yet */
 	priv->stop_rf_kill = 1;
diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
index 129ef2f6248a..5af1c548a564 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -1945,9 +1945,9 @@ static void notify_wx_assoc_event(struct ipw_priv *priv)
 	wireless_send_event(priv->net_dev, SIOCGIWAP, &wrqu, NULL);
 }
 
-static void ipw_irq_tasklet(unsigned long data)
+static void ipw_irq_tasklet(struct tasklet_struct *t)
 {
-	struct ipw_priv *priv = (struct ipw_priv *)data;
+	struct ipw_priv *priv = from_tasklet(priv, t, irq_tasklet);
 	u32 inta, inta_mask, handled = 0;
 	unsigned long flags;
 	int rc = 0;
@@ -10673,8 +10673,7 @@ static void ipw_setup_deferred_work(struct ipw_priv *priv)
 	INIT_WORK(&priv->qos_activate, ipw_bg_qos_activate);
 #endif				/* CONFIG_IPW2200_QOS */
 
-	tasklet_init(&priv->irq_tasklet,
-		     ipw_irq_tasklet, (unsigned long)priv);
+	tasklet_setup(&priv->irq_tasklet, ipw_irq_tasklet);
 }
 
 static void shim__set_security(struct net_device *dev,
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
