Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0796D49771
	for <ath11k@archiver.kernel.org>; Sun,  1 Dec 2024 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=68qOEfz1vPxOdGT/qDD3DqkJMDn+2pl3Ld7n516swbc=; b=QB7kgGnWcWx1OyiRsoWx4y8P4f
	k3Rr+41EsTSR5c268EjZlX6q4t/yCLGGB6ZJHOU7j46You6bZ9RX+7tt5r538/09QGScSyV+s/swx
	LquuQubD5eiobSk3teob5EnH9/LnqniJCaEg+7VQTiaFC1aG9oO5NOFrWtXohOhjkWLV1+wMbA/8E
	NvkLYiwFRs4mK//voRDLfkTL/E2Ml/WPgRwJAHtlrW1pveYc/Ek0n9FtVz/ewap4jsBZ9sKkpVrNQ
	5bSapOYwXmu2ZdtewedbIz8FRVyJ5jc0rL1dDGeecDJ2PM4YlPBibtz2dNYz7KSQJL/c62zXDIj/U
	Q5Tco3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHkRT-00000003sAo-1AIJ;
	Sun, 01 Dec 2024 13:56:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHkRR-00000003sAO-02qY
	for ath11k@lists.infradead.org;
	Sun, 01 Dec 2024 13:56:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ea39638194so2726509a91.2
        for <ath11k@lists.infradead.org>; Sun, 01 Dec 2024 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733061412; x=1733666212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68qOEfz1vPxOdGT/qDD3DqkJMDn+2pl3Ld7n516swbc=;
        b=GdMPgkreg3wb5EtGY1Mc1Daffow/Erm54crq13NUkPsqhEfukbFrhJJsbzeU7oYovb
         nsO6K3cTyD92FSlu+TWrO3f4vJMiXXUb+kGqQGC1xOkAh8MSajHH/BYZ1YPb2vOBTktJ
         zAWBID+z+I3jGwm1Gbs+Jy0/vlBsAMMGoO9NRpLXMlB2VVqA4n5aFC9OdBaZPIm3mYQL
         Sz15qZIpSZr9wH3uluVktn9Ybwgpzj1IDVDxLEOfsOEqyX6OhMD7uyMhk6vYPlvtYynv
         VV+DWYSN+SW1b6KeIlgBDuor1Zl48/3SuXSH8ZMJVMgVTg1Kdas8BoEgZRWgQEeQJSAR
         lTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733061412; x=1733666212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68qOEfz1vPxOdGT/qDD3DqkJMDn+2pl3Ld7n516swbc=;
        b=MViiFmwKnXlybS5GxaCEK8CSVWHOEGV3dMaRagNprWe1Ql/XiHOfwH/J7T1q9nfcAE
         l5ee5rhg5ohoC3oa7YxdSZWd+8gGsWAMX6bm1l3PUVLEOskdMgCEMXCWKywuon3uUG0W
         YgWZz3Vd6niZFtRThLQ+faPW39rUV3brWD9n4uhXlYS8QmEGd/Rv4d3UP6RpN+fi7NmE
         t82XCj+MFCk2Kh+dPIHber5jkvly+Ap/CQI6JZKfc+rvag8HgxbtXD9mH3DAQcLGTAtF
         Cj2xhFnZ41N/wdV1vtqz3w948c6IGrdo5q/pNYX7aIni62VIdbPoE7I89/nBxkL+603T
         ouyg==
X-Forwarded-Encrypted: i=1; AJvYcCVGzR4t/706fOFXgpxs3UfOaO75LNHJZxw8xHD/pmJcS3ONME7Qcr/C1RFez/FkMMXmPlVAzBM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4dua6lmJYLEF44dl9coTw6HW1+e+u8uw+f4ABSuYOMKABwRB5
	ujFFZgnLe+2QvsbYPR4wcaEZp1y6ikR3a4w2WPPpSoYXEt3W/w+l
X-Gm-Gg: ASbGncsW0YAg3FhWSaAvTe6K0vwV6mqsSTJ04BS8spcwpQkvmd6YmxQ7Ea9m8MpjPZz
	Fb7wAi4OHFOCvyS+cRHEcFq+t1dcqTEuMeJDTXDspG0SHAp/tCdwTFaQvpmRkWsIoHA+Hc/xN9W
	9OQbtVUzoA7Ajx+bAFSqykw6UpIE9IVP0GgkwAIbBIOh3y0+HZ00qI9Gpa51SsdytCPLtWfvRUc
	nxPdxj/X7iBnt3nNFgAer+Ai+hwlrxsSRc+jurDjh5fjR6D28tUtroyJWa3LXkOEQ8e
X-Google-Smtp-Source: AGHT+IEcWG91ybB3pH0MNUfESzU2Qoj4urY068Bf5W2w9eg8ERP80rvYwF6TBYDBIFki5QYZeDhoDw==
X-Received: by 2002:a17:90b:54c4:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-2ee097e3f10mr21172187a91.32.1733061411488;
        Sun, 01 Dec 2024 05:56:51 -0800 (PST)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c30e2d8sm5260617a12.38.2024.12.01.05.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 05:56:50 -0800 (PST)
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
Subject: [PATCH v4 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Sun,  1 Dec 2024 21:57:14 +0800
Message-ID: <20241201135716.141691-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_055653_045830_345E3F07 
X-CRM114-Status: UNSURE (   8.07  )
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
No changes in v4.

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
2.47.0


