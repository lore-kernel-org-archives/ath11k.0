Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSkD0-0005KW-2E
 for ath11k@lists.infradead.org; Thu, 07 Nov 2019 16:00:31 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F168360A19
 for <ath11k@lists.infradead.org>; Thu,  7 Nov 2019 16:00:28 +0000 (UTC)
Subject: [PATCH 3/4] dt: bindings: net: ath11k: fixes from review
From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 07 Nov 2019 18:00:26 +0200
Message-ID: <157314242626.18668.5805345100329345744.stgit@potku.adurom.net>
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

Various small fixes and cleanup found during review.

Link: https://lkml.kernel.org/r/20191025213028.GA5117@bogus
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 .../bindings/net/wireless/qcom,ath11k.yaml         |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index bc648d3873e9..476a8315c66d 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -12,19 +12,17 @@ maintainers:
   - Kalle Valo <kvalo@codeaurora.org>
 
 description: |
-  These are dt entries used on ath11k driver. AHB based ipq8074 uses most of the properties defined in this doc.
+  These are dt entries for Qualcomm Technologies, Inc. IEEE 802.11ax
+  devices, for example like AHB based IPQ8074.
 
 properties:
   compatible:
-    const: "qcom,ipq8074-wifi"
+    const: qcom,ipq8074-wifi
 
   reg:
-    description: Address and length of the register set for the device
     maxItems: 1
 
   interrupts:
-    minItems: 53
-    maxItems: 53
     items:
       - description: misc-pulse1 interrupt events
       - description: misc-latch interrupt events
@@ -81,8 +79,6 @@ properties:
 
 
   interrupt-names:
-    minItems: 53
-    maxItems: 53
     items:
       - const: misc-pulse1
       - const: misc-latch


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
