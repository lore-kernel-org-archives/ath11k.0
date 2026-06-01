Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA25CD5BD1
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=; b=Yk0iRo9HJtQkRDS+yIVEk4v5Mm
	380wnrQFiBp30ceuvW5VyQHXphLDG43jb9JD9aTRvPmJ4+Sx3rAmZd843j1UwBUa8iwvoT3kJP73o
	1NggoUMIkj9C14TbGo2+mQb37ClWJnOz22bf+cb8K7jeq6T6Z5BJzbVVooWJfPIBFPSu6J29nPLfW
	62v/4+0oIzmcdRLaDhSPaWhKFU5m3R8Bb9pNlFDDLgeQLwmtFCIoSTtIl6xt/jZJC+3FZbXxxqyz1
	EFy7uprhm1rVYI4PGXALEhqjdV4IVzXae4GFEMFi/SToDqhxhhEd7/+gyJA1TUL54ddKmdXiPCCfW
	9qTpXDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEk-0000000AWBM-29zF;
	Mon, 01 Jun 2026 09:47:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEi-0000000AW9g-26RQ
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 09:47:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6517N19x2882669
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 09:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=; b=iq3Eq1uJy5sqIyaB
	HEeTyGysoJFEbltXLV4EGShG2OY1eXw99X6JDSbw21wY57+Ry8w7iqhCG+9pc7e3
	WTNa9kgWHeLANCjlgSA1mPJQUkFMOPzJShC78ifs1DNraLkHfqEAVLiBMbtFVrCq
	ZPUxTEi1AVKlWjoHniamktcwbrcGahmyziNw/5CF6V68ltzeyxDo9VU7bydmkJGs
	dqBtOwayhiZokYmcjfP1rmTJ+DbSWLcZKPAR8nOfV4y6IDrpD68FV/UAsTQVp9ex
	zcGpwK3XS2dGoXKO+/0lV7vqhQ4y8b1210ygEdjfdIcPyydmQRfh79lAKR+taZiK
	LTRoAA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7ff0w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:47:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174d1b326eso30035411cf.3
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307227; x=1780912027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=;
        b=SaFgAi9EFIzxmbTXaKVXgvlavRpxRYM1nLRc0wqcy/Fk/CRBwoIrm10cqUw/sk/tNM
         JljtJvcrqCbMRPgfCj0hrwpgM0c0qVHv9EKGCJ5+AJe5LlhY58wYIhzIfSUomsHz7gLG
         eYXwNqzj8GgbAaExuevq/f3PmCjzTMXOAZTqxwahEtrycaNIaLdv+yzbsN1q+ynzFQzR
         yFkYyeX11PGWhnIfP/u0K3wKDUx7miEMPBJGsi+zvHlglkQ/9M39qcOHVdXdlI53IF3t
         CFsM8VLE5wK4MD9UsOYJ8E6AadJ0fwoSuiBzkO3YBH9POZeNmbImgUAzU+2OykYx1Ko1
         kvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307227; x=1780912027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32iMDaQ3qO7lDTIoDuzY5zW3z4FbD3aMPXHmlVvtKpA=;
        b=K/QWFfwT6n3zTvKFLI0e/ZqxZM0NAT7dUE/LyFSzZ2O0XYjOpNB5avvH4zF+0/P3J9
         Ke66VcsFBw0CemZvhWGQggJx8jDpZIoCaftdBUVR2CFpqx8YWg519GWVQcND8CcLCnau
         XQisTDrFkGgTkJdBuRclnoewjpVT2I7jnTLQYXsWH2MG6EUk26olq5VZA+kEXOy5OVwV
         p8qdR3ULVheW9NnMfDntBHzStfyZVpOOFXSoMS45QDqoXEId5y8HMOzSVnIyCZm6uBt8
         7lB0w4H94RQHlTP6WZFfDIh/g7F/r8tLcVhy3t99UOnOxufqsgmMw3g1gQ4SwI1YTm7q
         WC9Q==
X-Forwarded-Encrypted: i=1; AFNElJ88q9tQ6Nme0XJNQjI5z2R569Tj/wovzusdCpEtdsc+SC5+DOuUSF17osdXlvBtZzm8wFUH2U0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDFxpz4WMLD3NqaPF+Cx5nQKw9Afqfp/lD/yUQ3XGAfSrypjjx
	07NsHUogpSV+MYe0T8QUg0RUvCOxs7U9O0AHahQbG6CDc/YoqhVORfsDNGNLHOeM2+Ay7gKqUBD
	/Lkh/ByPFawYCJIGBlF3v1gnxAUKfwdF1EVk5D9EgJoe/krXd0wwNkZ2n/lnUbJJ1
X-Gm-Gg: Acq92OGBkpBlwtdUg76wlbvJ41UZPWVxs6bqzxRIuEV5Rt8vyG+lmN89NrC4thdXILn
	SsQ1etGGm9S7RfSvkhMcH+zSei1q4udWNRUj1YwPKbR09Po2GmO0ubpR33Bwa0WPBfKbky8sjc5
	kRaIT/V8g5SHrvQN1ZCjRgPoJ5jI4CLsAU4P5liRLetBaPMTQseEFL5yUZt301Ty92rkR466dSc
	w1Uq6SQvpaaXJr88UeZo7+UzOPnjYmBsr2taVqUNOhTTO2CEvSCrlxcJ3uFJeig5SDiGMHos/iI
	j4GW5A05ZQttISh9tvs7OzkjG+KZ8Tr5+kNi+48JeD51Z9i5RG2cli3fOwxVKjvAC5bk6olLakN
	UEDSms5OCwMop2wYFPwFm4VPcYcUEbp9cN/JFqVVXK8u2bj2A1NzP87WP/D+CLoelvo9V1iaP/I
	8upGDOPB+2M5D8UeFUjTZK2u2fE4teFtzp35W9dEG9xf+KQg==
X-Received: by 2002:a05:622a:299b:b0:517:58f6:29c3 with SMTP id d75a77b69052e-51758f642edmr25765551cf.32.1780307226576;
        Mon, 01 Jun 2026 02:47:06 -0700 (PDT)
X-Received: by 2002:a05:622a:299b:b0:517:58f6:29c3 with SMTP id d75a77b69052e-51758f642edmr25765361cf.32.1780307226184;
        Mon, 01 Jun 2026 02:47:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:55 +0300
Subject: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6120;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p/vEWXfWcfITuHPO9mfDyXFqaiM3ASW/1cHspYUnUG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVULHknQTeqgXWLpTQtoBAPOcZ8nrUprloMHR
 HJqLRInYkSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCwAKCRCLPIo+Aiko
 1aswB/wLWeCDt7fqtyhpWQItLB5x948RgkF3AfS0s+K8vCNS5F6wN12TNHhnvx6N92e7SeuS4/O
 pbuLBC4kiL5kaoUWP2Y2zQ3KSWOUJWD+rWVtpA48mrHt41PQJIlx4L+YFCCLVPhZYsJwM9AsJFq
 0Z0rXdQuurtvBjuJbjkZEra7j+3bJMC6mOC+vkVWFisrSPB8txE20LJCRlZ+T8zT0MxTNw+g4Mv
 f9qnmUd5tW+23KQEPL/PK8+GbLTgxdPT7RqFbxhnPP+v+txO1Ku6VgmYnPSDBsruBI0FWtzcq3q
 EtcYzFmbprwQUCgBkP1sBKeckGK9uTFw4M3HA2jL2HVKUFn/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1oVxUIM-sx_EIQrr3Qd9ZE8r9qV1fsg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX9EYtTl+xRkHn
 pg0JW+9c6xV2bkxXfumsSN1N+ptudRP7pmud0+MSUAcnfIVAP9MqyMSTp2k3idJEjYx706bNGla
 Ng3C229PQ4/elz4OMSYde7B5zFM4//oa5fRAB4g4f3IQQIesjt4d366mEc34Qgd64zNZ+6oNzRX
 VOL/ro2ELzdQtyCP0G/1ISwJpdcf/eXSU17gOv9WwqOdPGoE7QHateyA9hd8DeM5glMRSSB44DE
 0tmvclQ1DX8bVoKSYIk4CYBAwEPwGk7f4dM/wP3n/d9MC8/a9UxhKFvF7nwdElNFCSw/ljA4KHS
 5RR7SWXAHnXEwCXxZL3oMhl0xM3Zcl5dZEmM2p+KDFEI8i4XHHUuTwbOVF8ChXM1CdK09FXAeRY
 RTeu6i8XDrGMRbqqxMBb+zVKrvrGKjk2nBmcTOqsha6OCnLbphLtSp8es3f7WQ0VNn7KYR4U85h
 WVZ41muObjoqyV481qw==
X-Proofpoint-GUID: 1oVxUIM-sx_EIQrr3Qd9ZE8r9qV1fsg5
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d551b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=o9ryCBrv46mMSQ48XGcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_024708_882108_7113E600 
X-CRM114-Status: GOOD (  15.98  )
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

The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
parts of the device.

The firmware isn't (yet) available as a part of linux-firmware, so it
was verified with the firmware files from the vendor-supplied package
(wcn prefix was applied to Bluetooth firmware files to make them follow
upstream driver changes, vendor provided hpbtfw10.tlv and hpnv10.b06).

Bluetooth: hci0: QCA Product ID   :0x00000013
Bluetooth: hci0: QCA SOC Version  :0x400c0110
Bluetooth: hci0: QCA ROM Version  :0x00000100
Bluetooth: hci0: QCA Patch Version:0x00001017
Bluetooth: hci0: QCA controller version 0x01100100
Bluetooth: hci0: QCA Downloading qca/wcnhpbtfw10.tlv
Bluetooth: hci0: QCA Downloading qca/wcnhpnv10.b06
Bluetooth: hci0: QCA setup on UART is completed
Bluetooth: hci0: HFP non-HCI data transport is supported

ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
ath11k_pci 0000:01:00.0: MSI vectors: 32
ath11k_pci 0000:01:00.0: wcn6855 hw1.1
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
mhi mhi0: Wait for device to enter SBL or Mission mode
ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x6 soc_id 0x400c0110
ath11k_pci 0000:01:00.0: fw_version 0x110c80c8 fw_build_timestamp 2021-05-25 21:43 fw_build_id WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ-1
ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

For the reference, the driver looks for the board data for
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=0,qmi-board-id=6,variant=QC_8350_HDK

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 126 ++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 4973a3eb11b5..8e35216e4272 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -115,6 +115,70 @@ lt9611_3v3: lt9611-3v3-regulator {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6851-pmu", "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_en>, <&wlan_en>, <&swctrl>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_s10b_1p8>;
+		vddaon-supply = <&vreg_s11b_0p95>;
+		vddpmu-supply = <&vreg_s11b_0p95>;
+		vddpmumx-supply = <&vreg_s2e_0p85>;
+		vddpmucx-supply = <&vreg_s11b_0p95>;
+		vddrfa0p95-supply = <&vreg_s11b_0p95>;
+		vddrfa1p3-supply = <&vreg_s12b_1p25>;
+		vddrfa1p9-supply = <&vreg_s1c_1p86>;
+		vddpcie1p3-supply = <&vreg_s12b_1p25>;
+		vddpcie1p9-supply = <&vreg_s1c_1p86>;
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
 };
 
 &adsp {
@@ -373,6 +437,13 @@ vreg_l7e_2p8: ldo7 {
 			regulator-name = "vreg_l7e_2p8";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
+
+			/*
+			 * This is used by the RF front-end for which there is
+			 * no way to represent it in DT (yet?).
+			 */
+			regulator-boot-on;
+			regulator-always-on;
 		};
 	};
 };
@@ -499,6 +570,23 @@ &pcie0 {
 &pcie0_port0 {
 	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
+		qcom,calibration-variant = "QC_8350_HDK";
+	};
 };
 
 &pcie0_phy {
@@ -763,6 +851,20 @@ &tlmm {
 		"HST_WLAN_UART_TX",
 		"HST_WLAN_UART_RX";
 
+	wlan_en: wlan-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	bt_en: bt-en-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		perst-pins {
 			pins = "gpio94";
@@ -815,12 +917,36 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	swctrl: swctrl-state {
+		pins = "gpio153";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &uart2 {
 	status = "okay";
 };
 
+&uart18 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6851-bt", "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 

-- 
2.47.3


