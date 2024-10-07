Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C8CCFB444
	for <ath11k@archiver.kernel.org>; Mon,  7 Oct 2024 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZWMilAdAhXOxfk4TdLStJoaJ1G5RmvUuFw/ETpmqfO8=; b=sqpFuxPTPnUewqjDIYZ5QN/xA6
	jMNxN694p3hsn3cfOBMehFkL8IJY0w2lBBw4h3slMdhSPzsk46HHrLKAIFV3xFtzrzZZwLPpvzMxO
	GVAV3xq7PXmiRnkNZWP4quLZ6KWePrOnMo4lo25Ojmo3qXDRXMRjhHi1qNnRQTsilW2SyhNsY0VHd
	9PUaUlUddKhPl9YJ37g4n0/TtdT63JVAjwbdK1IIU66gQv4st2nwYBGLVosuDKi++kX/DKbiWHiyf
	TRIpIFNLZHcqdZBqKnm+iLKfFZVTmJU3PXCHUrgjcpPVPBvyaDhk5vYPc+l7SPIB5+ZVB40qZ6hNQ
	HvPQSmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnhK-00000002UjV-1YoS;
	Mon, 07 Oct 2024 13:22:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnNn-00000002Qwo-1qPt
	for ath11k@lists.infradead.org;
	Mon, 07 Oct 2024 13:02:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20b90984971so45482435ad.3
        for <ath11k@lists.infradead.org>; Mon, 07 Oct 2024 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306158; x=1728910958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWMilAdAhXOxfk4TdLStJoaJ1G5RmvUuFw/ETpmqfO8=;
        b=XqGZoY2fTn/Um1F5GobIrOjPBKMh0fN8AegkspssAku80CJe/FZLByo2EI4iEqlZZf
         dDtCC75MJZ6AOCrOoU3ODDgH37qPq1kb/+s3BSmO6ZlyJWFghZqm6JVCKrWpMyUEI6yl
         jrh+PpVLf97ahUJlzz2lGi4CwOLfpGeIeUiK2AxkMT1YlxjHkia/Qx93HGo8JzpteI9x
         o1MEfb8my5syaGBqK/Fp7vwyUxs7+ZxtPS4p496lUnntek+OvuFwfu8Ruh7IriiODMpN
         n7Mo/EGG+2ZaaNHoMG505v3TN5yLTSNc9HNQS1meDy6DlYUc3fyYVcRlVFGLTmPmNSu9
         4ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306158; x=1728910958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWMilAdAhXOxfk4TdLStJoaJ1G5RmvUuFw/ETpmqfO8=;
        b=ceLxpMyvi9bg+ei7rqSBwnrm/AH7qOIorC04I7s3Pai2A8YA3wCu4Dub+tA+AzdZrk
         alSPn4Jrv2cn7F6Jot489fWx0/ld7r4qAt71JtAx595764pjg9ljLkTfDpzzRW0Ae9NR
         TlJvkqms3kQqFsRq5iS2roTVx7G+NMp5P2QTwHYhM62XRrNxxkF5YZl8dV1Qe0CuDnUE
         b6jhO5Avg2QDWZYErbXXWlD8nc8mXEPrsVC5OiIeQ+gFinFs4Gt9YHI23knESG5w206i
         2zg85d5AtrRNEwyKqj9f91i/1iqFDqmBmLmjAIysrQtNFbMEK4oucrsEtnq+RgBZ+fVD
         Ma2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVje+KKTroqWWP6nyGEHHH98XhQPqka36aWT5QsDymiWyi4JXqUYibSkhOttelf33HZa9A2gRQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyN3CGHhFbgilh09x1YopaPEI+Zn6yvJVIqQghL7AoSdJY9Mijy
	+L8wpE4bXfzbYrZ1ca3hIPIhTuu+XQlcsxMg7l6f4gkK4/BTGspiSNlKSQ==
X-Google-Smtp-Source: AGHT+IGNUSBKOHPdq8ZkRSZF/M2tlelAs87E7dApEhcF1aDWG6JeTrj/gl/a6o1XgptXcmacfg3L7g==
X-Received: by 2002:a17:90a:db8b:b0:2e0:7495:93bb with SMTP id 98e67ed59e1d1-2e1e631e1b0mr13471545a91.31.1728306157731;
        Mon, 07 Oct 2024 06:02:37 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b128847sm5306654a91.49.2024.10.07.06.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:02:37 -0700 (PDT)
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
	Jianhua Lu <lujianhua000@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Mon,  7 Oct 2024 21:02:49 +0800
Message-ID: <20241007130251.125022-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_060239_497480_AB5942CB 
X-CRM114-Status: UNSURE (   9.35  )
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
2.46.0


