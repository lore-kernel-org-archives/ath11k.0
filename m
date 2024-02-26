Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1C1C48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6zd1PEyLITWZm9KL/dK4q9knEoV+TXO6CvpPczfz6M=; b=PEgZwv74qPDy/XYlhXl8s7wxN3
	nYlLFqGBooH5hS4+u71KXMwEy8nYgndf5oOXLhf3HnY50LZeV5Ga5zIc4CTSDgibGSEGUWqiKTQvu
	SuBCdOWTcYI1ORl3czdGkUT27n+UqAqO7PThYlPH5IBdu9goNp2K1EDZf10JuZMEWQv47nv5j2O/P
	yBsOjx23e8xtw42Qep0mCwi+YRb8L9gozyyYArZDhjjyprtYURqqEyEhQI+nGgfAPdTsts7HVezZM
	r6y4fte/4WC8LlAK2e6ZQKMedMNXdch3RYTDt0Hmtobz2JQEz8vJ0N4ia5XQjh9nJuEgL9we5zcic
	FoI14uPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZtj-00000000Wfd-0zTe;
	Mon, 26 Feb 2024 12:15:55 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZtb-00000000Weg-3s6d
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 12:15:54 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e5329aa516so270596b3a.3
        for <ath11k@lists.infradead.org>; Mon, 26 Feb 2024 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708949746; x=1709554546; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k6zd1PEyLITWZm9KL/dK4q9knEoV+TXO6CvpPczfz6M=;
        b=O7YJx5dIoIWC0XmCfN495Oj7RbfhbbeGg+7UFClovIVIk2PZwE7IhVBYnr5VNe/EqQ
         VuH5ozd2Ln1feRLstBwkvdv10iy9OPVG5Jny3dJNfROqnFNqoCKGnkoV3jZM3PF6tKAl
         25dLIl9iHgsdTfbiyNt5BvBTRmDX2hQzqTCPHI5Zr/MyKHVJnd/s1T0aYStSSzcIQXWt
         W5JsgGnL/FoeNOJ7bnNr07D73doru8IFb4cY5qeG+YcBWAzhc+4G+Pa+hy3kWcGhlJcE
         2PMVfbfZYJJYqoLZc4lgfkbzr68HJ0sSym8dgISwjFWI9j7Ul/zkhGbpdMduLZxBNUtd
         B1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708949746; x=1709554546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6zd1PEyLITWZm9KL/dK4q9knEoV+TXO6CvpPczfz6M=;
        b=vs2doS4lTv0FOt8V/NDTk1v16Ogwn3Qnl6ywzSz+swhLXrtIVeuck/X37WxM11T3YA
         gl5m5y7LyBvQnskKrik+nrtEt8DbQE3N0eXHiCF5MJeEUFo1G8wDKjDWcIo1dEgjaT/E
         yyBX9yxuRWau3A3VKbcBl/+dQKUcteKL5GfFlkseGiZSKae6hwjFIdA+M4m7Jfs76Akl
         udvPfeUyAyOyR/0ORjEk3oJTcnUwLdVXMXiN8gFJ072RfOLbKkBPt/sN3xfZSfv1XbnA
         SdcAjRSQdgC/+RSM2GKsNbFG9o2wQzQrfSxJyD8FiB+f5xQ0i0QFvo5TCO31HK2RI55/
         Ev5Q==
X-Gm-Message-State: AOJu0YyJWELKew2fBEREr0c3QckplzZ7funUteqXiVmNqgR7VKTu/m5E
	IaS1Rqfr4jNJkxklGq+plXAOUmhCrDjwymlwCO9Sgc/XgbmtKJj+uAo4vNIdxWryWOaLzXU3k6A
	=
X-Google-Smtp-Source: AGHT+IFDKTAEwU7H2ub/fu0Zunzeq97i1ADGULrYokdFChSWx4DN0La9rIhOTdH6MyK96EtToENjlA==
X-Received: by 2002:a05:6a21:31c7:b0:1a0:adbc:7a96 with SMTP id zb7-20020a056a2131c700b001a0adbc7a96mr5643823pzb.36.1708949746498;
        Mon, 26 Feb 2024 04:15:46 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id p18-20020a056a0026d200b006e45b910a98sm3912974pfw.6.2024.02.26.04.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:15:46 -0800 (PST)
Date: Mon, 26 Feb 2024 17:45:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] bus: mhi: host: add mhi_power_down_no_destroy()
Message-ID: <20240226121542.GD8422@thinkpad>
References: <20240221030026.10553-1-quic_bqiang@quicinc.com>
 <20240221030026.10553-2-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221030026.10553-2-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_041548_025247_575F5F00 
X-CRM114-Status: GOOD (  40.55  )
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

On Wed, Feb 21, 2024 at 11:00:24AM +0800, Baochen Qiang wrote:
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
> To fix this add new function mhi_power_down_no_destroy() which doesn't destroy
> the devices for channels during power down. This way we avoid probe defer issue
> and finally can get ath11k hibernation working with the following patches.
> 

Upto this line is the actual commit message and below should be moved to the
comments section of the patch.

> Actually there is an RFC version of this change and it gets positive results
> from multiple users. Firstly Mani doesn't like this idea and insists that an
> MHI device should be destroyed when going to suspend/hibernation, see
> 
> https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/
> 
> Then Mani changed his mind after a further discussion with kernel PM guys,
> see
> 
> https://lore.kernel.org/all/21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com/
> 
> So we come up with the regular version and it is almost identical with that RFC
> version.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  drivers/bus/mhi/host/internal.h |  4 +++-
>  drivers/bus/mhi/host/pm.c       | 36 +++++++++++++++++++++++++++------
>  include/linux/mhi.h             | 15 +++++++++++++-
>  3 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 091244cf17c6..8ce4aec56425 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -86,6 +86,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_FP,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
> +	DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> @@ -96,7 +97,8 @@ enum dev_st_transition {
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
> index 8b40d3f01acc..5686d32f7458 100644
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
> @@ -530,8 +531,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> -	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> -	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);

I'd be nice to add a comment here on why destroying the device is optional.

> +	if (destroy_device) {
> +		dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> +		device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	}
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> @@ -821,7 +824,10 @@ void mhi_pm_st_worker(struct work_struct *work)
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
> @@ -1175,7 +1181,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_async_power_up);
>  
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +static void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +			     bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -1211,15 +1218,32 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
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
> +void mhi_power_down_no_destroy(struct mhi_controller *mhi_cntrl,

How about "mhi_power_down_keep_dev"? Not the best of the API naming suggestion,
but it reflects what the API does.

> +			       bool graceful)
> +{
> +	__mhi_power_down(mhi_cntrl, graceful, false);
> +}
> +EXPORT_SYMBOL_GPL(mhi_power_down_no_destroy);
> +
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>  {
>  	int ret = mhi_async_power_up(mhi_cntrl);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 474d32cb0520..39a6a944a52c 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -647,12 +647,25 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
>  
>  /**
> - * mhi_power_down - Start MHI power down sequence
> + * mhi_power_down - Start MHI power down sequence. See also

How about?

	/**
	 * mhi_power_down - Power down the MHI device and also destroy the
	 * 		    'struct device' for the channels associated with it.

	 ...

	 * See also mhi_power_down_keep_dev() which is a variant of
	 * this API that keeps the 'struct device' for channels (useful during
	 * suspend/hibernation).
	 */

> + * mhi_power_down_no_destroy() which is a variant of this for
> + * suspend/hibernation.
> + *
>   * @mhi_cntrl: MHI controller
>   * @graceful: Link is still accessible, so do a graceful shutdown process
>   */
>  void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
>  
> +/**
> + * mhi_power_down_no_destroy - Start MHI power down sequence but don't destroy
> + * struct devices for channels. This is a variant for mhi_power_down() and
> + * would be useful in suspend/hibernation.
> + *

	/**
	 * mhi_power_down_keep_dev - Power down the MHI device but keep the
	 * 			     'struct device' for the channels
	 *			     associated with it.

	 ...

	 * This is a variant of 'mhi_power_down' and useful in scenarios such as
	 * suspend/hibernation where destroying of the 'struct device' is not
	 * needed.
	 */

- Mani

> + * @mhi_cntrl: MHI controller
> + * @graceful: Link is still accessible, so do a graceful shutdown process
> + */
> +void mhi_power_down_no_destroy(struct mhi_controller *mhi_cntrl, bool graceful);
> +
>  /**
>   * mhi_unprepare_after_power_down - Free any allocated memory after power down
>   * @mhi_cntrl: MHI controller
> -- 
> 2.25.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

