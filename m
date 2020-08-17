Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 05/16] wireless: atmel: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:26 +0530
Message-Id: <20200817090637.26887-6-allen.cryptic@gmail.com>
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
 drivers/net/wireless/atmel/at76c50x-usb.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/atmel/at76c50x-usb.c b/drivers/net/wireless/atmel/at76c50x-usb.c
index a63b5c2f1e17..365c2ee19d03 100644
--- a/drivers/net/wireless/atmel/at76c50x-usb.c
+++ b/drivers/net/wireless/atmel/at76c50x-usb.c
@@ -1199,7 +1199,6 @@ static void at76_rx_callback(struct urb *urb)
 {
 	struct at76_priv *priv = urb->context;
 
-	priv->rx_tasklet.data = (unsigned long)urb;
 	tasklet_schedule(&priv->rx_tasklet);
 }
 
@@ -1545,10 +1544,10 @@ static inline int at76_guess_freq(struct at76_priv *priv)
 	return ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
 }
 
-static void at76_rx_tasklet(unsigned long param)
+static void at76_rx_tasklet(struct tasklet_struct *t)
 {
-	struct urb *urb = (struct urb *)param;
-	struct at76_priv *priv = urb->context;
+	struct at76_priv *priv = from_tasklet(priv, t, rx_tasklet);
+	struct urb *urb = priv->rx_urb;
 	struct at76_rx_buffer *buf;
 	struct ieee80211_rx_status rx_status = { 0 };
 
@@ -2215,7 +2214,7 @@ static struct at76_priv *at76_alloc_new_device(struct usb_device *udev)
 	INIT_WORK(&priv->work_join_bssid, at76_work_join_bssid);
 	INIT_DELAYED_WORK(&priv->dwork_hw_scan, at76_dwork_hw_scan);
 
-	tasklet_init(&priv->rx_tasklet, at76_rx_tasklet, 0);
+	tasklet_setup(&priv->rx_tasklet, at76_rx_tasklet);
 
 	priv->pm_mode = AT76_PM_OFF;
 	priv->pm_period = 0;
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
