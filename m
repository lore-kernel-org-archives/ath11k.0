Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807ABC47DDF
	for <ath11k@archiver.kernel.org>; Thu,  1 Feb 2024 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtEt022kkPXVXmIT70xulNhz204nKO73T0HIbZTpt3c=; b=RioFUv3PgOsykOr/u9f9Y1IKqa
	rGAyWtNAApYwWJaeP1ybfwuLoMIZNbdx4YnTOelVEaehdRzOi1JaUQGoz+Yx94HPWaVRWWQgLM03W
	Ru5IvMflZjtDZda83UMQ/f8VooXnf4wH4McjonX0wVHpFEexb9ykoD8CTBJMgoueylHDrMtg5+02+
	sREMhLSKVGva/7WWBzEymSIWzR4verPvzBisbzem+QprIRWemMtcURZCZhnzEDOI9Tq/hI+rTIHYJ
	KTKcUjl4ql0wY5ew6vjOIrPnaspkIYgax5SWG4z3Vf4jjHvOv8TZbDvS5FY0mCRrmiBzdQiX3lXDJ
	gFN/zHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTsI-00000007NQV-1V4Z;
	Thu, 01 Feb 2024 10:00:50 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTsF-00000007NPy-3bRi
	for ath11k@lists.infradead.org;
	Thu, 01 Feb 2024 10:00:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so620145b3a.0
        for <ath11k@lists.infradead.org>; Thu, 01 Feb 2024 02:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706781646; x=1707386446; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MtEt022kkPXVXmIT70xulNhz204nKO73T0HIbZTpt3c=;
        b=bfXkKXlbyb4F1nIXu3IYg4iPiardwhfCReoCDLGMMgr2S1Mhgys3zLylnyUMEn+k7j
         GeyKGRc3oi6SuOyhz4VsH7OWU2Y44QEbir/pVB9mnVtb/lgt7JpbjziNhBklD/oYA/Nr
         3taPWl/YTND7O/qjPFZAU+oCjtANcxVvspmF/kc1eUQeeGitImUxwhnEclw9uDnoMLSV
         kzlDZtxqOMqt70XIPtBuZi2AqN5c7UW/tbqYcHEdGXMs781FYh5bwKLgztCQMx3HB2H9
         ZdfrwYkIgINlgd6Eym8wO9TRq6Fg7+ThDlBJcQZa7p3m0Gvb1YLxWyBbPTArF7rGdHK5
         XprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706781646; x=1707386446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtEt022kkPXVXmIT70xulNhz204nKO73T0HIbZTpt3c=;
        b=Qlo9RrrodXZys81n1RFqpiDZltkev9ms6RHHqm9ady3AY+PaRgGdtWo2jXLfXK0YHj
         30F8gGYWPOseFbsh9MjD30M/vISuIRJ3NgFPnBQMQI/XrRZ6mmf3ywGs/jWhltE52gs9
         Dm9TlaJfDZUDNsHWKmdtY1I+2fLrLi8GSy4UpYQo8c3qbvE0nSlDtjIAdFKsYEfSQ8ib
         as7CPC7uHK0XwchGAIYLqhlUJWOWPieoiNcY8ZnxGcoPHde8SslSTYoq4BHOROhJj1s2
         La3rjqUqyF7KrDYa4knG6szhDoSD6iC49ieZS5N0TAjc5vyni8/xMfLABCfgu2mVmtVR
         tnlw==
X-Gm-Message-State: AOJu0Yy9iiRBe0aPqnBlA9UxVk0SICWnDLmAhaDLqli3I9m0MDNxenOa
	5ZJGY3+gzeMlr7okImPy3vM6PIDfoZuKq8PX9relx579OVZ/rmihVEnKDj9nydnj0TXBTW4XKGE
	=
X-Google-Smtp-Source: AGHT+IF+MGpP/C7cfZjCjiG2aRdHkdHtz96E7vnVzdz00IberE36RJU8ufLm/3ynoxUiAbLUZ2NUiw==
X-Received: by 2002:a05:6a00:830d:b0:6dd:a0a5:141f with SMTP id gd13-20020a056a00830d00b006dda0a5141fmr3943855pfb.28.1706781645551;
        Thu, 01 Feb 2024 02:00:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXVWK7ZNbXwm8vo/FW2JCaF4MCdQw3rEaFqlzDa/y5YlePi0w/NMK0AEl0x8jlw0AbXA9MhulRZ+/8PwRsfzInBnqlY1r3hro1Tt8zcjhBxn5KeDzZrmq98Ak8CZC517clv5wEvyNOvk0H/BttdCSmlwXbr97Wxfaoa2qNX26Ew
Received: from thinkpad ([117.248.5.99])
        by smtp.gmail.com with ESMTPSA id r6-20020a056a00216600b006dbda1b19f7sm11389533pff.159.2024.02.01.02.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 02:00:45 -0800 (PST)
Date: Thu, 1 Feb 2024 15:30:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, mhi@lists.linux.dev,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/8] bus: mhi: host: add new interfaces to handle
 MHI channels directly
Message-ID: <20240201100040.GB17027@thinkpad>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-3-kvalo@kernel.org>
 <20240130181938.GB4218@thinkpad>
 <d002afe9-3c01-413c-82d2-353db0356802@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d002afe9-3c01-413c-82d2-353db0356802@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_020047_934289_9F0A4013 
X-CRM114-Status: GOOD (  38.75  )
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

On Wed, Jan 31, 2024 at 03:39:26PM +0800, Baochen Qiang wrote:
> 
> 
> On 1/31/2024 2:19 AM, Manivannan Sadhasivam wrote:
> > On Mon, Nov 27, 2023 at 06:20:16PM +0200, Kalle Valo wrote:
> > > From: Baochen Qiang <quic_bqiang@quicinc.com>
> > > 
> > > When using mhi_power_down_no_destroy() MHI hosts need to unprepare MHI channels
> > > by themselves.  Similarly, MHI stack will also not create new MHI device since
> > > old devices were not destroyed, so MHI hosts need to prepare channels as well.
> > > Hence add these two interfaces to make that possible.
> > > 
> > > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> > > 
> > > Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> > > ---
> > >   drivers/bus/mhi/host/main.c | 107 ++++++++++++++++++++++++++++++++++++
> > >   include/linux/mhi.h         |  20 ++++++-
> > >   2 files changed, 126 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > > index d80975f4bba8..3f677fc628ad 100644
> > > --- a/drivers/bus/mhi/host/main.c
> > > +++ b/drivers/bus/mhi/host/main.c
> > > @@ -1669,6 +1669,58 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev)
> > >   }
> > >   EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer_autoqueue);
> > > +static int ____mhi_prepare_for_transfer(struct device *dev, void *data)
> > 
> > "__mhi_prepare_all_for_transfer"
> 
> This is to prepare one single child device, I don't think a name like
> __mhi_prepare_all_for_transfer (with 'all' inside) make sense, right?
> How about changing to "mhi_prepare_dev_for_transfer" or
> "mhi_prepare_single_for_transfer"?
> 

I think most of the checks in this function can be moved inside
mhi_prepare_for_transfer() API. With that you can just reuse the API without
adding a new helper.

For autoqueue channels, you can add another API
mhi_prepare_all_for_transfer_autoqueue() just like
mhi_prepare_for_transfer_autoqueue() to maintain uniformity.

- Mani

> > 
> > > +{
> > > +	struct mhi_device *mhi_dev;
> > > +	struct mhi_chan *ul_chan, *dl_chan;
> > > +	enum mhi_ee_type ee = MHI_EE_MAX;
> > 
> > Reverse Xmas order, please.
> > 
> > > +
> > > +	if (dev->bus != &mhi_bus_type)
> > > +		return 0;
> > > +
> > > +	mhi_dev = to_mhi_device(dev);
> > > +
> > > +	/* Only prepare virtual devices that are attached to bus */
> > 
> > "Only prepare virtual devices for the channels". Here and below.
> > 
> > > +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> > > +		return 0;
> > > +
> > > +	/* There are cases where there is no MHI client driver matches
> > > +	 * this device, we are not allowed to do prepare for it.
> > > +	 */
> > 
> > Use the preferred style for comment:
> > 
> > 	/*
> > 	 * ...
> > 	 */
> > 
> > > +	if (!mhi_dev->id)
> > > +		return 0;
> > > +
> > > +	ul_chan = mhi_dev->ul_chan;
> > > +	dl_chan = mhi_dev->dl_chan;
> > > +
> > > +	/*
> > > +	 * If execution environment is specified, remove only those devices that
> > > +	 * started in them based on ee_mask for the channels as we move on to a
> > > +	 * different execution environment
> > > +	 */
> > > +	if (data)
> > > +		ee = *(enum mhi_ee_type *)data;
> > > +
> > > +	if (ul_chan && ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
> > > +		return 0;
> > > +
> > > +
> > 
> > Remove extra newline.
> > 
> > > +	if (dl_chan && ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
> > > +		return 0;
> > > +
> > > +	if (dl_chan->pre_alloc)
> > > +		return mhi_prepare_for_transfer_autoqueue(mhi_dev);
> > > +	else
> > > +		return mhi_prepare_for_transfer(mhi_dev);
> > > +}
> > > +
> > > +int mhi_prepare_all_for_transfer(struct mhi_controller *mhi_cntrl)
> > > +{
> > > +	return device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL,
> > > +				     ____mhi_prepare_for_transfer);
> > > +}
> > > +EXPORT_SYMBOL_GPL(mhi_prepare_all_for_transfer);
> > > +
> > >   void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
> > >   {
> > >   	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> > > @@ -1684,3 +1736,58 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
> > >   	}
> > >   }
> > >   EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
> > > +
> > > +static int ____mhi_unprepare_from_transfer(struct device *dev, void *data)
> > 
> > __mhi_unprepare_all_from_transfer
> 
> same as above.
> 
> > 
> > > +{
> > > +	struct mhi_device *mhi_dev;
> > > +	struct mhi_chan *ul_chan, *dl_chan;
> > > +	enum mhi_ee_type ee = MHI_EE_MAX;
> > > +
> > > +	if (dev->bus != &mhi_bus_type)
> > > +		return 0;
> > > +
> > > +	mhi_dev = to_mhi_device(dev);
> > > +
> > > +	/* Only unprepare virtual devices that are attached to bus */
> > > +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> > > +		return 0;
> > > +
> > > +	/* There are cases where there is no MHI client driver matches
> > > +	 * this device, so it is not probed or prepared, no need to
> > > +	 * do unprepare for it.
> > > +	 */
> > > +	if (!mhi_dev->id)
> > > +		return 0;
> > > +
> > > +	ul_chan = mhi_dev->ul_chan;
> > > +	dl_chan = mhi_dev->dl_chan;
> > > +
> > > +	/*
> > > +	 * If execution environment is specified, remove only those devices that
> > > +	 * started in them based on ee_mask for the channels as we move on to a
> > > +	 * different execution environment
> > > +	 */
> > > +	if (data)
> > > +		ee = *(enum mhi_ee_type *)data;
> > > +
> > > +	if (ul_chan) {
> > > +		if (ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
> > > +			return 0;
> > > +	}
> > > +
> > > +	if (dl_chan) {
> > > +		if (ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
> > > +			return 0;
> > > +	}
> > > +
> > > +	mhi_unprepare_from_transfer(mhi_dev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +int mhi_unprepare_all_from_transfer(struct mhi_controller *mhi_cntrl)
> > > +{
> > > +	return device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL,
> > > +				     ____mhi_unprepare_from_transfer);
> > > +}
> > > +EXPORT_SYMBOL_GPL(mhi_unprepare_all_from_transfer);
> > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > index ae092bc8b97e..dcf62a57056a 100644
> > > --- a/include/linux/mhi.h
> > > +++ b/include/linux/mhi.h
> > > @@ -668,7 +668,7 @@ static inline void mhi_power_down(struct mhi_controller *mhi_cntrl, bool gracefu
> > >    * destroy struct devices. This is a variant for mhi_power_down() and is a
> > >    * workaround to make it possible to use mhi_power_up() in a resume
> > >    * handler. When using this variant the caller must also call
> > > - * mhi_prepare_all_for_transfer_autoqueue() and
> > > + * mhi_prepare_all_for_transfer() and
> > 
> > This change belongs to previous patch.
> > 
> > >    * mhi_unprepare_all_from_transfer().
> > >    *
> > >    * @mhi_cntrl: MHI controller
> > > @@ -842,4 +842,22 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> > >    */
> > >   bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
> > > +/**
> > > + * mhi_prepare_all_for_transfer - if you are using
> > > + * mhi_power_down_no_destroy() variant this needs to be called after
> > > + * calling mhi_power_up().
> > 
> > Add info about what this API does also.
> > 
> > > + *
> > > + * @mhi_cntrl: MHI controller
> > > + */
> > > +int mhi_prepare_all_for_transfer(struct mhi_controller *mhi_cntrl);
> > > +
> > > +/**
> > > + * mhi_unprepare_all_from_transfer - if you are using
> > > + * mhi_power_down_no_destroy() variant this function needs to be called
> > > + * before calling mhi_power_down_no_destroy().
> > 
> > Same as above.
> > 
> > - Mani
> > 
> > > + *
> > > + * @mhi_cntrl: MHI controller
> > > + */
> > > +int mhi_unprepare_all_from_transfer(struct mhi_controller *mhi_cntrl);
> > > +
> > >   #endif /* _MHI_H_ */
> > > -- 
> > > 2.39.2
> > > 
> > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

