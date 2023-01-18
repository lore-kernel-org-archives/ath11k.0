Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61407C32793
	for <ath11k@archiver.kernel.org>; Wed, 18 Jan 2023 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WaZIZWtj7m5f/M50nPNu+DkjdvfahbU5CKxx591sWwY=; b=Oa0tO0J90rtqRt
	nt7TGSyYSw1sAYWEZIInQNbDpGATsv9YS8EXsvzfEVCVegkjrqC9+dnaPaFKCPgq18H/38x53glT3
	6xCCGOXnzAtr5mPLDtF/T7kqwSixws4Pg7mwhUCXVEuHtfvxPXR2MLzS3433LifdSMAm7nR+0TKxn
	OLtv5i/qYex3a8a+PISTj+hA7OuUh1jt8hGKT8HCRN9PyLSECJjQtzikn+L0QWMmNDyVC5W41+bv2
	uK+eD91gup7EzP/pkNQb1x3fFkhYYF9ygxWoXKI+wxZ9Xjbi6kfQhj2geshykETp4Xry3PkYkxa+r
	p4+Q5UQXEcfAA1EupmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICdj-0027nt-9i; Wed, 18 Jan 2023 17:54:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICdg-0027mH-PY
	for ath11k@lists.infradead.org; Wed, 18 Jan 2023 17:54:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so1952649wml.3
        for <ath11k@lists.infradead.org>; Wed, 18 Jan 2023 09:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWpO1YbgA04yjZBzLFJGZr2Ux7J9tn5oLTa4Qr7uJbk=;
        b=yPqo3wCU1xKWJPTbuSCKCbqYu6Q+pewK3OQ1KwO4DvrbPw4kUHaYyutclqFtr8rniv
         rFB6x+jo6VQZ3dIlql4OO3K15gyVQVAKU3AYVC2LM+MZh6yPUdKhf9nv6PA2T845Jgx0
         7yms/WQF5TaY3zASjHlGhI5n4Bamh23pq1kXrtkbHWpAmcRoSyGmggfj3vgMv2XT0hVc
         ny3oYDCyascDlK2oamvzZXNSAKXv97QzBO8GY3CF9s0p+ggSH3VBEFKJ7FowVdowCM0s
         lOyVHWx9INpOjZ9m5zUjoUnY8HVAxBrvv6R0qQ9om98BW0nVvP1h4U8BW7Fog/yjGxf+
         Wzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWpO1YbgA04yjZBzLFJGZr2Ux7J9tn5oLTa4Qr7uJbk=;
        b=yYM8Y7IX2eZ2t9xAUxnT6koxJj8vIyKNEI950gIfk/FaV3YpvnrCPkArdZVTdjVmaX
         WJsBFMg1ryvbEsMpHON9q6qIXnT7O6Lfm2Nx+I5Jub1nBLhRI1Zl1EfgyW4Z7E9fMqCp
         /64loDRqB+LFIkTVJ5SV9mhFC+uQriiE5b9RwF6yfFpwIzFL43ADfgKHWECEiztHa6G+
         2RM2Sfg2ZBfQzGImyH8nEXjk4p01XX8FjvQrYNWzgCWpAXg11g/Z1DWPnfwaRonbAI3+
         88NtuxVUw92Pt20xetMuuKP22mCO+hd3caSvXAQ5ZLV7QOKvA8/HRiJrlem+/P+Oz7g9
         7Uzw==
X-Gm-Message-State: AFqh2krm/FyFtRe6Yr8XmXXd5G5g5hcg8OERt6VILxrx7v/W7ijI+m1A
	eya8niNbKG826RsolY8tVkz85Q==
X-Google-Smtp-Source: AMrXdXuVbyarxnAiepfXzbwTR1RHkFZszrKxbE5DGbOdnNgX139UqeLC5+bUZ7kndu3Jzieu7igTOQ==
X-Received: by 2002:a05:600c:4d93:b0:3d9:efd1:214d with SMTP id v19-20020a05600c4d9300b003d9efd1214dmr7568201wmp.25.1674064457145;
        Wed, 18 Jan 2023 09:54:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b003cf894dbc4fsm2730015wmq.25.2023.01.18.09.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 09:54:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
	de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ath11k@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: net: wireless: minor whitespace and name cleanups
Date: Wed, 18 Jan 2023 18:54:13 +0100
Message-Id: <20230118175413.360153-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_095420_842256_0AC6A416 
X-CRM114-Status: GOOD (  10.97  )
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

Minor cleanups:
 - Drop redundant blank lines,
 - Correct indentaion in examples,
 - Correct node names in examples to drop underscore and use generic
   name.

No functional impact except adjusting to preferred coding style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/wireless/esp,esp8089.yaml    | 20 +++---
 .../bindings/net/wireless/ieee80211.yaml      |  1 -
 .../bindings/net/wireless/mediatek,mt76.yaml  |  1 -
 .../bindings/net/wireless/qcom,ath11k.yaml    | 11 ++-
 .../bindings/net/wireless/silabs,wfx.yaml     |  1 -
 .../bindings/net/wireless/ti,wlcore.yaml      | 70 +++++++++----------
 6 files changed, 50 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/esp,esp8089.yaml b/Documentation/devicetree/bindings/net/wireless/esp,esp8089.yaml
index 5557676e9d4b..0ea84d6fe73e 100644
--- a/Documentation/devicetree/bindings/net/wireless/esp,esp8089.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/esp,esp8089.yaml
@@ -29,15 +29,15 @@ additionalProperties: false
 
 examples:
   - |
-      mmc {
-          #address-cells = <1>;
-          #size-cells = <0>;
-
-          wifi@1 {
-              compatible = "esp,esp8089";
-              reg = <1>;
-              esp,crystal-26M-en = <2>;
-          };
-      };
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wifi@1 {
+            compatible = "esp,esp8089";
+            reg = <1>;
+            esp,crystal-26M-en = <2>;
+        };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
index e68ed9423150..d89f7a3f88a7 100644
--- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/ieee80211.yaml#
diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index f0c78f994491..7d526ff53fb7 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 556eb523606a..5f4b141ba813 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k.yaml#
@@ -262,10 +261,10 @@ allOf:
 examples:
   - |
 
-    q6v5_wcss: q6v5_wcss@CD00000 {
+    q6v5_wcss: remoteproc@cd00000 {
         compatible = "qcom,ipq8074-wcss-pil";
-        reg = <0xCD00000 0x4040>,
-              <0x4AB000 0x20>;
+        reg = <0xcd00000 0x4040>,
+              <0x4ab000 0x20>;
         reg-names = "qdsp6",
                     "rmb";
     };
@@ -386,7 +385,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        qcn9074_0: qcn9074_0@51100000 {
+        qcn9074_0: wifi@51100000 {
             no-map;
             reg = <0x0 0x51100000 0x0 0x03500000>;
         };
@@ -463,6 +462,6 @@ examples:
         qcom,smem-states = <&wlan_smp2p_out 0>;
         qcom,smem-state-names = "wlan-smp2p-out";
         wifi-firmware {
-                iommus = <&apps_smmu 0x1c02 0x1>;
+            iommus = <&apps_smmu 0x1c02 0x1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml b/Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml
index 583db5d42226..84e5659e50ef 100644
--- a/Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml
@@ -2,7 +2,6 @@
 # Copyright (c) 2020, Silicon Laboratories, Inc.
 %YAML 1.2
 ---
-
 $id: http://devicetree.org/schemas/net/wireless/silabs,wfx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wlcore.yaml b/Documentation/devicetree/bindings/net/wireless/ti,wlcore.yaml
index e31456730e9f..f799a1e52173 100644
--- a/Documentation/devicetree/bindings/net/wireless/ti,wlcore.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/ti,wlcore.yaml
@@ -90,47 +90,47 @@ examples:
 
     // For wl12xx family:
     spi1 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            wlcore1: wlcore@1 {
-                    compatible = "ti,wl1271";
-                    reg = <1>;
-                    spi-max-frequency = <48000000>;
-                    interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
-                    vwlan-supply = <&vwlan_fixed>;
-                    clock-xtal;
-                    ref-clock-frequency = <38400000>;
-            };
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wlcore1: wlcore@1 {
+            compatible = "ti,wl1271";
+            reg = <1>;
+            spi-max-frequency = <48000000>;
+            interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+            vwlan-supply = <&vwlan_fixed>;
+            clock-xtal;
+            ref-clock-frequency = <38400000>;
+        };
     };
 
     // For wl18xx family:
     spi2 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            wlcore2: wlcore@0 {
-                    compatible = "ti,wl1835";
-                    reg = <0>;
-                    spi-max-frequency = <48000000>;
-                    interrupts = <27 IRQ_TYPE_EDGE_RISING>;
-                    vwlan-supply = <&vwlan_fixed>;
-            };
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wlcore2: wlcore@0 {
+            compatible = "ti,wl1835";
+            reg = <0>;
+            spi-max-frequency = <48000000>;
+            interrupts = <27 IRQ_TYPE_EDGE_RISING>;
+            vwlan-supply = <&vwlan_fixed>;
+        };
     };
 
     // SDIO example:
     mmc3 {
-            vmmc-supply = <&wlan_en_reg>;
-            bus-width = <4>;
-            cap-power-off-card;
-            keep-power-in-suspend;
-
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            wlcore3: wlcore@2 {
-                    compatible = "ti,wl1835";
-                    reg = <2>;
-                    interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
-            };
+        vmmc-supply = <&wlan_en_reg>;
+        bus-width = <4>;
+        cap-power-off-card;
+        keep-power-in-suspend;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wlcore3: wlcore@2 {
+            compatible = "ti,wl1835";
+            reg = <2>;
+            interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+        };
     };
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
