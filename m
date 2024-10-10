Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED90CF07BE
	for <ath11k@archiver.kernel.org>; Thu, 10 Oct 2024 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpFy5FxhMWXNV2yEqbcX+eoDVHfJa3z53SbIDrRh8fA=; b=NUM9CxsJYMtBrC26K8bWF9lSxb
	QCaPnxHdR5nQl5CU7X9I27TnaOkT4B0WW8ctoPg01jCfEMcYkpQT/PT+ZLXAu1bvRyGnKjz/cOfMa
	ZcE9K2JYMG/wNHgZ+hN8WpiHBHqQLSoGm2dhjZYGifG3dcH1kq2hjz7gzx2anXM1caDNl1lkVwM1Z
	hzwJCVIbVYaRzdzP/DPpfYvwHV0nzlGD8V0JYcUsfGFAff9UMaL7RGuubjU9bmekzDu/8UVuY7cr2
	uelkGSi8nud7cxSGH1fO+nVIIXcubdWpXoh1RuUie6SZ2lGZ7Yazrf4snHZ1IyqnK5GZkpqAgBwwa
	XtgRG/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syntG-0000000BryL-1wQb;
	Thu, 10 Oct 2024 07:47:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synVQ-0000000BpOS-39TJ
	for ath11k@lists.infradead.org;
	Thu, 10 Oct 2024 07:22:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c803787abso4641135ad.0
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 00:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728544960; x=1729149760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpFy5FxhMWXNV2yEqbcX+eoDVHfJa3z53SbIDrRh8fA=;
        b=HThNIxfRoXCW0XljRUuRSLqfofaiC3sV+s+prDOKSBECgj1+JLU5O2kQeblJouWKSb
         EmitDRYKX+Nnw6cLSNjE5/BZMB7HWd+xAkB26ZT43IM4V3C8YRJzHuMEJWwvTUBTX09L
         1jie8XserdLgdcIJapXU0pEZaBHTITk+OMRmdAuM6HkOSNUbFrbl1Gz3LnvF4/gSmkvo
         CIfh3zCVcRw1w+WgzCSFjgRJYOe+I64ijpfdRuBzoFNyeAg+6xAmhhu4y3lT5y9jszb1
         xISnSakfzF8nq9xpBobMfgSW/UHgpOhyhnEFe+NTTLAbc8Bh8qCXxUuL3qwbZS1ZMPwF
         bF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544960; x=1729149760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpFy5FxhMWXNV2yEqbcX+eoDVHfJa3z53SbIDrRh8fA=;
        b=psH3oFS891MhnXBwL4M6Cn3v7cdOXgZBIUTRtYhXGYQtTgG7O+vAc/BoSUSwd+t6QJ
         y4AO9jOYB4Vjl/dSGWbnetHZOJNHegcJ2jOvfYRIQIOl7Ny5GIDbb5EoGPsPrLDLGYsx
         lbF884ldQT8+9Uaw/yQ3+tKhWQTAsdt5Ok5oTyw3xwZoZ+9BetADIyyPVyx7KbGrYHsX
         sMljNsnnDipCqG9esW6ZuGILntkLIfSKUVhvnjyx05LyiNuM/ybQfCQGEiJy6F+Tl6yY
         a1f1InuS/RWa5wK/s7mPYu77EfGqHDVPUzfEnaAQVpMZDilyQcLnZj69w6OPWFATYCva
         ILMw==
X-Forwarded-Encrypted: i=1; AJvYcCUHmNbnjE5H2DSznIT1xqe1ffG6BvRAKr+S2P7yTrVHguQ8tpgiPo/00PQqHmunaxeCiWwHpfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxToDGJZFTK5yc//GTfJqLV9ftVNm8ZElfnxeWjDUv2TwZYQ9J4
	5VZhHelnEs9s02hX6SK90SKjmiMYx5807CTlsr1f6/i9uHZCI/m4
X-Google-Smtp-Source: AGHT+IGCY0d5/Qj+wIFS/XBm/sG6iNLJ29I4Eo4vbbDr/u4NiqbohxygQN6qqz8hnNNVbtV6BPr+pw==
X-Received: by 2002:a17:903:230d:b0:20c:5960:bd60 with SMTP id d9443c01a7336-20c804444e8mr38534905ad.3.1728544959784;
        Thu, 10 Oct 2024 00:22:39 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c21616csm4413865ad.224.2024.10.10.00.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 00:22:39 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
Date: Thu, 10 Oct 2024 15:22:43 +0800
Message-ID: <20241010072243.10227-3-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241010072243.10227-1-lujianhua000@gmail.com>
References: <20241010072243.10227-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_002240_826695_4B73CCBC 
X-CRM114-Status: UNSURE (   9.38  )
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

Add bluetooth node and this bluetooth module is connected to uart.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
No changes in v3.

changes in v2:
1. pick up Dmitry Baryshkov's Reviewed-by

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 7a55e271c3ac..100607da42ad 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -30,6 +30,10 @@ / {
 	qcom,msm-id = <QCOM_ID_SM8250 0x20001>; /* SM8250 v2.1 */
 	qcom,board-id = <0x10008 0>;
 
+	aliases {
+		serial0 = &uart6;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -799,6 +803,21 @@ wlan_en_state: wlan-default-state {
 	};
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
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
 &usb_1 {
 	/* USB 2.0 only */
 	qcom,select-utmi-as-pipe-clk;
-- 
2.46.1


