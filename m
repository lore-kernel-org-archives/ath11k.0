Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8ECD8CA4
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7UWcSa7sch199uUm0ihpHSXkTOLrOrU2Q3K/tjsND8=; b=cUJhARuc6pvyy3ZjSfuItZB4gb
	d3jX3BIgpOachbXGQ8RM9/axdlXYzrtKOvDbwmLXoMYSjAVLCnAi39doBjg37lB5xCLM4yPRX1A7R
	FvrmAXFu68tqVNJlrdSvFNyy9pJq3wrNr/rAglErivppsSrFoEwd4vSAM8w+Z4g5jwXK2Jqj4rlHO
	/j0F+SnBqKomZhfwoxgkwAXYLn8neyZergIVtUv+WHYTkC/G0meGwVskX2z315EaQTizlY5woWylI
	kNHlzj0WfXeCBSUSvQHkm/xczsNpYSGtRrSR7HacBMcXYo4PZut8Q4HeL59ZoHc02k5ERqmAmxFhV
	w4XVOvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxZ-00000002vYZ-2ZDd;
	Mon, 08 Jun 2026 06:59:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxX-00000002vVA-0l2t
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 06:59:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OlGJ2801823
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 06:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7UWcSa7sch199uUm0ihpHSXkTOLrOrU2Q3K/tjsND8=; b=MsePBlZ+U1N9lgCF
	NLYP92U844vUD1wYtSyuAsPUHaJfSR0oRRVeFxzRzhEUt7JpEkblaAj9xyG2n2th
	wCjSB/RcL0cZlKR9o0D6MwJsJ0L1uP4wHUo6TYjfVAEPlxKwR4uIboDS7VyBaGjk
	mLTcXMKsYDmNAkPjg1CR1E/MP3y86PETbOao+3zXWzlqxxkgwwsLC0QGWZR+enEH
	I0mAVS9BL00B51ZNv03jyj1vQ74kp4qbFVKbbvU03RGqp9kfp/VVju3leLhQ4Qo3
	ML6rl/erWJO8/4iIRnRWkPRh3bAOW2pwcqXnTPgS3O8c7L89WhgNUQVbJYzaW80H
	jlITsg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3psg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:59:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfb3463931so5152459137.0
        for <ath11k@lists.infradead.org>; Sun, 07 Jun 2026 23:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901981; x=1781506781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7UWcSa7sch199uUm0ihpHSXkTOLrOrU2Q3K/tjsND8=;
        b=iJrKONC3Lrm6YMeU1FS2UYcmANL6ph3q8r+dLGprYooWu2a/Nvtl5PSQJr/g6NVA+C
         eUKOJKICpT2+z9+iBS+b4+NU8I2d+WNQ/1/T5YoWqFvMP0F1aql97dBT7tyiUk4uhHrz
         RmF6vGpjmWjanE20JbSaotO16sg11tRuXceaAlA8h3NU1W8HiBLOR83kcOFcp0gy8eHT
         rhIZaIliqYZMy3ehp33ePcCtOzgte7sSAZcsfV2SmOmGdp7O3eDR/76aaGxHzp9b3v5F
         XxIQ9PfwHQAIX1D2pj+LV63AwK6H92OT7+JQ0XM3IqzxoeKtzVK2dtQ30XQRKfr9izuo
         6FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901981; x=1781506781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/7UWcSa7sch199uUm0ihpHSXkTOLrOrU2Q3K/tjsND8=;
        b=bvxWu3pUGAdIqtfOeLoC/zeX9ceSToYcFz9hLtJ7wQyuB93THoDWY+C4xrZojeBSBY
         oo/Fp+gmoTAONQM8NsNL1LYojE53iUcSu2f0sRUBlNd+f+bbrgxlespJZtHK5zdKPoZ0
         EE5yino8bWNMkmDECDRz6JeQzYGmCU8nFPmyVhRUjQpB7Mt3VQWlsWuFPhg5Irnob2Ow
         v7OY4tPp2iXdz4WFAiyyoTEEuSYcGm+E6dY5EM8p3Qsxrd63MRwYGJznlLe8GDxGVsKA
         qIXfIplFAbnUfrQ2f8iyZT4TjNXtNer396CSv7oxAC92mcCDK7JOzmzsQaTRqDWH2Otk
         hj0g==
X-Forwarded-Encrypted: i=1; AFNElJ8TkAbM1+AVv0JNCbkA9pdgrJtDUjSwn2Chf6p5y44I2GQncnyFQowpgCpv3lwkffmnn3dcCo4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCaz/qfEOdnKTitZieq6/FcRu8vMnWH4ulWhnmeA0BesCaFHHO
	QvIM9IbJKLIlnuHas+kdocMzEvQHtXrIDBXPMlDvgoIuecNu6wib4UulvCHXlYAUtesFO0WVTqD
	ZaI0DhEiK1NLdl3HRDSFsB7SUi/PmMSZPQBJeOlONpJpFXozu6UYWBiEJAKRZlO7k
X-Gm-Gg: Acq92OF/Vvm4BmPtm8kUsguZO6ElKUboNwIwBCddg2HGk3p2lNtmlvbZawSDIkPqiYv
	glGhRc6n6JHFSLqkE6Zo78Je7rUetPNcobAr5B6YweCCMUBRrQR6MAuLn7O2DJGZFNDbnT4It24
	e7It2TbSGKwNT7eKkZu5zZyOuHLJk9MTrodnc7rBy1eMDvwELhAtTa8PB25Qv8hlEKL1S6kO88d
	ZUjjkuh7pQoCUs2Rl5YLg1v33tCVZndOLV7ZT3uYbT6KGYcXnDq8fJlnbTE5hLkIGUI08o/a7uM
	2OwlC0l1sWrqjgNGd1OqkCNbU4b4hf/pYbLIRuAf6sXCa7TxbrMovMi7gRp1ZJfeLAW5/TLQn48
	O1o4aJ8vi+FEiZgCOCY30YOEC96ZSoyJuM66Zh6EehBBQ6UIoQC0Bz9xTfuv0ml2uN1wIOSadPs
	pxsGiChwk/nBLkveLUb7SecBkRSHeglV7jQ4oKGhz9qpcshg==
X-Received: by 2002:a05:6102:5490:b0:6d9:a889:13b2 with SMTP id ada2fe7eead31-6fefdee84d9mr6614180137.11.1780901981552;
        Sun, 07 Jun 2026 23:59:41 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:6d9:a889:13b2 with SMTP id ada2fe7eead31-6fefdee84d9mr6614147137.11.1780901981146;
        Sun, 07 Jun 2026 23:59:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:24 +0300
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-6-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n8BAXFAj+oDCn4RhQ8z2NOQ90wTtinkzV4SU1c/SY4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhLpooe78rWUM+pR4BQH6xXBSOcSM/trlgR8
 7p27ucqN/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSwAKCRCLPIo+Aiko
 1Wi2B/wL9YzaoY4qmodagukhZOgdXJIhA6Y1QNMMx/Va60ooRz8YLt4QW9aOMDXUsOFPoLa+U94
 XGMmnat45/qKU/rD95roVjE/BrtRvsA83alds5Pw92qaatXP5HGdcyZshtqD9v9dYyp5tVnmLkB
 jrWSC8j3g1Omxut44iWRiy6laIkRAR5O+JZoEVYqksajmAMmaPGxK6iuwV7INO439eRXeKu+9lp
 FRg5VGJff6rHF94spYK4CBnlSV+CKQJA2Ow+iMkJpMN9oOKFjNSPu23rynyScf4FwdMmcCI8ey1
 Q5Im/Iway9vmYQRKRL/dS3vObRmxszVEGx5OzDrTZ10Ztks8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfXyPnzmdAMst+P
 QJbTiCOQrS40AAxk5IbiZALRVJXGogqv23c3ruE6gKQMd66+cHLTgBKxwx1M9c0qb6KR7Xr+mWA
 yYQKEc0FyI/dzoIVCw6Lyv60EF/WoXugzw45VuK47p4BFmfKhk5Cs892+h99jRhCq9eMEMRxzDF
 L8cZsVCoyTvAt0+8bVdK9Pl9fwYY0ekjNWMUDb0+QA31uRFTDWOfuZ87sUPmyiaskWgM0391c+f
 9dUSXuHdjbXIxSnoUhC0IkJrzJmPIxzBpRlBe7hiUEvseiG0Qy/n/l3RZ0giGPjyiMA0h3NtB0o
 mCgKpnpeSP9Qfe8TyQbRhM+6ebMjSajuFQijfxy05fSP04Hg1owv0O30b7VNzIFsCxmes9g9dnO
 g2mr4q4jB3D6YkwngT0/HdeVC+cjOj5pUEXPrJ+wk7OSfy1+nhDO6/dvaGV8g4jq4O94LxKPWN5
 8PlwajmLJrx5KGvqY2Q==
X-Proofpoint-ORIG-GUID: 2P9bqPo9AO3mY9FMDGCRXDkS5GqVvmbe
X-Proofpoint-GUID: 2P9bqPo9AO3mY9FMDGCRXDkS5GqVvmbe
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26685e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=a-LFHBoeUMMLBGfzAX8A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_235943_358554_FC296F66 
X-CRM114-Status: GOOD (  11.81  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


