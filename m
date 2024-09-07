Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA0CEB64C5
	for <ath11k@archiver.kernel.org>; Sat,  7 Sep 2024 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eD6sTmDGT5yjbK3VSKihHlljdk27lYNgMECrwSWDT+Q=; b=iuUtyn+LujFngf
	t0soMdoCzRAcQjqLnzI1yG70KYZCj2VzW9UPSGOaGHQGpobouksIQwx1IVco6xWEH4hsF0Z9qwJAZ
	+BKn2nYUKbXyXJWl2OpaS6pfP94xI1q50ilOlDgO2gYJcoaNbSGqM1FYHnK2K3rFgdubbrrz3IwMp
	vu/Ul7F8zAaVabrwGrHLkjLC8ZeOhuc76hxkxf0NF7VM8ZnTTSlfdUtEUgT1P8vYPngrS9Vh71HOx
	Yk0vbZUCdgp7BQskqG2oG85cOr0/MFc9jpB7yRS0S0vB0s4ZOyh9V48FUjRNI4vXuKq1B8Z4mtowq
	+Y0UVNwWjwLl0KMZLfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smuub-0000000F1L4-3ANv;
	Sat, 07 Sep 2024 12:51:33 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smuuZ-0000000F1KC-0GBu
	for ath11k@lists.infradead.org;
	Sat, 07 Sep 2024 12:51:32 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53659867cbdso2422814e87.3
        for <ath11k@lists.infradead.org>; Sat, 07 Sep 2024 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725713489; x=1726318289; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eD6sTmDGT5yjbK3VSKihHlljdk27lYNgMECrwSWDT+Q=;
        b=IFYs8Hf2hfDlyyI0+MP2U9kdlIwiUQQIbQruxNUzyKfr+YgZ7tzqxYrjS+dui06hsm
         pYicJ/+RYH5OswTzpzRwJA4eaGyCkFnQTjvs5wNCesfv4wRl+yYAq6dxmqyDjrvr184Z
         F3q4O2hyVfL+6z0aF18NkhgOPQ4R/MzMtcDIBSSzh+hO38kvIcvuycfsGMikYe4zTJTV
         KGsdoUDott7IkvJSDUnr4raTdvIjwIOkkJGxUhHXMmEMGLZKyG0JAPIMJzOQWaxPGQog
         u3NjY4oWBFC70uK9zCQOWbKlxJl8fWwRJfMmfV4LQHy8n4wGZehdp3WmxWHQ1hXOH10n
         V0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725713489; x=1726318289;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD6sTmDGT5yjbK3VSKihHlljdk27lYNgMECrwSWDT+Q=;
        b=NRhUJ4qMkX3F1yYQLgOF9DdMjiHzlkTu+6O6qu0S8ylMC2oh1+SNPP1VnKJIboNoJL
         9GikUX+tOmYI+DMCF0HKyiDQX2YfmYxaFBKpDpyhGKVgx4E9gYKV/ZvBqfjxe+rEd5Sb
         geSgtbxvkKf5jXfBgBYqMqTWrEGRG5d8AXvy1QZtHJ/d+8IXhR7022ptkRfbOunPnx51
         9pjXiQUFGE0iiRJcVDAUbTI0Q9ohMFAMiF8xBGRk5fUv1eYvXkVxILPfVfWrFMVCcROM
         gVK3SbyBSAMbBydU2fMMojIajDmi5GYDHSZOb8wS7eZnOdZgp4DBbQ1YlMxQSaTqRBEr
         AiCA==
X-Forwarded-Encrypted: i=1; AJvYcCUQoX15xpxQhT+0qpf/d6vhYTjxTtxPClq3ov14PipXK58v3T4vGR7wowP0iRnH/JhJq7hLVco=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2WKoM2IFWVvNYY/gCeY+3YNYV+UejXb979Q18JZNLnUI/V7AI
	hzf7uSgAJoKxJGD3n7MAcj2lkq5sPuVZFC9gRSd2Q5oAeagLfhIlSNgCajQ3hnQ=
X-Google-Smtp-Source: AGHT+IFN8zhhDATsn6E4CgRGDEeVCxfkMeXdbOgQR1B9tu35EJU80+iclas/Iu/9CbYFdkm2O04eKA==
X-Received: by 2002:a05:6512:2210:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-536587ced63mr5324665e87.33.1725713487707;
        Sat, 07 Sep 2024 05:51:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb76fsm143273e87.177.2024.09.07.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 05:51:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] arm64: dts: qcom: qcs6490-rb3gen2: several small fixes
Date: Sat, 07 Sep 2024 15:51:23 +0300
Message-Id: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEtM3GYC/x3LQQqAIBBA0avIrBNsGtC6SrTQmmw2FgoRhHdPW
 j4+/4XCWbjApF7IfEuRMzX0nYL18Cmylq0Z0CCZ0VidwxBR7/Jw0Za8JTTEzgVox5X5D22Yl1o
 /5fOwuV0AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, 
 Kalle Valo <kvalo@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Eftm1W+GNJmOJ42BfApHc6KXNrDKzXdFjqNJBwvHC5Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3ExN5mqCwKB4Wh0d4mb4TQ/xYsL7JcidKUc20
 C/0cxQuamWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtxMTQAKCRCLPIo+Aiko
 1aS9CACTrbXWCyrLgX8zPGjgBynAeh6+PdJa/FG1nqGe+I584L7sLKSNblB5Woq7B7KHJe0Wh23
 MjKleZzQZFEXtXqvVw9Ra/7F6Fj072441VwcUyq3LsGMnMjLyPYBWCNEyeu9JGSnJBTYd2p9sFm
 rkjoEuyzsh227CN1vi09zAoIzRCwkt6Il9gn10grnLVO6FwbfabIT6zU+2I9N31D3mbHvs5Uc5o
 8A7DbmtHEb8DZBxEjsHs0JTpGTLoiN+BvvycT5EYv10K3+b1oz6pfk3sISNyCiafRw911UEixOA
 I9CDmIWu89vIIBHGpm/jsMJ7azDjZpLHM/vnjhGSwlmfQz6l
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_055131_152240_40DB082E 
X-CRM114-Status: UNSURE (   6.61  )
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

- use modem.mbn instead of modem.mdt
- make GPU disabled by default
- specifiy ZAP blobs
- enable WiFi devices

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      arm64: dts: qcom: qcs6390-rb3gen2: use modem.mbn for modem DSP
      arm64: dts: qcom: sc7280: don't enable GPU on unsupported devices
      arm64: dts: qcom: qcm6490-idp: enable WiFi
      arm64: dts: qcom: qcm6490-rb3gen2: enable WiFi

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           | 11 +++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 13 ++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  2 ++
 4 files changed, 29 insertions(+), 1 deletion(-)
---
base-commit: c7d810a304e6ed8bbf3a09716ae3827fa185d2b1
change-id: 20240907-rb3g2-fixes-74a74204e88b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


