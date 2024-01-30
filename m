Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA1CC47DA9
	for <ath11k@archiver.kernel.org>; Tue, 30 Jan 2024 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls3Uxxmz3c0sy8qMsZbIkIULGPjOGrI0Jt4YUuIFoRc=; b=H7gqJgoxBmx7L/Ftfh2cC8ILIB
	MHXd9y9+VIicwVKDJuwvX6lGexSAFhVUq1DWcb3jzSKi9cNme0YZMZTR1LGuisvevcGgw2B5npDsC
	oQXTMDl5MFgviHlONPsvUF00xL8XlSgXf2kJaNrRz87Nxiq+z/YYpwxsvTTswVB0VjujzhO0VjlVy
	4d6WBY2BIFCI2cyu2GUDuRc1APxVVXiq1z9U5R5QIqzB9Padx/nBu8SvlLgthEI/hJtdmeF0LS3NL
	RQMsdbSZwgmkYwQMqu0V1E24RuByuD+iyXVOZBpoAdvyzruK/kSQmmzbhywfRhRcnVo+AIMFRdF9M
	B2AnJr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUsi4-000000006Tb-0dHd;
	Tue, 30 Jan 2024 18:19:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUsi1-000000006Sq-1Ktn
	for ath11k@lists.infradead.org;
	Tue, 30 Jan 2024 18:19:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso2190756a12.3
        for <ath11k@lists.infradead.org>; Tue, 30 Jan 2024 10:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706638784; x=1707243584; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ls3Uxxmz3c0sy8qMsZbIkIULGPjOGrI0Jt4YUuIFoRc=;
        b=LjR08wRpM5Ftdz9bh8DU2AZm2Mxy0Eo0ThWCN40XpoXeiI9NWl9Yd1KZ1Pr90i5MLv
         s25K1SAy6Mf1U0iSaO9VXGT12c7N7LFZlVWwYmCyRVhYmVIcG/ukBTPzrB2gQ7/0wxxw
         r/8d6YdFxwhNvQ1g0L4BiQc+3nzCRt8gsjswIHNn6mQV0KRs/BLBQ7tYZ0CMYs9GUtmg
         SVw/daRVjcATOjCtVkSOp+EBtdX7PE7sTfSFwSlzjyZSdwhjarT1d1lCc/qD1EkAaHZ5
         BR6Vm6OSTQUCebpoyZJoiSDTpJl/cAdYhmmcDpTorH0cQm54Y90qCqtT6YrJrlvAsdHL
         Q1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706638784; x=1707243584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ls3Uxxmz3c0sy8qMsZbIkIULGPjOGrI0Jt4YUuIFoRc=;
        b=qgluSI1l5YryGsxrAcOy3r6p1wjWdSq00XG+OBOxchb4aCnpgQ3Mqu/7enj8tSZ0+C
         u9grgTWMc/slVeHuIX2Lt1jG4WARgb8t9ZYnBITVxYX2LXrsyskkIww6HTKhvf4Qytr/
         FHzOISeKp/PhOqgi7a6gJENkgw5b1LfLOi05TWgaokOb6oCDQ/bqQxLOgIJZdgd9uLr8
         3PZixTv0/HuY5YSJYuc4uGwgO2CGQeu99gKhoq+QXJRJMsHMuzErojT4iOwEMcpxFYiq
         1iaeY+ekNMIYKclApyr+AtA+KEKHyU4XRQjie1PrgqRC9iF8DMuZfaiU2VOhETIqYAzX
         Q+Yw==
X-Gm-Message-State: AOJu0Yz6Re+56J27coqtT9Q4RijGRFQpAOKKkD8M3w5lJyp4Q2yQF8q4
	Zeo6fpI8wBmiSgTFrUA56teclXNydSL3qCKiioapJtYwerJHdTRag2MX3Ottapicr+hMSoCWiGU
	=
X-Google-Smtp-Source: AGHT+IHPCu9lOnMlNxGLncAZdAs1JmBBA5bFyb0DGbrnwdgYHqOhB65j9rmpGNCxIyUIwU86J74MtA==
X-Received: by 2002:a05:6a20:9c8e:b0:19c:9fe9:d6b6 with SMTP id mj14-20020a056a209c8e00b0019c9fe9d6b6mr5409977pzb.46.1706638783739;
        Tue, 30 Jan 2024 10:19:43 -0800 (PST)
Received: from thinkpad ([103.28.246.123])
        by smtp.gmail.com with ESMTPSA id s10-20020a63e80a000000b005cf5bf78b74sm8464001pgh.17.2024.01.30.10.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 10:19:42 -0800 (PST)
Date: Tue, 30 Jan 2024 23:49:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/8] bus: mhi: host: add new interfaces to handle
 MHI channels directly
Message-ID: <20240130181938.GB4218@thinkpad>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-3-kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127162022.518834-3-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_101945_397153_D22A7F35 
X-CRM114-Status: GOOD (  29.81  )
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

On Mon, Nov 27, 2023 at 06:20:16PM +0200, Kalle Valo wrote:
> From: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> When using mhi_power_down_no_destroy() MHI hosts need to unprepare MHI channels
> by themselves.  Similarly, MHI stack will also not create new MHI device since
> old devices were not destroyed, so MHI hosts need to prepare channels as well.
> Hence add these two interfaces to make that possible.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/bus/mhi/host/main.c | 107 ++++++++++++++++++++++++++++++++++++
>  include/linux/mhi.h         |  20 ++++++-
>  2 files changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index d80975f4bba8..3f677fc628ad 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1669,6 +1669,58 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev)
>  }
>  EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer_autoqueue);
>  
> +static int ____mhi_prepare_for_transfer(struct device *dev, void *data)

"__mhi_prepare_all_for_transfer"

> +{
> +	struct mhi_device *mhi_dev;
> +	struct mhi_chan *ul_chan, *dl_chan;
> +	enum mhi_ee_type ee = MHI_EE_MAX;

Reverse Xmas order, please.

> +
> +	if (dev->bus != &mhi_bus_type)
> +		return 0;
> +
> +	mhi_dev = to_mhi_device(dev);
> +
> +	/* Only prepare virtual devices that are attached to bus */

"Only prepare virtual devices for the channels". Here and below.

> +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> +		return 0;
> +
> +	/* There are cases where there is no MHI client driver matches
> +	 * this device, we are not allowed to do prepare for it.
> +	 */

Use the preferred style for comment:

	/*
	 * ...
	 */

> +	if (!mhi_dev->id)
> +		return 0;
> +
> +	ul_chan = mhi_dev->ul_chan;
> +	dl_chan = mhi_dev->dl_chan;
> +
> +	/*
> +	 * If execution environment is specified, remove only those devices that
> +	 * started in them based on ee_mask for the channels as we move on to a
> +	 * different execution environment
> +	 */
> +	if (data)
> +		ee = *(enum mhi_ee_type *)data;
> +
> +	if (ul_chan && ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
> +		return 0;
> +
> +

Remove extra newline.

> +	if (dl_chan && ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
> +		return 0;
> +
> +	if (dl_chan->pre_alloc)
> +		return mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	else
> +		return mhi_prepare_for_transfer(mhi_dev);
> +}
> +
> +int mhi_prepare_all_for_transfer(struct mhi_controller *mhi_cntrl)
> +{
> +	return device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL,
> +				     ____mhi_prepare_for_transfer);
> +}
> +EXPORT_SYMBOL_GPL(mhi_prepare_all_for_transfer);
> +
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  {
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -1684,3 +1736,58 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
> +
> +static int ____mhi_unprepare_from_transfer(struct device *dev, void *data)

__mhi_unprepare_all_from_transfer

> +{
> +	struct mhi_device *mhi_dev;
> +	struct mhi_chan *ul_chan, *dl_chan;
> +	enum mhi_ee_type ee = MHI_EE_MAX;
> +
> +	if (dev->bus != &mhi_bus_type)
> +		return 0;
> +
> +	mhi_dev = to_mhi_device(dev);
> +
> +	/* Only unprepare virtual devices that are attached to bus */
> +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> +		return 0;
> +
> +	/* There are cases where there is no MHI client driver matches
> +	 * this device, so it is not probed or prepared, no need to
> +	 * do unprepare for it.
> +	 */
> +	if (!mhi_dev->id)
> +		return 0;
> +
> +	ul_chan = mhi_dev->ul_chan;
> +	dl_chan = mhi_dev->dl_chan;
> +
> +	/*
> +	 * If execution environment is specified, remove only those devices that
> +	 * started in them based on ee_mask for the channels as we move on to a
> +	 * different execution environment
> +	 */
> +	if (data)
> +		ee = *(enum mhi_ee_type *)data;
> +
> +	if (ul_chan) {
> +		if (ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
> +			return 0;
> +	}
> +
> +	if (dl_chan) {
> +		if (ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
> +			return 0;
> +	}
> +
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	return 0;
> +}
> +
> +int mhi_unprepare_all_from_transfer(struct mhi_controller *mhi_cntrl)
> +{
> +	return device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL,
> +				     ____mhi_unprepare_from_transfer);
> +}
> +EXPORT_SYMBOL_GPL(mhi_unprepare_all_from_transfer);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index ae092bc8b97e..dcf62a57056a 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -668,7 +668,7 @@ static inline void mhi_power_down(struct mhi_controller *mhi_cntrl, bool gracefu
>   * destroy struct devices. This is a variant for mhi_power_down() and is a
>   * workaround to make it possible to use mhi_power_up() in a resume
>   * handler. When using this variant the caller must also call
> - * mhi_prepare_all_for_transfer_autoqueue() and
> + * mhi_prepare_all_for_transfer() and

This change belongs to previous patch.

>   * mhi_unprepare_all_from_transfer().
>   *
>   * @mhi_cntrl: MHI controller
> @@ -842,4 +842,22 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>   */
>  bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
>  
> +/**
> + * mhi_prepare_all_for_transfer - if you are using
> + * mhi_power_down_no_destroy() variant this needs to be called after
> + * calling mhi_power_up().

Add info about what this API does also.

> + *
> + * @mhi_cntrl: MHI controller
> + */
> +int mhi_prepare_all_for_transfer(struct mhi_controller *mhi_cntrl);
> +
> +/**
> + * mhi_unprepare_all_from_transfer - if you are using
> + * mhi_power_down_no_destroy() variant this function needs to be called
> + * before calling mhi_power_down_no_destroy().

Same as above.

- Mani

> + *
> + * @mhi_cntrl: MHI controller
> + */
> +int mhi_unprepare_all_from_transfer(struct mhi_controller *mhi_cntrl);
> +
>  #endif /* _MHI_H_ */
> -- 
> 2.39.2
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

