Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKez3-0002nB-FO
 for ath11k@lists.infradead.org; Wed, 16 Oct 2019 08:48:42 +0000
Received: from [127.0.1.1] (176-93-78-119.bb.dnainternet.fi [176.93.78.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A3646090E
 for <ath11k@lists.infradead.org>; Wed, 16 Oct 2019 08:48:39 +0000 (UTC)
Subject: [PATCH] ath11k: whitespace cleanup in core.c
From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 16 Oct 2019 11:48:37 +0300
Message-ID: <157121571771.9253.16181125542423146269.stgit@x230>
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

ath11k_hw_params was indented too much. Also group the module parameter macros together.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 5a6df2acabce..b0c71b5879b1 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -13,18 +13,16 @@
 #include "debug.h"
 
 unsigned int ath11k_debug_mask;
-
 module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
-
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 
 static const struct ath11k_hw_params ath11k_hw_params = {
-			.name = "ipq8074",
-			.fw = {
-				.dir = IPQ8074_FW_DIR,
-				.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
-				.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
-			},
+	.name = "ipq8074",
+	.fw = {
+		.dir = IPQ8074_FW_DIR,
+		.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
+		.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
+	},
 };
 
 /* Map from pdev index to hw mac index */


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
