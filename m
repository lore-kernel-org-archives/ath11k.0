Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.cryptic@gmail.com>
Subject: [PATCH 07/16] wireless: brcm80211: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:36:28 +0530
Message-Id: <20200817090637.26887-8-allen.cryptic@gmail.com>
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
 .../net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c  | 6 +++---
 .../net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index 648efcbc819f..521abe5ce5b8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -982,11 +982,11 @@ static const struct ieee80211_ops brcms_ops = {
 	.set_tim = brcms_ops_beacon_set_tim,
 };
 
-void brcms_dpc(unsigned long data)
+void brcms_dpc(struct tasklet_struct *t)
 {
 	struct brcms_info *wl;
 
-	wl = (struct brcms_info *) data;
+	wl = from_tasklet(wl, t, tasklet);
 
 	spin_lock_bh(&wl->lock);
 
@@ -1149,7 +1149,7 @@ static struct brcms_info *brcms_attach(struct bcma_device *pdev)
 	init_waitqueue_head(&wl->tx_flush_wq);
 
 	/* setup the bottom half handler */
-	tasklet_init(&wl->tasklet, brcms_dpc, (unsigned long) wl);
+	tasklet_setup(&wl->tasklet, brcms_dpc);
 
 	spin_lock_init(&wl->lock);
 	spin_lock_init(&wl->isr_lock);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
index 198053dfc310..eaf926a96a88 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
@@ -106,7 +106,7 @@ struct brcms_timer *brcms_init_timer(struct brcms_info *wl,
 void brcms_free_timer(struct brcms_timer *timer);
 void brcms_add_timer(struct brcms_timer *timer, uint ms, int periodic);
 bool brcms_del_timer(struct brcms_timer *timer);
-void brcms_dpc(unsigned long data);
+void brcms_dpc(struct tasklet_struct *t);
 void brcms_timer(struct brcms_timer *t);
 void brcms_fatal_error(struct brcms_info *wl);
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
