Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2431EC433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DL9N8wxH0tMrSPrl4XQNFxx2tJcKkpYRNvoZkkyZIs0=; b=TIzuBdS8yportW
	hOqFSRHUFp/hLRSYGU0OCOcJo6l7Do0UnFGfcwAVd/ZfauAonocYBb5NWYw9XGRKM+1DUJ8wNlCJf
	nYXkwByhC4IBblbgCqdqO86y/KJ3bvP12Xgb8HJKfOBQXbM3YJUhnKH1uXg+DVFkoOLLrkfbHm5Uh
	9NJicQ97dcTlVQE9VvAhWI5l/P8ZQsnGRbAkyRUW03+VCTg7cRow6Zp5/gzrVWJqB9TIr0zhQWhEX
	1aUh373cOVUFR7Qw6+5sTTCLPAocXOe24Dt3vMTezy+t8FsY1h55evztmLJzdsGxGbDSXxUcIimxI
	BZJtufAoX7XQgIAj1k5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musvS-00BpE7-Th; Wed, 08 Dec 2021 09:07:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musvP-00BpCw-Vx
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 09:07:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56799B81FFB;
 Wed,  8 Dec 2021 09:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6F1C00446;
 Wed,  8 Dec 2021 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638954460;
 bh=T3bqbFw0/TGXHjPFkL/yl3IefsMUWQBO0/sRkAtLw8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wQgVn8JAzV1jFjmDUfX2rT2sTUtxmydRoN3tuFFVLHgQXYu1EN3sgAr+ARAVpcpeM
 Pk5w7/H73F0BCq0Gd1BgS+LXdIhQ9mNhrhWzWi2FTBc+DcwC/CSXymzGQyU6eS72xC
 LYr8ju67I56nxa9hCvpOGAepoR9k2Z9RhxEI9+gc=
Date: Wed, 8 Dec 2021 10:07:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
 loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 stable@vger.kernel.org, Pengyu Ma <mapengyu@gmail.com>,
 Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH 1/1] bus: mhi: core: Add support for forced PM resume
Message-ID: <YbB11M0FZ+AdELPa@kroah.com>
References: <20211208085735.196394-1-manivannan.sadhasivam@linaro.org>
 <20211208085735.196394-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211208085735.196394-2-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_010744_358987_3E1C7DED 
X-CRM114-Status: GOOD (  29.67  )
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

On Wed, Dec 08, 2021 at 02:27:35PM +0530, Manivannan Sadhasivam wrote:
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
> Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
> Cc: stable@vger.kernel.org #5.13
> Link: https://lore.kernel.org/regressions/871r5p0x2u.fsf@codeaurora.org/
> Reported-by: Kalle Valo <kvalo@codeaurora.org>
> Reported-by: Pengyu Ma <mapengyu@gmail.com>
> Tested-by: Kalle Valo <kvalo@kernel.org>
> Acked-by: Kalle Valo <kvalo@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [mani: Added comment, bug report, reported-by tags and CCed stable]
> Link: https://lore.kernel.org/r/20211206161059.107007-1-manivannan.sadhasivam@linaro.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/core/pm.c             | 10 +++++++---
>  drivers/bus/mhi/pci_generic.c         |  2 +-
>  drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
>  include/linux/mhi.h                   |  3 ++-
>  4 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index fb99e3727155..8a486374d57a 100644
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
> index 4c577a731709..3394819e8115 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -962,7 +962,7 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
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

apis like this are horrid to work with over time.

Why not just have:
	mhi_pm_resume_force()
which then internally can set a flag that does this?  That way the
driver author does not have to stop every time they see this call and
look up exactly what the true/false field means in the function call in
their driver.

It also lets you leave alone the existing calls to mhi_pm_suspend() that
do not want to "force" anything.

self-documenting code is good, this is not self-documenting at all.

Also, is "force" really what you are doing here?  This is a "normal"
resume call, which should always work.  The "force" option here really
is just "ignore the current state of suspend for the device".  So
perhaps mhi_pm_resume_ignore_current_state() might be better?  Or
something shorter?

Naming is hard, sorry.

thanks,

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
