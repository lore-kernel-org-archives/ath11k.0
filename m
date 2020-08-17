Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 02/16] wireless: ath9k: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:23 +0530
Message-Id: <20200817090637.26887-3-allen.cryptic@gmail.com>
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
 drivers/net/wireless/ath/ath9k/ath9k.h        | 4 ++--
 drivers/net/wireless/ath/ath9k/beacon.c       | 4 ++--
 drivers/net/wireless/ath/ath9k/htc.h          | 4 ++--
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 6 ++----
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c | 8 ++++----
 drivers/net/wireless/ath/ath9k/init.c         | 5 ++---
 drivers/net/wireless/ath/ath9k/main.c         | 4 ++--
 drivers/net/wireless/ath/ath9k/wmi.c          | 7 +++----
 drivers/net/wireless/ath/ath9k/wmi.h          | 2 +-
 9 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless/ath/ath9k/ath9k.h
index a412b352182c..e06b74a54a69 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k.h
+++ b/drivers/net/wireless/ath/ath9k/ath9k.h
@@ -713,7 +713,7 @@ struct ath_beacon {
 	bool tx_last;
 };
 
-void ath9k_beacon_tasklet(unsigned long data);
+void ath9k_beacon_tasklet(struct tasklet_struct *t);
 void ath9k_beacon_config(struct ath_softc *sc, struct ieee80211_vif *main_vif,
 			 bool beacons);
 void ath9k_beacon_assign_slot(struct ath_softc *sc, struct ieee80211_vif *vif);
@@ -1117,7 +1117,7 @@ static inline void ath_read_cachesize(struct ath_common *common, int *csz)
 	common->bus_ops->read_cachesize(common, csz);
 }
 
-void ath9k_tasklet(unsigned long data);
+void ath9k_tasklet(struct tasklet_struct *t);
 int ath_cabq_update(struct ath_softc *);
 u8 ath9k_parse_mpdudensity(u8 mpdudensity);
 irqreturn_t ath_isr(int irq, void *dev);
diff --git a/drivers/net/wireless/ath/ath9k/beacon.c b/drivers/net/wireless/ath/ath9k/beacon.c
index e36f947e19fc..4876bff2dc2c 100644
--- a/drivers/net/wireless/ath/ath9k/beacon.c
+++ b/drivers/net/wireless/ath/ath9k/beacon.c
@@ -385,9 +385,9 @@ void ath9k_csa_update(struct ath_softc *sc)
 						   ath9k_csa_update_vif, sc);
 }
 
-void ath9k_beacon_tasklet(unsigned long data)
+void ath9k_beacon_tasklet(struct tasklet_struct *t)
 {
-	struct ath_softc *sc = (struct ath_softc *)data;
+	struct ath_softc *sc = from_tasklet(sc, t, bcon_tasklet);
 	struct ath_hw *ah = sc->sc_ah;
 	struct ath_common *common = ath9k_hw_common(ah);
 	struct ath_buf *bf = NULL;
diff --git a/drivers/net/wireless/ath/ath9k/htc.h b/drivers/net/wireless/ath/ath9k/htc.h
index 9f64e32381f9..0a1634238e67 100644
--- a/drivers/net/wireless/ath/ath9k/htc.h
+++ b/drivers/net/wireless/ath/ath9k/htc.h
@@ -583,14 +583,14 @@ int ath9k_htc_tx_get_slot(struct ath9k_htc_priv *priv);
 void ath9k_htc_tx_clear_slot(struct ath9k_htc_priv *priv, int slot);
 void ath9k_htc_tx_drain(struct ath9k_htc_priv *priv);
 void ath9k_htc_txstatus(struct ath9k_htc_priv *priv, void *wmi_event);
-void ath9k_tx_failed_tasklet(unsigned long data);
+void ath9k_tx_failed_tasklet(struct tasklet_struct *t);
 void ath9k_htc_tx_cleanup_timer(struct timer_list *t);
 bool ath9k_htc_csa_is_finished(struct ath9k_htc_priv *priv);
 
 int ath9k_rx_init(struct ath9k_htc_priv *priv);
 void ath9k_rx_cleanup(struct ath9k_htc_priv *priv);
 void ath9k_host_rx_init(struct ath9k_htc_priv *priv);
-void ath9k_rx_tasklet(unsigned long data);
+void ath9k_rx_tasklet(struct tasklet_struct *t);
 u32 ath9k_htc_calcrxfilter(struct ath9k_htc_priv *priv);
 
 void ath9k_htc_ps_wakeup(struct ath9k_htc_priv *priv);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index 1d6ad8d46607..8136291791d6 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -645,10 +645,8 @@ static int ath9k_init_priv(struct ath9k_htc_priv *priv,
 	spin_lock_init(&priv->tx.tx_lock);
 	mutex_init(&priv->mutex);
 	mutex_init(&priv->htc_pm_lock);
-	tasklet_init(&priv->rx_tasklet, ath9k_rx_tasklet,
-		     (unsigned long)priv);
-	tasklet_init(&priv->tx_failed_tasklet, ath9k_tx_failed_tasklet,
-		     (unsigned long)priv);
+	tasklet_setup(&priv->rx_tasklet, ath9k_rx_tasklet);
+	tasklet_setup(&priv->tx_failed_tasklet, ath9k_tx_failed_tasklet);
 	INIT_DELAYED_WORK(&priv->ani_work, ath9k_htc_ani_work);
 	INIT_WORK(&priv->ps_work, ath9k_ps_work);
 	INIT_WORK(&priv->fatal_work, ath9k_fatal_work);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index b353995bdd45..bdfa22fdc867 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -570,9 +570,9 @@ void ath9k_htc_tx_drain(struct ath9k_htc_priv *priv)
 	spin_unlock_bh(&priv->tx.tx_lock);
 }
 
-void ath9k_tx_failed_tasklet(unsigned long data)
+void ath9k_tx_failed_tasklet(struct tasklet_struct *t)
 {
-	struct ath9k_htc_priv *priv = (struct ath9k_htc_priv *)data;
+	struct ath9k_htc_priv *priv = from_tasklet(priv, t, tx_failed_tasklet);
 
 	spin_lock(&priv->tx.tx_lock);
 	if (priv->tx.flags & ATH9K_HTC_OP_TX_DRAIN) {
@@ -1062,9 +1062,9 @@ static bool ath9k_rx_prepare(struct ath9k_htc_priv *priv,
 /*
  * FIXME: Handle FLUSH later on.
  */
-void ath9k_rx_tasklet(unsigned long data)
+void ath9k_rx_tasklet(struct tasklet_struct *t)
 {
-	struct ath9k_htc_priv *priv = (struct ath9k_htc_priv *)data;
+	struct ath9k_htc_priv *priv = from_tasklet(priv, t, rx_tasklet);
 	struct ath9k_htc_rxbuf *rxbuf = NULL, *tmp_buf = NULL;
 	struct ieee80211_rx_status rx_status;
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index 4d72cd7daaa2..42eefdfc58d1 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -728,9 +728,8 @@ static int ath9k_init_softc(u16 devid, struct ath_softc *sc,
 	spin_lock_init(&sc->sc_pm_lock);
 	spin_lock_init(&sc->chan_lock);
 	mutex_init(&sc->mutex);
-	tasklet_init(&sc->intr_tq, ath9k_tasklet, (unsigned long)sc);
-	tasklet_init(&sc->bcon_tasklet, ath9k_beacon_tasklet,
-		     (unsigned long)sc);
+	tasklet_setup(&sc->intr_tq, ath9k_tasklet);
+	tasklet_setup(&sc->bcon_tasklet, ath9k_beacon_tasklet);
 
 	timer_setup(&sc->sleep_timer, ath_ps_full_sleep, 0);
 	INIT_WORK(&sc->hw_reset_work, ath_reset_work);
diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index a47f6e978095..3d44552fb534 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -368,9 +368,9 @@ static void ath_node_detach(struct ath_softc *sc, struct ieee80211_sta *sta)
 	ath_dynack_node_deinit(sc->sc_ah, an);
 }
 
-void ath9k_tasklet(unsigned long data)
+void ath9k_tasklet(struct tasklet_struct *t)
 {
-	struct ath_softc *sc = (struct ath_softc *)data;
+	struct ath_softc *sc = from_tasklet(sc, t, intr_tq);
 	struct ath_hw *ah = sc->sc_ah;
 	struct ath_common *common = ath9k_hw_common(ah);
 	enum ath_reset_type type;
diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index e7a3127395be..fb82c0910d5d 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.c
+++ b/drivers/net/wireless/ath/ath9k/wmi.c
@@ -106,8 +106,7 @@ struct wmi *ath9k_init_wmi(struct ath9k_htc_priv *priv)
 	mutex_init(&wmi->multi_rmw_mutex);
 	init_completion(&wmi->cmd_wait);
 	INIT_LIST_HEAD(&wmi->pending_tx_events);
-	tasklet_init(&wmi->wmi_event_tasklet, ath9k_wmi_event_tasklet,
-		     (unsigned long)wmi);
+	tasklet_setup(&wmi->wmi_event_tasklet, ath9k_wmi_event_tasklet);
 
 	return wmi;
 }
@@ -136,9 +135,9 @@ void ath9k_wmi_event_drain(struct ath9k_htc_priv *priv)
 	spin_unlock_irqrestore(&priv->wmi->wmi_lock, flags);
 }
 
-void ath9k_wmi_event_tasklet(unsigned long data)
+void ath9k_wmi_event_tasklet(struct tasklet_struct *t)
 {
-	struct wmi *wmi = (struct wmi *)data;
+	struct wmi *wmi = from_tasklet(wmi, t, wmi_event_tasklet);
 	struct ath9k_htc_priv *priv = wmi->drv_priv;
 	struct wmi_cmd_hdr *hdr;
 	void *wmi_event;
diff --git a/drivers/net/wireless/ath/ath9k/wmi.h b/drivers/net/wireless/ath/ath9k/wmi.h
index d8b912206232..be1f126d0306 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.h
+++ b/drivers/net/wireless/ath/ath9k/wmi.h
@@ -185,7 +185,7 @@ int ath9k_wmi_cmd(struct wmi *wmi, enum wmi_cmd_id cmd_id,
 		  u8 *cmd_buf, u32 cmd_len,
 		  u8 *rsp_buf, u32 rsp_len,
 		  u32 timeout);
-void ath9k_wmi_event_tasklet(unsigned long data);
+void ath9k_wmi_event_tasklet(struct tasklet_struct *t);
 void ath9k_fatal_work(struct work_struct *work);
 void ath9k_wmi_event_drain(struct ath9k_htc_priv *priv);
 void ath9k_stop_wmi(struct ath9k_htc_priv *priv);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
