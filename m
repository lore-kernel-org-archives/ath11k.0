Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3867AD49773
	for <ath11k@archiver.kernel.org>; Sun,  1 Dec 2024 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8BEB2d9VDDivv3uuqrErXlNfZp57BYmvdkGk2vj1t0=; b=oNtBNQNcDkUKAXBRHNQpsngTrW
	0AD8YhuJWqKYcC6KQ0Ub/pveOF+VYvs2EQqEy7ddJhz7iD6eP5bpck3kgSYEdePfH07J60uRCwca4
	cNLvZrRMn2HTv/yIs8BD9tBD2IjCMrb8pCZVLgp73XUVK5Rrg3JmOQah+295ukaAXwBiRoyH/xfYc
	ah2ESV7FbNJnozuxGZcC5LNwQlfNrA5cJwdQZFs1Wj/DgVII2uvrORjo/5PGiS1lAHtDR9jTEySyb
	yEfv9ujJBo05XAg5IIbgLWGZn5bEdvoVK+ARbMOaNoldk4CgqiLQSTocE+/d00ctHsQV8eNQhL/Kf
	+UJX7/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHkRg-00000003sFz-3iZv;
	Sun, 01 Dec 2024 13:57:08 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHkRf-00000003sEw-17u4
	for ath11k@lists.infradead.org;
	Sun, 01 Dec 2024 13:57:08 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so2377680a12.1
        for <ath11k@lists.infradead.org>; Sun, 01 Dec 2024 05:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733061426; x=1733666226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8BEB2d9VDDivv3uuqrErXlNfZp57BYmvdkGk2vj1t0=;
        b=buv38pQaO3CqpriwIo8oMVujj1KiQsuzGW3XdCydHrL6K4hdwKlA7TDRkKIidk6hPd
         Spfkl6kODZcT4gp+X7tfTxBV1MIQ4LlYW2d33vQ5XQKGuSY0zqdDk0LIlEiCD5546HLu
         GrFfBCA9riZHD+BLvsmPJBwoOZFATVA0LMj4coXLud2TgiG3pfAHBYtfNyI69ZUD3c5F
         M2LT1EYpIwQ3OGVVK82YX+hnclzpG8DbyMEAZzjHowh8nb79asprKuQBpZzUoLcxLD7I
         nSiX5kCCa9KRF/9mHl7x27fbfEqamDYDuZ4izC0Qudn5UjJ779Sl9nUcxxtZKWcoHcMj
         T1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733061426; x=1733666226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8BEB2d9VDDivv3uuqrErXlNfZp57BYmvdkGk2vj1t0=;
        b=Rp2TgKV0Pk5EGJ3GLSF1S4/w3IHSfBRWoezUOQT0Z53UkiIXNQbu9OTxQLQOwBsFMn
         DdO0khvzUGMdEcEcWUt91PNpR6y/SSZKxwcP97CCo76Ui1a1Ll9jmZV/t/hGXMf6AeXn
         ts8dMXUNd83ST23fnLpQeilCn8ofaaHlTHlZMUJj4EApwUcP0FJ4ql9HjH07TaDCFHgN
         AOD+cA87IupWaLjhK5KEO70TDt5ywiZjFEFt+sFojkOwJcim4Rfco3e4rBZRJ9YX/uLZ
         XluW4JGKuZNPorYl7gg0fr8zPc0R7AOK9mMdDgIbJL90Pk/fos9ViCwzkgFZr6d8uHLQ
         IG+g==
X-Forwarded-Encrypted: i=1; AJvYcCV7wAeMlMGDyeLNYBoEPAyrlUy6zezst+rsowbaTLfI2gqvbN5yMo/55s6qKR+JgCFarqOvrwk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHq+uF7z67P89U3pdRm15NRMqkxRzJCgkAw2uGyVzrAX2buNG9
	qZcxT5GOf6PvnGHV/wKGp/kZaEM9ewpfJtKdzPj6+8A+SNzAB0Ss
X-Gm-Gg: ASbGncv+oXjgb+xOdyK08MEKPPaxApGYFY7u/cMHLXDNbGB7PVbUhnuRTq3m5qQDx4z
	Bg39KBhB3uRMD5XJPgMrZokuMY++2NHbC/FnfY4lCRJN1seQHE+Ty4Jat+91C7L+qhfB1K4z7Dd
	8Xoq3vBqlEU/j8P6fpF4eM8qDUhgBlgwAvPdP7TEoIHVfpIntMOdYuJXUhAMC+zAo2T2OcoiWYn
	59+YskbtHnOlzwxR5U5e+zxolCMEi0IAczb4Dmk+nVhhX6KEIQGlBiZwjsCrwxf2D6m
X-Google-Smtp-Source: AGHT+IFJjj9F4dXNsBy6kw3+QYCWUsKYkEUj+Q4WLS4WR0HTA1qQwKaj+2crHZAGT7A5uyFQQuWvMg==
X-Received: by 2002:a05:6a21:7e02:b0:1e1:f5a:c027 with SMTP id adf61e73a8af0-1e10f5adc02mr16461640637.43.1733061426284;
        Sun, 01 Dec 2024 05:57:06 -0800 (PST)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c30e2d8sm5260617a12.38.2024.12.01.05.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 05:57:05 -0800 (PST)
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
Subject: [PATCH v4 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Date: Sun,  1 Dec 2024 21:57:15 +0800
Message-ID: <20241201135716.141691-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241201135716.141691-1-lujianhua000@gmail.com>
References: <20241201135716.141691-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_055707_302751_001087EF 
X-CRM114-Status: UNSURE (   7.90  )
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

Add wifi node and this wifi module is connected to PCIe port.
The following is qca6390 probe message:
  ath11k_pci 0000:01:00.0: Adding to iommu group 12
  ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
  ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
  ath11k_pci 0000:01:00.0: MSI vectors: 32
  ath11k_pci 0000:01:00.0: qca6390 hw2.0
  ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
  ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
changes in v4:
1. pick up Dmitry Baryshkov's Reviewed-by

changes in v3:
1. fix commit message typo (pice -> PCIe).

changes in v2:
1. add qcom,ath11k-calibration-variant property.

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index ebea283f56ea..7a55e271c3ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -680,6 +680,25 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
+	};
+};
+
 &pm8150_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
-- 
2.47.0


