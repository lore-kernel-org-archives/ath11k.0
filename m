Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB972D24468
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 03:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6f3uHrKBFZE0TezqG7rTj23m1ABTyz8fgG6j+UM3RIY=; b=RmY1CzM14NlhpDnKTm4rCCEHlq
	88bJkprKqJjL+qJLemAvK51f0ZCoMI6wWQTWvvJS3UuuM641IQDWCq6Ba/0FmpCg65hFbGei7ItY3
	cV7a7lNwVQAPldxTmczO2sCeBuHpo242xs2O/ZE9rlXmBV5Oa2GJ0r92Icu1Xrc+mhq/iREyxdVis
	Aln85qGQQWHIg8xAjkU55x3ew9FzmMfYwx1Dl4QUL2Q4I9tw6ZkQaDccjPo9DyqGclCWlUOy87euW
	+oDWD1lt7fu3BhYwSW1lfTfogRdj+L8Er6SUFGZtSK3JFi10ljjrD0vzK5XgTc8tIVsFDaU6KM5KL
	2dmo/e2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5vw-0000000F6tW-1lEg;
	Fri, 11 Oct 2024 03:03:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5vt-0000000F6su-1wE6
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 03:03:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ACSQX0011418;
	Fri, 11 Oct 2024 03:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6f3uHrKBFZE0TezqG7rTj2
	3m1ABTyz8fgG6j+UM3RIY=; b=MqdB9Jo9sUkxOLHvK7QpNrh+ZOX2wEIKzUEicu
	MT6514d7zJI4z6BNgiXMhhfc06ViRBOvVO0Nj2XcshACaWwMyjCmvrxqP3WTD2vm
	DumIX8DgJ1Pbg88hx/r6Zqztut+7Ak6TrHwseWlF+VmWND2TFKdDilI5hggCHJQL
	a5oahs1LPsdOT7Tk0SfjH2PuzosRBpRwLhwhA5NpghDiRqx5MNrxQwBUDKIudCPC
	0TWZRJmHmBcwR37Ows4PWYmPt54kZsjxyR9LwNwDG/XJA9eqQHmcfgKxV+QLK8Hx
	77t9ael0fHBj6EgLG8bNfGt7O+3RzNMFQmX9CAJQav3Td6Sw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xthvcfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 03:03:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B336f6003325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 03:03:07 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 20:03:03 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <dmitry.baryshkov@linaro.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Date: Fri, 11 Oct 2024 11:02:54 +0800
Message-ID: <20241011030254.2915173-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uSvkxu_kZc3dlzv4VtXSbwQNcn3-QWQD
X-Proofpoint-GUID: uSvkxu_kZc3dlzv4VtXSbwQNcn3-QWQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410110017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_200313_534652_26C05F70 
X-CRM114-Status: GOOD (  13.41  )
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


