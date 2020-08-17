Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 11/16] wireless: marvell: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:32 +0530
Message-Id: <20200817090637.26887-12-allen.cryptic@gmail.com>
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
 drivers/net/wireless/marvell/mwl8k.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwl8k.c b/drivers/net/wireless/marvell/mwl8k.c
index 97f23f93f6e7..23efd7075df6 100644
--- a/drivers/net/wireless/marvell/mwl8k.c
+++ b/drivers/net/wireless/marvell/mwl8k.c
@@ -4630,10 +4630,10 @@ static irqreturn_t mwl8k_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void mwl8k_tx_poll(unsigned long data)
+static void mwl8k_tx_poll(struct tasklet_struct *t)
 {
-	struct ieee80211_hw *hw = (struct ieee80211_hw *)data;
-	struct mwl8k_priv *priv = hw->priv;
+	struct mwl8k_priv *priv = from_tasklet(priv, t, poll_tx_task);
+	struct ieee80211_hw *hw = pci_get_drvdata(priv->pdev);
 	int limit;
 	int i;
 
@@ -4659,10 +4659,10 @@ static void mwl8k_tx_poll(unsigned long data)
 	}
 }
 
-static void mwl8k_rx_poll(unsigned long data)
+static void mwl8k_rx_poll(struct tasklet_struct *t)
 {
-	struct ieee80211_hw *hw = (struct ieee80211_hw *)data;
-	struct mwl8k_priv *priv = hw->priv;
+	struct mwl8k_priv *priv = from_tasklet(priv, t, poll_rx_task);
+	struct ieee80211_hw *hw = pci_get_drvdata(priv->pdev);
 	int limit;
 
 	limit = 32;
@@ -6120,9 +6120,9 @@ static int mwl8k_firmware_load_success(struct mwl8k_priv *priv)
 	INIT_WORK(&priv->fw_reload, mwl8k_hw_restart_work);
 
 	/* TX reclaim and RX tasklets.  */
-	tasklet_init(&priv->poll_tx_task, mwl8k_tx_poll, (unsigned long)hw);
+	tasklet_setup(&priv->poll_tx_task, mwl8k_tx_poll);
 	tasklet_disable(&priv->poll_tx_task);
-	tasklet_init(&priv->poll_rx_task, mwl8k_rx_poll, (unsigned long)hw);
+	tasklet_setup(&priv->poll_rx_task, mwl8k_rx_poll);
 	tasklet_disable(&priv->poll_rx_task);
 
 	/* Power management cookie */
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
