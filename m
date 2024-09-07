Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36F9EB64CF
	for <ath11k@archiver.kernel.org>; Sat,  7 Sep 2024 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bp2f3Cd3xUZZx5mV8or2w5DKaQxEUtdkX4okocf5JKQ=; b=Vj8XLiET7ck5Mz
	k4Uc5V8cJDsd2gWMmhHcGy1n0RFMIm79q2RVoGRCsOhu51zN7wCXafRQO02QZF+Vj25VED0OpvrqJ
	EksEXD7gJn3AU8AIX1gxEuidh7jPIKt9Q3N67c0qJeLR81mAb0SNKWcy7Ag/l/JuyaUuCcfIoRP9F
	i26eo4tMRBglw0PuJICCEoY75UuEsUmLV3QL7H4NymyGp4ic2v4KT2R892uhfotnSKY4Lu4rfthfs
	iy1oCurDwUHVQpR162sJ3mQR9WnAAbwjkKtY68lcDg2vFKNtOZLfiS5a5C2r9Arnq7ROBDonbSOty
	v7p/KzAFy9ikaIEGEX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn0Uw-0000000FTuJ-1gfG;
	Sat, 07 Sep 2024 18:49:26 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn0Tu-0000000FTZZ-0WJP
	for ath11k@lists.infradead.org;
	Sat, 07 Sep 2024 18:48:24 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so6384861fa.2
        for <ath11k@lists.infradead.org>; Sat, 07 Sep 2024 11:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725734900; x=1726339700; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp2f3Cd3xUZZx5mV8or2w5DKaQxEUtdkX4okocf5JKQ=;
        b=A0RJ09ZYHEmQIZSN7WAoTkgP2j6vDwCWUZUrfI0x5k7ypoxU3+UhJHgD2OSh8eVcq8
         JsuuYUNwauYULtFN7mg2fBb2shRts6O1k/TKN9L+x4fvmge3vcJdpefO46LiA3FTIRC0
         e2sCJxvfEQv3j1OC1kCWr/VqSGC4K4/hcy8PLUV40AQs3K6rwOTZEtkPTTZmoxq96dol
         E5yU/P3MrWEfAhiOrm1Vk6uu5oZFabS4QAOeUm/Rp7UK1XeTi6Njky+8iRik95VmSjUh
         LlnNDV63gAoxWTntvup8S8VfKVYV32cGNRsW8makEAFv8tklEm14CsuKZIYZPXgWJE/3
         LEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725734900; x=1726339700;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bp2f3Cd3xUZZx5mV8or2w5DKaQxEUtdkX4okocf5JKQ=;
        b=vGFpeczau4WpBxXF0dkj0qRtgkUhBZtIY9Jvd0zEdERt1Uapkk2oIRi6QV9l8Boay1
         M5D39uwTjRAoU5fE9x12ZFuhlVYuenEVAdyQP1aNkbrho6qOpYMe4QLLNuCpSkMSb/Ah
         1AM33+XHGSKKUywJmrrz3NOg8C6BkCjaC5/6UcSZ5uMWIo7ZqSv7InmsTncb8geU30/5
         pCGtYpDh+7PWC+wtsTgunCI9GlmaUKAv0h8QybdVd2a7i6RUGomNKdSfy8Y3ZpIFVyCE
         K0I9zCAGCq3NfEJG0UXj2mWHJ+iwAE9DULbwHLS+u7W0G/RHILKRnqcu3noyN99/G4X2
         +upw==
X-Forwarded-Encrypted: i=1; AJvYcCUm+MJAu+waFxVcbDy56Pj9ULJyDF2lXBs1LFr65UPX5E30PjH+OIzTQjm3pfZuWQSf6vUvlK0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmCHDaQDBetO7BtYM/gHDEGNNUpmljGzrZLVbLtEgexOjAEgH7
	xIngkfwDpYiTKOFccQnlknbmvGuho/Zn2xUGEbO387L4O8ZcL5FKbFDZLgl4BqQ=
X-Google-Smtp-Source: AGHT+IGO0WNu0PFOcRrTUtNd5FKi2izDYAt1p3P/Gtjx0bVcVZuQjc3v0I9yiOFDdx9qV8/gFlWDQg==
X-Received: by 2002:a2e:4c19:0:b0:2ef:2c0f:283e with SMTP id 38308e7fff4ca-2f751ec89bamr35682181fa.12.1725734899190;
        Sat, 07 Sep 2024 11:48:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c0b1af3sm2271861fa.129.2024.09.07.11.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 11:48:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/7] arm64: qcom: sda660-ifc6560: enable GPU and WiFi
 support
Date: Sat, 07 Sep 2024 21:48:11 +0300
Message-Id: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOuf3GYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEwNj3eKUXDMzA93yzLRM3URTi1QL8ySLNPMUQyWgjoKi1LTMCrBp0bG
 1tQAf8W+jXQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j2MGhLcuLoVLWg4I2MuE84ebYpICQobwJaU/0pV8mPM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3J/s3aD3giiWStxq0Uq71R3ZAHngRAI9exh4S
 gvabAQfWrKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtyf7AAKCRCLPIo+Aiko
 1WpICAClKoPTaFjA24SOWFpGheQP76MScFD8h1Cc7JoNZyGlm/c9t3JtblTAopntkVLPeWJ3e/R
 weoly+63q++LVTgHBNDieyj/sKCanLvE/GbQdmsaQfZUhorPpYC2nivqtNLjxEduVwDZNQ0Oivd
 e2g9mjU/97PGn+LIx9M4O8IzAYqd5z125QWqX2An9MwNmzZZkfYd1NsuKzQMFqXSPl0oSU8CnfQ
 RdgDEKYZJQfPFWInCTMpMc6D68DYCBhrkvC/z0jyFvcOeuXdAGl2xFzObLWF4eK4cWmETcQseuC
 NgOMqyDQ4aXXsSqhzTnVB0VWFvFE5f7tVAq6VeA9Z2nrxz51
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_114822_171853_A2E9D640 
X-CRM114-Status: UNSURE (   8.06  )
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

Follow the MSM8998 example and limit num_context_banks on SDM630 /
SDM660 platforms. This allows Linux to make use of the A2NOC and KGSL
SMMU, making it possible to enable GPU and WiFi on those platforms, and,
in particular, Inforce IFC6560 SBC.

Note, while WiFI starts up and can work for a short amount of time, MSS
starts crashing with the following message:

qcom-q6v5-mss 4080000.remoteproc: fatal error received: dog_hb.c:266:Task starvation: diag, ping: 4, triage with owner(d.dump 0xde5825

Note2: DTS changes should be applied only after IOMMU chages get merged.
If it is not possible to get IOMMU changes into 6.12 in its last days of
the merge window, I'd kindly ask for the immutable branch from the iommu
subsys to be submerged into MSM tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      iommu/arm-smmu-qcom: apply num_context_bank fixes for SDM630 / SDM660
      arm64: dts: qcom: sdm630: enable GPU SMMU and GPUCC
      arm64: dts: qcom: sda660-ifc6560: enable GPU
      arm64: dts: qcom: sda660-ifc6560: fix l10a voltage ranges
      arm64: dts: qcom: sdm630: enable A2NOC and LPASS SMMU
      arm64: dts: qcom: sdm630: add WiFI device node
      arm64: dts: qcom: sda660-ifc6560: enable mDSP and WiFi devices

 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 32 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 38 ++++++++++++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 11 +++++++
 3 files changed, 73 insertions(+), 8 deletions(-)
---
base-commit: f70cb2e8ce3f8883a526a28f93b7744d1a1a9ce0
change-id: 20240403-sdm660-wifi-a58e87b8f7d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


