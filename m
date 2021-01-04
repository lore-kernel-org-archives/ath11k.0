Return-Path: <SRS0=Snh0=GH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50857C433E0
	for <ath11k@archiver.kernel.org>; Mon,  4 Jan 2021 17:04:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0461C22482
	for <ath11k@archiver.kernel.org>; Mon,  4 Jan 2021 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0461C22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6vz403GSJe4xHR8T/9+7VYPriQspnx9ZajGnYK+nojQ=; b=VlnJuVEVtBvLBqcvOX1UPMeQ5
	iYfDi9DgR1fvu6SVML0Srvbk83eRBi4VCmIlKRNxhf6FKA9dwqZSZ1nF7wZnBUEGhupf4SKKR2gZa
	2UHmsSN3fwTPY6oQcImWtvvB0OO/t0URXnSbmD1ozQy35dJXU+kOi9thcRJV3x1uUgy3mLzeH0Pge
	asdjLwnqjPLbJv+qEjk0ZmcTiJUpF7hYoVHiT3etjwmoJz2Zp8OuQ49HE2gvYAiFqMvPFtrj5xu3r
	U4G0jTevkRFeK7XbX2FAfGPZuvmBtnM/MrjrThCATK/YASRO0jYm5aVEIiE7nXboqWW3Msznw0Vrm
	54ue9JZLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwTH6-00073l-5D; Mon, 04 Jan 2021 17:04:08 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwTH3-000737-Jp
 for ath11k@lists.infradead.org; Mon, 04 Jan 2021 17:04:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id f14so10451498pju.4
 for <ath11k@lists.infradead.org>; Mon, 04 Jan 2021 09:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IQcm30joQ1MOZvDbTDrRnopca1uhY1ndGDE9lkwCZAc=;
 b=BCIixdhQz0ExCp0AmsUIvPZ18AUH+wiojlGbwoXezAz15MaThplttNDQc+MfKl32hG
 poMMlEoNBcVwoo2GLpyhRxx+QcayT9nI80+Fxm0EQ4x3zlBoy4x5ELTyGx436AIvX7e7
 KlCloSXe6Oz17jHhw4OHjPaiRUMUMBkGM09A7xe4dOJVXbKX4z91exkrSx2BfpDQhWl8
 KVPZ8S3oZjRgI2GLlrPPQ9pjp8qFuzHr/YkvF/INPPsJfjIxV3g8L2rZCvZf5ZzacELL
 4kVNGfLlsq7Drh3FHCDiG3C2pkZgynI97jj8wIrn6I9Hj/rmtSTl1dIK3rzXEijlsdwj
 v4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IQcm30joQ1MOZvDbTDrRnopca1uhY1ndGDE9lkwCZAc=;
 b=b2dUMzjGmBVBx3h6WqChRopS5k9Bue9rylL8bqGh3R+HGvCVasHKN5pdTN1R+Ejjbo
 2GowHNyPDNlx90QuKo+TcJF35EkpMsVBP2p/1x2zSnI5JOkLYx63XL3WtIYl2Dw4dScD
 YjOl9BhRS41byYZmsvPV9Zn4un9GwPC1aw95PHGGpEsHdwGXQFud6qMTGR43gLoZVRf1
 ODH4cFw6BjVAKA5IuiRdOQTZLdSvmowiY7Ie7UJC2n8o2Vnycl6Jg9fDpsmBpRIMidtA
 RasatfBmxJBnml/JvUgcOk24CZZh8rCuE2fJlxHby68Z7Gb6QPH5nwTtWgEl54d0thKB
 t6Ow==
X-Gm-Message-State: AOAM532LgWm7lEOYtGAB/XLFqZAOiogqKHXnsintjOroz7EUvQFIwLBb
 HS64dUYcSED7OIMmKNwF2+vb
X-Google-Smtp-Source: ABdhPJzstLU9i3O9N1V2w9aLZIwS7/jD4AeG4EenR1Mw3gYn+u7BY34odJUrymKTvSm7jCXshIi1LQ==
X-Received: by 2002:a17:90a:454e:: with SMTP id
 r14mr31112408pjm.194.1609779843170; 
 Mon, 04 Jan 2021 09:04:03 -0800 (PST)
Received: from work ([103.77.37.129])
 by smtp.gmail.com with ESMTPSA id w63sm55114714pfc.20.2021.01.04.09.04.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Jan 2021 09:04:02 -0800 (PST)
Date: Mon, 4 Jan 2021 22:33:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
Message-ID: <20210104170359.GE2256@work>
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210104101128.8217-1-cjhuang@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_120405_979094_9BDAE4CF 
X-CRM114-Status: GOOD (  27.08  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: hemantk@codeaurora.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Jan 04, 2021 at 06:11:28PM +0800, Carl Huang wrote:
> If controller driver has specified the irq_flags, mhi uses this specified
> irq_flags. Otherwise, mhi uses default irq_flags.
> 
> The purpose of this change is to support one MSI vector for QCA6390.
> MHI will use one same MSI vector too in this scenario.
> 
> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
> is requested. The reason is if irq migration happens, the msi_data may
> change too. However, the msi_data is already programmed to QCA6390
> hardware during initialization phase. This msi_data inconsistence will
> result in crash in kernel.
> 
> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
> 
> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
> of one MSI vector when mhi_register_controller is called.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
> v3:
> - replace "client driver" with "controller driver"
> - add Reviewed-by: Manivannan Sadhasivam 
> 
> v2:
> - document irq_flags added to mhi_controller
> 
>  drivers/bus/mhi/core/init.c | 9 +++++++--
>  include/linux/mhi.h         | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 381fdea..37903a8 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>  {
>  	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>  	int i, ret;
>  
> +	/* if controller driver has set irq_flags, use it */
> +	if (mhi_cntrl->irq_flags)
> +		irq_flags = mhi_cntrl->irq_flags;
> +
>  	/* Setup BHI_INTVEC IRQ */
>  	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
>  				   mhi_intvec_threaded_handler,
> -				   IRQF_SHARED | IRQF_NO_SUSPEND,
> +				   irq_flags,
>  				   "bhi", mhi_cntrl);
>  	if (ret)
>  		return ret;
> @@ -171,7 +176,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>  
>  		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
>  				  mhi_irq_handler,
> -				  IRQF_SHARED | IRQF_NO_SUSPEND,
> +				  irq_flags,
>  				  "mhi", mhi_event);
>  		if (ret) {
>  			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index cb7cd54..77f1e3f 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -351,6 +351,7 @@ struct mhi_controller_config {
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
>   * @pre_init: MHI host needs to do pre-initialization before power up
>   * @wake_set: Device wakeup set flag
> + * @irq_flags: irq flags passed to request_irq (optional)
>   *
>   * Fields marked as (required) need to be populated by the controller driver
>   * before calling mhi_register_controller(). For the fields marked as (optional)
> @@ -440,6 +441,7 @@ struct mhi_controller {
>  	bool fbc_download;
>  	bool pre_init;
>  	bool wake_set;
> +	unsigned long irq_flags;
>  };
>  
>  /**
> -- 
> 2.7.4
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
