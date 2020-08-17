Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 09/16] wireless: iwlegacy: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:30 +0530
Message-Id: <20200817090637.26887-10-allen.cryptic@gmail.com>
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
 drivers/net/wireless/intel/iwlegacy/3945-mac.c | 8 +++-----
 drivers/net/wireless/intel/iwlegacy/4965-mac.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
index 9167c3d2711d..5fe98bbefc56 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -1374,9 +1374,9 @@ il3945_dump_nic_error_log(struct il_priv *il)
 }
 
 static void
-il3945_irq_tasklet(unsigned long data)
+il3945_irq_tasklet(struct tasklet_struct *t)
 {
-	struct il_priv *il = (struct il_priv *)data;
+	struct il_priv *il = from_tasklet(il, t, irq_tasklet);
 	u32 inta, handled = 0;
 	u32 inta_fh;
 	unsigned long flags;
@@ -3399,9 +3399,7 @@ il3945_setup_deferred_work(struct il_priv *il)
 
 	timer_setup(&il->watchdog, il_bg_watchdog, 0);
 
-	tasklet_init(&il->irq_tasklet,
-		     il3945_irq_tasklet,
-		     (unsigned long)il);
+	tasklet_setup(&il->irq_tasklet, il3945_irq_tasklet);
 }
 
 static void
diff --git a/drivers/net/wireless/intel/iwlegacy/4965-mac.c b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
index e73c223a7d28..afc54c63c4c6 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
@@ -4344,9 +4344,9 @@ il4965_synchronize_irq(struct il_priv *il)
 }
 
 static void
-il4965_irq_tasklet(unsigned long data)
+il4965_irq_tasklet(struct tasklet_struct *t)
 {
-	struct il_priv *il = (struct il_priv *)data;
+	struct il_priv *il = from_tasklet(il, t, irq_tasklet);
 	u32 inta, handled = 0;
 	u32 inta_fh;
 	unsigned long flags;
@@ -6238,9 +6238,7 @@ il4965_setup_deferred_work(struct il_priv *il)
 
 	timer_setup(&il->watchdog, il_bg_watchdog, 0);
 
-	tasklet_init(&il->irq_tasklet,
-		     il4965_irq_tasklet,
-		     (unsigned long)il);
+	tasklet_setup(&il->irq_tasklet, il4965_irq_tasklet);
 }
 
 static void
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
