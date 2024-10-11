Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C99AD24468
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 03:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dRboePwXKGLUTBGbWr5cufVJ4O8k6LsI8p1I57NNJyw=; b=URfW5zDwaNWxCRg0yWxcm6NlqU
	ed/MKROToDW8lS78RVyWHC5OVflUg9gUZt8QP0TZU4eA/RJamz0tY7NGR+BiO9ReQuo5apf1U6V0Q
	8V3le9iBg9klZhuweZgo+fwrKSogi2aOyltCIdFSDvCiVRVkeWZiSpM8/91Rpyh9Z2KyiwgGBDtn9
	YLvGlfBkO1Mgv/tKNx7LZcAuSqgwd5QfTvsegYaRiL7J4vaj6Zl1/5q6IN359DS+XVcHHGGjvPFyy
	GBsi8/dsTJ6H/MknaY3nhRK5teyi+hW9oahaa3ybKPRmSXtyrwg9ChVXF+AmMFFhuNzcO0Ux0F1xv
	yDd+EwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz60c-0000000F7IA-2hz3;
	Fri, 11 Oct 2024 03:08:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz60Z-0000000F7Gd-24ZP
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 03:08:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B2eeUU028022;
	Fri, 11 Oct 2024 03:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dRboePwXKGLUTBGbWr5cuf
	VJ4O8k6LsI8p1I57NNJyw=; b=LzmBBDBdcg+/Qvmk4Ni/ruTxnG28pHWh+WY9hf
	M9A5O2mZaeVtwWYyoQYoUPB7GwX8e30qROR78j/HSXHPGxFVUvr7/A3A++E3TjvZ
	+Cc9+t5jdduyEdmHsxXJ8WfdY7MN+Z5XMKJilEWOYXCICtAb8lyW0SJFI686+g1S
	d/r45YAkmSGQrgQd6OZD9iRSNSTqyrWkds7UMUxd74l0PCvalRzYKw/Fb9SmXS8y
	d0v1fNb4tzeC0S3WqraFzXiUbVBFf+cIVsgGIf5IODPPt6hQMv0/4v28td6sHdeZ
	D8k2rrQgZwbc32u9jibwGM1ArhaZXHwnT8fVmvdIi1TR5usA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qyrk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 03:07:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B37vaG021192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 03:07:57 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 20:07:53 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <dmitry.baryshkov@linaro.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH v6] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Date: Fri, 11 Oct 2024 11:07:33 +0800
Message-ID: <20241011030733.2915321-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s_NgsNilO_Mgr8-wi4w8wJ4Fa2TZb-Kx
X-Proofpoint-ORIG-GUID: s_NgsNilO_Mgr8-wi4w8wJ4Fa2TZb-Kx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_200803_671919_5EB7B762 
X-CRM114-Status: GOOD (  13.09  )
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

Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
v2:
  - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
  - relocate pcieport0 node in alphabetical order.
v3:
  - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
v4:
  - update 'ath11k-calibration-variant' to "Ride".
v5:
  - update 'Ride' to 'QC_SA8775P_Ride'.
v6:
  - no code change, fix patch version.
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
 2 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b6..c41fac1eb6c2 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -27,6 +27,83 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_conn_1p8: vreg_conn_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8654au_1_gpios 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: vreg_conn_pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pmm8654au_1_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_l2c>;
+		vddpmu-supply = <&vreg_conn_1p8>;
+		vddrfa0p95-supply = <&vreg_l2c>;
+		vddrfa1p3-supply = <&vreg_l6e>;
+		vddrfa1p9-supply = <&vreg_s5a>;
+		vddpcie1p3-supply = <&vreg_l6e>;
+		vddpcie1p9-supply = <&vreg_s5a>;
+
+		bt-enable-gpios = <&pmm8654au_1_gpios 8 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&pmm8654au_1_gpios 7 GPIO_ACTIVE_HIGH>;
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
@@ -453,6 +530,20 @@ &pmm8654au_1_gpios {
 			  "USB2_PWR_EN",
 			  "USB2_FAULT";
 
+	wlan_en_state: wlan-en-state {
+		pins = "gpio7";
+		function = "normal";
+		output-low;
+		bias-pull-down;
+	};
+
+	bt_en_state: bt-en-state {
+		pins = "gpio8";
+		function = "normal";
+		output-low;
+		bias-pull-down;
+	};
+
 	usb2_en_state: usb2-en-state {
 		pins = "gpio9";
 		function = "normal";
@@ -702,6 +793,25 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		qcom,ath11k-calibration-variant = "Ride";
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
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/sa8775p/adsp.mbn";
 	status = "okay";
@@ -744,6 +854,17 @@ &uart17 {
 	pinctrl-0 = <&qup_uart17_default>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &ufs_mem_hc {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index e8dbc8d820a6..8d42b5e9c7d6 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -5570,7 +5570,7 @@ pcie0: pcie@1c00000 {
 
 		status = "disabled";
 
-		pcie@0 {
+		pcieport0: pcie@0 {
 			device_type = "pci";
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			bus-range = <0x01 0xff>;
-- 
2.25.1


