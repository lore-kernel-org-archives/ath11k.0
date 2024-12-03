Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BAFE6C609
	for <ath11k@archiver.kernel.org>; Tue,  3 Dec 2024 06:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z0fsV+QhBSZIl22aOSwtQDjFAPpIBmujBQC0g8Hc5sA=; b=cQMKRlIPrK1e6w6MOnyd1WYnRC
	V3G/hZ7HPwqYb8G0DZo5ZOtjFFwyFlfCgN7udTOys+ANUJIo9G4G9U57fY4XiTSaBQBJhvlLATFfl
	LgHmo7z9Dlk62QyhWkKewMjUn0mOL4ZWDPc2Qx+mpOPcnrp/VfIMHRAHD0w59GcaUGTgMAk0lPRZz
	VEpCaLlm+JWpx4URVORLWFRjYoueLmCPGinbbznRDS4sMwUrPBNVHmvWUKITD/pBMnuCtu+IAFceh
	dQWGiTrv0cJhzIAVAuKrB1B33njCpajghSxTm3gCRuX3+hmBf5YjYQagAZ0w98WAsbuuCpbuTtSz0
	vWw9C+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIM0r-00000008MmP-21fH;
	Tue, 03 Dec 2024 06:03:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIM0o-00000008Mll-12Yi
	for ath11k@lists.infradead.org;
	Tue, 03 Dec 2024 06:03:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2JiN4b002455;
	Tue, 3 Dec 2024 06:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z0fsV+QhBSZIl22aOSwtQD
	jFAPpIBmujBQC0g8Hc5sA=; b=pZk5Er997gON1Mnm0wb1wnkGQEFoAo7hQ3ijFe
	e9+UglvTRKf5G1g5wq45qCeiVLEk6uAop/Yn0TVrgdz8lQGMJKoQwK9czo3v2o7y
	mddLSmLsLwNCOhYS13LcoggkaR2189+bssffq+WLs0lL9UzZkOs5XhctNAJJdSUv
	bmU72JJdKsf6R9WD6yBvxhQtEA8D55Z1V5/+k3dnJQC/Qfp/38iWNAgSIfb5ROFL
	TW3RYK2fOcjjyDBBW/G3ZtNQRVUVmFZVrpgBrouR8XBTrUJgSQfwOK5vskkUVeBU
	QWDhgXxk4U9kP7pl4lcgl7Pu2bciE6H3o31IOwalXzORttSA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe6xf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 06:03:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B363mhK026728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 06:03:48 GMT
Received: from yuzha-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 22:03:44 -0800
From: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
To: <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <agross@kernel.org>, <ath11k@lists.infradead.org>,
        <dmitry.baryshkov@linaro.org>, <konradybcio@kernel.org>,
        <kvalo@kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <quic_jjohnson@quicinc.com>,
        <quic_miaoqing@quicinc.com>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <quic_jiaymao@quicinc.com>
Subject: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
Date: Tue, 3 Dec 2024 14:03:18 +0800
Message-ID: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3zLnB5VLGS3Nnzl0D_S42mTghQM7aLEa
X-Proofpoint-GUID: 3zLnB5VLGS3Nnzl0D_S42mTghQM7aLEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_220354_292867_B4ADEA3C 
X-CRM114-Status: GOOD (  10.33  )
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

Add a node for the PMU module of the WCN6855 present on the qcs615
board. Assign its LDO power outputs to the existing WiFi/BT module.

This patch depends on below patch series:
- base
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
- pmic
https://lore.kernel.org/all/20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com/
- pci
https://lore.kernel.org/all/20241122023314.1616353-1-quic_ziyuzhan@quicinc.com/

Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 66f99cd860b9..80ae02ab2a9b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -14,6 +14,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -33,6 +34,83 @@ xo_board_clk: xo-board-clk {
 			#clock-cells = <0>;
 		};
 	};
+
+	vreg_conn_1p8: vreg_conn_1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: vreg_conn_pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_s5a>;
+		vddpmu-supply = <&vreg_conn_1p8>;
+		vddrfa0p95-supply = <&vreg_s5a>;
+		vddrfa1p3-supply = <&vreg_s6a>;
+		vddrfa1p9-supply = <&vreg_l15a>;
+		vddpcie1p3-supply = <&vreg_s6a>;
+		vddpcie1p9-supply = <&vreg_l15a>;
+
+		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
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
@@ -231,10 +309,33 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		qcom,ath11k-calibration-variant = "QC_QCS615_Ride";
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
 &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
@@ -262,12 +363,42 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <16>;
+		output-high;
+		bias-pull-up;
+	};
+
+	bt_en_state: bt-en-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-pull-down;
+	};
 };
 
 &uart0 {
 	status = "okay";
 };
 
+&uart7 {
+	status = "okay";
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
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 808e42f799a6..8465e96e0e8e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -819,7 +819,7 @@ opp-8000000 {
 			};
 		};
 
-		pcie@0 {
+		pcieport0: pcie@0 {
 			device_type = "pci";
 			reg = <0x0 0x0 0x0 0x0 0x0>;
 			bus-range = <0x01 0xff>;
-- 
2.34.1


