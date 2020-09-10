Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGGtC-0001zf-9S
 for ath11k@lists.infradead.org; Thu, 10 Sep 2020 07:21:05 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: fix link error when CONFIG_REMOTEPROC is disabled
Date: Thu, 10 Sep 2020 07:20:58 +0000
Message-ID: <0101017476e38e80-84d58edf-641e-492a-95bb-c0d1573f987c-000000@us-west-2.amazonses.com>
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
Cc: linux-wireless@vger.kernel.org

If CONFIG_REMOTEPROC was disabled the linking failed with:

ERROR: modpost: "rproc_get_by_phandle" [drivers/net/wireless/ath/ath11k/ath11k.ko] undefined!

Compile tested only.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 1ff8ed786d5d ("ath11k: use remoteproc only with AHB devices")
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 437b1123a34f..413811edd083 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -784,6 +784,9 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
 	struct rproc *prproc;
 	phandle rproc_phandle;
 
+	if (!IS_ENABLED(CONFIG_REMOTEPROC))
+		return 0;
+
 	if (ab->bus_params.mhi_support)
 		return 0;
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
