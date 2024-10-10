Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4ABCF07BD
	for <ath11k@archiver.kernel.org>; Thu, 10 Oct 2024 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKw/JoI0r8yQE1Dp1vopxnWx9JbnMVopH/+pwaMqF7g=; b=U76yiJe0+hITSS2oDLWtUhWw4f
	ZUCcOFWbas3n719fYkzBK1nJUJF7WCeAphMawH06IX9jl6o4RB/AfvTKvEV4vrZNCoxwAu2t0h5Gk
	qLKnqlBaKUs4aJ+9VGJ9ZpJwPvtfA5qNYyMltYB+xh370OCanVgjIhPwmEckgdU7zuMn1S2UIn8V3
	Ys9fEedVGU61OiN6sLm+t7/BUjRVFUqmjeisUexJr1hxfkH2MlIJe4OxIw8EQ+n8n198MDGsLyGoV
	whWrL9aiBhbZzd8JDlhO2vigyhyO7wEQeN2vAEXwe4ecPDSNFpDwDsiYWWeGwz4XqK92lwAGVUVWl
	ZoKtQkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syntF-0000000BryH-40ur;
	Thu, 10 Oct 2024 07:47:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synVL-0000000BpO1-0MTH
	for ath11k@lists.infradead.org;
	Thu, 10 Oct 2024 07:22:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20b7259be6fso6353345ad.0
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728544954; x=1729149754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKw/JoI0r8yQE1Dp1vopxnWx9JbnMVopH/+pwaMqF7g=;
        b=Vtg0H5b2ECvKWxmJtt5nmzWmvh/Qo+rnUMS5lOd1SAmRroVdqCQs9B/iktp60VAzjR
         d0y3+RxIN0j/lCKOWUU/H2Y3GEzRYiUicVVuS75DZCaSYyu8FJfn96JcVgiY2BBGnHH3
         cAf4k5TsnsMJzfH8OPr8M5hjrPfBbnS4zCuIQ1Lr25icuWYIz5P7Dp6w8sLMx9SAtpqg
         OC+4b2H/5gAv/gAwFoZcdYZr8bOvNTUzyXsiD7xjjmpXM4w3wZTISfJdHRWmuWcweggF
         d13+/lVMoR48wFj0Lp+GWDW4VPIwVQHDnP418aW9szWHqWGXmwprvYOo/naVLm4GFptl
         YC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544954; x=1729149754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKw/JoI0r8yQE1Dp1vopxnWx9JbnMVopH/+pwaMqF7g=;
        b=QqIorCmoL+kFTKwXFR+6Gw4hOgljDxa6yux//+HTX56WUrmVpVSvgP1QnwRtegMdKA
         ExScgAAqLpF1vdtIkXGNnqavtzwHUAu4A38eEGnkWg7eLxj8NCqxy6pceal27EAx47fD
         6gPQP7Svs9z9x1TwjcT7BlRzNVVtWJzO66DaeBeFbhHtOQtmx0KbkbI8tX/c4451+u+Q
         QqxPFvqkpSTGlW5jeMJ5UMmkVRNOrySV53nl4VIV+/+M+J79MzJ6vUZqOkI+BYvj9QYx
         BGmFuHFkfCe1P6ElwUT3uPQYvZ0fduBMC4m2xeeU/aIKR/pyJBw6YpeBRQ+grbW7uGl/
         6Ahg==
X-Forwarded-Encrypted: i=1; AJvYcCVXew4LPowa2RGhv/PGsvjFRwVVZCjWL16jAJKnZrTHvLAaEVfi6JBdJc3AZ54uaB6ae4+6SJI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4JKovvS5B5t8Gp7KgV8wDCNvE0e3wtXlQQKTgkJvvKqmDNUrG
	UgmU5ZjG9hWTp+lhcbOJN5K1WzPicg74YqzDYBDhGZ4IS5DlM+Yl
X-Google-Smtp-Source: AGHT+IFEq4jKqyPTtrzF+iLBOHfODKPUhCo/6KznjZq89UYKbOSWLmD2ggVpEKQQSFSYTEieqOZZ6A==
X-Received: by 2002:a17:902:f687:b0:20b:a9b2:b560 with SMTP id d9443c01a7336-20c636d6b88mr60719135ad.6.1728544954238;
        Thu, 10 Oct 2024 00:22:34 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c21616csm4413865ad.224.2024.10.10.00.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 00:22:33 -0700 (PDT)
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
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Date: Thu, 10 Oct 2024 15:22:42 +0800
Message-ID: <20241010072243.10227-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241010072243.10227-1-lujianhua000@gmail.com>
References: <20241010072243.10227-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_002235_166123_4BD60E1C 
X-CRM114-Status: UNSURE (   8.57  )
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

Add wifi node and this wifi module is connected to PCIe port.
The following is qca6390 probe message:
  ath11k_pci 0000:01:00.0: Adding to iommu group 12
  ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
  ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
  ath11k_pci 0000:01:00.0: MSI vectors: 32
  ath11k_pci 0000:01:00.0: qca6390 hw2.0
  ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
  ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
changes in v3:
1. fix commit message typo (pice -> PCIe).

changes in v2:
1. add qcom,ath11k-calibration-variant property.

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index ebea283f56ea..7a55e271c3ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -680,6 +680,25 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
+	};
+};
+
 &pm8150_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
-- 
2.46.1


