Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDvI2-0000iF-3t
 for ath11k@lists.infradead.org; Thu, 03 Sep 2020 19:52:58 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath11k:  Fix napi related hang
Date: Thu,  3 Sep 2020 12:52:54 -0700
Message-Id: <20200903195254.29379-1-greearb@candelatech.com>
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
To: ath11k@lists.infradead.org
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

Similar to the same bug in ath10k, a napi disable w/out it being enabled
will hang forever.  I believe I saw this while trying rmmod after driver
had some failure on startup.  Fix it by keeping state on whether napi is
enabled or not.

And, remove un-used napi pointer in ath10k driver base struct.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 12 +++++++++---
 drivers/net/wireless/ath/ath11k/core.h |  2 +-
 drivers/net/wireless/ath/ath11k/pci.c  | 12 +++++++++---
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 6380d48e013d7..e667f5f0a0686 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -411,8 +411,11 @@ static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 
 		ath11k_ahb_ext_grp_disable(irq_grp);
 
-		napi_synchronize(&irq_grp->napi);
-		napi_disable(&irq_grp->napi);
+		if (irq_grp->napi_enabled) {
+			napi_synchronize(&irq_grp->napi);
+			napi_disable(&irq_grp->napi);
+			irq_grp->napi_enabled = false;
+		}
 	}
 }
 
@@ -536,7 +539,10 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		napi_enable(&irq_grp->napi);
+		if (!irq_grp->napi_enabled) {
+			napi_enable(&irq_grp->napi);
+			irq_grp->napi_enabled = true;
+		}
 		ath11k_ahb_ext_grp_enable(irq_grp);
 	}
 }
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 858dfc700d54c..ac03c9c0f07ef 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -111,6 +111,7 @@ struct ath11k_ext_irq_grp {
 	u32 num_irq;
 	u32 grp_id;
 	u64 timestamp;
+	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device napi_ndev;
 };
@@ -674,7 +675,6 @@ struct ath11k_base {
 	u32 wlan_init_status;
 	int irq_num[ATH11K_IRQ_NUM_MAX];
 	struct ath11k_ext_irq_grp ext_irq_grp[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-	struct napi_struct *napi;
 	struct ath11k_targ_cap target_caps;
 	u32 ext_service_bitmap[WMI_SERVICE_EXT_BM_SIZE];
 	bool pdevs_macaddr_valid;
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index b3f1c6659f419..1e2fc8932a66e 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -569,8 +569,11 @@ static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
 
 		ath11k_pci_ext_grp_disable(irq_grp);
 
-		napi_synchronize(&irq_grp->napi);
-		napi_disable(&irq_grp->napi);
+		if (irq_grp->napi_enabled) {
+			napi_synchronize(&irq_grp->napi);
+			napi_disable(&irq_grp->napi);
+			irq_grp->napi_enabled = false;
+		}
 	}
 }
 
@@ -589,7 +592,10 @@ static void ath11k_pci_ext_irq_enable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		napi_enable(&irq_grp->napi);
+		if (!irq_grp->napi_enabled) {
+			napi_enable(&irq_grp->napi);
+			irq_grp->napi_enabled = true;
+		}
 		ath11k_pci_ext_grp_enable(irq_grp);
 	}
 }
-- 
2.26.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
