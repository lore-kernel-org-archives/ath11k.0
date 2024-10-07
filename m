Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF17BCFB443
	for <ath11k@archiver.kernel.org>; Mon,  7 Oct 2024 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CwQatre7HDmPEfiwWXMhAxTYd1eDybO1wBnpMYOLMc=; b=YM4Ls6C01KfZoruOkRLxBc5yyx
	bWzFs3EQZCoqbPWA/OvcnYznrGTS02gOziG0Vwfx98WGWlSB4LBJ4yDAZzANccOsk7/Jn0+kqO+hA
	t8NgDK+Vz1a4ku7W/t/aC3gXRW3koQIOQ1sQZQSQdPm/UlSEpCZrx5wQtQuh/2ufa8We14RxV0mMO
	9d/WK0jXv0OtIVnIKXv/r8V2TMLkZ9r/+ZTkITbgVjXsz+xDrmcXcTOj9IcyC5KD29ILXbOpgYgFH
	Ifr7pfIgkVs9w7LF+SfWRVbLqmfATFHUXegTh5b2ttaMDqziomHPAUxgL1wxLWaArDNa4T561fQiY
	T6TrG4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnhL-00000002Uk2-1IDs;
	Mon, 07 Oct 2024 13:22:51 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnNz-00000002QyI-0ktp
	for ath11k@lists.infradead.org;
	Mon, 07 Oct 2024 13:02:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e075ceebdaso3114769a91.2
        for <ath11k@lists.infradead.org>; Mon, 07 Oct 2024 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306169; x=1728910969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CwQatre7HDmPEfiwWXMhAxTYd1eDybO1wBnpMYOLMc=;
        b=B2Iie2ZHHRfrNhvliDtgkAX3FE9z2HjiuqVISAzUhWw2PtvG6ya+thLJKAcUh5r5pO
         WtpltuRacXcSKP+9ALuFYEVkMamYXA7qApDTEzOIXEsEywrr71QrezGbV82g+ApfK4vt
         NrASvUzaxHoOGh0kqoRGoWUjX11DTARjAhXEjM9jYHGNYzXfyJ1ej4e1P/3LxrIcxCei
         /KUgZxVR8jbt+pfGrFvel3WiBCsKBi2Nb8cMs8cjJ08tzWvb/nUtB1B03LQUfbBqM+Y8
         nl+oc9ydTx9T4qYaPfkAyhXbQhDnFvdQ5Pka7PPrZ/tHTuInb9+uAYHnpUebvbcCh2Qg
         7Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306169; x=1728910969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CwQatre7HDmPEfiwWXMhAxTYd1eDybO1wBnpMYOLMc=;
        b=ZPnnKXjeNZsGhv4KzyjT+m2cjNLW3zBBtqhT7x6Twkhbnr/QVVEgOFdBJiWve3h3P0
         er8Nw8fH5t6G/WHL9tj/yF8RpEyStgw6rO1mKRDImYabflyfMbkBSevP5M+JxhpX7MEY
         qWFOVpNxpmD73wm19m2/Ak3flS188lb9uHaBCRWEkuQ9RUAs8Xf89T0DOpJbqWr7Ahei
         nGL2xapFPVoPfoMnQH9MvusTkVKMBC6Z7VNdq3oA88/Xoq1vOhoABHn0It9pT+xUz9vr
         rUUNfW/RLQtJlFCUISnAQWzR11q/utv2+xVQbjIQDrxwcCPbMtsoOM8X8IcAhERhQCdr
         bn3A==
X-Forwarded-Encrypted: i=1; AJvYcCWhUrGKZWCCkxHuuu1ViPqQEuAut0L7DK6h+y7EGZXkctrugAPfYePHjnlqysjhWUBVMmCws7M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq5T1Xv5WPUGCpwSfBHqGuNPkCW1IcRQOf+P4hi9Xe9atE9cxq
	qkqaOtNRRQ9aJaZmxSa86wgFp66W1JxLzEm0o0xchMNL8Bmj3i8E
X-Google-Smtp-Source: AGHT+IHphNi8wQvW0Re22UFHYUWUX4stPnQdkVdx94eKxUrXesf/TgfdflxgAcmdcunP3HnAr5R2+g==
X-Received: by 2002:a17:90a:db87:b0:2d1:bf48:e767 with SMTP id 98e67ed59e1d1-2e1e631e7a5mr12276086a91.29.1728306168961;
        Mon, 07 Oct 2024 06:02:48 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b128847sm5306654a91.49.2024.10.07.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:02:48 -0700 (PDT)
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
	Jianhua Lu <lujianhua000@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
Date: Mon,  7 Oct 2024 21:02:51 +0800
Message-ID: <20241007130251.125022-3-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007130251.125022-1-lujianhua000@gmail.com>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_060251_237712_A94C4AA0 
X-CRM114-Status: UNSURE (   9.53  )
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
2.46.0


