Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E55C5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d45gls5E6DHoFDGkz67r8N78oa/WUavR6gYW/EilR8=; b=zjZ0L8RhizX5rD63soETPiiDBp
	3XZaU4wq7fpDGvu+8LyknpMgutDu66mG8SdcQvyhduvMFBeckc8UY7m0JFuKucL8vyUiNEnlGTeNQ
	SbpcqRO5/O3/PLbzveIxZ8gu/xbpNTO5Ri0QhUxF/3RHYGO+KyyShiy4qEKUm40EPU0xdyhNSdtle
	Ai0uyg+tYOJEqR/eTNeWZQjxNhf16p8+4LIIqpazrsR4riKKJWTpk46e5Y9QT/wdTQIXGAIrpTdJq
	uz5tRkJyugjfznjz4u4ZAlzbnDNH5qIs+ifuOPxhO6uZ1A0iKA2M2T/3Hy9nCdUc6zmof4QP3xp9L
	DObsGCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rere9-000000045Fj-0VbJ;
	Tue, 27 Feb 2024 07:13:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rere6-000000045EZ-15IQ
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 07:12:59 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e544942455so859987b3a.3
        for <ath11k@lists.infradead.org>; Mon, 26 Feb 2024 23:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709017975; x=1709622775; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d45gls5E6DHoFDGkz67r8N78oa/WUavR6gYW/EilR8=;
        b=f3hO4YPDWfXFdRRE3dFJ4y4du7sSjvP0jAmpLctuhuBjcDszLr/F/jsp7C3cSDn6xh
         JZYWyhgRrmYzFAeM/LT8oXRb16jrrKjct1iTWifJHG0g+rXPfK9DUlxFlrTXqHtO0pmB
         9sRX83WbJzctO8ejEvwliDyCa/iYH2mv5P5AqHlNLDKi7rotef5McLn02mfS0NbtcbgB
         oQqKZA5HUowNsPqkvTKDoqYzX2xcUgeLHrrKvH3QYW+RZt70X259OZCi0SH9ARkCjSGS
         bnHIsVg0w8LwTyBQeF72LGcnu58XrNQlSgzCVCVvIuDkcJGMSeNeI0rAAzJC+C2RHfKI
         RDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709017975; x=1709622775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2d45gls5E6DHoFDGkz67r8N78oa/WUavR6gYW/EilR8=;
        b=Y8WaLo3+RZJVwgzHLsIn8BPOpt+NJkMQ5WJqD8bZXbntlZOSZfDnQ5XJQHNkPF5NlH
         yZSG45kgPqP+rKFFarWxPmrzCjjLxz+q/zfOL3ZyZHjh7ZOGqOnBOfMaEirmZKKKdx+p
         AVC7DputATKJ4hKXazLQIwP8SjF2lbRnIVfySSUbTK/SQQ4uGTOYhgmgE2ku0A7f9JOx
         wbyNLd461mzNdqMKoVZbXkFAlAYGbhBt3Emvpn7FfadbZNfiPZIzITzbomn53jOdXnnS
         WudY3IUJJLvV9d5Vd0aDfn1Z9Btlfw/szrGz1tQX0dseeLLue39hVSlZOqsi3PXUPCdG
         n0LQ==
X-Gm-Message-State: AOJu0YzQbvLhqpIAWLoa45PA0YLu7McIyY0REQmGiKfaFbfsPrx/AErU
	vvBAPxEine0k+0rUqHFcv5+apj3UokbiRIupw0wqHMjBSUix54F0uu1qTlRLfkt2sUJL2IPAmbI
	=
X-Google-Smtp-Source: AGHT+IELCobY2pUNJ1u/obojIQqEMSdmJboJV9duSJH4f/IOyx64dLYkKcOFFTxC9LjzZndNZ4hGVQ==
X-Received: by 2002:a62:cd48:0:b0:6e4:bb45:49f3 with SMTP id o69-20020a62cd48000000b006e4bb4549f3mr9585299pfg.34.1709017975099;
        Mon, 26 Feb 2024 23:12:55 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id ei29-20020a056a0080dd00b006e507a98254sm3951760pfb.206.2024.02.26.23.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:12:54 -0800 (PST)
Date: Tue, 27 Feb 2024 12:42:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] bus: mhi: host: add mhi_power_down_keep_dev()
Message-ID: <20240227071249.GC2587@thinkpad>
References: <20240227063613.4478-1-quic_bqiang@quicinc.com>
 <20240227063613.4478-2-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227063613.4478-2-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_231258_330654_CB0D70BC 
X-CRM114-Status: GOOD (  36.59  )
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

On Tue, Feb 27, 2024 at 02:36:11PM +0800, Baochen Qiang wrote:
> ath11k fails to resume:
> 
> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
> 
> This happens because when calling mhi_sync_power_up() the MHI subsystem
> eventually calls device_add() from mhi_create_devices() but the device
> creation is deferred:
> 
> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
> 
> The reason for deferring device creation is explained in dpm_prepare():
> 
>         /*
>          * It is unsafe if probing of devices will happen during suspend or
>          * hibernation and system behavior will be unpredictable in this case.
>          * So, let's prohibit device's probing here and defer their probes
>          * instead. The normal behavior will be restored in dpm_complete().
>          */
> 
> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not
> called and thus MHI channels are not prepared:
> 
> So what this means that QRTR is not delivering messages and the QMI connection
> is not working between ath11k and the firmware, resulting a failure in firmware
> initialization.
> 
> To fix this add new function mhi_power_down_keep_dev() which doesn't destroy
> the devices for channels during power down. This way we avoid probe defer issue
> and finally can get ath11k hibernation working with the following patches.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Small nitpicks below. With that fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Unfortunately, I just sent the PR for 6.9. If possible, I'll try to send v2.
Otherwise, I can only apply it for 6.10.

> ---
>  drivers/bus/mhi/host/internal.h |  4 +++-
>  drivers/bus/mhi/host/pm.c       | 41 ++++++++++++++++++++++++++++-----
>  include/linux/mhi.h             | 18 ++++++++++++++-
>  3 files changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 5fe49311b8eb..aaad40a07f69 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -80,6 +80,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_FP,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
> +	DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> @@ -90,7 +91,8 @@ enum dev_st_transition {
>  	dev_st_trans(MISSION_MODE,	"MISSION MODE")		\
>  	dev_st_trans(FP,		"FLASH PROGRAMMER")	\
>  	dev_st_trans(SYS_ERR,		"SYS ERROR")		\
> -	dev_st_trans_end(DISABLE,	"DISABLE")
> +	dev_st_trans(DISABLE,		"DISABLE")		\
> +	dev_st_trans_end(DISABLE_DESTROY_DEVICE, "DISABLE (DESTROY DEVICE)")
>  
>  extern const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX];
>  #define TO_DEV_STATE_TRANS_STR(state) (((state) >= DEV_ST_TRANSITION_MAX) ? \
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 8b40d3f01acc..4b817b259a3e 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -468,7 +468,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  }
>  
>  /* Handle shutdown transitions */
> -static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
> +static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
> +				      bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state;
>  	struct mhi_event *mhi_event;
> @@ -530,8 +531,15 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> -	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> -	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	/**

Use the preferred style for multi line comments:

	/*
	 *...
	 */

> +	 * Some MHI controller drivers, ath11k as an example, would like to keep
> +	 * MHI deivces for channels during suspend/hibernation to avoid the
> +	 * probe defer issue. Add a check here to make it possible.

How about:

	Only destroy the 'struct device' for channels if indicated by the
	'destroy_device' flag. Because, during system suspend or hibernation
	state, there is no need to destroy the 'struct device' as the endpoint
	device would still be physically attached to the machine.

- Mani

> +	 */
> +	if (destroy_device) {
> +		dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> +		device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	}
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> @@ -821,7 +829,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_pm_sys_error_transition(mhi_cntrl);
>  			break;
>  		case DEV_ST_TRANSITION_DISABLE:
> -			mhi_pm_disable_transition(mhi_cntrl);
> +			mhi_pm_disable_transition(mhi_cntrl, false);
> +			break;
> +		case DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE:
> +			mhi_pm_disable_transition(mhi_cntrl, true);
>  			break;
>  		default:
>  			break;
> @@ -1175,7 +1186,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_async_power_up);
>  
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +static void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +			     bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -1211,15 +1223,32 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  
> -	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
> +	if (destroy_device)
> +		mhi_queue_state_transition(mhi_cntrl,
> +					   DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE);
> +	else
> +		mhi_queue_state_transition(mhi_cntrl,
> +					   DEV_ST_TRANSITION_DISABLE);
>  
>  	/* Wait for shutdown to complete */
>  	flush_work(&mhi_cntrl->st_worker);
>  
>  	disable_irq(mhi_cntrl->irq[0]);
>  }
> +
> +void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +{
> +	__mhi_power_down(mhi_cntrl, graceful, true);
> +}
>  EXPORT_SYMBOL_GPL(mhi_power_down);
>  
> +void mhi_power_down_keep_dev(struct mhi_controller *mhi_cntrl,
> +			       bool graceful)
> +{
> +	__mhi_power_down(mhi_cntrl, graceful, false);
> +}
> +EXPORT_SYMBOL_GPL(mhi_power_down_keep_dev);
> +
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>  {
>  	int ret = mhi_async_power_up(mhi_cntrl);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 77b8c0a26674..5ce1fc1167d0 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -630,12 +630,28 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
>  
>  /**
> - * mhi_power_down - Start MHI power down sequence
> + * mhi_power_down - Power down the MHI device and also destroy the
> + *		    'struct device' for the channels associated with it.
> + *		    See also mhi_power_down_keep_dev() which is a variant
> + *		    of this API that keeps the 'struct device' for channels
> + *		    (useful during suspend/hibernation).
>   * @mhi_cntrl: MHI controller
>   * @graceful: Link is still accessible, so do a graceful shutdown process
>   */
>  void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
>  
> +/**
> + * mhi_power_down_keep_dev - Power down the MHI device but keep the 'struct
> + *			     device' for the channels associated with it.
> + *			     This is a variant of 'mhi_power_down()' and
> + *			     useful in scenarios such as suspend/hibernation
> + *			     where destroying of the 'struct device' is not
> + *			     needed.
> + * @mhi_cntrl: MHI controller
> + * @graceful: Link is still accessible, so do a graceful shutdown process
> + */
> +void mhi_power_down_keep_dev(struct mhi_controller *mhi_cntrl, bool graceful);
> +
>  /**
>   * mhi_unprepare_after_power_down - Free any allocated memory after power down
>   * @mhi_cntrl: MHI controller
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

