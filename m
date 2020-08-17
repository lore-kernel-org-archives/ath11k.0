Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 03/16] wireless: ath: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:24 +0530
Message-Id: <20200817090637.26887-4-allen.cryptic@gmail.com>
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
 drivers/net/wireless/ath/carl9170/usb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/carl9170/usb.c b/drivers/net/wireless/ath/carl9170/usb.c
index ead79335823a..e4eb666c6eea 100644
--- a/drivers/net/wireless/ath/carl9170/usb.c
+++ b/drivers/net/wireless/ath/carl9170/usb.c
@@ -377,9 +377,9 @@ void carl9170_usb_handle_tx_err(struct ar9170 *ar)
 	}
 }
 
-static void carl9170_usb_tasklet(unsigned long data)
+static void carl9170_usb_tasklet(struct tasklet_struct *t)
 {
-	struct ar9170 *ar = (struct ar9170 *) data;
+	struct ar9170 *ar = from_tasklet(ar, t, usb_tasklet);
 
 	if (!IS_INITIALIZED(ar))
 		return;
@@ -1082,8 +1082,7 @@ static int carl9170_usb_probe(struct usb_interface *intf,
 	init_completion(&ar->cmd_wait);
 	init_completion(&ar->fw_boot_wait);
 	init_completion(&ar->fw_load_wait);
-	tasklet_init(&ar->usb_tasklet, carl9170_usb_tasklet,
-		     (unsigned long)ar);
+	tasklet_setup(&ar->usb_tasklet, carl9170_usb_tasklet);
 
 	atomic_set(&ar->tx_cmd_urbs, 0);
 	atomic_set(&ar->tx_anch_urbs, 0);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
