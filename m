Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSkD8-0005LP-Ji
 for ath11k@lists.infradead.org; Thu, 07 Nov 2019 16:00:39 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 93B1F602F0
 for <ath11k@lists.infradead.org>; Thu,  7 Nov 2019 16:00:37 +0000 (UTC)
Subject: [PATCH 4/4] dt: bindings: net: ath11k: change license
From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 07 Nov 2019 18:00:35 +0200
Message-ID: <157314243482.18668.3440519521632310524.stgit@potku.adurom.net>
In-Reply-To: <157314240904.18668.4904613381977271570.stgit@potku.adurom.net>
References: <157314240904.18668.4904613381977271570.stgit@potku.adurom.net>
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

Change license to (GPL-2.0-only OR BSD-2-Clause).

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 .../bindings/net/wireless/qcom,ath11k.yaml         |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 476a8315c66d..a1717db36dba 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: BSD-3-Clause-Clear
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
 
 %YAML 1.2


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
