Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA728CF07BA
	for <ath11k@archiver.kernel.org>; Thu, 10 Oct 2024 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fAZN9C/GFdXF6RdMc8O3pl7Hwn2h+nafu8g8plyOOA0=; b=sKRJa49LW0o3HvHsu+rmBqwYrB
	X61FuIx85pAECqwoU21W/7/TkdE+ncT6RkAB4F1oFqYWmrX0r7U565nqkSNV62FhnqUh/FnY/JbpU
	O4ZZSzFemsFuxX0Tjubivb2bQ/fcC4FM4ilCDUI6ecgqFHIEuCNAdLqBIBqYGl2anwVxbQO915onO
	2G9nW4nqfzqAYT8si5WqgZxYvWXTkkPlCn48Gs6Ce9jirSgfethQm2zSpCLJE9O/n/QI5kouY5uSz
	wbx6B+2VnJFI5rXKh3EVoojkZQwuk0i50M9WCYcUbkBdSxLuJNgHbg34dNr9eS3MApnzVt12/PG9q
	5YLSHN9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syntF-0000000Bry7-1kQg;
	Thu, 10 Oct 2024 07:47:17 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synVE-0000000BpNb-1WAp
	for ath11k@lists.infradead.org;
	Thu, 10 Oct 2024 07:22:39 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c5a7b2908so4706165ad.1
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728544947; x=1729149747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAZN9C/GFdXF6RdMc8O3pl7Hwn2h+nafu8g8plyOOA0=;
        b=B26MdasxJ2QCKzxjKTTaWO0TYpC6eYvAuEeWdAHrcsPMlBfXk5A+RfmTk0Oph9WejL
         IHG0a1mukOtONwHSC97KWo/uo8vDtgD+9Jrk/VsANuJR/3/2gLgSw50OTehFcBvmeBOx
         yWMOQVEgnbtxEk9B4qQxvCI2Mw3CpJngYDHuYrlax/t+GaD2QkqavUt6Vt1CMnOQLrCh
         J9JJofujYyj8lercZyJmSJfNjxylGAVyNDdy5F+YaSi5Sohi6FJI+baSXTWEFSorg8T4
         H35vk1FYaCOZe8Re+1+/2KY55/TL9Fv1Rt4joZf19LlCVh8+74ClJJKMM36X2cy4FMv4
         cBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544947; x=1729149747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAZN9C/GFdXF6RdMc8O3pl7Hwn2h+nafu8g8plyOOA0=;
        b=Dwqo5yi65m0XHB/rCUTZ8j5b0zkAujdgAus4fTP0Ml9HGAU3NlBEOh2fe9LmA0aI1f
         srXiwnIXchnOnpxyhKe+WuvV9X2z398hVXyGHuSnmPnJNKgPTNXsPgPCllNPD9dm0BI+
         3R6J0g3/gYCF04gh7ueq3FZHzAp5oZQmNc0HYtaM6NccEMnxi48oIu1qFzBhgwpDM/94
         sYvIW1NFheYX54gGMXXeHo4zQv2gRe3hOpXtkAAvbE6ES29cYdxO/BwXfEbbUJutc84J
         pKm4pJws/XwdozDjfMQdywgpjoitpb8/PeKd+vaEAhmaP5bFJNK9sLEvyA0fD0kN+Qxk
         miew==
X-Forwarded-Encrypted: i=1; AJvYcCW/rQ74Yudk5ErSgvTOz5/NV8uVB/vUze1FurhnuWWCWGVp905zGRF+iuZYtSeAoFBoC5O6RUo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUpHVxenPbGy7rJN1N7yDuW84ftgBrFjgQADjTzw+KmgoshNqX
	RtiT+7eFKxry1JBYwbQxI+SLOHJwgO7rqj0/CpmkD9TrpWpyQ+9+
X-Google-Smtp-Source: AGHT+IGun9eCRZcpSJMPC1tFvuB8ARPLpuejb55VSsC6xFiZnGFpWUrfZe4+TzhboBaOJ0IQkXJifw==
X-Received: by 2002:a17:902:d4c1:b0:20c:774b:5ae5 with SMTP id d9443c01a7336-20c774b5cfemr60270875ad.9.1728544946915;
        Thu, 10 Oct 2024 00:22:26 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c21616csm4413865ad.224.2024.10.10.00.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 00:22:26 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Thu, 10 Oct 2024 15:22:41 +0800
Message-ID: <20241010072243.10227-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_002228_463711_F3C34B0F 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

Add qca6390-pmu node, which is used to manage power supply sequence for wifi and
bluetooth on sm8250 soc based devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
No changes in v3.

changes in v2:
1. pick up Dmitry Baryshkov's Reviewed-by

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 3596dd328c31..ebea283f56ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -97,6 +97,67 @@ key-vol-up {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -701,6 +762,22 @@ &slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <40 4>;
+
+	bt_en_state: bt-default-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
+
+	wlan_en_state: wlan-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
 };
 
 &usb_1 {
-- 
2.46.1


