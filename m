Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSkCr-0005JY-OE
 for ath11k@lists.infradead.org; Thu, 07 Nov 2019 16:00:23 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A13A6019D
 for <ath11k@lists.infradead.org>; Thu,  7 Nov 2019 16:00:20 +0000 (UTC)
Subject: [PATCH 2/4] dt: bindings: net: ath11k: fix whitespace
From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 07 Nov 2019 18:00:18 +0200
Message-ID: <157314241767.18668.741133614573574364.stgit@potku.adurom.net>
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

Convert all tabs to spaces, no other changes.

Link: https://lkml.kernel.org/r/20191025213028.GA5117@bogus
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 .../bindings/net/wireless/qcom,ath11k.yaml         |  224 ++++++++++----------
 1 file changed, 112 insertions(+), 112 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 5d25542f85f8..bc648d3873e9 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -159,119 +159,119 @@ examples:
   - |
 
     q6v5_wcss: q6v5_wcss@CD00000 {
-    	compatible = "qcom,ipq8074-wcss-pil";
-    	reg = <0xCD00000 0x4040>,
-    	      <0x4AB000 0x20>;
-    	reg-names = "qdsp6",
-    		    "rmb";
+        compatible = "qcom,ipq8074-wcss-pil";
+        reg = <0xCD00000 0x4040>,
+              <0x4AB000 0x20>;
+        reg-names = "qdsp6",
+                    "rmb";
     };
 
     wifi0: wifi@c000000 {
-        	compatible = "qcom,ipq8074-wifi";
-    	reg = <0xc000000 0x2000000>;
-    	interrupts = <0 320 1>,
-    		     <0 319 1>,
-    		     <0 318 1>,
-    		     <0 317 1>,
-    		     <0 316 1>,
-    		     <0 315 1>,
-    		     <0 314 1>,
-    		     <0 311 1>,
-    		     <0 310 1>,
-    		     <0 411 1>,
-    		     <0 410 1>,
-    		     <0 40 1>,
-    		     <0 39 1>,
-    		     <0 302 1>,
-    		     <0 301 1>,
-    		     <0 37 1>,
-    		     <0 36 1>,
-    		     <0 296 1>,
-    		     <0 295 1>,
-    		     <0 294 1>,
-    		     <0 293 1>,
-    		     <0 292 1>,
-    		     <0 291 1>,
-    		     <0 290 1>,
-    		     <0 289 1>,
-    		     <0 288 1>,
-    		     <0 239 1>,
-    		     <0 236 1>,
-    		     <0 235 1>,
-    		     <0 234 1>,
-    		     <0 233 1>,
-    		     <0 232 1>,
-    		     <0 231 1>,
-    		     <0 230 1>,
-    		     <0 229 1>,
-    		     <0 228 1>,
-    		     <0 224 1>,
-    		     <0 223 1>,
-    		     <0 203 1>,
-    		     <0 183 1>,
-    		     <0 180 1>,
-    		     <0 179 1>,
-    		     <0 178 1>,
-    		     <0 177 1>,
-    		     <0 176 1>,
-    		     <0 163 1>,
-    		     <0 162 1>,
-    		     <0 160 1>,
-    		     <0 159 1>,
-    		     <0 158 1>,
-    		     <0 157 1>,
-    		     <0 156 1>;
-    	interrupt-names = "misc-pulse1",
-    			  "misc-latch",
-    			  "sw-exception",
-    			  "watchdog",
-    			  "ce0",
-    			  "ce1",
-    			  "ce2",
-    			  "ce3",
-    			  "ce4",
-    			  "ce5",
-    			  "ce6",
-    			  "ce7",
-    			  "ce8",
-    			  "ce9",
-    			  "ce10",
-    			  "ce11",
-    			  "host2wbm-desc-feed",
-    			  "host2reo-re-injection",
-    			  "host2reo-command",
-    			  "host2rxdma-monitor-ring3",
-    			  "host2rxdma-monitor-ring2",
-    			  "host2rxdma-monitor-ring1",
-    			  "reo2ost-exception",
-    			  "wbm2host-rx-release",
-    			  "reo2host-status",
-    			  "reo2host-destination-ring4",
-    			  "reo2host-destination-ring3",
-    			  "reo2host-destination-ring2",
-    			  "reo2host-destination-ring1",
-    			  "rxdma2host-monitor-destination-mac3",
-    			  "rxdma2host-monitor-destination-mac2",
-    			  "rxdma2host-monitor-destination-mac1",
-    			  "ppdu-end-interrupts-mac3",
-    			  "ppdu-end-interrupts-mac2",
-    			  "ppdu-end-interrupts-mac1",
-    			  "rxdma2host-monitor-status-ring-mac3",
-    			  "rxdma2host-monitor-status-ring-mac2",
-    			  "rxdma2host-monitor-status-ring-mac1",
-    			  "host2rxdma-host-buf-ring-mac3",
-    			  "host2rxdma-host-buf-ring-mac2",
-    			  "host2rxdma-host-buf-ring-mac1",
-    			  "rxdma2host-destination-ring-mac3",
-    			  "rxdma2host-destination-ring-mac2",
-    			  "rxdma2host-destination-ring-mac1",
-    			  "host2tcl-input-ring4",
-    			  "host2tcl-input-ring3",
-    			  "host2tcl-input-ring2",
-    			  "host2tcl-input-ring1",
-    			  "wbm2host-tx-completions-ring3",
-    			  "wbm2host-tx-completions-ring2",
-    			  "wbm2host-tx-completions-ring1",
-    			  "tcl2host-status-ring";
-    	qcom,rproc = <&q6v5_wcss>;
+        compatible = "qcom,ipq8074-wifi";
+        reg = <0xc000000 0x2000000>;
+        interrupts = <0 320 1>,
+                     <0 319 1>,
+                     <0 318 1>,
+                     <0 317 1>,
+                     <0 316 1>,
+                     <0 315 1>,
+                     <0 314 1>,
+                     <0 311 1>,
+                     <0 310 1>,
+                     <0 411 1>,
+                     <0 410 1>,
+                     <0 40 1>,
+                     <0 39 1>,
+                     <0 302 1>,
+                     <0 301 1>,
+                     <0 37 1>,
+                     <0 36 1>,
+                     <0 296 1>,
+                     <0 295 1>,
+                     <0 294 1>,
+                     <0 293 1>,
+                     <0 292 1>,
+                     <0 291 1>,
+                     <0 290 1>,
+                     <0 289 1>,
+                     <0 288 1>,
+                     <0 239 1>,
+                     <0 236 1>,
+                     <0 235 1>,
+                     <0 234 1>,
+                     <0 233 1>,
+                     <0 232 1>,
+                     <0 231 1>,
+                     <0 230 1>,
+                     <0 229 1>,
+                     <0 228 1>,
+                     <0 224 1>,
+                     <0 223 1>,
+                     <0 203 1>,
+                     <0 183 1>,
+                     <0 180 1>,
+                     <0 179 1>,
+                     <0 178 1>,
+                     <0 177 1>,
+                     <0 176 1>,
+                     <0 163 1>,
+                     <0 162 1>,
+                     <0 160 1>,
+                     <0 159 1>,
+                     <0 158 1>,
+                     <0 157 1>,
+                     <0 156 1>;
+        interrupt-names = "misc-pulse1",
+                          "misc-latch",
+                          "sw-exception",
+                          "watchdog",
+                          "ce0",
+                          "ce1",
+                          "ce2",
+                          "ce3",
+                          "ce4",
+                          "ce5",
+                          "ce6",
+                          "ce7",
+                          "ce8",
+                          "ce9",
+                          "ce10",
+                          "ce11",
+                          "host2wbm-desc-feed",
+                          "host2reo-re-injection",
+                          "host2reo-command",
+                          "host2rxdma-monitor-ring3",
+                          "host2rxdma-monitor-ring2",
+                          "host2rxdma-monitor-ring1",
+                          "reo2ost-exception",
+                          "wbm2host-rx-release",
+                          "reo2host-status",
+                          "reo2host-destination-ring4",
+                          "reo2host-destination-ring3",
+                          "reo2host-destination-ring2",
+                          "reo2host-destination-ring1",
+                          "rxdma2host-monitor-destination-mac3",
+                          "rxdma2host-monitor-destination-mac2",
+                          "rxdma2host-monitor-destination-mac1",
+                          "ppdu-end-interrupts-mac3",
+                          "ppdu-end-interrupts-mac2",
+                          "ppdu-end-interrupts-mac1",
+                          "rxdma2host-monitor-status-ring-mac3",
+                          "rxdma2host-monitor-status-ring-mac2",
+                          "rxdma2host-monitor-status-ring-mac1",
+                          "host2rxdma-host-buf-ring-mac3",
+                          "host2rxdma-host-buf-ring-mac2",
+                          "host2rxdma-host-buf-ring-mac1",
+                          "rxdma2host-destination-ring-mac3",
+                          "rxdma2host-destination-ring-mac2",
+                          "rxdma2host-destination-ring-mac1",
+                          "host2tcl-input-ring4",
+                          "host2tcl-input-ring3",
+                          "host2tcl-input-ring2",
+                          "host2tcl-input-ring1",
+                          "wbm2host-tx-completions-ring3",
+                          "wbm2host-tx-completions-ring2",
+                          "wbm2host-tx-completions-ring1",
+                          "tcl2host-status-ring";
+        qcom,rproc = <&q6v5_wcss>;
     };


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
