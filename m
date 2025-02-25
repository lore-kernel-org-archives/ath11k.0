Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E651C021B8
	for <ath11k@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY0h+JkzJEPC+Fr2bSYHihmywLYc/knwfAjtuNnsAeo=; b=YedQTyFJD/90NZ1DGLupWDHc4D
	gJe9Aj8zfKsls/oAMpBwFpdZIiDH5mXVK37GPKGgP493+94DZMVpbsqjSUADT0UJXV82HcLjJgaCm
	6o8bnBxGqGbzdZKsk8hy3M+7Vn6i6aj+K5BLF55QB1dDo3YS8fuXVG+IOuTY+qNQ+t+hBFZLzYZ7w
	W/TtdEKIHxTNfrNSJlFo3sM7e14t7N9kCf4A+ekfE+gPOo7Xf9evdHQ3ATQbCfENF1Tg8FilTCqrg
	JLUEfZx9VBnKHIFq+xW3u0+IwnqkQvGi1Kat69hQhF7iTVQ8LA4pExJ1aYHhObWEe/vl8Q5g+lXeQ
	4rJTekeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNl-0000000GcNE-3fOg;
	Tue, 25 Feb 2025 09:37:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqst-0000000GVfo-0p01
	for ath11k@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abc28af1ba4so46397466b.1
        for <ath11k@lists.infradead.org>; Tue, 25 Feb 2025 01:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474346; x=1741079146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fY0h+JkzJEPC+Fr2bSYHihmywLYc/knwfAjtuNnsAeo=;
        b=vBiYPPIHpj+qKQvYSesEBjRXl5NY9EXCsPhPXepaQNHLeoK6GAkecgYgRQHRodK5PM
         eKC1u1E25tYJ1mcYqFVozDxh/n8SZVKhbmH8NZkMk2YVHNJwFqWHChZkQl1m30j5V8n5
         MvjuVBd4mV1bRwiPzvNzAhlM0Mrp6hYbwlh49jKXx1+5JvKjjc2HJj1b1DrhCf2p+uJs
         nIm1kqBYYn3w5H84AIsSGEoZPjKETvOUnbALDBAV5VxYsKxYGB2DHkZhxCJdXq7wIW4n
         OCwU8u5KG1DW4UgPoZYRBTrxtAo6LtrFo5k65zkk4HwzU4Gvkm7eCi+Gb9TvurlQPGnb
         7W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474346; x=1741079146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY0h+JkzJEPC+Fr2bSYHihmywLYc/knwfAjtuNnsAeo=;
        b=DHSSWg3qWcJ8KQCeUKBANAnAVnNh1eSTXR3N6s3avX/Plql6vDjfLI5fACTRT5wH2H
         dNe7jQeq/GNvZhm63HeFNbwAqfw0PpZvD8eZn4DRxoof2Hy1H6aw1apbJP/xOY4PAQO7
         U1kYbL0fiLcq2oxWO/PdAwqoe6JIyT6Htv45UKYt/iITvryff/NLy9INP9NpJJ9YfM6z
         84RkU+GnY6RDWwDWm+4zhahAc12fn/qUWYifBfzEIeFlvLJLsL8GpDw58ADPhgkRJpaR
         2dd9yPFJ4/QvY7OfieOEgHfn/VDPIUtkYxIODFs/eGfQeiZPU/9C6kA5baGzxbJ9hFXo
         jBuA==
X-Forwarded-Encrypted: i=1; AJvYcCUKxCJWACqn3zWuhiapmiuSHYKHF5wMhy9WO0EK+JlpdHlF9lUaDDHiBkvZ/TOC0gdlniHgPB4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Cu26g3qiP6YK0hcvQbT2MDREitfRmuGy0vWcwS5N/lgSCAzU
	jsKw8pRW9T0LHwFCKyrNHNdS7L28cFdg2eIdIX2U/tTK2EFewjeD3dB+ShGSM4E=
X-Gm-Gg: ASbGncs1hKNAqULmUmf05c6VrvDAxRRZMMXUvmoSrXhDQi6UsACdyvluqvH/biWg+8L
	BPhUVnaAwVHL3vkTUFnqjxdkive/sQ8CrKKHOvhQaz16gYL4aJXkf2Hey5BgdnKTJdezTxnVQQe
	Ir+AEuVuQGdmyx8kBKw4SSGmyqC9F9sqwQrBiMgPnDDulfEJfR5LHiuUTbxE/jKzNAuBVD13OuN
	dbk0k002vfp9F/8EV4bL8atA/mVEM1v2VZJ4fL5YMTiLoEqJ4z03ohgGcG7LCtPKYQ2v5oXtqTd
	syLOBx61FkS7gz5hdw/olaPvhfAS8w3g6LwLaat5RLKSRfsHKwFNh8yqp6o+vYECvgjoGKRCY6/
	E
X-Google-Smtp-Source: AGHT+IGkqhINat7Gxz1iDEnab5crobr9JPjoaawiIMmvU8LrPtIbqlI6khHbhhpw1r11PcRLe2kLUA==
X-Received: by 2002:a17:907:3d8e:b0:ab3:2719:ca30 with SMTP id a640c23a62f3a-abc09bcce60mr682984466b.10.1740474345817;
        Tue, 25 Feb 2025 01:05:45 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d58sm106681566b.148.2025.02.25.01.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:05:33 +0100
Subject: [PATCH 2/5] dt-bindings: wireless: ath11k: Strip ath11k prefix
 from calibration property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b-wifi-qcom-calibration-variant-v1-2-3b2aa3f89c53@linaro.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2961;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8usnTAEFm1Piu5Yd2wL1LXpPE1HGz8E+rmzlqa0grM8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvYfh6CpkJd8c70kQJfWzDAjgLHF01wrk68d68
 hSc3oJt3RyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72H4QAKCRDBN2bmhouD
 11UmD/wNk1W++Osvh3b2yso4MtXvuq3PwwRO5Yiz8g4FfR+ea8vdj3Um0ZQ6m48tUIyZ+JMX9St
 URu3XSQHi//YmHCI9eyHnkTUvxjvVLjgee37/OiwUTVMXN4xN6cKjHE1+mGQDP0JzPQGkdTDlIK
 TxSazB/bESJwr2RzDNB9MQIRwUDiWjAJ9oTP6661PQsMlRW0XF+H2OSJ+JDe1lPAbF7/wK4D9uL
 C1IG0uzI2RPu39ZzHnyo9uvdnE8SRQ+Xd+Dbzz4TH8zzEKXaVJljrMLWVF/A/oNGbsZxmRvi5Q6
 VDPw7Xfz5PIY/P++793HL5UFBlqQtl43wRKIOKFMaaUE6z60LM4a1YyMErH3vVXD5bcdeT/WE1q
 Ph+mzNZANDXPdL7CpefayVOEFupDOR5aijsD+z5gOF6pHSxk1HLL0jMRXW90/8PkxsyK5iQI47/
 ZMCrjf0D+KHE+V0sWqazBQyizUIfEDnvImMIrWx3YyPcza/apucuDYzppT4nD+/k4TKUZVBlaC+
 fAhFxaRn3YR9/2+0cbJAi3lyAfLdBTahyMEvV6OA2c83nf+a/jLiCyXikoVwOOrSzlIMJcXhEdd
 c+qjpbafFiIf04McwHGosxH8vkeAkYvgojJ4K+LDDM5tBGfmHfZpLsB3RdhAu3u2nFVm6w3VfMt
 cHMvTQ/ajd2nsBA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010547_257152_853573AC 
X-CRM114-Status: GOOD (  10.55  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Devicetree properties describing exactly the same thing should be
reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
certain calibration data, so properties should not be prefixed with
device family (ath11k).

Deprecate qcom,ath11k-calibration-variant and alike, so we gradually
switch to a common property.  This will also allow moving these
properties to common schema, if desired.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 9 ++++++++-
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml  | 7 +++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index a4425cf196aba58e4181e690a0448236aee15e50..653b319fee880ef0944d8e35c545890b60611756 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -22,8 +22,15 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      string to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
   qcom,ath11k-calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description: |
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
@@ -127,7 +134,7 @@ examples:
                 vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
                 vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
 
-                qcom,ath11k-calibration-variant = "LE_X13S";
+                qcom,calibration-variant = "LE_X13S";
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index a69ffb7b3cb884a4eeb51064cc1c8136b433f285..c089677702cf17f3016b054d21494d2a7706ce5d 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -41,8 +41,15 @@ properties:
         * reg
         * reg-names
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      string to uniquely identify variant of the calibration data in the
+      board-2.bin for designs with colliding bus and device specific ids
+
   qcom,ath11k-calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description:
       string to uniquely identify variant of the calibration data in the
       board-2.bin for designs with colliding bus and device specific ids

-- 
2.43.0


