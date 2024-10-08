Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC60CED24C
	for <ath11k@archiver.kernel.org>; Tue,  8 Oct 2024 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miFjzeWy++5orkxZQhpnOaD2jAcQZeozu/hleuos2cM=; b=JKdOYTfbXQ2bAi0rlr/UuahSSR
	HCn8L2KCsGbpNFi6eJEcKJQSDJZVTzB9CZrjqKrYgrSz1gG6pUtm22BNVYccQG0wkFK96hAJ6ZJgi
	zz+ht1VVnNazQEzXK0DulxLZE+h9aJKXD6K35wy3Fr02J49z/52xTL7K6WdbTcTLIcJOS5WiB1Kox
	dY0rf3QuMAJsh7kYdFVOA1wKB80/S/HVbHMmrehfRSl+fECkd9X7akmiIgsROPcvHnLQhEBVnUThg
	KA3lxJ+s6wkTxPtHmlCmleegb304Vd61t+QH3VZQvHAfeOPbbvPQk0uVa2BUw0yKZAk0f5bbTTi3u
	uAgwaUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxxlU-0000000452q-40DT;
	Tue, 08 Oct 2024 00:07:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxxlS-0000000452B-1Yr1
	for ath11k@lists.infradead.org;
	Tue, 08 Oct 2024 00:07:47 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e0a74ce880so4211192a91.2
        for <ath11k@lists.infradead.org>; Mon, 07 Oct 2024 17:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728346066; x=1728950866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=miFjzeWy++5orkxZQhpnOaD2jAcQZeozu/hleuos2cM=;
        b=VOKSfnet7Q7aB7qP4Aax0yCGwJGQ6g1d3cRkRtnS0EWmoWmBM7nW6KdDIHslVDdu6n
         qU2dPgYJD6fcU0++yCPOm+atp68s1K4b4feNvyR9znT1zlDgex9evYS9xNq1dInpCNJS
         VUS/aUThNfoad1nfvlS/70P0tYTXnfR/8XSeM7S5xZIUomA8SVUVJvlMDGmdBxLqnYCM
         XwBUAe/r+n8NExiAF1y6ljWz9Vy+o1WgZKUzTLUGMaygnXlvmeGrZdF/Y6Tv/BbT0mww
         +bPKyNcXqddnRCl0pY9u2nTjuDOSUTWc+gzCjDCXCuE2gv6vmDaosOGm0wDmdkAo42Rr
         AZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728346066; x=1728950866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miFjzeWy++5orkxZQhpnOaD2jAcQZeozu/hleuos2cM=;
        b=kPoM7gV1f7gUO57XHT7NE0Gw0l7kkiaSJpOrnKQecM4X3D91e0QfCMiLFBd7HOUOGs
         yYwBThwh7/XgTMGQmf8DBueNB06tZBDx4FDjdJYUb49FjEuOZsm41dXXOcSQuCKKvSDm
         dx/M7hlmSUW4zVOrawWoilewlUsmaZVgMbx9MlLxfQr74zDMt1X45pyWNGuM0WSugCs4
         YHHM/9SQ+pvSsyh/k8quZKbY7H9E+HWatWzimhKIWlcvxDrJGEyfuLJtE+3J/JL68Wfr
         9NUmNvjGLcMELCMCuC9qnU40hx3XFyV52Qa2yOVQWUMh3al7oJJcX4xz19pPzSnJMhVW
         SqyA==
X-Forwarded-Encrypted: i=1; AJvYcCVL+9tbB5psgEnsd1O2jBMURcgsWAx6LvpAkG7trx1xibhmB4jcVxYEWKMLKOf82KwDgT07ElM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ5jWOg5+ZT3mAD1WpbbEw3D8WCCPrsY0mAxkXz7+CZKkN49mp
	TNp3G18RlLgWB2skj11ejRasCPLh6Ng9TJijy+YCpNiS1eOw/X6r
X-Google-Smtp-Source: AGHT+IF0RBKwgW4tthfAQBSAoJIijBpe1n0ZQjkbJYge4bFLQtS9TcqoaC+egoNNjETfPykOZdtVwg==
X-Received: by 2002:a17:90a:43c4:b0:2c9:7ebd:b957 with SMTP id 98e67ed59e1d1-2e1e621e54bmr16491664a91.11.1728346065564;
        Mon, 07 Oct 2024 17:07:45 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e83cabbasm7921653a91.9.2024.10.07.17.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 17:07:45 -0700 (PDT)
Date: Tue, 8 Oct 2024 08:08:03 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
Message-ID: <ZwR341pdImJf_z_b@localhost.localdomain>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
 <20241007130251.125022-2-lujianhua000@gmail.com>
 <181d03f6-9a1d-449f-a8af-b4d0fcc8b188@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181d03f6-9a1d-449f-a8af-b4d0fcc8b188@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_170746_437133_3BA3ED76 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, Oct 07, 2024 at 11:40:48AM -0700, Jeff Johnson wrote:
> On 10/7/2024 6:02 AM, Jianhua Lu wrote:
> > Add wifi node and this wifi module is connected to pice port.
> 
> s/pici/pcie/ (or perhaps better: PCIe)
> 
Acked
> > The following is qca6390 probe message:
> >   ath11k_pci 0000:01:00.0: Adding to iommu group 12
> >   ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
> >   ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> >   ath11k_pci 0000:01:00.0: MSI vectors: 32
> >   ath11k_pci 0000:01:00.0: qca6390 hw2.0
> >   ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
> >   ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> > 
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> > changes in v2:
> > 1. add ath11k-calibration-variant property.
> > 
> >  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> > index ebea283f56ea..7a55e271c3ac 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> > @@ -680,6 +680,25 @@ &pcie0_phy {
> >  	status = "okay";
> >  };
> >  
> > +&pcieport0 {
> > +	wifi@0 {
> > +		compatible = "pci17cb,1101";
> > +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> > +
> > +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> > +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> > +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > +
> > +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
> 
> Are you going to submit the board file per the guidance Dmitry provided?

I want to get comment for this patch, then send board file.
I have send board file to ath11k@lists.infradead.org now.
> 
> Note that I am not up to speed on the firmware/board maintenance procedures so
> we'll need to wait for Kalle to have bandwidth to handle the request (and show
> me how he handles it).
> 
> /jeff
> 

