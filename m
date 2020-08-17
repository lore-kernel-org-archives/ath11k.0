Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 16/16] wireless: zydas: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:37 +0530
Message-Id: <20200817090637.26887-17-allen.cryptic@gmail.com>
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
and remove .data fieldd

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/wireless/zydas/zd1211rw/zd_usb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/zydas/zd1211rw/zd_usb.c b/drivers/net/wireless/zydas/zd1211rw/zd_usb.c
index 65b5985ad402..8b3d248bac6e 100644
--- a/drivers/net/wireless/zydas/zd1211rw/zd_usb.c
+++ b/drivers/net/wireless/zydas/zd1211rw/zd_usb.c
@@ -1140,9 +1140,9 @@ static void zd_rx_idle_timer_handler(struct work_struct *work)
 	zd_usb_reset_rx(usb);
 }
 
-static void zd_usb_reset_rx_idle_timer_tasklet(unsigned long param)
+static void zd_usb_reset_rx_idle_timer_tasklet(struct tasklet_struct *t)
 {
-	struct zd_usb *usb = (struct zd_usb *)param;
+	struct zd_usb *usb = from_tasklet(usb, t, rx.reset_timer_tasklet);
 
 	zd_usb_reset_rx_idle_timer(usb);
 }
@@ -1178,8 +1178,8 @@ static inline void init_usb_rx(struct zd_usb *usb)
 	}
 	ZD_ASSERT(rx->fragment_length == 0);
 	INIT_DELAYED_WORK(&rx->idle_work, zd_rx_idle_timer_handler);
-	rx->reset_timer_tasklet.func = zd_usb_reset_rx_idle_timer_tasklet;
-	rx->reset_timer_tasklet.data = (unsigned long)usb;
+	rx->reset_timer_tasklet.func = (void (*)(unsigned long))
+					zd_usb_reset_rx_idle_timer_tasklet;
 }
 
 static inline void init_usb_tx(struct zd_usb *usb)
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
