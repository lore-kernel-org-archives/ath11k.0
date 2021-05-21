Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54153C433ED
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:36:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66AB610CB
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66AB610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAe7evsvv0EAUqzAZ4/a8mubmOeCw6OzTYMjTdcbVd8=; b=kcCdsGXmKwMsb+eKpbnFtHoRRo
	wlAhyLRROLjZyWgFWlEen+c923gB4gtWQRRagNoUPjwEiTzpkkO7iguoOWOU82m4U65I8OCyKzD24
	hfwnZmWHpXoj+OLbWoklAcPr5RWqZ0XDlQ4+Dv/cZtgz3Zvz3Hh3s/fz9PYazjh7uPRzmhpfkW7Dt
	PeZPRNYCKzocC0tpDxAUgfT8mL4pwZRSQIHqZAf1oU8igWj5rA1Wv7OUQM9aWBm2H7bcQQVLjRg3m
	Z+XLQBRL4aVmO0GfNzX8z3hbn1JJcprlckBR7Ppx48clI5CpXWvrCAHQUPp++QjfVIgYNBjQMsNdl
	7Ql4jQ8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5K6-005YLh-SX; Fri, 21 May 2021 13:36:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5K4-005YLb-Fx
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 13:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EzH9pap79ZEbSmxkb3tCxH891f8oUodb32l9cw5UCwU=; b=ubeQ+GISMY3uwQVnYEGMw9Tgj1
 4oHJ0U0vyvR4yYsfssPxDBb0fNQVBbd7mmzyAtHMabZKR9RWzm0gwNfkFQSag02dr7CpIPTPXXFYt
 9/dFg1o8Ie9Tfw8IKh8YgaKXjxXAMZ9kz3jXVN/IZafbkQbAWHxU9hlLXgsXTTlwGwOqflVHAPce7
 IEqz8a4Sy8dXaJwueAnHpNi/R8/vl9AYfOzZ1It3qHSrof72BAubsmDl3nDNgGgZQ9dYrJto2KIgV
 q7/Eg4qNcwNWO7EfDTrbvJTt9ReMuzwxGi6Yd6nWa2o93m7m52cUkVw5me/aJMNyayyxoC6hIhB+M
 sttdXHAA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5K1-00H9MV-Kd
 for ath11k@lists.infradead.org; Fri, 21 May 2021 13:36:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECA056023D;
 Fri, 21 May 2021 13:36:08 +0000 (UTC)
Date: Fri, 21 May 2021 19:06:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 1/6] bus: mhi: core: Set BHI/BHIe offsets on power up
 preparation
Message-ID: <20210521133604.GI70095@thinkpad>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620330705-40192-2-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063613_756595_6E98482A 
X-CRM114-Status: GOOD (  24.09  )
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

On Thu, May 06, 2021 at 12:51:40PM -0700, Bhaumik Bhatt wrote:
> Set the BHI and/or BHIe offsets in mhi_prepare_for_power_up(),
> rearrange the function, and remove the equivalent from
> mhi_async_power_up(). This helps consolidate multiple checks
> in different parts of the driver and can help MHI fail early on
> before power up begins if the offsets are not read correctly.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 42 +++++++++++++++++++++++-------------------
>  drivers/bus/mhi/core/pm.c   | 28 ++++------------------------
>  2 files changed, 27 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c81b377..11c7a3d 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1063,7 +1063,7 @@ EXPORT_SYMBOL_GPL(mhi_free_controller);
>  int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  {
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	u32 bhie_off;
> +	u32 bhi_off, bhie_off;
>  	int ret;
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
> @@ -1072,29 +1072,36 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  	if (ret)
>  		goto error_dev_ctxt;
>  
> -	/*
> -	 * Allocate RDDM table if specified, this table is for debugging purpose
> -	 */
> -	if (mhi_cntrl->rddm_size) {
> -		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
> -				     mhi_cntrl->rddm_size);
> +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
> +	if (ret) {
> +		dev_err(dev, "Error getting BHI offset\n");
> +		goto error_reg_offset;
> +	}
> +	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
>  
> -		/*
> -		 * This controller supports RDDM, so we need to manually clear
> -		 * BHIE RX registers since POR values are undefined.
> -		 */
> +	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
>  		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
>  				   &bhie_off);
>  		if (ret) {
>  			dev_err(dev, "Error getting BHIE offset\n");
> -			goto bhie_error;
> +			goto error_reg_offset;
>  		}
> -
>  		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
> +	}
> +
> +	if (mhi_cntrl->rddm_size) {
> +		/*
> +		 * This controller supports RDDM, so we need to manually clear
> +		 * BHIE RX registers since POR values are undefined.
> +		 */
>  		memset_io(mhi_cntrl->bhie + BHIE_RXVECADDR_LOW_OFFS,
>  			  0, BHIE_RXVECSTATUS_OFFS - BHIE_RXVECADDR_LOW_OFFS +
>  			  4);
> -
> +		/*
> +		 * Allocate RDDM table for debugging purpose if specified
> +		 */
> +		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
> +				     mhi_cntrl->rddm_size);
>  		if (mhi_cntrl->rddm_image)
>  			mhi_rddm_prepare(mhi_cntrl, mhi_cntrl->rddm_image);
>  	}
> @@ -1103,11 +1110,8 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	return 0;
>  
> -bhie_error:
> -	if (mhi_cntrl->rddm_image) {
> -		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image);
> -		mhi_cntrl->rddm_image = NULL;
> -	}
> +error_reg_offset:
> +	mhi_deinit_dev_ctxt(mhi_cntrl);
>  
>  error_dev_ctxt:
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index e2e59a3..adf426c 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1066,28 +1066,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	if (ret)
>  		goto error_setup_irq;
>  
> -	/* Setup BHI offset & INTVEC */
> +	/* Setup BHI INTVEC */
>  	write_lock_irq(&mhi_cntrl->pm_lock);
> -	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &val);
> -	if (ret) {
> -		write_unlock_irq(&mhi_cntrl->pm_lock);
> -		goto error_bhi_offset;
> -	}
> -
> -	mhi_cntrl->bhi = mhi_cntrl->regs + val;
> -
> -	/* Setup BHIE offset */
> -	if (mhi_cntrl->fbc_download) {
> -		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF, &val);
> -		if (ret) {
> -			write_unlock_irq(&mhi_cntrl->pm_lock);
> -			dev_err(dev, "Error reading BHIE offset\n");
> -			goto error_bhi_offset;
> -		}
> -
> -		mhi_cntrl->bhie = mhi_cntrl->regs + val;
> -	}
> -
>  	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
>  	mhi_cntrl->pm_state = MHI_PM_POR;
>  	mhi_cntrl->ee = MHI_EE_MAX;
> @@ -1098,7 +1078,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
>  		dev_err(dev, "Not a valid EE for power on\n");
>  		ret = -EIO;
> -		goto error_bhi_offset;
> +		goto error_async_power_up;
>  	}
>  
>  	state = mhi_get_mhi_state(mhi_cntrl);
> @@ -1117,7 +1097,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  		if (!ret) {
>  			ret = -EIO;
>  			dev_info(dev, "Failed to reset MHI due to syserr state\n");
> -			goto error_bhi_offset;
> +			goto error_async_power_up;
>  		}
>  
>  		/*
> @@ -1139,7 +1119,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	return 0;
>  
> -error_bhi_offset:
> +error_async_power_up:
>  	mhi_deinit_free_irq(mhi_cntrl);
>  
>  error_setup_irq:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
