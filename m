Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D96D1CDD1
	for <ath11k@archiver.kernel.org>; Tue, 22 Oct 2024 10:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvTNyLNGAHIQ6cpxYTM3zWA6pjUJiTbrO2qEq3VuoYw=; b=xvA9red/euxgTc5dd3UZu4EoAu
	LxhbhRx+t5Mpf67q8LefsjNVwkXoOm4gMEt6HOt6xq+rEOPINOBrG4SZFSQCoR7nXDZERwQQ/zsVW
	y41aCdiN2Eps2NLWoTGX5nRkATG/6kNdNvEQ7038T5vWJ+FHMwkiIkJz7a1pq8XEBtNNDUhQn6ibW
	HKJ/2KK2WczsFLQ+ixTkFPWEFJyiA+4u1PxOIGty4yVRDMOOP4zfhxYxE3F/IE7K4RmfIfQ51g5vr
	9d5igmWv4H90g5rJmN3Xr4UDaX50DSUZR/kFAnUuQNVkAaJt88lEI9DwJw2HtYKTn1F2E23h88zKl
	AuiIPPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Bvh-0000000AUtD-1zWT;
	Tue, 22 Oct 2024 10:15:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Be9-0000000AS6E-2pDR
	for ath11k@lists.infradead.org;
	Tue, 22 Oct 2024 09:57:51 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539d9fffea1so5163745e87.2
        for <ath11k@lists.infradead.org>; Tue, 22 Oct 2024 02:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729591068; x=1730195868; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvTNyLNGAHIQ6cpxYTM3zWA6pjUJiTbrO2qEq3VuoYw=;
        b=PZ363elJB1rDWT85TzeOlvSl3fuH/rZk1DTESZkTiSUFSauQV87WTc/SucGCmJlKM4
         zZKqnXVWfPsGyU5TKnKB0hyY3Sc+RN/uR/OlnntKfyLyzFm8d8xZg1ruN8gWcr/NGRsd
         HSVFXUNVl+KJAojKEnuIep+g6dLOs5qr9/OWZbyfoYg8dWPydeuL1jB4TZQSNxnnpNBn
         FH7vcWHD9Ran7zHrZX9WWRf+SOYAVqVv/corxvqNXZS237sPls0C1HrxhLzgOYjanF5O
         EyDq9Sev1MJucjrqmLK3D3yTYhrDw5gXxBiLcm7KiMOqJzZdE+6YoZ4Y9NHQHXThN8CM
         rSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729591068; x=1730195868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvTNyLNGAHIQ6cpxYTM3zWA6pjUJiTbrO2qEq3VuoYw=;
        b=o4Hu/1K6s6GUw7LHc/mKdSeLRYmZZB5Q3JcmA671IyXb0wo//oxYzOc31ebadP9wDf
         XCzwzrs5avWo2vtonrZwElND/UWxjIzIri9BBhzkKMo6/qemqvX8O65XynZ2I/0e9cbE
         65MY271PXFTsKLKlXbslQz+AKbgA4zmHne7+kS5IbxumN8rv7nFlUk7qnHpGgQ3I/7HM
         se5FFL9paruaFahDHeY5wmdrtrVhUtnKIGFUHhB+4GLycileSCa362HXd7U4NQx7hf8K
         8uUdvnh5WRzFFQSoPMSx+u/1yXT169I7ly2NApgRpfaYfWsw92whBQSV+daz8bdeFekK
         l5/w==
X-Forwarded-Encrypted: i=1; AJvYcCVsWaYGghSuyBy7Vunw/Gtb4cEPz9F3qoo5/szxz+5eXlgmFdo2aWoNUPjeWeN9TO8B2F4Ez9U=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywepag+MnR5v70UcqBRPoBhsq4OcDDVx6fQx1SgkX1wsT1RMEGy
	zc6sXcl2NWotl/Cy9WYv9sAAOKwZyHqSpM56W0zHF8jxN1KWV8/j8vPctpwZMO8=
X-Google-Smtp-Source: AGHT+IHVu91T26e5E//xB6XfjAMTT+PWPADj71F+BMcbekDOXThdc77eC6SbwTZMrGx5Pm1w5zcDNg==
X-Received: by 2002:a05:6512:220a:b0:539:da76:c77e with SMTP id 2adb3069b0e04-53a1520bd15mr6361012e87.5.1729591067825;
        Tue, 22 Oct 2024 02:57:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223efbcesm728504e87.72.2024.10.22.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:57:47 -0700 (PDT)
Date: Tue, 22 Oct 2024 12:57:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] wifi: ath11k: add firmware-name device tree property
Message-ID: <smgbishqbin4kcpshqvue3ivvfko2l6rj2w4ikwydosbkq6kde@pdbzhklj7znm>
References: <20241001033053.2084360-1-quic_miaoqing@quicinc.com>
 <20241001033053.2084360-3-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001033053.2084360-3-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_025749_746412_91B292FC 
X-CRM114-Status: GOOD (  14.91  )
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

On Tue, Oct 01, 2024 at 11:30:52AM +0800, Miaoqing Pan wrote:
> QCA6698AQ uses different firmware/bdf/regdb with existing WCN6855
> firmware, which is customized for IoE platforms. And the 'pci-device-id +
> soc-hw-version + soc-hw-sub-version' may not be enough to identify the
> correct firmware directory path.

Why is it so? What makes it so different from the existing platforms
that you can not use WCN6855 firmware?

> 
> The device tree allows "firmware-name" to define the firmware path,
>     wifi@c000000 {

You are describing platform node, while the commit message talks about
the PCIe devices. Could you please clarify, whether it is a PCIe device
or an AHB device?

>         firmware-name = "QCA6698AQ";

Could we please follow the approach that has been defined in the commit
5abf259772df ("wifi: ath10k: support board-specific firmware
overrides")? In other words, instead of creating another directory under
ath11k, create a subdir under the WCN6855/hwN.M/ which contains your
device-specific data.

>         status = "okay";
>     };
> 
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

P.S. please CC linux-arm-msm for future respins of this series or for
all other submissions that concern board-specific DT data on MSM
platforms.

> ---
>  drivers/net/wireless/ath/ath11k/core.c | 12 ++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h | 11 +++--------
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

