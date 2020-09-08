Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFaS0-0004oc-JE
 for ath11k@lists.infradead.org; Tue, 08 Sep 2020 10:02:10 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: remove calling ath11k_init_hw_params() second time
Date: Tue, 8 Sep 2020 10:01:59 +0000
Message-ID: <010101746d2a3ffb-29314df1-2d04-4ef0-9bd9-9cddba9fce9d-000000@us-west-2.amazonses.com>
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
To: ath11k@lists.infradead.org
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org

During probe ath11k_init_hw_params() is called from ath11k_core_pre_init()
and is not needed agian in ath11k_core_init().

Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1

Fixes: 1ff8ed786d5d (ath11k: use remoteproc only with AHB devices)
Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 648a697e414a..03e922111cd6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -849,12 +849,6 @@ int ath11k_core_init(struct ath11k_base *ab)
 		return ret;
 	}
 
-	ret = ath11k_init_hw_params(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to get hw params %d\n", ret);
-		return ret;
-	}
-
 	ret = ath11k_core_soc_create(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to create soc core: %d\n", ret);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
