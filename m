Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086A1C433ED
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:54:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C227C6008E
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C227C6008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvHA9Anylhw+h5VOZj/bWFWBKWV3VYhH5bsmyXgXpC8=; b=Gj2c81CIxRRNvfPoiDiQcNSPAJ
	jhvfjw/KLGu0ftjRXb8ZtCP07MTy5wYofNj17AxajWQBywgh1Sz3OzbhdzA2ygtGfKJ5pEPKeNy67
	gptxfM/LiBGVlxfdHHAW5GLHn6n8fLzB3Szxr0dlEjGUm+FTbdyKQofgzklw31IYLKXYt4PBt+5J3
	ra9XL5SqrS95XyhExr7E0z4yBstfLv52NvVmc1FgUcWs/ZJv95Pweb9ogBHVDAgfN3CO1ouuYD5k6
	t1veb3VHNvMD/tXpaTiQo9jMn2z/4uZgMSSpm96J0uqi243WXqZyv02ic/uRqHbAaPLbfm7seFycP
	pHsYEBZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5c4-005gCt-7Z; Fri, 21 May 2021 13:54:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5c3-005gAe-JF
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 13:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wkGvXHvkyimelGMbBI0CIKCZGsdF+l1lKO17gNouNsA=; b=B4T98+0NMKV6tWMmDJVSrp5KpG
 9Fi/0fuq802EylMu/gswCELS69s974afNgvhjFRA+5ZlMuqGuJ6UfuXtoqguduIi/OljhqJQn/WjQ
 8GlFTZ1WIFtZQc7AAc9fxax6TMCQWMx1X6Q8gQVGdxqGz+h11IvCZJoPkLXPOzLQm23e+UJ2VGrkK
 pBndGaHu/oBsjiod8TL5TprrJTaoBxU5pf8u4gtucScdQ5QBS4MH8Bu9dfQ2DGnpxMQw7YAuoabE/
 p+ghJFyBOL56txK9EaZRPen8Y9chXc3sxpV67bTTzGpe0M74AbTw8K/9YOXzjI8JGTzAaLxMy+TBN
 lLAj3x0w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5by-00HAhD-Nu
 for ath11k@lists.infradead.org; Fri, 21 May 2021 13:54:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66940611AD;
 Fri, 21 May 2021 13:54:42 +0000 (UTC)
Date: Fri, 21 May 2021 19:24:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 6/6] bus: mhi: core: Add range checks for BHI and BHIe
Message-ID: <20210521135437.GN70095@thinkpad>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-7-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620330705-40192-7-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_065446_817371_D704BF3C 
X-CRM114-Status: GOOD (  18.75  )
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

On Thu, May 06, 2021 at 12:51:45PM -0700, Bhaumik Bhatt wrote:
> When obtaining the BHI or BHIe offsets during the power up
> preparation phase, range checks are missing. These can help
> controller drivers avoid accessing any address outside of the
> MMIO region. Ensure that mhi_cntrl->reg_len is set before MHI
> registration as it is a required field and range checks will
> fail without it.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 1cc2f22..aeb1e3c 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -885,7 +885,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
>  	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
>  	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
> -	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs || !mhi_cntrl->irq)
> +	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
> +	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
>  		return -EINVAL;
>  
>  	ret = parse_config(mhi_cntrl, config);
> @@ -1077,6 +1078,13 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  		dev_err(dev, "Error getting BHI offset\n");
>  		goto error_reg_offset;
>  	}
> +
> +	if (bhi_off >= mhi_cntrl->reg_len) {
> +		dev_err(dev, "BHI offset: 0x%x is out of range: 0x%zx\n",
> +			bhi_off, mhi_cntrl->reg_len);
> +		ret = -EINVAL;
> +		goto error_reg_offset;
> +	}
>  	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
>  
>  	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
> @@ -1086,6 +1094,14 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  			dev_err(dev, "Error getting BHIE offset\n");
>  			goto error_reg_offset;
>  		}
> +
> +		if (bhie_off >= mhi_cntrl->reg_len) {
> +			dev_err(dev,
> +				"BHIe offset: 0x%x is out of range: 0x%zx\n",
> +				bhie_off, mhi_cntrl->reg_len);
> +			ret = -EINVAL;
> +			goto error_reg_offset;
> +		}
>  		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
>  	}
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
