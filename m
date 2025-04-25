Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF38C369C2
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZbqNinw0GvgPs1iizzcZ6AlHQrRMk2Lrby4q0n+fcU=; b=C3XkCfAb5B39z9ubmibrNO+W5a
	5BAPYWQtpRjB+grZVfvP94HWnTy5JKO3ht7VHpVMTPeDR3rvRBTcJ1tEUaQHIVagvDyIAJI6dRqeO
	kzudeJ1KIgjWSC26avGyIuwdN1O6q8z/7e/1gl72U5E3+xZDIlpHXjrfws1Mb7UCHiohloiBCCxfq
	43oXj7xEMSr+SPXbg4BxCLgYuy9o9s3C01NCmGlNwti9s3cFO8Lu9DW5mQrS7qdhlp48E+pktdU8a
	eoxgMQ3+ye6Us8e9qwtZbsNK8vQc6N/BwY7zujOz7RKJDOsZbcF5VIowJy5Lin99quX/rIYr82zgw
	P2iJMwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MZq-00000000LhR-3rzS;
	Fri, 25 Apr 2025 17:11:02 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lkn-00000000BC5-3NaT
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 16:18:19 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-af52a624283so2307472a12.0
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745597897; x=1746202697; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZbqNinw0GvgPs1iizzcZ6AlHQrRMk2Lrby4q0n+fcU=;
        b=TzzO006C0F3aHPTSg0H+wr7NE6GW2rgGQkWRMcj35zmaI5GZ1zmqR06JLqGOgK2ovP
         2TSw2APBWnKUyK1NRX7iGK5PXpkm7JDJyVqwmWppzXwvDGgLRSvauRXK/f2kBKMocmqE
         3auS56Xdz5t15uWae+6Byz8TM2tmaAWutS0VjrssBVLhBJkSvkM3H9gvUOHE9F3rJDg8
         7p1H8adg46WgiK3YL+qZrZ6/EbTVCa8Cx4hZvFpg4waGpHDRDW4Vu2T3NuW6xiPSUqEx
         nVQQi6IxKlpwBUoIZyow66tvcJGiNz+s81QCXx0LV9dEkdxYBaL2S+3Rs3JVql5texRW
         O80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597897; x=1746202697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZbqNinw0GvgPs1iizzcZ6AlHQrRMk2Lrby4q0n+fcU=;
        b=iJK5wbhSRbn7Qdyr8jFW0PVxLyfRXwquT8zie1MtqtU0ew/27OXwYDg+bM5BhVSR8+
         tkfIYyxMacjIKDydwnKIzPBtCLbcogJbJsbPCODvfon8UMJ1HcQiYbNvEXCNZ6ObRqvE
         9PXuHRrajGBvxK6U3/gbdR+DFTCmaf0hc9ot4a4xCXM71oGVKaqTFCqUliyoNRbSDD0z
         R0n4O+p89dFtf9cggP0Wugx/T0rwoSdARbgV3Te5YquVKuhgHmNrr1i4o4koMa3Nx0/v
         wXGx7A9np8MaIReqzGb9iPdB7oGfO7KvJQT0XbaC8XyNl3Od2m6b0qDsJGl9v+bm/L0H
         vA0A==
X-Forwarded-Encrypted: i=1; AJvYcCV7xv/PeJ+XwnFqq8maue7/0uDT2+MnPcSd7j7JeHEaGR/KIUWVotY5AKsyUFqecuC16geNaks=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxb3KRB2+PzbOHIR8iAMK+bs0czbzrYfCqrkGEg2FsfGWfEbrt
	bIP9kEENjLu4dLN5cpmDo6cbevbLuy/OJnyXr6iAt8Un4CthXtCN3pLh6kxemQ==
X-Gm-Gg: ASbGncttqxKQ+RcQ8GG/NhuoVm+tme0hzdQ5bxb9B3nWVf7XDbU5hht3v0zTXura3vn
	2YUwFC/T9qDCBv10bB5eBGbeMDg5WEVKZfThcuIA4ekMzyTBT0oQ0RFuP9Njd1H5jm9oYQytuRM
	t9GKbzOMPAX3Dt4YEH5kSlC+uIcKe6bwiVZo+d8CZ5hiD+awM/InAuCDmdZmvcx0HWXykH9M8UM
	NvYtoJsHktW7vBHVDGOOog9CQraTL3WNLnxbR4uuz0u03I7ukt6pIwPSV6hljPriJzEKqTsPqly
	MzHb3zs3rIv2noS0uL4nVd38nggvOqKaqGONoGw+oa68ppfb8Uc1
X-Google-Smtp-Source: AGHT+IFJ8f+Ljs0TwETyk/DKUrALYADuqKxZ4P01us48D6R3+0qlUDjyPo+P1Thcb08Psu0HHHpIew==
X-Received: by 2002:a05:6a20:c702:b0:1f5:9cdc:54bb with SMTP id adf61e73a8af0-20445ee29a1mr8972811637.11.1745597896910;
        Fri, 25 Apr 2025 09:18:16 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45d2sm3080986a12.11.2025.04.25.09.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:18:16 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:48:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/10] bus: mhi: host: Add support to read MHI
 capabilities
Message-ID: <ywqbhivo7k7jmuptueeqhirlkpk5inbfaucuvmvnpj6ppcpzd4@whdsaymdvtaf>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-6-869ca32170bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-6-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_091817_854566_F68AAA18 
X-CRM114-Status: GOOD (  19.99  )
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

On Thu, Mar 13, 2025 at 05:10:13PM +0530, Krishna Chaitanya Chundru wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> As per MHI spec sec 6.6, MHI has capability registers which are located

Add spec version also since these capability registers are present in newer
versions only.

- Mani

> after the ERDB array. The location of this group of registers is
> indicated by the MISCOFF register. Each capability has a capability ID to
> determine which functionality is supported and each capability will point
> to the next capability supported.
> 
> Add a basic function to read those capabilities offsets.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h    |  4 ++++
>  drivers/bus/mhi/host/init.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index dda340aaed95..eedac801b800 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -16,6 +16,7 @@
>  #define MHICFG				0x10
>  #define CHDBOFF				0x18
>  #define ERDBOFF				0x20
> +#define MISCOFF				0x24
>  #define BHIOFF				0x28
>  #define BHIEOFF				0x2c
>  #define DEBUGOFF			0x30
> @@ -113,6 +114,9 @@
>  #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
>  #define MHISTATUS_SYSERR_MASK		BIT(2)
>  #define MHISTATUS_READY_MASK		BIT(0)
> +#define MISC_CAP_MASK			GENMASK(31, 0)
> +#define CAP_CAPID_MASK			GENMASK(31, 24)
> +#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>  
>  /* Command Ring Element macros */
>  /* No operation command */
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index a9b1f8beee7b..0b14b665ed15 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -467,6 +467,35 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	return ret;
>  }
>  
> +static int mhi_get_capability_offset(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
> +{
> +	u32 val, cur_cap, next_offset;
> +	int ret;
> +
> +	/* get the 1st supported capability offset */
> +	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
> +				 MISC_CAP_MASK, offset);
> +	if (ret)
> +		return ret;
> +	do {
> +		if (*offset >= mhi_cntrl->reg_len)
> +			return -ENXIO;
> +
> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
> +		if (ret)
> +			return ret;
> +
> +		cur_cap = FIELD_PREP(CAP_CAPID_MASK, val);
> +		next_offset = FIELD_PREP(CAP_NEXT_CAP_MASK, val);
> +		if (cur_cap == capability)
> +			return 0;
> +
> +		*offset = next_offset;
> +	} while (next_offset);
> +
> +	return -ENXIO;
> +}
> +
>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  {
>  	u32 val;
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

