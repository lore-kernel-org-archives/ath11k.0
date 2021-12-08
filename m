Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D24BC433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHWcAo026qfZ3t1J0j4LCdY5RHSEkwCXGLn+z7ncS8E=; b=qNR0OKK4Ayhn/y
	uaM00RqxINGL8aOM9UvvQD8bm2/mbBMJrENtIJGao6G53RmhM9P1nnbhEHOZ3Wj/gwleK+QEpCIUA
	vV9B9Dvm5MI6viJ1lcQN5RfQfJ0JMvFEzQSDngI+IMaHHx4iLgDgDlRj96arOYrbJH8xxUsLZkss5
	wtYxh3AJbtnsn43Ks5tl78U31d9dI12+BdWyKrUEZvyekYq0Y/OPCjjXCEkdFd+LqBQMXDhh8QbEm
	lDGuXFzGyXJREV9vju3DM6iTPJ8MJe9VLbTu4aWmgWfGLTykOJ52YBgxIiBFfM9c1lcI//3vrtWf3
	k3weNjamwbVADTxVYZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musXX-00BlyL-Bh; Wed, 08 Dec 2021 08:43:03 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musXU-00BlxF-63
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 08:43:02 +0000
Received: by mail-pg1-x532.google.com with SMTP id q16so1451045pgq.10
 for <ath11k@lists.infradead.org>; Wed, 08 Dec 2021 00:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1y+dXBcCkVtTTqUS06lctFWwk/nUClDqIvvgzBUxsEM=;
 b=LIedwnSB3H0UrB/1qhz5cKbBUvN7EOy72wHx8PQexHUvdmsILOBfeb3SxU6Kaimmsz
 jplvEmfbojzRNT4Sq80gQv4Zn2oyWSyTcZjzaeUQncC9HjgByiIRong73YIJheMSxxoS
 tzooCnNJKnPYlAhExrGaXKx3xfO5vspUWhFNymWwEwc5vIn5TsQPgCfQ68+ZEbMC9B/n
 vQArdxTvfz70L7OelzyVs2McCtanh+kT3D6VjB25Hq0nTIjWiMm2p7oXDTTaA2Bn9g1P
 0zwf03s5im3OVFobT2S1QrQxxoU5ovok2A8YxGNLhPD1bzlbVgJELuWyQX3FeR1gM80b
 zC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1y+dXBcCkVtTTqUS06lctFWwk/nUClDqIvvgzBUxsEM=;
 b=rRbm0jltV+jgR0yZN2AX4fAZj30P7NTjONr32ed+EC6tcmdiqd3cA8iknmD+BIsQrw
 +sFBHthqTvVrDybFVXm5u5zz9tk1w5RfAFrP5VuYwq/orkMnGOibMZxF1LPJHQb4JOgl
 IPGHHLLPqX0yHdVOr9ZMEVRad1UsFVvZU2ct0fO2lZcc8n+BX6x3TBtqEHJvPcx9FRKt
 gkCIkjkIMxencXvMXRY1Bfrl7lDh8pC2ty8ei8ljS5RvGHjlKoL//VTsxBxD7uLidTys
 iNd3jCoUBbGN9FJEv4G1wwjNRJlsZ5E/cGkLra+AtQsld2/4Qxncr0K4jjJfZZoD0JHd
 oaEw==
X-Gm-Message-State: AOAM533dueitQDaDQiaFfksNfKB1vDFYxlFKdNtM7MDyLIa2h7ws07ON
 tW1SVa03RX/vsaxcRO7CTpTE
X-Google-Smtp-Source: ABdhPJw5E9rmnvj1IAYXO+PiR22Gni2EGztw+NGY2q4aCvVaQbJ4K2NDCeDI38pJOz69bF/QTJOnEQ==
X-Received: by 2002:a63:5954:: with SMTP id j20mr27822286pgm.365.1638952979151; 
 Wed, 08 Dec 2021 00:42:59 -0800 (PST)
Received: from thinkpad ([117.202.189.59])
 by smtp.gmail.com with ESMTPSA id lp12sm2002937pjb.24.2021.12.08.00.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 00:42:58 -0800 (PST)
Date: Wed, 8 Dec 2021 14:12:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org, loic.poulain@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, stable@vger.kernel.org,
 Pengyu Ma <mapengyu@gmail.com>
Subject: Re: [PATCH] bus: mhi: core: Add support for forced PM resume
Message-ID: <20211208084253.GE70121@thinkpad>
References: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_004300_257935_13371E08 
X-CRM114-Status: GOOD (  25.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Dec 06, 2021 at 09:40:59PM +0530, Manivannan Sadhasivam wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> For whatever reason, some devices like QCA6390, WCN6855 using ath11k
> are not in M3 state during PM resume, but still functional. The
> mhi_pm_resume should then not fail in those cases, and let the higher
> level device specific stack continue resuming process.
> 
> Add a new parameter to mhi_pm_resume, to force resuming, whatever the
> current MHI state is. This fixes a regression with non functional
> ath11k WiFi after suspend/resume cycle on some machines.
> 
> Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179
> 
> Cc: stable@vger.kernel.org #5.13
> Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
> Reported-by: Kalle Valo <kvalo@codeaurora.org>
> Reported-by: Pengyu Ma <mapengyu@gmail.com>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [mani: Added comment, bug report, added reported-by tags and CCed stable]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-fixes! Will be submitted for v5.16-rcX.

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c             | 10 +++++++---
>  drivers/bus/mhi/pci_generic.c         |  2 +-
>  drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
>  include/linux/mhi.h                   |  3 ++-
>  4 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 7464f5d09973..4ddd266e042e 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -881,7 +881,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_pm_suspend);
>  
> -int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> +int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
>  {
>  	struct mhi_chan *itr, *tmp;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -898,8 +898,12 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>  		return -EIO;
>  
> -	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> -		return -EINVAL;
> +	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
> +		dev_warn(dev, "Resuming from non M3 state (%s)\n",
> +			 TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> +		if (!force)
> +			return -EINVAL;
> +	}
>  
>  	/* Notify clients about exiting LPM */
>  	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 9ef41354237c..efd1da66fdf9 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -959,7 +959,7 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
>  		return 0; /* Nothing to do at MHI level */
>  
>  	/* Exit M3, transition to M0 state */
> -	err = mhi_pm_resume(mhi_cntrl);
> +	err = mhi_pm_resume(mhi_cntrl, false);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to resume device: %d\n", err);
>  		goto err_recovery;
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index 26c7ae242db6..f1f2fa2d690d 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -533,7 +533,11 @@ static int ath11k_mhi_set_state(struct ath11k_pci *ab_pci,
>  		ret = mhi_pm_suspend(ab_pci->mhi_ctrl);
>  		break;
>  	case ATH11K_MHI_RESUME:
> -		ret = mhi_pm_resume(ab_pci->mhi_ctrl);
> +		/* Do force MHI resume as some devices like QCA6390, WCN6855
> +		 * are not in M3 state but they are functional. So just ignore
> +		 * the MHI state while resuming.
> +		 */
> +		ret = mhi_pm_resume(ab_pci->mhi_ctrl, true);
>  		break;
>  	case ATH11K_MHI_TRIGGER_RDDM:
>  		ret = mhi_force_rddm_mode(ab_pci->mhi_ctrl);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 723985879035..102303288cee 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -660,8 +660,9 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl);
>  /**
>   * mhi_pm_resume - Resume MHI from suspended state
>   * @mhi_cntrl: MHI controller
> + * @force: Force resuming to M0 irrespective of the device MHI state
>   */
> -int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
> +int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force);
>  
>  /**
>   * mhi_download_rddm_image - Download ramdump image from device for
> -- 
> 2.25.1
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
