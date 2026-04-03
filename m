Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7EBE85367
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=; b=dcpTPoa4zscVVdsPRyBIElmFc/
	EkAFGnAv2qpYKjREcCN3Yrkw1a5xYVVSso4/UMaNyR1JlX9kkkywxyGGcwRG/bAMEllXby4hwMrJY
	ckC0fhyV3N6AX1xFcV+3vAt2V9fWYzyGShCipmQj31nUORKBqhZUJnwE4moUvv+nk4hOln9DKpwVn
	Q+9BEwqZtJQ+HG/TZWXuMqw6lar0JPDgh6FvVqRoVE2rGNDQmRhOOLbvCX1SOagHh5ZaUS97vtnKS
	uLHXZ2gPrNrwDbepcS4hPTjObVJE0t1x6sUzx9w/f2xBJSIxf/9ieoCx91x7ScurP1vifQc5JAFvU
	pbEVz4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezf-000000026Qa-4BIJ;
	Fri, 03 Apr 2026 13:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezf-000000026Oq-1Jeo
	for ath11k@bombadil.infradead.org;
	Fri, 03 Apr 2026 13:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=; b=M5MPwqgMOznyIDdxSwbMMIJ5dZ
	ERUshdWkaVGROAoU5qpcLmlpEkTSemt/ONw6GOpbgwQCtc4ubBUW+3la8/RM+B2AHaL+lq915hF71
	GNXjf5zGBPQ9AQm0bgSqkW+zCxTJ5DcjvpnmDVy9Tjq6dSKd+zk6wiXRuhRvDdkNYkxLuCo4t17/c
	l45LiPSeAnVyorJj7YO8XkRvv+UpIWbxAc5jC/N+VDE1QEoBltdMx5ynVISCZ4awGv8DhHds/nkLr
	Czd2A2JoFg4dZIpuzc4vSOoaOkBLovo3eCpWx0fzI9aYhbQqtXAjYLIQB5gauP2EH8kTHDKlF3cgC
	HlAfzjZA==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezb-00000004CZm-330F
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 13:55:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b941762394aso251675366b.1
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224520; x=1775829320; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=;
        b=K04X/XmPdkbvd7sLCQhq1anYXRxe4A62OLxs+lndrB80HrBWO6O+HufgwEWfUQVP0s
         3HGbW9zpS9+g654KwRjwoxliO3MxaCzD4EBMR6Y2qOHckx9T1uAj0oCiOryeCZeioRFm
         MHFP9xKtOyqqEALKAoPCA75gz3WxBPFVeRihPFYOHLZ7EOrFqkzScaZWBEZRWAtaQEQW
         te5ee2j4TYV6d2bEe4E/OI5+R0fR6+13CsSDp0YtGddn9mYMLBOSe08yBm2MN5/fdKxu
         ZT0sTJ1kGjiu3pBNQpyUDI2Kmh+zqzoLRkSTbURWtZt1dnqAwtMoBRfxehUh+VRBNuPy
         /TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224520; x=1775829320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JUIw5PfzjSbRelAWl0scbWA1aw6NDc9ZPR21LqC1P6U=;
        b=JEk/eDV4PQ9K4gLBVgHKlJw1BMkvvOtIat0jxYIioDT6QDSjGIJy6NvufBTZN3xha9
         RC2IbHqOIzMBzV/eIgwe4GOqkCwtadvM5xoAtHP5UFwgTF/IOW+NggfhCl5gsQJcr0NG
         HuYWvHl1FBKkvZszq0aDwHIcjG7iTyILDARrtJFq2swC7tI23irqc9+UNjtlm9kCfS5n
         B/V3tk/z/P7RRnC1q0PWvDvCygOupPtfOhRHX0QsDSNDtWkB4JsTgdmPQDOjPS2dMgGw
         FrXNEnnocFpA1O6oPUXiphcWzbpw0aZhTcm/O+CpXNCEk7q+x6MIO+z0eB0WhGmgDhSl
         vWNg==
X-Forwarded-Encrypted: i=1; AJvYcCVskC681KBhIMwjeoE8/+LRuvwdiQie1IHn5/UfjlbwFTFaOsI9COAmpjYbnerC1AhLb+F1tso=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzx/wjTFOK4e4fOJ/FIddd9YClpqZ5QlT84NohFFEhLLZ4BRRX
	au2czfMM3LLsML8o3qBo/aSa3RRauYcTwq/kVy15Fdc7CjWKDhIcEiOtn5Wscjx6HCE=
X-Gm-Gg: AeBDietd8OGNXXs/+h2IwFuLB3JosOQYufisoUtoTyGZVjiS89SEBZL1DozkJjqSYaF
	HkD178GcYLVErHqmQvxuiqC6+0bxxo2hLLKP4V5COulJZY35LWJhCWmzjWeFVozcc3UDXP++37d
	I2+9K9lLCOhl8MpyS1Pay92ONp5eb3d+WWkPLL+mvxXJP4n7CrsLQZjpAcvYTNsI1Bzb09Hgtsg
	US5NhNemXeHSVy9c4KO/C85j80wPFqYGNnBiTOliRs6eoXTPkMgQ04jFgfaWztKHHQ3R+GkYlxH
	zA4CQeNG0vLUcrczHPE8q8IfZVgRyYCGauNXBit10Gzkw0ztOwvrgaLdQkhuNX4unACT7di8Bkm
	Tj9BYiuZuden/Ehuk+xsgzm4jM3CMyANSRiWs9zuuW+YwZVZJAWb/PAxWeajK+WL96oxlo7x8ix
	noiGFDkBsGC+eu24xglRQhgJ131OEKKxya9Ya8oO3hIfeThfocVMDeXAlHC8617AWFbZ/Tq8LuP
	Hea0CKyuD4Dqbu+QnNV7JkPrchvyhRoqXMr3A==
X-Received: by 2002:a17:907:9711:b0:b96:e593:fd1e with SMTP id a640c23a62f3a-b9c66e5e2cemr156799566b.0.1775224520390;
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:50 +0200
Subject: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1487;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0tNxjU9iZ5aS9yMEJ2ytUcRE8/Wq0mJ0XVTDTTRdWIM=;
 b=/YToNUqYXJRAKqxJIRr0r/cZTobsLFymsg/TVbH46bVWMTHSJdm7XRvdUpgk256TWrcMjxZzR
 nOrivC7LfVFCc3S9aQe2Xi11CK1Ror8u934bOVKDYcB1HNT8BXOHYGt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_145523_989279_9C62F7D8 
X-CRM114-Status: UNSURE (   9.56  )
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

In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
split up the pinctrl configuration into 4 nodes so that boards can set
some properties separately.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..71292dfd6e08 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2099,19 +2099,27 @@ qup_i2c7_data_clk: qup-i2c7-data-clk-state {
 			};
 
 			qup_uart11_cts_rts: qup-uart11-cts-rts-state {
-				/* CTS, RTS */
-				pins = "gpio48", "gpio49";
-				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-down;
+				qup_uart11_cts: cts-pins {
+					pins = "gpio48";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rts: rts-pins {
+					pins = "gpio49";
+					function = "qup1_se4";
+				};
 			};
 
 			qup_uart11_default: qup-uart11-default-state {
-				/* TX, RX */
-				pins = "gpio50", "gpio51";
-				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-up;
+				qup_uart11_tx: tx-pins {
+					pins = "gpio50";
+					function = "qup1_se4";
+				};
+
+				qup_uart11_rx: rx-pins {
+					pins = "gpio51";
+					function = "qup1_se4";
+				};
 			};
 
 			sdc2_default: sdc2-default-state {

-- 
2.53.0


