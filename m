Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Allen Pais <allen.lkml@gmail.com>
Subject: [PATCH v2 3/3] ath11k: convert tasklets to use new tasklet_setup() API
Date: Wed,  7 Oct 2020 16:03:09 +0530
Message-Id: <20201007103309.363737-4-allen.lkml@gmail.com>
In-Reply-To: <20201007103309.363737-1-allen.lkml@gmail.com>
References: <20201007103309.363737-1-allen.lkml@gmail.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@codeaurora.org
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com, kuba@kernel.org, Romain Perier <romain.perier@gmail.com>, Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index d7eb6b716..b75f47dc3 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -380,9 +380,9 @@ static void ath11k_pci_sync_ce_irqs(struct ath11k_base *ab)
 	}
 }
 
-static void ath11k_pci_ce_tasklet(unsigned long data)
+static void ath11k_pci_ce_tasklet(struct tasklet_struct *t)
 {
-	struct ath11k_ce_pipe *ce_pipe = (struct ath11k_ce_pipe *)data;
+	struct ath11k_ce_pipe *ce_pipe = from_tasklet(ce_pipe, t, intr_tq);
 
 	ath11k_ce_per_engine_service(ce_pipe->ab, ce_pipe->pipe_num);
 
@@ -581,8 +581,7 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 
 		irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + i;
 
-		tasklet_init(&ce_pipe->intr_tq, ath11k_pci_ce_tasklet,
-			     (unsigned long)ce_pipe);
+		tasklet_setup(&ce_pipe->intr_tq, ath11k_pci_ce_tasklet);
 
 		ret = request_irq(irq, ath11k_pci_ce_interrupt_handler,
 				  IRQF_SHARED, irq_name[irq_idx],
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
