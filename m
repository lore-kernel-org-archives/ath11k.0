Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75C6C433ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:12:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C2361164
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47C2361164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1vNkYy9Gnf6a5upr2MxIqOFnBhFNOziJ+WSDcRypmGY=; b=nZjQQrbMhmYBPz5iqKIOTBkAs
	tI21E/8rO+RWWFUgqavDznKNT+kItvmH3BkmTEqZLG0bpL+xyfSxZpZOGZRT506k3vcd1K8AdT9Ho
	kFlo09sx3ylUBsOtqInpmMIPkn4KqNUNH/ku5Z8tlJvwPTGS5Y3ql5zY6EpEcbZLyQ6jAU5yG3tXC
	DXNbEtLQClL4RAyI9u1TPebZgnRLTS0VgZ5+cZHP6g+aheqgx5Ee0uzxTsI6iCb9GDqRd+mx+MXq4
	mQ1OUHMyOh/j9DmnYRz1AzNHXL6nojDQTfqLUUOe4pqd8+TG6xBOtQ9GkxjYX+DpwuMCRJROJADyc
	by3CqoK1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leRdA-002gKy-Fo; Thu, 06 May 2021 00:12:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRd7-002gKn-DO
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 00:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=pKhzewIExom3v+dwxtzsTkBsKL6YMTRwhAWb3ai83A4=; b=q6ZOYVwfOgCLa9v5YEcgkYYKVu
 qsJO86BI0nEU6O7IvKA1UiJKrL1760c3QRbzyo9DGHVm+Shha1bx9N2blA9k1uxbxC+GM42dovdL7
 5iVhu6yNqn9eHhY3uAQ+Tfa8KkYxsjZ0RGG13XQOiFFE9KG7Ul2uPLHdsoywV0k2LKj11wxBBqyKD
 xzpMF9n8YhFoGUdFERIk59uw49TTp/LYGKp2xcCsCajSDB6NNtongcsCn5bHO1UiBhDvR9Vkq3It7
 FEaFvGYGVS4wQrafSyc4kjpKkaRsXQ/2EVmgMYtpPzaegJrK3I+ILIjMz6q65u8pHUdr2cfu7BsP7
 PEHx4d0g==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRd3-005QPe-EP
 for ath11k@lists.infradead.org; Thu, 06 May 2021 00:12:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620259954; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=pKhzewIExom3v+dwxtzsTkBsKL6YMTRwhAWb3ai83A4=;
 b=RnEPqOeTAgxSz+zg0lclultVI+MRf4no4AUvEyNJfbR2PDjDEkSs4m2XPr0Vag/ne+CpE0Lj
 HIYfpOBqglY91BF+DqDuQ6ThqKv9jAJoURqL9NQ+1DaDuHW6olAmVzoApy2ljQSnF39wHNWC
 c02RjrX1pCEzFgmG6zI7NwkWo2w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60933460c39407c32743ea6c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 00:12:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BD923C433D3; Thu,  6 May 2021 00:12:15 +0000 (UTC)
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hemantk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E519C433D3;
 Thu,  6 May 2021 00:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E519C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 6/6] bus: mhi: core: Add range checks for BHI and BHIe
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 ath11k@lists.infradead.org
References: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
 <1620234501-30461-7-git-send-email-bbhatt@codeaurora.org>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <4eb740c7-d95f-8962-a06e-677404ebe84d@codeaurora.org>
Date: Wed, 5 May 2021 17:12:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620234501-30461-7-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_171234_735506_EBF9CB02 
X-CRM114-Status: GOOD (  24.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Bhaumik,

On 5/5/21 10:08 AM, Bhaumik Bhatt wrote:
> When obtaining the BHI or BHIe offsets during the power up
> preparation phase, range checks are missing. These can help
> controller drivers avoid accessing any address outside of the
> MMIO region. Ensure that mhi_cntrl->reg_len is set before MHI
> registration as it is a required field and range checks will
> fail without it.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   drivers/bus/mhi/core/init.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 1cc2f22..86ad06e 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -885,7 +885,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>   	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
>   	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
>   	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
> -	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs || !mhi_cntrl->irq)
> +	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
> +	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
>   		return -EINVAL;
>   
>   	ret = parse_config(mhi_cntrl, config);
> @@ -1077,6 +1078,12 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>   		dev_err(dev, "Error getting BHI offset\n");
>   		goto error_reg_offset;
>   	}
> +
> +	if (bhi_off >= mhi_cntrl->reg_len) {
> +		dev_err(dev, "BHI offset is out of range\n");
Does is make sense to also log bhi_off and/or reg_len values in error if 
it helps in debugging
> +		ret = -EINVAL;
> +		goto error_reg_offset;
> +	}
>   	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
>   
>   	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
> @@ -1086,6 +1093,12 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>   			dev_err(dev, "Error getting BHIE offset\n");
>   			goto error_reg_offset;
>   		}
> +
> +		if (bhie_off >= mhi_cntrl->reg_len) {
> +			dev_err(dev, "BHIe offset is out of range\n");
Same comment as above
> +			ret = -EINVAL;
> +			goto error_reg_offset;
> +		}
>   		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
>   	}
>   
> 

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
