Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636A9CD8C9D
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UUGNkY7j3/4zh2rLPHPzZHPlPL1HtPoB4XrZlt6ez8=; b=Bq9EFtRfuQZMRhlJxyGAtmAu7q
	+t+rhDnXcgQQ+04e8zSSmHqAJfMi9f7pC5+yX15yULtN2nIP/4C++mplgTsLcWEnN5Ezj7Q+DGCzw
	UZ/OPsBBVsvBbtP//nETa0QVOxYoTawR5cLbtjMJ8bj3NBvsLpDHU9GhZrG+l42kkYpF7/yNy1fs2
	BTxWlZN6H+elE/R0KPrQK0VtHz4nmra9j73Jw4OjH00NL3Rrped9kFj30h2G9Pc3q0bJiWJ448C1x
	2WZwodGb2/jQPnMasrd9PpuXF5UaiCyegksZwyOFsYOi5conf0GS0IHTZ2Q70urle0ytmsLIpCvgR
	DW/yhg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxd-00000002vdr-2z1u;
	Mon, 08 Jun 2026 06:59:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxb-00000002vZg-04Wv
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 06:59:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PmGi2733184
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 06:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5UUGNkY7j3/4zh2rLPHPzZHPlPL1HtPoB4XrZlt6ez8=; b=gLwKCEW2PQCeQqva
	NS9QXhcWMAFJYCt3Ee6FPAJqCW5CTFsfrMtgC/znIDmEHt/IZyEm03DkAA5KGJ/1
	5/pRX7IO5XHkSXjmiOu9qYe6De/Y93LzCYg1xbo9zhYga7NksFr1SWrpm7gn1y07
	uRSPpNt6EAbmOFdnTPnou1nwDppjVJjafGEa23+o/r5Kb6goroP80DimL/E88YXD
	W0Q6Sn+PnZHootbHWjf91m2/DOs+sBrdxV40ituPeG2xBOxjY+6/VaX8Xm48w/T6
	2pollpjB1KvahgeFe+4v9aHCG7Sny//Yum1GzNiIYsgq3t4fmkROSc6ohANdv0oJ
	+sNNSQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6gfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:59:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d24c3886so3565282241.0
        for <ath11k@lists.infradead.org>; Sun, 07 Jun 2026 23:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901985; x=1781506785; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UUGNkY7j3/4zh2rLPHPzZHPlPL1HtPoB4XrZlt6ez8=;
        b=LEci+NJsYt8T0YjTle2808+PO4pN8mRpCRXp0msiIwllYzElmAboR/GM7OsrXdJBgV
         oTh046yKvPQg/n2HDM9JGQXL7/GRSjE+XDv36IKV8U7ejOS/W9EZpDk7P6u9hNBhN1PM
         LvybRNlIQ1eaB3oqgSCh+VgTl+OiWhLTymqb99nPs57lZoOWf7snxDvEI1Z2SMxlVR4g
         JfecEclSxlKeowr0qVVQwgKcjwv5yEkgBVam4Dwu48x44dX5YG/V3BLfqFFNfR6g2UBM
         QWHWAxNAH5jJEt8T3DOcZiyvtpCAlcR79pkV5/DCx/RM0xIwfquA1i1SYTGi1T3oxjse
         ZCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901985; x=1781506785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5UUGNkY7j3/4zh2rLPHPzZHPlPL1HtPoB4XrZlt6ez8=;
        b=CQ9/hRi24cbG3s7VFHH2PRsW8G7pGgw2HA8refmvhyRqZM/3xyi1QilE7bIWOf0VYI
         d4EpVb2yaoyHAGrKlJGkRqhL+pKPqp25krPyvEIWkj09XcpBrUjy+ZCSwQwjAp5RSgSR
         mvZpyDwKmVqP/QvGPUv34uX+D7FGKbFwE+FXzQcqWUoJYqCfdIKC6Yk6pIYfQBBI/Jn1
         h5MK6seIcuq5+3mhyMhOPmH4vjMShq5SRW582Qbmr/xoDYQV7ZMX8D6OXiDWLoNlsRZZ
         7fClbKBnns05rU+Ndhp1QuJbh2HNokXqnHmb05kuRSMwMlIjmWlKhkncq/4bqAETGyWW
         34Uw==
X-Forwarded-Encrypted: i=1; AFNElJ/1pHTTRG1ekTxaQdMn5AQ53P8jpcGj6bNJTQCaExiG84Go63zZwni7YUx+hcRhGlxLZDPqRJs=@lists.infradead.org
X-Gm-Message-State: AOJu0YynSlGey80jLJxHum9O1tQQjyLnh446lq5Fq+xA2/KFE5Pe9nNG
	aBVWxdmcipFQVR4afDHCF03MLA2h7ydNyS383ARMj4lwyj12aqmqX+fzXGge2sp2tHU/62yvTHO
	b0O3FRnNM8ChS7lsjTE6sFeXgw3hmUzpMqrsLHrJdG8NyzhwW5E8E8ADkv9reQ+Jg
X-Gm-Gg: Acq92OGkyUP9MunVPItxhF0+DPCWmG9Fx5lWA4RmPOG2vZ6AkUhT8vuiKuhEJmnbO44
	Qyf/vXHSbeakWdA088zTOSs/Lf8RpypnSOA+/C9sgMljIctQStr2uTwjjVImjXENapm3FexzwRu
	YgbzHMIQUSeQH4AatQq6llkEeKQ/YZr4iY0lWtW3RwhQ2r7PEA8Zl/2X16W8rYrcp5FJpcdWN4i
	XXxovEetRkPSjpjFk0OdPKefGtJK2mT+N/QFUZlKJnD08z4hRhU5W003SOumTfcbgmm+eY7nMVH
	LDKYwJtvLFTyrgBuxUCRY/cQnADm0kb9sMukFtqrgsnCRJrp2VHxW6yAUY+uiuUXpGXyyZ3PhBL
	7FW8ZiRCCB00KDHc7vsv9PKKvDL2+yiuY5BmE8LIdexlS9PsfXNkYdchFgL70D2V7cmC01IODRN
	FzT2bhm9yVe+sldXCjNg5xdWdGBk10irYuNWbkcaiSJR5b3g==
X-Received: by 2002:a05:6102:3e0b:b0:6ef:d9b8:88d with SMTP id ada2fe7eead31-6fefc8b6fd2mr7182290137.8.1780901985337;
        Sun, 07 Jun 2026 23:59:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0b:b0:6ef:d9b8:88d with SMTP id ada2fe7eead31-6fefc8b6fd2mr7182278137.8.1780901984873;
        Sun, 07 Jun 2026 23:59:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:25 +0300
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-7-efb68f1ff04c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6193;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ivfez+E9B3qAfRh5L70SB2bSHUzO4GoveMoTJ4pZ8Vc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhMuqGfQoyOCl1z0/vW5dE+0jogozA0K9B7r
 kku4lpySs+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoTAAKCRCLPIo+Aiko
 1XabCACw2Bp0Gz+PrGS7tDbpoA4CbJky6pod9M426pAO+JrCgMofF5yNPYfSbJdixO6vvT3t004
 XRNGoysRpBKyIrZCROWXoj8W66wckYFcKMntiwBCl3OZmZgoulp9sfIA4Rj8S+96k77801TNZNn
 K+BpDr+GcMfk3eH46QBM3/5wO5zmglfFTWmIwiQ5l5kb+Lq7f79XetrIglxNYnEPp/NzBLFToJg
 cXIfLqhtff6pRJtjSGY370yRkPgjeW+zV7D43PVBb7q6Z0SAtdtlkIUfLAgDAGGJ/IHUbKsMxb7
 sq1NwizoyGv4tyXrnlNYcGR8MH9VmN0DFZ92s8nFLlGbKCl7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a266862 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=o9ryCBrv46mMSQ48XGcA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: iolRlflVQVFVvGI-YEeeGW9qxWDpUnfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX7syUU+xU1NiZ
 Ifuknpvy4uFUpzxZAIlXJrWxeJyBJ0bP66C3DDglSQ9qu//wXDPcsKfALm8S3yozld9neKh9uHG
 +MeAVzm4GqolP4AWipU+K9RRbimGlF+pAd57htOuc0YVY+gGgQD96csfh3vDT6+dQS7MhUacBXf
 yaCHC31nm5+cEpihbGpjnPVY7SC8ymj2tYkHV//l+1fAl3RwF/koNjB1eBG2ucX5q5tdA2PLNOC
 nclqieaiHorzDsx4XToyiLtj5lx720KHBT6Gmg07Q8vkEbbO3ebxxawnitPocKi9GPtbUxn74sJ
 ZTPRYWn16RMlD5Poo/AMJEusTp6NvM7KeH6wd2U2XhEpSiwPuKSxjCFf8LpnXCaqE/bUzMv4O+s
 n2mRxtNUadkT66bh/uKhlYRDhO7dOyElQMeDWl2UubsmeL8eiUzA2y0v8TQV5Sc7+hrU426qfhF
 V4XHMmZVcBA7n+2GNmg==
X-Proofpoint-GUID: iolRlflVQVFVvGI-YEeeGW9qxWDpUnfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_235947_186055_518073D8 
X-CRM114-Status: GOOD (  15.64  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


