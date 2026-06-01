Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D5FCD6E56
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 09:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60CRMLwoH22MNuhk43vWwIeN3bSXwFAvh1cnlrI6z9M=; b=bxIxjIYDwzuXhavhNsnFcmudPz
	eRql0mZSV+CyiO0QkSwpjbRK1NmBGM5xiKElCAalk5aIGWuq/UiXwPZk8F9+jmS4OEpyDJOMSvscJ
	xynwZV64C8/AqpCXPQhmL4uBo8OBZne0B34r8g2TvvmudTTarQLftBkPgUCvNxg+avT9X3HlbFvRw
	T+1XShbXiLeFldlqbK3jH1V6o6LEeCzh7ySZL70KjWh1UlbGyYKGsvSjWY1bEj/4aAfOon6YID01L
	ED7sFbl1wyexauF221XaUuxr3/NZbuj+OXmF2AOiwWtJV0BNQUkXKHXm/PY4Q/7e7Rne8XtUbCdqQ
	uDRUG4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEl-0000000AWCV-35Tb;
	Mon, 01 Jun 2026 09:47:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEg-0000000AW9c-2Aj4
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 09:47:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fKIL144960
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 09:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60CRMLwoH22MNuhk43vWwIeN3bSXwFAvh1cnlrI6z9M=; b=Z9ryOJh4vNQVtmxk
	JR2e68TNAyMQEm5TZPX7E7YplmiBGGLi6PwgQ/PDDpjdSpLRZAM/VvS/KNAMwJWq
	/eis4SPu9oITqsZjztQfNgp2TaJ20ODaKiUAyy8uwbXfAbRJU5LARuQOvGkGACnk
	S0yPiK4M9rHcOTWZerssJMFEFUoCeRp+dyihmrRZ129epv7LoaA9vUs9ynnQ5Ixn
	N8K+ZkrO/xVFKiHXkVBSv9FmUTs+2PwRp98qRhfjyjRgRVtAnzEH4QKgGSorkjRS
	L0TtUqkh3X/FV4Pd2xWiWdFHghHcE/Ttpl8tAClYl49R+4jDUxz33SKNSrxLS/eT
	O1tEfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6str8cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:47:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51749fb465fso27226191cf.0
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307225; x=1780912025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60CRMLwoH22MNuhk43vWwIeN3bSXwFAvh1cnlrI6z9M=;
        b=hKbtyLI+sid5LP0LuHgOnKAdLGTsc/CbPvqDaoIhJe5HMS5CyXcPry49skNou29opJ
         FsVxEvuRMzlZhAq1LTtl0p4btmxnILGLKMXG6kW/HenyDjDNEv6Lsp7CGu1PjLfIBejR
         L+wR3NB7iWd0reMeer0LPwNxcIG6aNmDhBOiuQZPYLs3aUxam9Oibzrjmj8lIcaJlhr9
         vSpxNAKPzmWq+7f7d5Y8uHLZVFXRUNNvdYiXe5TkR7mVTiDxcbRPjY2od14oejYkSy3b
         U3rSOBfgDMx2uDLfc6h2VG184j0vYnydiiJX0n6+XB0N/LU2OGIVI93uivcSP9ESBoEt
         bo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307225; x=1780912025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=60CRMLwoH22MNuhk43vWwIeN3bSXwFAvh1cnlrI6z9M=;
        b=mhDH0rMOX61Q2HgsFAPKWCJ6prchbiB6wRAu58TlgOSRgkWgzB9Nl8/+la4NqAAJ6R
         fI+1VORrMgvkomCmVGys9m4eAzRQPIEqHbmYMmqUS3xezeQQioQtsZZwK5frBmowXvA9
         odpPOVwvnMreCA0RzYQ6jBSHZwAb5Rp2xHIqyLjuX3m8F8EWWoJiGCI6WfAWLhwj7bqR
         Sn/n2R6VG6GBeATFEME/HIxG28oKgxe/X+eNiK+Ek1REtk7y6zWfZjClZf+aGiB912Fx
         UgdIC3Vn0Nq2oEVtnWL1v5S8nEgzb0VkrwaTwC5zUB9e/y8gfyzc1cNlrDEx0/UEvcC0
         rcZg==
X-Forwarded-Encrypted: i=1; AFNElJ+8O1124dqDQgWCeKx9pBntuqa24Ib5+SZeN3+A3dB9wcg6883hExdqTOXVa69HksLKyjeuGHM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMQH76Czrm5DyhnZXNDzUDIP89sVDCwZVFev0QYlKvyRce07zd
	Bk8HRfy3maymwWNPPIiE9cYSnR/lWEnv92T3u7HeU5Dmk730K1Xklg+Nx3mOV6jziFYyvDtXFtO
	6mNzYAatrwm1YBaGFOy7kSlZYKkjifpMXc1HVxw64V96vWlHLgcVY1HizuC/2sU8u
X-Gm-Gg: Acq92OGJi3zgcIlBlsllKKCKSS+GIzUsNhFh9boPeC5eKaeJF1Hhrpsn/1UGkTeR08r
	arijtgWeQOgkjfmJycal+pH+xOPRQzDIBYmR8YCzi9Tr1KSDzPuZ2Prlkb773p1gXoD/OSxmLea
	//wLU2XT1+vA/eKG2q+G4qYIuMRBweAQW59SPjOTeD3z9nrUMTVdTAIJLjCZHws5M3GZJau3UKp
	VEL84F4+iHrvOvZ6ucrwX+Tr2V/UoBOqH6OnYtvi00p/qIRdw4+TGYnr/N/5NOGRyRyO7JATNd1
	S7DMD0aWIHlmxBdInOIr+pWgjoxwvUKpRrzArYiYV7q+mUIhuKaj8IuuYFj7iwkJmn17CGFbjre
	DDIBeesWwoFdh+h+BydoP3lW49uK0Nap1srNKySQlV1/cGz62q3DTz1pjZmd1mocp9QztjeXvZe
	pOmt2AzylDsDCPAeWkGL9G7QoUuJPiypVXX7cRlpmC3GMzJw==
X-Received: by 2002:a05:622a:356:b0:509:44c3:5ffa with SMTP id d75a77b69052e-5173a99136bmr153697741cf.52.1780307224993;
        Mon, 01 Jun 2026 02:47:04 -0700 (PDT)
X-Received: by 2002:a05:622a:356:b0:509:44c3:5ffa with SMTP id d75a77b69052e-5173a99136bmr153697521cf.52.1780307224560;
        Mon, 01 Jun 2026 02:47:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:47:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:54 +0300
Subject: [PATCH 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=docfPpUXnI1XHz/OPdL2Yqjd7jogAI8PSdedpaSUSzg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVULFMkz7B2KUaWzp0dMD3c4J4pOVHVAE9ivW
 I1u0vWVJ3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCwAKCRCLPIo+Aiko
 1YjxCACZ15J4fbUYzTAR/V7VUO95cRXGAnVEZVcCy9aRNacj+oQUbM8ZeOdKuCyhJJWAlezStTf
 Z40uMUE31aH7GftcJ8ijLYgXo6cpShIy05Ukm2kP5bvkratPZlxmtFGeLP43Cly2zxsyomVS2Nt
 hsYRkrNvAPlOYmc6PBoZw+kumrbJ6D6kzmrTEkm0PtFWENsETv6++fKoWLE1bmNlrywi/VQYzX2
 OnV3ImkPvtNEo3RjpvwaKkwCWfepEYablX98ZLwpNK924P9pAs0lUbrsnnV8FmViAKO6VLIu44g
 MCP4Q8gomOSy+Bsgcu1i5McYOgaT7JFoBDMf+XZ5Zc1OI0eG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX0WePlJtapGYQ
 JZPjePtpREiqTL6nuq9GBnLeZkthp96A7WZb+tgeWaGHbW9eT1yRLZTp+GvqaEMzBbrUcwScXDm
 c0MRULnJYWCVTPMW80e1b2V1H+LwYaOsej9LQvXKQKLS0ezhh0LmQ6Gcbg0xkzHYo3Q+FMwmLX2
 GJCjyE1OrfA6u8RUmNiWxMaW/poIJQLm2q5wo0Mk47GzuaZt0n49R3C/jdt8YwwcvC/JVXuu1E+
 0oP5GpvaGcyXz5NusUoWjFYffDTNQQQ0pEJWC5rcRN6kp1CM/06mRr2lXD8J53d3UVkVdRXvXDw
 XW2vGHDgr4YH0tb/dqwgDSszFY+5s0DkxJVNeOi7hntcFUBnXsSphTsfXYFTCHp0OGFG5V+CGvx
 tYh0vEye6kInfrm9WZ2fXPFgRmVuIXjoSrvxhvkXR7TtJxqXYE2xSI4BluJfDny5pzrj/4SkEuC
 FSjSmIvmwyk8qRJla0Q==
X-Proofpoint-ORIG-GUID: 95j-0OgnfmW5vwEg2a7zYln_HsL-GCOo
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1d551a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=a-LFHBoeUMMLBGfzAX8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 95j-0OgnfmW5vwEg2a7zYln_HsL-GCOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_024708_883386_F83787C6 
X-CRM114-Status: GOOD (  12.73  )
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

The recent suggestion is to have PERST# / WAKE pins and PHYs in the PCIe
port rather than RC device. The kernel recently started warning about
the older style of DT. Modernize DT for SM8350 platform by moving the
entries under the root port device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 18 +++++++++++-------
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 12 ++++--------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..4973a3eb11b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -493,12 +493,14 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
-
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5b_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -507,15 +509,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie1_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index eb2a795d8edb..136daa444865 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1596,6 +1593,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1692,12 +1690,9 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1705,6 +1700,7 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.47.3


