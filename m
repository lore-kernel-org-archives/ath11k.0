Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23195CFB445
	for <ath11k@archiver.kernel.org>; Mon,  7 Oct 2024 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rqykl1jSbR3Xf0wddDtKRGArfsd/LgQPVty+FehECcE=; b=Vc1AOKKnP1LjCoFDJZz89MmXNG
	K0+Xe+GXgkxLima+CISMfCOXEW8HP2fQkT9Ml/McuaEkM/OSxY0AyFq/lsH6s2LuwlJ0GcxwYEKrz
	uyLeT/CDGZxNrOyanSsT8waFf0WNvtbA6L1VT59VgH6w9GbAGJ4Cz1FOYNqCvptYb16KNhau6V+Kq
	Ix3x1RXAJHRnbab7+GUtSKh9G/ErkteKinDgZeV8GV+ZmVlkI7Z8dg2V3nknfQFF2BxWVzez+RHgg
	y4K9PdyG94ckwxvHtRDyQupX0iYGc5SGfu0oZnN3dulCIS+BFSqw+/Gvi1reIqax69ELiLYv+OYdi
	7+NoGgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnhK-00000002Ujc-3VFZ;
	Mon, 07 Oct 2024 13:22:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnNs-00000002QxN-1cJp
	for ath11k@lists.infradead.org;
	Mon, 07 Oct 2024 13:02:45 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-207115e3056so39564055ad.2
        for <ath11k@lists.infradead.org>; Mon, 07 Oct 2024 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306164; x=1728910964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rqykl1jSbR3Xf0wddDtKRGArfsd/LgQPVty+FehECcE=;
        b=hBvm26biLWOSENRgDOypSUNeuSH1iE/LJfn8whon5ExGjWmr3WDKsZdyfPmL+IZkOM
         /aEi4rvwuwRBzCcbXopGWvwr3pJdBLXyP0aHVrCyHh0SmaldKjTUFkknN+iYR9leJvDT
         KGeZBQXTuk5R2cUMjsQ7UKs6MZpnp3IZ+lk8oFjBzQkpk9/yQI0oWLlynPpixiImgf6m
         cWpDuW7TsK9rQJcTVwTXwBXbR4c0E95Ke/axOKTl61k0MgtO8VwrHdRHKf7BLZJ/zZs5
         7Ig+WL5syIaNb/zI/iDw5D/U3DhucCezRZqrzgYCVXA9HfAC6qp7lS2kbjMVCZcPVCEc
         k5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306164; x=1728910964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rqykl1jSbR3Xf0wddDtKRGArfsd/LgQPVty+FehECcE=;
        b=YY2ZCv/cMqiWNFYBaMDHGeDhhjDuavS2Ojyb5jSzN6OkDxFAWGE7sd49oke33/xdaa
         FX9MhFpnNGpJFoWUKhgPpQAWmoOUaglTeH57u8cVwk8o7NxK+KM5tN66cm/Hg1E1Rrl2
         NLwptT/0o5LxMdDiUV/kMGPxxKyNDhBdsAZ47ckwU4baiIZJYNaw6yKKVSZ+DchpVuX5
         kmS3aQ8Y1gavFQIOUj4qhIe+Po/Pgr2qcf+fMZ4+rw1YLGoA0+THwm9TqZ1b5n2iEUw6
         fsUxK8TEixfrW5DE3eB0BexnliyB0CZMePEERUrK6k13ZDJZE5aof3lwA4wUvaMhr054
         Afpg==
X-Forwarded-Encrypted: i=1; AJvYcCUCROH+BkSMWDZMKTJjipwrOQPKG6T5qBA1HuAx+Yk7b/MaHm/zcrANhPRB0L8OpHW1PntwCgw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlSKNeoUvRE06Ib8NwTPzTtE1Ztt3gzw/7jsdClqMALzGmHHBS
	lvq2Elb3w0IKoHdxoUPtCIWkWZnCXCGjw+IN5m/ZHt9OyNaox5Iz
X-Google-Smtp-Source: AGHT+IHgj18A/vjl7cwbS7J5GjAsyapY1A8uAmSx9GKN/DSCI14RjjrVWvOelKONI7gJCiAOxdqTIQ==
X-Received: by 2002:a17:903:41c2:b0:20b:c1e4:2d5d with SMTP id d9443c01a7336-20bfe494d53mr158699775ad.34.1728306163666;
        Mon, 07 Oct 2024 06:02:43 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b128847sm5306654a91.49.2024.10.07.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:02:43 -0700 (PDT)
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
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Date: Mon,  7 Oct 2024 21:02:50 +0800
Message-ID: <20241007130251.125022-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007130251.125022-1-lujianhua000@gmail.com>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_060244_445416_F7824C52 
X-CRM114-Status: UNSURE (   8.47  )
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

Add wifi node and this wifi module is connected to pice port.
The following is qca6390 probe message:
  ath11k_pci 0000:01:00.0: Adding to iommu group 12
  ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
  ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
  ath11k_pci 0000:01:00.0: MSI vectors: 32
  ath11k_pci 0000:01:00.0: qca6390 hw2.0
  ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
  ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
changes in v2:
1. add ath11k-calibration-variant property.

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
2.46.0


