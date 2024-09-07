Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B93EB64CF
	for <ath11k@archiver.kernel.org>; Sat,  7 Sep 2024 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa6fMV9tZ2Snsz6tr/dYASfgwbJ2HTPtEyRdc5RFNjI=; b=D2ekljfNYSnpUfCA2Qdh2PSBnG
	vWF2oeoIAJzI0wU/oSfje3O1y1621vd/iiFkbLBsxWSNhN5FQGKL/+sHJxQkWGUw1uZZthkPNSHoS
	iko5yG65swrMgOZvZDRHGp1X703qNDnWxlQMnMLCrTX9Upc3YvfmjiD59GqiLf89aPtpOWOYwpLFC
	idTTR4jGHzRUf71LdwJ1UjlwRaYc6s8YQ8DqZVNrx4jRC0Nl56UyqC6kXgVa3nOH5gjp+QfF7WZkL
	2Tijnl9m840xEw2VQ/XD5pthHlB//+OU8U54mMu34yAGtudjH906PAVu0YRj0At9hyqpmw2/sz04X
	SrCbcTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn0be-0000000FUvH-1rMW;
	Sat, 07 Sep 2024 18:56:22 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn0Ty-0000000FTbw-1Mq7
	for ath11k@lists.infradead.org;
	Sat, 07 Sep 2024 18:48:27 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2f75de9a503so5165711fa.0
        for <ath11k@lists.infradead.org>; Sat, 07 Sep 2024 11:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725734905; x=1726339705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wa6fMV9tZ2Snsz6tr/dYASfgwbJ2HTPtEyRdc5RFNjI=;
        b=aYgPMDOLiQJL0k0KczR7f83eUMOxWlrc0vYsN0Yh+mAeJYZMWXF5I2zjhzZI8gIIxt
         6YCgS+BQ+lKl4y2ChxMFLkTlKew+Xq/w9FVEk0cpLnF6z3NfcUKtWp40Vcf5lJObR13z
         SQHeJjCBZcu+MUfb+6kD1nj4uxD4m2fR6Fstjd2CQvnbD4p5otEBClB8FMaXiX+g8HLc
         d+1+71yfnnJQ0nU0ho4l/429e74J3aWTfDDFTQ/aAYUurXHxWljwWkvAAfd9P+ZgrjjA
         c+N82SaDLdW6SCJXj+78FYky2lCN0e+9chSmOx0VkQXGe4ECm3VIiQ4nag+6yQzmXwLQ
         9IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725734905; x=1726339705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa6fMV9tZ2Snsz6tr/dYASfgwbJ2HTPtEyRdc5RFNjI=;
        b=dFarVhxVALHBWJMCIb6h7yE2PX2XI6l495iIFgkGJOh9kP2QThjQSPkIMBv0og82pv
         AsdUqGlK3kUt66VWUlBRi3ESCg6QMEjOBfW+sGVRi+X+m5s3b7/RKDsNCEcRddQg4Xb5
         Xuk4KYbuxR86mBzVd5vIlJ5ObYwwDSu3+h0Vw82yAUW7/BKX9duNixycDOw0dWu/ZItE
         6fTB04CvAx5Ysn5MuV+3+hI0nN7+bDiimq5pMHmYpfWyI/TkGkNfl8lOehpGMFUz/SiW
         UHxRMLgDyIDZCLcnWVowOejHUqKLoHQvYwqWFCHw5Rj3ny4K8vxLc1pia870Wd4T3Giw
         Ec3w==
X-Forwarded-Encrypted: i=1; AJvYcCVhrQFSdEmjpBNxNahen2TpV/Fkk0qpBMs919CGIPQ6pHwy9/92okDaWW4gkAfqnhwjrDieOgA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdo0G16sC9+aPyIchHWF/0h53t/1/1rkwAqLdfzirJ993t1W7x
	NO1JueHJImviNnKZaVN2gebsftCXjxO968CReAYwudHUL/xsESGv/SjFsolR+A4=
X-Google-Smtp-Source: AGHT+IHSIoknUKa0V2bIajtq0UbQnlrrMTwcNCvk0Cm0DK+8zJifYj/tq+SFZ349vHrP4HPAC7liRw==
X-Received: by 2002:a2e:bc13:0:b0:2f7:5c58:cc7c with SMTP id 38308e7fff4ca-2f75c58cd06mr15833141fa.44.1725734904516;
        Sat, 07 Sep 2024 11:48:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c0b1af3sm2271861fa.129.2024.09.07.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 11:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 07 Sep 2024 21:48:18 +0300
Subject: [PATCH 7/7] arm64: dts: qcom: sda660-ifc6560: enable mDSP and WiFi
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-sdm660-wifi-v1-7-e316055142f8@linaro.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
In-Reply-To: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, ath11k@lists.infradead.org, 
 Kalle Valo <kvalo@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2512;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XTnySTBdd5sawEDE4jiRSfy1oa5Ctl+YWAAqUv4joIg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3J/yWVPTASuqwGf6KgTFf9lHvriPxuej/lwbV
 aZEbLvM9JWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtyf8gAKCRCLPIo+Aiko
 1ZEqB/4/aeZwm+BdnM4GZPBXDOBNORRCXxR7ErRiln3e5RdBCf4xXCE6iQvmGFXEXS/LrebtK/X
 FNMW65S93BZFnkwxHn6UQ+EHAFGW27njCs/KvrkXnGPtjv50v4+JiV2Kp1cUWTb3w21MJAnJSU5
 5TP4gUddxWWFBAqPeK0Khdh4ojgcQcxkbJZg49A+fkAl1eQ2+Muneg+woHbjtFa51jJYnvX0SWE
 /Xu+uP5bMQ3+J+0Y+lS2f+HdM6ZAKIvLcVs4cEzVqh4+fljZ6NUrrfM4P/TAlLZ3Q6M0gheBeJV
 4PQ81KBAp7c2Opqwvn3clTZnknpVaurmdvLR2aBlgRtUjDU5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_114826_403924_D3F603E1 
X-CRM114-Status: UNSURE (   8.96  )
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

Enable the onboard WiFi device present on the Inforce IFC6560 SBC.
Pretty much like MSM8998 this device also doesn't generate the
MSA_READY_IND indication.

For the reference:

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40050000
ath10k_snoc 18800000.wifi: qmi fw_version 0x101d01da fw_build_timestamp 2018-07-26 21:42 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0.1.c2-00474-QCAHLSWMTPLZ-1
ath10k_snoc 18800000.wifi: qmi not waiting for msa_ready indicator
ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc 18800000.wifi: htt-ver 3.54 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---
Cc: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>
---
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 09bc010ce56a..7948c8f6ab64 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -252,6 +252,11 @@ &qusb2phy1 {
 	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
 };
 
+&remoteproc_mss {
+	firmware-name = "qcom/sda660/mba.mbn", "qcom/sda660/modem.mbn";
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm660-regulators";
@@ -291,6 +296,11 @@ vreg_l1a_1p225: l1 {
 			regulator-allow-set-load;
 		};
 
+		vreg_l5a_0p8: l5 {
+			regulator-min-microvolt = <848000>;
+			regulator-max-microvolt = <848000>;
+		};
+
 		vreg_l6a_1p3: l6 {
 			regulator-min-microvolt = <1304000>;
 			regulator-max-microvolt = <1368000>;
@@ -489,3 +499,15 @@ &usb3_qmpphy {
 	vdda-pll-supply = <&vreg_l10a_1p8>;
 	status = "okay";
 };
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l9a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l6a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l19a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l8b_3p3>;
+
+	qcom,ath10k-calibration-variant = "Inforce_IFC6560";
+};

-- 
2.39.2


