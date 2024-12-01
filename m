Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFD8D49771
	for <ath11k@archiver.kernel.org>; Sun,  1 Dec 2024 13:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSi63laDVLde5pIwB6wSgBpmbCeHCRHr3UINQDkHQJQ=; b=sVx8NLaPBtUaxJUMjwsrputJJZ
	1x+1wxbfShxu7raUVCTQcEL9y/MkPl/DhqcOkP+tkA2xlyFnBwFepLDEos97Ey8ah8tbHDuh9QneQ
	Wb7yEPdZYIodRKq7muRBEbnwCQgzHMwGCely6s3EHEO0dGtnXJUoD7p5Tmuz8KtapcPiK/wpK+S3f
	i0ShnLpPk5OrswoDcJ77QuLkZD0YUiIonvi31kKJwLetVcxhNymR2QUjA3QsHbA4f4+0qcAj+Gk9C
	3nd2jw9GpUGHvjnKRJFbObU2SqRIKdAZjbPYBAk/gfd3+nY8cq8uMx56YZAm4pSadssmaQDVeWA2t
	Ic1EhfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHkRu-00000003sLK-24Fx;
	Sun, 01 Dec 2024 13:57:22 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHkRr-00000003sK4-3qvN
	for ath11k@lists.infradead.org;
	Sun, 01 Dec 2024 13:57:20 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7250906bc63so2377231b3a.1
        for <ath11k@lists.infradead.org>; Sun, 01 Dec 2024 05:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733061439; x=1733666239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSi63laDVLde5pIwB6wSgBpmbCeHCRHr3UINQDkHQJQ=;
        b=AYb5tJXjL7aOQzlj2HkWPs35yyVpK62KNsQvADfWrSBb3MHPgDjemxMbFA7uXPSdQO
         rsjPswEUTATAcUiTi1SxqP2LGUEBm6ZerYzbZ5UmPKhtZaeQyT/hnudvl7LLhbl6qFpa
         i9x1gXb8I59Gs1exScW/nNzrIgx100tzmPlrPVCUI00iH2FsRXjucq5wNrHO9IooWtVx
         aIf4IFUp7WW/dnDPXSN8hiTxoZl4d0Rl1U4Z+D74KjoVqJMqFdwcdyFNu72e+7Fwj5ns
         s4s0MUF2F7AS1zB4g3EakhWvJTp5VAHP54DeX0px0OoZH0AtTvxnUsFkj9LIJVkRTQfy
         4v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733061439; x=1733666239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSi63laDVLde5pIwB6wSgBpmbCeHCRHr3UINQDkHQJQ=;
        b=vTafCwMeEnGrj50otKadetK5zdW7oU723hC/sUOmIDy1xonoZqtxIw8SgYybGRqe+j
         K/XI3XDrfkjUXcjzWUf/5kLcOgdli8erF8MbFBkxk6SUQeJUaZPBZNSLzu0rHfwnq5Tm
         j6GpRUMdvgp1IqznKRh8bgG9PpB/5sPwvhe15Y2Am1rbrY3J8uavghjVAGjiXCszuu9C
         w7YdRkMvWFZEiVH5lpUOVdGrUxVSXTvPfr/vrODS2B8vhRqLFdCv9FNqvZoHpjx/kdl2
         5+nhcsIBMA+Q4rM93F567omZbLUNdMNld1I/85fX1T0F3dfW1vLyLzVo5bAXYjqE6Szc
         lNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTsy5vrFZPbFdVE4gCPDVObJ+zYBtj42KRFhIAf2eEqKNbEzf+Q7bWc6v36gPPFyBW/Zxm1Vo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTZ+ay+yKtoxhwZyl80JZQrayQrNPRtis99haiOiMW0wfxE7qh
	pIRNpzoxdVbRFuyL9ZNoWuH4q6J4MgTQRc+6UfnQiigsweRleSJrszsFOQ==
X-Gm-Gg: ASbGncvsLGivCO49AURLLyWIlSesqokwANwR1fjmZ4pmM+uAx8Hy46SuWPLNfyrWtrV
	4kB894QOuwFHSvxpqRiRA4CdvkI7UTVQpZBlw2OV2ciG8PO5LvGeG8uLxFAcWoFbeu1UogxdI84
	ASS+C3NSQVVDQc//4+HlYJ4YYxow9Vmjxh4BzALALJ7JwKCcmgQFl9l3ZiSlKPVv6DlmtWXlKDn
	Z6zbt6OFdIzNZap9315syRBEM6drRMmeIlOF7C2Q0cI+wb6eMqXsSQLeyS5FH1LvasI
X-Google-Smtp-Source: AGHT+IFaEuhkU4qR7aHB0uV1Ch6t4H7GsWfvPfZ9GTPabcTVWYOp6CJKYF0f3EY1mkzg2xv4eosLWw==
X-Received: by 2002:aa7:93b5:0:b0:725:3fb5:5151 with SMTP id d2e1a72fcca58-7253fb5528amr18770034b3a.12.1733061438923;
        Sun, 01 Dec 2024 05:57:18 -0800 (PST)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c30e2d8sm5260617a12.38.2024.12.01.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 05:57:18 -0800 (PST)
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
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
Date: Sun,  1 Dec 2024 21:57:16 +0800
Message-ID: <20241201135716.141691-3-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241201135716.141691-1-lujianhua000@gmail.com>
References: <20241201135716.141691-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_055719_953445_CEEE4D89 
X-CRM114-Status: UNSURE (   8.53  )
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
No changes in v4.

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
2.47.0


