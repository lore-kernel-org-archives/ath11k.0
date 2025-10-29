Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB2BCCF9F6
	for <ath11k@archiver.kernel.org>; Wed, 29 Oct 2025 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntt60EdyNyljZjPJF01h+kHNn5eevukW54+nJwzmO2Y=; b=pSy7dfLa6HbdxziyKkaad8pRMu
	zqQqz2Ej60iEkoupjQSwb+TW5fdSjwnS7KOVmdsN8L3b37P2BiJJy7M75UUxLejur9TSndwpZzgl8
	/OVydap8mye2pyqarx8Yt2dSJr0G1WYaTjB3j1mmlIipvd6ZbzkR6MBcKYFiJzTfgGfz+T7Mx9Htn
	te+53hM8NawA0gmqpdcKWh+2RRWJQVeGV0qL0IiwcwJh31Y90rqp37TkoSVD1VY1qIPcmx9a8Ezcx
	Az8f2DLpBdwovOSKcOCq2bGUlYVotWg9vbdLimKCow3AbCzpWLQ6aX/YpB4RjN7vV9d1/oHFmP3pF
	y4exyDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE78O-00000001ZdR-25sE;
	Wed, 29 Oct 2025 14:26:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE78M-00000001Za3-1P9z
	for ath11k@lists.infradead.org;
	Wed, 29 Oct 2025 14:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80A66488EE;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63B83C4CEFF;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761748000;
	bh=uAFaddzt+o5Jaxvpc4u0qmiEWtTqty66JcCDtI2hth0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HWOzqi9Bxd3FHXRdr4CFX8V6rgdrLULLiUfNUWKA/TnH4K7W3ygUUHvKfbUvD0n9F
	 BCqxIgLQ5YSqLKGJhQfVffKJlhU2lixUy0mBbkq0/UKfTw/NuFGQ8B65RAom6Sig3Z
	 tp96yXpR5vz77Jf/I2EgXD8p8E1XS1NZjwe54BV0an2KV/zmTIKukPEWHUD8dTxCEZ
	 WfgUvcP9Wij5fM8zSwBTtY8dgXuGFfMMlb7Kr5LUrp2YlE8s3gPo8dBO9ZTPaMxAze
	 CWuUOXbOe7cIILBSW/Gnwl00ScbPjNsMYHG2PS5XsalV1tW11ELXqmwjrb4ZdmBoAD
	 1jUDYwUg4e4VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A06FCCF9EB;
	Wed, 29 Oct 2025 14:26:40 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 29 Oct 2025 18:26:22 +0400
Subject: [PATCH 1/6] dt: bindings: net: add bindings for QCN6122
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-ath11k-qcn6122-v1-1-58ed68eba333@outlook.com>
References: <20251029-ath11k-qcn6122-v1-0-58ed68eba333@outlook.com>
In-Reply-To: <20251029-ath11k-qcn6122-v1-0-58ed68eba333@outlook.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761747997; l=4199;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=8oCgkx2tBE/XoLjt2QmaWVlpynCUGOtanyX8ad9w9XQ=;
 b=+Lg/GmnlljSyRRhc0gmBi4zkwu92ultczCM8t+AFO50E/X2H02QHzXOZ5sQq/NWMTJ4ecsWAg
 BpYCx8WZCEsAmjBNYcHAARzuXPOGOojbgr8hchE+sS28bDo9FeHSEGM
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_072642_419917_D566A9B1 
X-CRM114-Status: GOOD (  11.54  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: george.moussalem@outlook.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

QCN6122 is a PCIe based solution that is attached to and enumerated
by the WPSS (Wireless Processor SubSystem) Q6 processor.

Though it is a PCIe device, since it is not attached to APSS processor
(Application Processor SubSystem), APSS will be unaware of such a decice
so it is registered to the APSS processor as a platform device(AHB).
Because of this hybrid nature, it is called as a hybrid bus device as
introduced by WCN6750. It has 5 CE and 8 DP rings.

QCN6122 is similar to WCN6750 and follows the same codepath as for
WCN6750.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../bindings/net/wireless/qcom,ath11k.yaml         | 57 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index c089677702cf17f3016b054d21494d2a7706ce5d..4b0b282bb9231c8bc496fed42e0917b9d7d106d2 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -21,12 +21,13 @@ properties:
       - qcom,ipq6018-wifi
       - qcom,wcn6750-wifi
       - qcom,ipq5018-wifi
+      - qcom,qcn6122-wifi
 
   reg:
     maxItems: 1
 
   interrupts:
-    minItems: 32
+    minItems: 13
     maxItems: 52
 
   interrupt-names:
@@ -87,6 +88,14 @@ properties:
     items:
       - const: wlan-smp2p-out
 
+  qcom,userpd:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 3]
+    description: instance ID of user PD (protection domain) in multi-PD
+                 architectures to distinguish between multiple instances
+                 of the same wifi chip used by QMI in its interface with
+                 the firmware running on Q6.
+
 required:
   - compatible
   - reg
@@ -268,6 +277,31 @@ allOf:
             - description: interrupt event for ring DP20
             - description: interrupt event for ring DP21
             - description: interrupt event for ring DP22
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcn6122-wifi
+    then:
+      required:
+        - qcom,userpd
+      properties:
+        interrupts:
+          items:
+            - description: interrupt event for ring CE1
+            - description: interrupt event for ring CE2
+            - description: interrupt event for ring CE3
+            - description: interrupt event for ring CE4
+            - description: interrupt event for ring CE5
+            - description: interrupt event for ring DP1
+            - description: interrupt event for ring DP2
+            - description: interrupt event for ring DP3
+            - description: interrupt event for ring DP4
+            - description: interrupt event for ring DP5
+            - description: interrupt event for ring DP6
+            - description: interrupt event for ring DP7
+            - description: interrupt event for ring DP8
 
 examples:
   - |
@@ -467,3 +501,24 @@ examples:
             iommus = <&apps_smmu 0x1c02 0x1>;
         };
     };
+
+  - |
+    wifi1: wifi@b00a040 {
+        reg = <0x0b00a040 0x0>;
+        compatible = "qcom,qcn6122-wifi";
+        interrupts = <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 419 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 420 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 422 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 423 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 424 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 425 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+        qcom,rproc = <&q6v5_wcss_pd2>;
+        qcom,userpd = <2>;
+    };

-- 
2.51.1



