Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95005C7618D
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4guttqOqRM9I+SV8gq7XcLY9BT2klyB4G2jiofMdQKk=; b=sqmPjp+sgGnW9c
	bO7F4naw8ABr3uUmslkbmSHPBVggAM5OGDMU3TNu3WYpDWqhWHvEQRibEmVEk1wibxffWWwzNF2oN
	e3l1BXTWGa2JRzbP5WF812CDGvAnaHNb99lB/9L3aF6w8lhL6w/EVeJfnap4EADx7TtUfroPgFUtO
	H27bb/nW0MiyFRJJqiYxDRfucK9Sn9NG18yNNHI2CbqRxD8VGkggxTpudnZNjrk5OLhBgENczcJdl
	Sf0uAMTP82zX74my3Afrw+QSESUZjzzjecPDmj5SwpXiW3nptZV8Pel9xl02ICpQWtE60i1iixqnq
	tPj4y0D/cxnR8M7ImaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYSX-00BuLY-1x;
	Tue, 21 Mar 2023 09:39:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYSU-00BuKJ-2i
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 09:39:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2026C61AAC;
	Tue, 21 Mar 2023 09:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98FEC433D2;
	Tue, 21 Mar 2023 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679391548;
	bh=OO5zaDA6gWw6Yo8WQeWvzqILKDsdnOqeoGNGYtZyLVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oj6ds/hJfqa48Lkwj+yTTqPF5GBJ2tyyUZzV1T+NVAmmgwUW81rWrVvQWsD4cuPSW
	 fxRt6f0da841LGFKHab0jcMXRiOi7ro2LD84PFovx06dNiUbo8ZWVvAR/I/e3Xt8d5
	 B1Lm7zTzeBwmyjo8rsDfRbaCfwZGV300ZZHAPq/KepoPpVCV2Km6FojLUVQCGFbaIS
	 LMYChRIDYH9i3X1GROLo96CxwPoCmOEBdNrgb7M3HLJU+/IBR9e6cKkUredc2Df1SY
	 u4Gdmv/g/ZR1fw5nV9bGXqcAf+YdsUm448oW3ChVCu2uLmT8AIy8XvwdhoooMEAMCv
	 GJFPiOQ3duLkQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1peYTo-0002Xy-AV; Tue, 21 Mar 2023 10:40:32 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Steev Klimaszewski <steev@kali.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: wireless: add ath11k pcie bindings
Date: Tue, 21 Mar 2023 10:40:10 +0100
Message-Id: <20230321094011.9759-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321094011.9759-1-johan+linaro@kernel.org>
References: <20230321094011.9759-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_023910_954974_B58FA90E 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add devicetree bindings for Qualcomm ath11k PCIe devices such as WCN6855
for which the calibration data variant may need to be described.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../net/wireless/qcom,ath11k-pci.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
new file mode 100644
index 000000000000..817f02a8b481
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 Linaro Limited
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies ath11k wireless devices (PCIe)
+
+maintainers:
+  - Kalle Valo <kvalo@kernel.org>
+
+description: |
+  Qualcomm Technologies IEEE 802.11ax PCIe devices
+
+properties:
+  compatible:
+    enum:
+      - pci17cb,1103  # WCN6855
+
+  reg:
+    maxItems: 1
+
+  qcom,ath11k-calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      string to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+
+            bus-range = <0x01 0xff>;
+
+            wifi@0 {
+                compatible = "pci17cb,1103";
+                reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+                qcom,ath11k-calibration-variant = "LE_X13S";
+            };
+        };
+    };
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
