Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCFCE8536E
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=; b=iZ7ZjAFN/Ji3GwueA2aj81MU2K
	K5Y1TZhuKf74hkEc5/i4oiQxYLdZ5yd02vXgmlile/f5Nj/Qui5M2SXjS6HM3Elsl9qGa4a5S/aKW
	X5lut20z3IstuSmybXVEHJERGZqlwb6SLznGuq6LNXdytmO0/Gbi6YV8c6FD9Kcnia4FdvYTJ33d1
	SJvrADRhE7716gpAWyke5fK45SwT1oRmtu27ppsRkSRVzNouLrNrRgOjitf/SBHWOmtGtYoY3Ffqc
	BUgMkn8rT9PwGavSfRbhAR0ZJLhglsWzRoydhGQ8E0v69lL1iJCFL1CTg3nNy5opV/yar0JQTadjZ
	qTcvJU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezj-000000026U8-2B3L;
	Fri, 03 Apr 2026 13:55:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezh-000000026Rc-2kS2
	for ath11k@bombadil.infradead.org;
	Fri, 03 Apr 2026 13:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=; b=AFgl+EiCeT1SEDay/Oy+QlKxlD
	X/hySeXEa7BFnTUtzoWW6eRmO2wyuceTA4Cyw+7OFkhD3/TCYZNBpJjcLvyBY+ZZ6uDW6R7mQgCnj
	8Yl/1rBnoBL03qBprvpErJWxhpu8ovISshxvHCrm8CfO0ohAEG5xnIghXN9+DES8MVU+IsrMGYW62
	/bAXJRbzK7YJOPmPIRfIP9YQ7BUfjzLmY1sgwH0JD0CpqvwwLOnVaRi4VPq9VpEQ6SqwVg/OCmYWy
	OsJlMCeN8Ch50kQpfjkstbTtpi9i0zf5nobglt7SUQnuLHYPOWac7kJyt/cgUTQa7+8fwUxcVLh5E
	BYilYyxg==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezd-00000004Ca5-36yP
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 13:55:28 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b9358bc9c50so272185366b.1
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224523; x=1775829323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=;
        b=0ihw5bkMoPJ2QYiAZGf/RxPtiNXw61Lv5GeVzuZDkTnqdOQNcsV7ZCca6umwbOG52A
         Zk7tSJ9a0kj7sLSxOQZWqiRlL06srYp7rjmE+sq9/cCCBQCXvlVKiBqUCU2Ea46n1Rdf
         AQSZYya49Y0m8iVOB24xa01rKukOYJ05BKIgtUmjUnsXyg32Qq1KyzGbs62xHkCooJBd
         KRXW6No4ddJs21rGQFHJm8tFQLAq8jEyYGs94aNHwOzfKPnWpr+pjtqsBkHmgZRZNRQC
         0wSHjryp1F6l7G/pupOSmRa7H5YP+dQGheSllpEC2Mew7K408UtErv7xKSDrutpofjQq
         tppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224523; x=1775829323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=;
        b=KjF8OK9eUgASlZzXvfyhNjCFh2T2RyFtqZLGydoqyzcvZm5A3yP3zr0YGCR5gpXyNf
         HXhrgDTbwPGmE+9h1ce3aTpnsO+UiIULib00qOOyg9tqY6rKS8uFYuE1MFfcs44Y1iLT
         VZO3HpY7zQEfWdKP9hdqaXZ/doRXblyGr4zqI6ahi3bka+TecmMP5Rws9YhuOpKF63BL
         FigreLUDfJM3yYN3j9t/H6om22c6n9/jxA5mEbFIkkbWjyZsNqwMExBFWMGx4hicOjOX
         EdiT2tIrxUTSvHaoeEl5SLioSoUpGzxBIlCydSRyQwIoBirGkptu2eiJMo9ydKsrSU0a
         fvew==
X-Forwarded-Encrypted: i=1; AJvYcCXRGOrTdOCtwmrTEP3nngd1QJbk4eDQ7FwpLghMgXhRLV0ZePdpolrVOvL4FoIpjF3yNv5kg+o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0NBGg/TsaUU/TuCqKH6Z/lBfoPPLXbW05IVlmjfdKtFNlWwO1
	yTkQZWfwhJw8NFXz9x3P84gyvW9jjfsLSBY4pDPGWAxgBOUf//+6fedHpnyXCd4iZPY=
X-Gm-Gg: AeBDievO/9GXSxMM8vBnDdpPaPKTD3YSV1JXIiYRJV/HOojRVChqD2i7WUZRoZona67
	ZVxCT47fXyH20rg+zldbeq2ALW8owmwKDMcGefGzWFFInTwmgbS2xXTzUinmQ2DKfqMROOjbpEa
	VMV8xYgO32PjUAtBCdYaej9duM5KRxPVIt7R9v3+zD9n1sKJ2w8T12vCy6GfUDsyj8GD4sIMoec
	3ixbF06zByT+9SLtQkvDMaFPm+gerQERgJrgZHck+zfmeSIER/V9WpyM13rQVFHPyYQf88IjG5G
	HZB0X90If4Wls3ahVUgmoUGXTBiVExQSN+1ClUZdt42dLuek1SaITRfoED/ciXKOmT2labkCb75
	+gMbwdMUSGnZIlp1Xu3+uJo/x63jFfGtGAB5bsoUmhSbnAL83x2OIth/R5RXxBGmwA9lQPEWoE7
	U/VaDji3tYVZN+drHqNPnYOmOj8PfZ4uqYhtn6pBl2P1XBzjbiLrwzLrbiyAFxY5ZpWmtAG1E7Q
	lqTnIAyVIhHx9Hqn1gG3lvMbR6YlqRc3HxmAw==
X-Received: by 2002:a17:906:6a0c:b0:b9b:5164:906a with SMTP id a640c23a62f3a-b9c672a4f0cmr157218266b.4.1775224523388;
        Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:53 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1686;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WiO7xxC4vnoDFEP8yYgqIU+yonljli5p0uLIYnjF80c=;
 b=9xLHPNbkt0sV/SMYIy8WN5UbmrF1+a9f7EhbS1150zHQgK2ZkM3gLMQ3RUV3bSz9ea71I2aJt
 R2qV50g74/zAGlFDurH8tXrwoGm2tG7BDnEuEDClBZR1UMTaig0kdCg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_145525_912435_844BEA42 
X-CRM114-Status: GOOD (  10.22  )
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

Configure and enable the WiFi node, and add the required pinctrl to
provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.

Thanks to Alexander Koskovich for helping with the bringup, adding
the missing pinctrl to make the WPSS stop crashing.

Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index db72418b7195..d8ac495ca7c8 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -242,7 +242,7 @@ wcn6750-pmu {
 
 		clocks = <&rpmhcc RPMH_RF_CLK1>;
 
-		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
 		pinctrl-names = "default";
 
 		regulators {
@@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
 	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
 };
 
+&pmk8550_gpios {
+	pmk8550_sleep_clk_default: sleep-clk-default-state {
+		pins = "gpio5";
+		function = "func1";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &pmr735b_gpios {
 	s1j_enable_default: s1j-enable-default-state {
 		pins = "gpio1";
@@ -1049,3 +1060,9 @@ &usb_1_hsphy {
 
 	status = "okay";
 };
+
+&wifi {
+	qcom,calibration-variant = "Fairphone_Gen_6";
+
+	status = "okay";
+};

-- 
2.53.0


