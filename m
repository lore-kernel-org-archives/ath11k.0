Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jya4M-0000za-1s
 for ath11k@lists.infradead.org; Thu, 23 Jul 2020 12:11:29 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v4 1/3] dt: bindings: net: update compatible for ath11k
Date: Thu, 23 Jul 2020 17:41:02 +0530
Message-Id: <1595506264-6393-2-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1595506264-6393-1-git-send-email-akolli@codeaurora.org>
References: <1595506264-6393-1-git-send-email-akolli@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, akolli@codeaurora.org, linux-wireless@vger.kernel.org

Add IPQ6018 wireless driver support,
its based on ath11k driver.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V3:
 - Use 'enum' rather than oneOf+const.
V4:
 - removed oneOf, use just enum (Rob)

 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index a1717db36dba..7cd1e323ca56 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -17,7 +17,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,ipq8074-wifi
+    - enum:
+       - qcom,ipq8074-wifi
+       - qcom,ipq6018-wifi
 
   reg:
     maxItems: 1
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
