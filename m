Return-Path: <SRS0=7VVY=GD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3CDC433E6
	for <ath11k@archiver.kernel.org>; Thu, 31 Dec 2020 07:24:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F21422287
	for <ath11k@archiver.kernel.org>; Thu, 31 Dec 2020 07:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F21422287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pf5jji5IdCOMCiXvQO2K/TJw4qyN/wNqa0e+nUwtdYo=; b=lpocWhTRTx1jE2U1ywQnBSfwu
	/dS0NTcdQroFynxFnzx20NYSVnqODo+1A8wSE4IVymDRyr2BOG0RY+ajFCF7GXz3uj2V1m11K0gtN
	8CR0m3SbtyVISVPQYKbQu3jotaKwK7xXsqyWiyFW8nbvuUJMaaHUCDVRO2RNyjXC/pUEcIugQ1Fmk
	UD6bwviHiiSS/17DSj4wdwLwUUzLF0Vxd3NCoHjRNg6jSCCxj31JxcPo6gfyW+F8VYk62t4cUtqfD
	sOpuID19Ug06box6AH5vOUn2bML2g1GQJrMfT0d6m5HkQ7h5Wsc50C5HELYvp/jOweYcw6Mt2lttO
	KqnkzTjBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kusJk-00070Y-KB; Thu, 31 Dec 2020 07:24:16 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kusJh-000703-GO
 for ath11k@lists.infradead.org; Thu, 31 Dec 2020 07:24:15 +0000
Received: by mail-pg1-x532.google.com with SMTP id 30so7978303pgr.6
 for <ath11k@lists.infradead.org>; Wed, 30 Dec 2020 23:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=59Y9lLu7gKLA6PBo+Rc/MQHtWZJv/8/MoV+hD4xt+3U=;
 b=atsO3HYk9RIzqk8lrfu3fkNFFnAf7WDnApVjEQXtzGeV5l09/FU1arRk8JsJgMWPJ2
 n3sUerQzGu2/R0yY6mssYhacZRfSCQ0X7tRSaRBiMzfnuE5mYY/6Oe/MbXUjHbygu1Bw
 4P8m5l/Jy8hdli+4kRHqf0hlV8wQ3DNOi/2W1XmYK5JuImxyy/uvcaQDHevU+kKB1GEl
 6iZV2bukZOjI/FreHO/8kWRGT4/BmrVI1QPgmfBNRkoR7T/VvBcordQ3OW4myXaquSRW
 0Jcr16pqEfosYZpdN3l3DLmqmcpLfKeZODLFdXbgDEazp3D/ARlv1zmerp1FCpj8BSF+
 doSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=59Y9lLu7gKLA6PBo+Rc/MQHtWZJv/8/MoV+hD4xt+3U=;
 b=rOQcX1+n9a+tPqP1yt/4k6/ME6TXn0mTBYStcosbdjGaOycM80DOueuJlwz6ZAj9y4
 +AkKngp0c80Fxch2MrL4hrdDkg75oa8SlgW3J30RulrZK6MJT+vM0m0ii5m3BT/vAJ7m
 EgI9E2MoGrGxUwVU/OuHTujRdvkaCIeUYcH8rVTxy7r0tk4itJS0hbF9D0cxemiwHu1g
 bu3snOjVdGSCtQ4OEpLcFjw7pORX161KPd7YfFtySSa0++CBGs08PEv81b9lXB0XnD1p
 6Fs/FzwH9GkkXxEtXBzz5Me5Jniu8s+SGE79Q40+j1KYkIuJvy0YrsLLrlxkOZcsAey+
 e+hQ==
X-Gm-Message-State: AOAM5336JMAuo+qR1oZ17BGW4EIh0EM523nwVz8JaZSWVoRvm2LD4PPy
 7TBU6zVLi1Pn+6ybcAMzYPTQ
X-Google-Smtp-Source: ABdhPJzPh9/5Dzj2H8zgXe2mVdWGiMZgpYGXX/bIf3qnJ7fMOTe1H8yA0aiAvu4907EpfBEwso5LIg==
X-Received: by 2002:a63:eb0c:: with SMTP id t12mr771240pgh.7.1609399451132;
 Wed, 30 Dec 2020 23:24:11 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
 by smtp.gmail.com with ESMTPSA id cq15sm9274573pjb.27.2020.12.30.23.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 23:24:10 -0800 (PST)
Date: Thu, 31 Dec 2020 12:54:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH v2] mhi: use irq_flags if client driver configures it
Message-ID: <20201231072404.GE7345@thinkpad>
References: <20201229070551.3129-1-cjhuang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201229070551.3129-1-cjhuang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_022413_900707_7AE32623 
X-CRM114-Status: GOOD (  25.70  )
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

On Tue, Dec 29, 2020 at 02:05:51AM -0500, Carl Huang wrote:
> If client driver has specified the irq_flags, mhi uses this specified
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

Small nitpick below, with that addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> v2:
> - document irq_flags added to mhi_controller
> 
>  drivers/bus/mhi/core/init.c | 9 +++++++--
>  include/linux/mhi.h         | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 0ffdebd..5f74e1e 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>  {
>  	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>  	int i, ret;
>  
> +	/* if client driver has set irq_flags, use it */

s/client driver/controller driver

Thanks,
Mani

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
> index d4841e5..918cf6a 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -353,6 +353,7 @@ struct mhi_controller_config {
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
>   * @pre_init: MHI host needs to do pre-initialization before power up
>   * @wake_set: Device wakeup set flag
> + * @irq_flags: irq flags passed to request_irq (optional)
>   *
>   * Fields marked as (required) need to be populated by the controller driver
>   * before calling mhi_register_controller(). For the fields marked as (optional)
> @@ -442,6 +443,7 @@ struct mhi_controller {
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
