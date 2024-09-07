Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFEFE71080
	for <ath11k@archiver.kernel.org>; Sat,  7 Sep 2024 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ry35yCJ463+zD4OGlWWPKJGpjaBwBkhPM2x5J37i0CE=; b=RFnRM+ncCrKkT1A4q+15mQtCgM
	M8l5LR3DXMb6LaOfDiwgwkMS0pI3Pri6Ho7QL0gYNRYs9Bm1+MUmZMMYDJJG1GS1h805En4fNG/J9
	4me8y7uMWAUQx6qQanQVpRRV3rlSQV/jG6fiD1VZBpO7wCKlKGBgw9/JAlAm7yWYfFJExM/s7zAuN
	jOcVXi/KlChUewW5vv8gH/WSa76152PfcAa9szk9x1iyoxXxvKBUJDRhzBVtn3ZgJzql2vjRLlVal
	AnBTGVgeTjlfi0OLABAKryMTOvusARU+64uZ9HjhAEVRZOAzNQL50rG7IMwKsnlZifTh+odhad+1d
	cFp5ckEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smuud-0000000F1LP-0oiK;
	Sat, 07 Sep 2024 12:51:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smuua-0000000F1KS-2y5n
	for ath11k@lists.infradead.org;
	Sat, 07 Sep 2024 12:51:33 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5365b6bd901so1466115e87.2
        for <ath11k@lists.infradead.org>; Sat, 07 Sep 2024 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725713491; x=1726318291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ry35yCJ463+zD4OGlWWPKJGpjaBwBkhPM2x5J37i0CE=;
        b=ZGks07xdBSdz7OiSZJ9k8SAZs746MhjXOjmDt6vVVL+jdWTZPq0UopXltXnabhwPRv
         +5A2gyjYdd5Xgk9AScj9iDB3S5tbBt3GG9ETpo05UpYNjvPQ2ZRYpm7817ue4g1zxoif
         Kob0fF060hIouEEUjKStlEeb2MuZu5Ic3lYlQ8QlvwxLJ8qsDHGvr0x5H3YKquxEOJdB
         T9GR6uPdFzgsy/VhWh68+qrZMzqZyK6Hna3gYCdge+1SYH6MrM4fn92yKjRhAL1zCJqK
         U8zIWPP6uS+Bz0eYPqE3436qnQ4yN/jFe9jl8CPmTi1Ob1YD+gCPWAbbxvdkZVRRGF1X
         G3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725713491; x=1726318291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ry35yCJ463+zD4OGlWWPKJGpjaBwBkhPM2x5J37i0CE=;
        b=j4Zz9RuFW26n2L6/yy/bfitKaJSZX33/A4zsaCzYv3IhTcCscwxMeo48aCCv1NwPvB
         XjrrxPiOw8QNIIkVHjhwIjUbp2KattT12l/MgSC6fkClv+OQ/8Eem9yp2eLZw8whDcF7
         d4m7f1ANCrrwn0OGXtL1tuu2hLk1mM/D7vnlykYYEIn0RdbdltYm2ehVs3jC3lCMUaBa
         FFulMb1iIznxSJ9dBjZjuIX+bTntzBUoWbxJg8mc99zukZLvu2GkIjMmLDeFQ9LWDCwE
         ++y/Sc936Aq00CMwchsIcqJ9vJqrbJ7UkLLxzzj7WS5W4eBX6OFnhpf2bb/j1w838IM6
         lwWw==
X-Forwarded-Encrypted: i=1; AJvYcCUZykQbPhXnaUrK9nD8ThupCGGewPGbME5dglu3Tn0WMv9SKF5JXAl60uR0DM6a1H/j9QFRxbo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSyYNuOz5ResUmiPLJMhgESZZjD427S7cY3twAmPQBIc6rMxxh
	tSVxMdo37tIHnYKgiDtHowK/+u9hdYZjxJMT6kxLzmDehBOEAU6vamIViVkzXxQ=
X-Google-Smtp-Source: AGHT+IEOYXbGoGUO5kEmH5otBnf+rwik5L5cVUNcm0tfDqQeLLbqt7pwNbM7kCgryALND2b51rr12Q==
X-Received: by 2002:a05:6512:2c0e:b0:535:63a3:c7d1 with SMTP id 2adb3069b0e04-53658808338mr2826012e87.48.1725713489995;
        Sat, 07 Sep 2024 05:51:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb76fsm143273e87.177.2024.09.07.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 05:51:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 07 Sep 2024 15:51:26 +0300
Subject: [PATCH 3/4] arm64: dts: qcom: qcm6490-idp: enable WiFi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-rb3g2-fixes-v1-3-eb9da98e9f80@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=741;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mlgAAn6y1IVA0pzyPONzxQeJLkN87dF7Z/QWTl5Bx/I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3ExOw/FMRhOsTTuXWpEh0sw/kSrPWZPsk0sGQ
 TR2yMbWxymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtxMTgAKCRCLPIo+Aiko
 1fAfB/46pS2cy5RrZoYjuW5FHyWBpnDqz4QHMaQ1OS4nFZSd7ca0LgA7Qd4TFw0uFPFe2p5o/gm
 mfx/ghco0wj0+Xs/kakA5EqcP307OCrtgW55catskE0zAWKnQhTHDB7kzcGqmQnkvd8gfrift/Q
 jlWtr4GNvrEG3Fn7mvHgROrCg26MtTdGo+rBekA/5mjQovR2A3VU6U9fdHY4+Ao4TWY23wTj40j
 fPGzXvI15RV8jPdr5Og7+vGnG6OHsB91pqTCp4gKWa6hzAPo24lQOxAOKi/PqW6A5wA8Kh+ofy9
 vZhpZtq9PPrD9Hg48fe7dknHHZinlnZRHOD6X71RWiZYhYQC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_055132_779759_812B18CC 
X-CRM114-Status: UNSURE (   8.35  )
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
QCM6490 IDP device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Cc: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index c4cfafb3ec15..5f3d4807ac43 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -728,4 +728,7 @@ &usb_1_qmpphy {
 
 &wifi {
 	memory-region = <&wlan_fw_mem>;
+	qcom,ath11k-calibration-variant = "Qualcomm_qcm6490idp";
+
+	status = "okay";
 };

-- 
2.39.2


