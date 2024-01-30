Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD573C46CD2
	for <ath11k@archiver.kernel.org>; Tue, 30 Jan 2024 18:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5rCUPWRVnCWABaRNN1h1y1plAtstVCj5fDa010mMEE=; b=ypC/egWhO55w6sksIubgGm6zKI
	OYZMs1WjwbCxy6KzNNIRfGV+sEgCq6APB+T1auWER1AoHuKLiNTvh45CoJWftAKiX8pMah/vRX1dq
	HD8I5ktKMgU4daa0mbTbjXazAilbalMx0uQp3rZllumIc0f0oFkBD2gCMy2lVd3PQy0i0VML8wvur
	lxhNUv3uFlyKYHRpGCRfTyQcQUc/IsJ2LGjxPc5FIpeLrFyCf4dHC49++1dfFqE3gwy6EFDt6i28K
	wVK04muLBPx1NpmXK+HSEfi6HfRjW5tggVpGL3jH1bL11rSHtHltpABJ7h69aleKcomZ70Ri9OVmH
	Up1NF+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUsT9-000000003oz-1usR;
	Tue, 30 Jan 2024 18:04:23 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUsT7-000000003nv-1Vgh
	for ath11k@lists.infradead.org;
	Tue, 30 Jan 2024 18:04:22 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so2536328a12.1
        for <ath11k@lists.infradead.org>; Tue, 30 Jan 2024 10:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706637859; x=1707242659; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5rCUPWRVnCWABaRNN1h1y1plAtstVCj5fDa010mMEE=;
        b=jRqTbnfvPcfIAoz3C2IW5i7vY3noO8BBZMqbJSPkJGBGS9fyUI6PdGdeas1MfxjXyL
         GVEFRThrFXtilbRxSFYEVweUaBSOsfNgk5ieZ/wgqHs9TsjaF0rIbTnSGQZRKsL17G/8
         Uh+OHVkyLf8m6jFw1Y+APBSO2K9HLTsqgkLxiymjzpNz1d5VYvaSEQFQ8wbmITgM4hso
         fqguhz8caseC8AELCNXrjntvPFvl1Jg3xYnlDClc4gA/lehMsgSSXhtZDOTRMU9ExQpU
         dzoSHptvF6yADRTjBU1JS4NHxD5j6kzhF/t0YIC9snOy6EUDB2IqOO5wE633gXbT0N3I
         K7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706637859; x=1707242659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F5rCUPWRVnCWABaRNN1h1y1plAtstVCj5fDa010mMEE=;
        b=kJaC3wnEphg0/lepUVtpcoN/4L460477MZai4R1gEYt53jrcnfQgRDlPbNATjPXJs1
         KkEpdeqnPdiHtiHLTtBXwA32xtzNaj4f+MwGwgGy+ABVR7rx1MWlTxEqhU7tDivHjt5+
         rCqtgX2rxFk8GEg3H68CLSklFlgCYtswVjE5v51J5d6Ng33bTWnXgKg8OlbfmwL6v0S7
         TGPrHX/RGZy+Kjf3C8kgjigruWtGnGbZ96XWQznf9ANBpZCBofs7yfNKkh4ZlPaJQaTa
         tOWUhfmyqD8e9ix0Xg0N/yY6eQLyMdTGx6j0jJCNxnUlE/v1VeW5ojr7eHA7N04uR0aM
         4VOA==
X-Gm-Message-State: AOJu0YwVjEpEZH3citZ02Z69yab5C+jN+fh1ylWaB449BADOR4pnb05x
	9DyFBnA75AW+cBY+EXLTDDez18pGt0YZQ8Ng8MC6Q0z8jI6Ra685O6Ivct6WYKdy2wV7OF3gtYA
	=
X-Google-Smtp-Source: AGHT+IE24Ukg4bkh+RCYauvJd0iOfN2NlWT2ru38iOlXAK6Nun7jw7rCxMFXPNnCOVxpNigZ9/ANMQ==
X-Received: by 2002:a05:6a21:3502:b0:19c:841a:99e4 with SMTP id zc2-20020a056a21350200b0019c841a99e4mr4623182pzb.6.1706637859071;
        Tue, 30 Jan 2024 10:04:19 -0800 (PST)
Received: from thinkpad ([103.28.246.123])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006ddc2cf3662sm8115605pfu.184.2024.01.30.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 10:04:18 -0800 (PST)
Date: Tue, 30 Jan 2024 23:34:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/8] bus: mhi: host: add
 mhi_power_down_no_destroy()
Message-ID: <20240130180411.GA4218@thinkpad>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-2-kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127162022.518834-2-kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_100421_453134_79DED786 
X-CRM114-Status: GOOD (  36.86  )
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

On Mon, Nov 27, 2023 at 06:20:15PM +0200, Kalle Valo wrote:
> From: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> If ath11k tries to call mhi_power_up() during resume it fails:
> 

This is confusing! Maybe this is what confused me initially. mhi_sync_power_up()
never fails, but ath11k timesout waiting for QMI. You also confirmed the same
[1].

> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
> 
> This happens because when calling mhi_power_up() the MHI subsystem eventually
> calls device_add() from mhi_create_devices() but the device creation is
> deferred:
> 
> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
> 
> The reason for deferring device creation is explained in dpm_prepare():
> 
> 	/*
> 	 * It is unsafe if probing of devices will happen during suspend or
> 	 * hibernation and system behavior will be unpredictable in this case.
> 	 * So, let's prohibit device's probing here and defer their probes
> 	 * instead. The normal behavior will be restored in dpm_complete().
> 	 */
> 
> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not called and
> qcom_mhi_qrtr_dl_callback() fails silently as qdev is zero:
> 
> static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
> 				      struct mhi_result *mhi_res)
> {
> 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
> 	int rc;
> 
> 	if (!qdev || mhi_res->transaction_status)
> 		return;
> 
> So what this means that QRTR is not delivering messages and the QMI connection
> is not working between ath11k and the firmware, resulting a failure in firmware
> initialisation.
> 
> To fix this add new function mhi_power_down_no_destroy() which does not destroy
> the devices during power down. This way mhi_power_up() can be called during
> resume and we can get ath11k hibernation working with the following patches.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/bus/mhi/host/init.c     |  1 +
>  drivers/bus/mhi/host/internal.h |  1 +
>  drivers/bus/mhi/host/pm.c       | 26 +++++++++++++++++++-------
>  include/linux/mhi.h             | 29 +++++++++++++++++++++++++++--
>  4 files changed, 48 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 65ceac1837f9..e626b03ffafa 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -43,6 +43,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>  	[DEV_ST_TRANSITION_FP] = "FLASH PROGRAMMER",
>  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS ERROR",
>  	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
> +	[DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE] = "DISABLE (DESTROY DEVICE)",
>  };
>  
>  const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 30ac415a3000..3f45c9c447bd 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -69,6 +69,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_FP,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
> +	DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index a2f2feef1476..8833b0248393 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -458,7 +458,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  }
>  
>  /* Handle shutdown transitions */
> -static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
> +static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
> +				      bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state;
>  	struct mhi_event *mhi_event;
> @@ -520,8 +521,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  	dev_dbg(dev, "Waiting for all pending threads to complete\n");
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> -	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> -	device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	if (destroy_device) {
> +		dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
> +		device_for_each_child(&mhi_cntrl->mhi_dev->dev, NULL, mhi_destroy_device);
> +	}
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> @@ -806,7 +809,10 @@ void mhi_pm_st_worker(struct work_struct *work)
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
> @@ -1160,7 +1166,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_async_power_up);
>  
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> +void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +		      bool destroy_device)
>  {
>  	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -1196,14 +1203,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
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
> -EXPORT_SYMBOL_GPL(mhi_power_down);
> +EXPORT_SYMBOL_GPL(__mhi_power_down);

This is a helper, so should not be exported. You should export the API instead.

>  
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>  {
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d0f9b522f328..ae092bc8b97e 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -648,12 +648,37 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl);
>   */
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
>  
> +void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
> +		    bool destroy_device);

This is a helper, so make it static.

> +
>  /**
> - * mhi_power_down - Start MHI power down sequence
> + * mhi_power_down - Start MHI power down sequence. See also
> + * mhi_power_down_no_destroy() which is a variant of this for suspend.

suspend/hibernation

> + *
>   * @mhi_cntrl: MHI controller
>   * @graceful: Link is still accessible, so do a graceful shutdown process
>   */
> -void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful);
> +static inline void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)

No, API cannot be static inline. Make it global.

> +{
> +	__mhi_power_down(mhi_cntrl, graceful, true);
> +}
> +
> +/**
> + * mhi_power_down_no_destroy - Start MHI power down sequence but don't
> + * destroy struct devices. This is a variant for mhi_power_down() and is a

"struct devices for channels"

> + * workaround to make it possible to use mhi_power_up() in a resume

You should mention that the devices are not destroyed and this would be useful
in suspend/hibernation.

> + * handler. When using this variant the caller must also call
> + * mhi_prepare_all_for_transfer_autoqueue() and

mhi_prepare_all_for_transfer*()

> + * mhi_unprepare_all_from_transfer().
> + *
> + * @mhi_cntrl: MHI controller
> + * @graceful: Link is still accessible, so do a graceful shutdown process
> + */
> +static inline void mhi_power_down_no_destroy(struct mhi_controller *mhi_cntrl,
> +					     bool graceful)

Same as above, make it global.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

