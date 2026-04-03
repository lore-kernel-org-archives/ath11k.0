Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0145EE85371
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPHsiCpdUUXRFvwRdI2OtsPeWnYw906MZTDdwum5VRU=; b=bkAKAzy7t0b54txRh71IJF/34f
	CeYLpbclwumkSmcCHUgW9tHbLml3ZM/L80+5ZtnhXBYHs1RdLnj34H44LR32JFnsBnc6QI/oxA3NH
	1QFelSjd777TDOMgeujPZ2u0GYorv9ORKinJXceb7/2JRCBwkY8PX4u6buZC0nJDwkDnQuOclJV0y
	Aee6nMsvGQ2zpD0oYKeen006McqS0EziTGsT0VxMV0Pod1p5mw+76h1zDhCJ+6BfDh6TVy0kCi20k
	nSgezax5Z0UuO78+ZoeRUeT+catcQsMjbORjR4AUN+NVhFrnwRk4QYkDWXMwQvS348u5by8+tc4c0
	oDSNK/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezf-000000026Q4-331H;
	Fri, 03 Apr 2026 13:55:27 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezc-000000026Mu-1nsq
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 13:55:26 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso496612966b.0
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224522; x=1775829322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPHsiCpdUUXRFvwRdI2OtsPeWnYw906MZTDdwum5VRU=;
        b=Mnuwcg+CK3mCkmDCUbWIw9vIcnY7I1ajVjdVzsfetQwzwAfZ5AXXkqYaTba51RwVtb
         21xPBbAQKm/BXcXopIAjKE1KQBHenkCGUkQaFD1kN7NgcyIffjUCz8DfCzq/7M0cZfjd
         lpZfenMjegMhw5+0qJAvEVu2KgePh+6vql6Z52EDD6BRMmoLEMesGlqAwOZ7ncHCc5Km
         R/DT3yWVC3n0YsG4mROg4nfn1D4it+YhP6uNgT5S8Qb51j8adMzrwHInqAwoi9EuvRrX
         CuOsdA7487hKXD1BKBW5c74xY531TmtXTk9lMANwqJwNWSKbewBqdDyzwZ5yW7dN9TDB
         LMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224522; x=1775829322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EPHsiCpdUUXRFvwRdI2OtsPeWnYw906MZTDdwum5VRU=;
        b=Y3KhHXtAbbbXvlSLXb/oZa4unwiNYI6RTy0gu9AZuzxX2tqdQzGZRkI+LgubhDHWPY
         LLpk7sLbH7fA+bClvmACzi89lpoC+cY+1yor5xjWmwE/A3VD37dwEEAZZo0N5DS+/cho
         mN+sJRsNTezHSDsAyXDOMXiCYF3fyGuausigQJxnALPjR+V7kb3z1xagG65txg01bDCz
         iF5FzMoIia76+k2QGwwbuczJG4CNACmc9zggDYkHYKQtswL0x7cHt7c1HXhqJ/+mAOet
         8lQOkMYj1gfwDbp7RXAodJH1EjnJB1jbQUzBpam6147garg3UJLyWzLJRvvp9v+NxiaK
         jaSA==
X-Forwarded-Encrypted: i=1; AJvYcCXS58Hk6sk5ysp5ahpEz/iwHOnnKa7VQ4FMkZJmD8fHTr+Eldx+jySXi1OEgaMNASsauYYDjiI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCiCcs6Ea1ZCA9CLblebM45W3YE9C6srjv1QdXeHRNbWviDIGn
	PXzJ/+3GHA4C8ewDSPa8D+tdHS6+LvSK25aCHK3iCcaM2NdKTsUBv8XmaPsfo6tYK71ZUUPyyKp
	yxToD6Sg=
X-Gm-Gg: ATEYQzwdEnbHoJx/ymeFMWW6zBvduCx1X9m9hAoVXmgTq8Dwvq3/E+nlTGdINNoyxxv
	KQyqFRmN2P1XAOcw+u6Z8vA/ULF0prPi/6EQrpntcSbnde63mt8yJuTMwSYW7WW9f16JbiZi4KF
	+yrLdGNSAqVkyhsxreViP3j1MtdAyqPy8jfF/YSvONuYCuVLepuc6U6aPQpi9HlyjF0eai8iQIg
	WV/1atV6eO7TpFI9MjKV1IaXwGLEyc2UCZyjpwiE9FdHGit+uxEYS2tvOZRR8SzzcgfhVjy8GmA
	S0AvM7gVxXhOJmkbf+uCUYL1qgGO0O8mu/QhyE1+n51Gwovm9ipHQE69kqriramicVOAPGbP6os
	jxPOux7zj5wwR7QY8Ci9LMRX/eoSKt/fZj3UreqKocaTvRMUYDorHRrDsuRG0R38Sn8Kcg5QhM9
	2l4s1oRWhlN8G1Qe/GfaUHo3NhHj4JXn+gWNr1zEtG5H95PbhrpdGRReDoyDE/0uYfwMi/7Chl0
	MzAVFb928d/SCTEUzNZINclbkCHRk7GfgU1Uw==
X-Received: by 2002:a17:907:3d56:b0:b94:231f:26ca with SMTP id a640c23a62f3a-b9c46fedc37mr308190066b.20.1775224522291;
        Fri, 03 Apr 2026 06:55:22 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:52 +0200
Subject: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=5650;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=akUQPIrMgPWRNFtOss4vuRIj1MAE0awNf856ZYFJhDg=;
 b=dyYdc5Ec1aiox9qFG4Riy10GAz315VOhkO2VRCASezMRP6RTMEzf6wuziUmcu2DsGn7c72cho
 P8++lG8qX9OCFoKmQAwkmfYwCfcltX0EMy6Baz9Am39oTehVbjctRh/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_065525_340816_8F29FCCD 
X-CRM114-Status: GOOD (  14.73  )
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

Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
parts.

Thanks to Alexander Koskovich for helping with the bringup, adding
'clocks' to the PMU node to make Bluetooth work.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e71..db72418b7195 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -24,6 +24,7 @@ / {
 
 	aliases {
 		serial0 = &uart5;
+		serial1 = &uart11;
 	};
 
 	gpio-keys {
@@ -225,6 +226,67 @@ trip1 {
 			};
 		};
 	};
+
+	wcn6750-pmu {
+		compatible = "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";
+
+		vddaon-supply = <&vreg_s3b>;
+		vddasd-supply = <&vreg_l7b>;
+		vddpmu-supply = <&vreg_s3b>;
+		vddrfa0p8-supply = <&vreg_s3b>;
+		vddrfa1p2-supply = <&vreg_s2b>;
+		vddrfa1p7-supply = <&vreg_s1b>;
+		vddrfa2p2-supply = <&vreg_s1j>;
+
+		bt-enable-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-names = "default";
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
 };
 
 &apps_rsc {
@@ -752,6 +814,39 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_uart11_cts {
+	/*
+	 * Configure a bias-bus-hold on CTS to lower power
+	 * usage when Bluetooth is turned off. Bus hold will
+	 * maintain a low power state regardless of whether
+	 * the Bluetooth module drives the pin in either
+	 * direction or leaves the pin fully unpowered.
+	 */
+	bias-bus-hold;
+};
+
+&qup_uart11_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart11_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	bias-pull-up;
+};
+
+&qup_uart11_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -810,6 +905,59 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	qup_uart11_sleep_cts: qup-uart11-sleep-cts-state {
+		pins = "gpio48";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart11_sleep_rts: qup-uart11-sleep-rts-state {
+		pins = "gpio49";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart11_sleep_tx: qup-uart11-sleep-tx-state {
+		pins = "gpio50";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart11_sleep_rx: qup-uart11-sleep-rx-state {
+		pins = "gpio51";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio53";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -836,6 +984,32 @@ &uart5 {
 	status = "okay";
 };
 
+&uart11 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 =  <&qup_uart11_sleep_cts>,
+		     <&qup_uart11_sleep_rts>,
+		     <&qup_uart11_sleep_tx>,
+		     <&qup_uart11_sleep_rx>;
+	pinctrl-names = "default",
+			"sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6755-bt", "qcom,wcn6750-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 167 GPIO_ACTIVE_LOW>;
 

-- 
2.53.0


