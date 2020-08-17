Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 15/16] wireless: realtek: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:36 +0530
Message-Id: <20200817090637.26887-16-allen.cryptic@gmail.com>
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
and from_tasklet() to pass the tasklet pointer explicitly
and remove .data field.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/pci.c | 21 ++++++++++-----------
 drivers/net/wireless/realtek/rtlwifi/usb.c |  9 ++++-----
 drivers/net/wireless/realtek/rtw88/main.c  |  3 +--
 drivers/net/wireless/realtek/rtw88/tx.c    |  4 ++--
 drivers/net/wireless/realtek/rtw88/tx.h    |  2 +-
 5 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/pci.c b/drivers/net/wireless/realtek/rtlwifi/pci.c
index 25335bd2873b..42099369fa35 100644
--- a/drivers/net/wireless/realtek/rtlwifi/pci.c
+++ b/drivers/net/wireless/realtek/rtlwifi/pci.c
@@ -1061,16 +1061,18 @@ static irqreturn_t _rtl_pci_interrupt(int irq, void *dev_id)
 	return ret;
 }
 
-static void _rtl_pci_irq_tasklet(unsigned long data)
+static void _rtl_pci_irq_tasklet(struct tasklet_struct *t)
 {
-	struct ieee80211_hw *hw = (struct ieee80211_hw *)data;
+	struct rtl_priv *rtlpriv = from_tasklet(rtlpriv, t, works.irq_tasklet);
+	struct ieee80211_hw *hw = rtlpriv->hw;
 	_rtl_pci_tx_chk_waitq(hw);
 }
 
-static void _rtl_pci_prepare_bcn_tasklet(unsigned long data)
+static void _rtl_pci_prepare_bcn_tasklet(struct tasklet_struct *t)
 {
-	struct ieee80211_hw *hw = (struct ieee80211_hw *)data;
-	struct rtl_priv *rtlpriv = rtl_priv(hw);
+	struct rtl_priv *rtlpriv = from_tasklet(rtlpriv, t,
+						works.irq_prepare_bcn_tasklet);
+	struct ieee80211_hw *hw = rtlpriv->hw;
 	struct rtl_pci *rtlpci = rtl_pcidev(rtl_pcipriv(hw));
 	struct rtl_mac *mac = rtl_mac(rtl_priv(hw));
 	struct rtl8192_tx_ring *ring = NULL;
@@ -1194,12 +1196,9 @@ static void _rtl_pci_init_struct(struct ieee80211_hw *hw,
 	rtlpci->acm_method = EACMWAY2_SW;
 
 	/*task */
-	tasklet_init(&rtlpriv->works.irq_tasklet,
-		     _rtl_pci_irq_tasklet,
-		     (unsigned long)hw);
-	tasklet_init(&rtlpriv->works.irq_prepare_bcn_tasklet,
-		     _rtl_pci_prepare_bcn_tasklet,
-		     (unsigned long)hw);
+	tasklet_setup(&rtlpriv->works.irq_tasklet, _rtl_pci_irq_tasklet);
+	tasklet_setup(&rtlpriv->works.irq_prepare_bcn_tasklet,
+		     _rtl_pci_prepare_bcn_tasklet);
 	INIT_WORK(&rtlpriv->works.lps_change_work,
 		  rtl_lps_change_work_callback);
 }
diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index d05e709536ea..8740818e8d87 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.c
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.c
@@ -289,7 +289,7 @@ static int _rtl_usb_init_tx(struct ieee80211_hw *hw)
 	return 0;
 }
 
-static void _rtl_rx_work(unsigned long param);
+static void _rtl_rx_work(struct tasklet_struct *t);
 
 static int _rtl_usb_init_rx(struct ieee80211_hw *hw)
 {
@@ -310,8 +310,7 @@ static int _rtl_usb_init_rx(struct ieee80211_hw *hw)
 	init_usb_anchor(&rtlusb->rx_cleanup_urbs);
 
 	skb_queue_head_init(&rtlusb->rx_queue);
-	rtlusb->rx_work_tasklet.func = _rtl_rx_work;
-	rtlusb->rx_work_tasklet.data = (unsigned long)rtlusb;
+	rtlusb->rx_work_tasklet.func = (void(*)(unsigned long))_rtl_rx_work;
 
 	return 0;
 }
@@ -528,9 +527,9 @@ static void _rtl_rx_pre_process(struct ieee80211_hw *hw, struct sk_buff *skb)
 
 #define __RX_SKB_MAX_QUEUED	64
 
-static void _rtl_rx_work(unsigned long param)
+static void _rtl_rx_work(struct tasklet_struct *t)
 {
-	struct rtl_usb *rtlusb = (struct rtl_usb *)param;
+	struct rtl_usb *rtlusb = from_tasklet(rtlusb, t, rx_work_tasklet);
 	struct ieee80211_hw *hw = usb_get_intfdata(rtlusb->intf);
 	struct sk_buff *skb;
 
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 54044abf30d7..6719c687a322 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1422,8 +1422,7 @@ int rtw_core_init(struct rtw_dev *rtwdev)
 
 	timer_setup(&rtwdev->tx_report.purge_timer,
 		    rtw_tx_report_purge_timer, 0);
-	tasklet_init(&rtwdev->tx_tasklet, rtw_tx_tasklet,
-		     (unsigned long)rtwdev);
+	tasklet_setup(&rtwdev->tx_tasklet, rtw_tx_tasklet);
 
 	INIT_DELAYED_WORK(&rtwdev->watch_dog_work, rtw_watch_dog_work);
 	INIT_DELAYED_WORK(&coex->bt_relink_work, rtw_coex_bt_relink_work);
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index 7fcc992b01a8..ca8072177ae3 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -587,9 +587,9 @@ static void rtw_txq_push(struct rtw_dev *rtwdev,
 	rcu_read_unlock();
 }
 
-void rtw_tx_tasklet(unsigned long data)
+void rtw_tx_tasklet(struct tasklet_struct *t)
 {
-	struct rtw_dev *rtwdev = (void *)data;
+	struct rtw_dev *rtwdev = from_tasklet(rtwdev, t, tx_tasklet);
 	struct rtw_txq *rtwtxq, *tmp;
 
 	spin_lock_bh(&rtwdev->txq_lock);
diff --git a/drivers/net/wireless/realtek/rtw88/tx.h b/drivers/net/wireless/realtek/rtw88/tx.h
index cfe84eef5923..6673dbcaa21c 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.h
+++ b/drivers/net/wireless/realtek/rtw88/tx.h
@@ -94,7 +94,7 @@ void rtw_tx(struct rtw_dev *rtwdev,
 	    struct sk_buff *skb);
 void rtw_txq_init(struct rtw_dev *rtwdev, struct ieee80211_txq *txq);
 void rtw_txq_cleanup(struct rtw_dev *rtwdev, struct ieee80211_txq *txq);
-void rtw_tx_tasklet(unsigned long data);
+void rtw_tx_tasklet(struct tasklet_struct *t);
 void rtw_tx_pkt_info_update(struct rtw_dev *rtwdev,
 			    struct rtw_tx_pkt_info *pkt_info,
 			    struct ieee80211_sta *sta,
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
