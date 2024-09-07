Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE97EB64C8
	for <ath11k@archiver.kernel.org>; Sat,  7 Sep 2024 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sWs0Yh5GOl19xy1ip0mx+la4ukXR/+lSq5N8TyxyHg=; b=ToVIYK8tnoX9ayJ10LCZSvk/dA
	0WBN7PJ+Jwbkr+dTrH1gWSc6QoYwwK/kU6gj7KJdFL4SEcU7MYtghD30P8pl06SmSL2dmdNhvv3jJ
	CeGqrTgRyoMXxc77aDB256uYN7VPwzhKQIOmhF7nZzy3kTWJHuLUW9D5nGMLf5JaznwuBK7W5xZyU
	06GZqq0LyuTCgyGnTuhFJPOYEm0qvfTakbm8spIYyuoNU7/xKv8MfkT7Y/tt2KCN1kJjOX1kHu2Va
	Aq2cms0ap44nvaprBQ2H+BwFKTABb+iEqPhcY+FoFic1JzXzB9h2j6aKabn+pEn1y84jFG4sRvw6U
	LKtZsDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smuud-0000000F1Li-2XRI;
	Sat, 07 Sep 2024 12:51:35 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smuua-0000000F1KU-3ZlB
	for ath11k@lists.infradead.org;
	Sat, 07 Sep 2024 12:51:34 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2f75b13c2a8so6510601fa.3
        for <ath11k@lists.infradead.org>; Sat, 07 Sep 2024 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725713491; x=1726318291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sWs0Yh5GOl19xy1ip0mx+la4ukXR/+lSq5N8TyxyHg=;
        b=i1op3SZO2Te+YYc6m1daFu8ePMpnfIQ38grwB+uDslLx8UnZH4rx8iE4iqAQWcGgUi
         Z9fKIqC944Zq55qFrCu76JhhLWnouCNEVpiEoAPFXrg3Ytu5oIj9eA6vJTYCQ//Cm2CT
         lR0q2HYbiKmHCF3DN3CIoJY7qQSLgyTBNRYhZ87DxkzXijjM+bLm5Gh9xFmpWuJZ5y6f
         TqJ5UM3YekCXH/ZU6+Z8mbmvrGb6gr8caVFuPYWd9DKB0AtheH8Gt8aiRzBcYnYxKMb2
         DeIosQdS495sis80llbQLYve34CmODBvmYOMyGvWCxm+fSyTJh5ZQEr9JHLlSxnoCre4
         U05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725713491; x=1726318291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sWs0Yh5GOl19xy1ip0mx+la4ukXR/+lSq5N8TyxyHg=;
        b=e9IjrB1akP3AilJjL/Seqq8n0l464ONsXfbLUrkQeO3YYZoW+AYmHa6fRZ2P6ekffi
         qPNQU/wOat+sKoRBBUFJqOioZU3JrLGmd6kFAqGMjgcmZDvq9b2+6KqSGSbGYhP69lXo
         xgnOIC1vraYuWz5oYRxJCE84BPbKjPMdaQ29jnf+ILZfYciW6XOk4++oDKrQS+6Bx61z
         8AC1vzZhRKy/AcZGFfPRYoJJpNyT2ApquK8YCyfMfhynbPnAYZEZ5i5j4cbGxqgOI2zS
         QfDST0nXhlyHivh3N4q+66lsIJoXVFJ7Xm1QDU/J6dNMgaUmWYgiGeEiZocanVCRBQGT
         50wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI56pZf3kNrAO+MRwLJC6z7eAx3Taxm5Ue0DjMADZr/IR1K/n0oxQ1GWgeaijHLo8iwtsA8QE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZnE+MR2C9Mrel6F1436kiOWC27j61yEIRUL9KfuIokCqvLQ4P
	7MdX+oI57S0WrDB5aHfuadbFGBEI3JQW/hdTcgNz7b4iBIMhQo58Fhe4NZlXeOg=
X-Google-Smtp-Source: AGHT+IGhqpckvhWmOG6EkU6IpaNRuD3yiEYQhHIW7VWjV1wlz4lF/h38bNZ5W5o8L+nGAnp6CZNHFg==
X-Received: by 2002:a05:6512:3502:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-536587fce54mr3016089e87.40.1725713490684;
        Sat, 07 Sep 2024 05:51:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb76fsm143273e87.177.2024.09.07.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 05:51:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 07 Sep 2024 15:51:27 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: qcm6490-rb3gen2: enable WiFi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-rb3g2-fixes-v1-4-eb9da98e9f80@linaro.org>
References: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
In-Reply-To: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, 
 Kalle Valo <kvalo@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=821;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Om2AhE/49Do7xLXq7286Q52iN2U3h4+EcOngsQ+aodU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3ExO0pHd0WKIcWTD7FOZykBxXIUyqiFeVUak+
 CufdfpCGtaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtxMTgAKCRCLPIo+Aiko
 1T+qB/wMeJVn2ogUiKRQAvEC4RAi62kilDEcn4FSYr3YYKo70j0oT6VQC5P5VcMwNyzuhErRAso
 3NzNTD+RKZ791SQO/GiwMR8By8cT+7O4a2zQP4XmerfLuiD9a9dbk39eO5PmmvNhBXUzJIMCZuE
 /fOwB1ha+Uxm/7FqsINkm1seiZUajN6vrGZOfa9H0Ii9l+LB7cwuFZAo3LdkL5TQel7DzBiRSQa
 BwOipQTaAjqrCvnwZxe/fmxRmxV5iNYAKWrOxO+ccZHmlGeuS4DXHhY4jo5pApmPqq8uAsN2ptT
 eLOuthF6TLV6EgbN8ekSIpWOTcYaGMD/NRFVuBhSGl4Spw0q
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_055133_200509_BA26FF5A 
X-CRM114-Status: UNSURE (   8.17  )
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

Enable WiFi device and specify the calibration variant name on the
RB3gen2 device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Cc: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 00b755779608..41d800e09638 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -800,6 +800,9 @@ &ufs_mem_phy {
 
 &wifi {
 	memory-region = <&wlan_fw_mem>;
+	qcom,ath11k-calibration-variant = "Qualcomm_rb3gen2";
+
+	status = "okay";
 };
 
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */

-- 
2.39.2


