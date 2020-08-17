Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 13/16] wireless: quantenna: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:34 +0530
Message-Id: <20200817090637.26887-14-allen.cryptic@gmail.com>
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
 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c | 7 +++----
 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
index eb67b66b846b..9a20c0f29078 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
@@ -1091,9 +1091,9 @@ static void qtnf_pearl_fw_work_handler(struct work_struct *work)
 	put_device(&pdev->dev);
 }
 
-static void qtnf_pearl_reclaim_tasklet_fn(unsigned long data)
+static void qtnf_pearl_reclaim_tasklet_fn(struct tasklet_struct *t)
 {
-	struct qtnf_pcie_pearl_state *ps = (void *)data;
+	struct qtnf_pcie_pearl_state *ps = from_tasklet(ps, t, base.reclaim_tq);
 
 	qtnf_pearl_data_tx_reclaim(ps);
 	qtnf_en_txdone_irq(ps);
@@ -1145,8 +1145,7 @@ static int qtnf_pcie_pearl_probe(struct qtnf_bus *bus, unsigned int tx_bd_size,
 		return ret;
 	}
 
-	tasklet_init(&ps->base.reclaim_tq, qtnf_pearl_reclaim_tasklet_fn,
-		     (unsigned long)ps);
+	tasklet_setup(&ps->base.reclaim_tq, qtnf_pearl_reclaim_tasklet_fn);
 	netif_napi_add(&bus->mux_dev, &bus->mux_napi,
 		       qtnf_pcie_pearl_rx_poll, 10);
 
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
index d1b850aa4657..4b87d3151017 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
@@ -1105,9 +1105,9 @@ static void qtnf_topaz_fw_work_handler(struct work_struct *work)
 	put_device(&pdev->dev);
 }
 
-static void qtnf_reclaim_tasklet_fn(unsigned long data)
+static void qtnf_reclaim_tasklet_fn(struct tasklet_struct *t)
 {
-	struct qtnf_pcie_topaz_state *ts = (void *)data;
+	struct qtnf_pcie_topaz_state *ts = from_tasklet(ts, t, base.reclaim_tq);
 
 	qtnf_topaz_data_tx_reclaim(ts);
 }
@@ -1158,8 +1158,7 @@ static int qtnf_pcie_topaz_probe(struct qtnf_bus *bus,
 		return ret;
 	}
 
-	tasklet_init(&ts->base.reclaim_tq, qtnf_reclaim_tasklet_fn,
-		     (unsigned long)ts);
+	tasklet_setup(&ts->base.reclaim_tq, qtnf_reclaim_tasklet_fn);
 	netif_napi_add(&bus->mux_dev, &bus->mux_napi,
 		       qtnf_topaz_rx_poll, 10);
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
