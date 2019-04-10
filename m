Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE6G6-0001TD-3d
 for ath11k@lists.infradead.org; Wed, 10 Apr 2019 05:58:55 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: fix compiler warnings for unused variables
Date: Wed, 10 Apr 2019 07:58:40 +0200
Message-Id: <20190410055840.5049-1-john@phrozen.org>
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
To: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Cc: John Crispin <john@phrozen.org>

  CC [M]  drivers/net/wireless/ath/ath11k/core.o
drivers/net/wireless/ath/ath11k/core.c: In function 'ath11k_core_init':
drivers/net/wireless/ath/ath11k/core.c:609:10: warning: unused variable 'rproc_phandle' [-Wunused-variable]
phandle rproc_phandle;
^
drivers/net/wireless/ath/ath11k/core.c:608:16: warning: unused variable 'prproc' [-Wunused-variable]
struct rproc *prproc;
^
drivers/net/wireless/ath/ath11k/core.c:607:17: warning: unused variable 'dev' [-Wunused-variable]
struct device *dev = sc->dev;
^

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 48a42cad4e14..af4aa8eabd81 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -747,11 +747,11 @@ static void ath11k_core_restart(struct work_struct *work)
 int ath11k_core_init(struct ath11k_base *sc)
 {
 	struct device *dev = sc->dev;
+#ifndef CONFIG_IPQ_SUBSYSTEM_RESTART
 	struct rproc *prproc;
 	phandle rproc_phandle;
 	int ret;
 
-#ifndef CONFIG_IPQ_SUBSYSTEM_RESTART
 	if (of_property_read_u32(dev->of_node, "q6_rproc", &rproc_phandle)) {
 		ath11k_err(sc, "failed to get q6_rproc handle\n");
 		return -ENOENT;
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
