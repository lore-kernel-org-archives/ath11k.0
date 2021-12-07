Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128B5C433EF
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 23:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwyBw9pQpMDz+LO50KK6UN/1eIUGguLlVolZBudZXHo=; b=nu4aTglwUu/r9ASUF0DuzAQ62d
	nrtBeHlxNcfkiRIfpFeAhnKorPkueNaQWtm5TznYXgWvYCA5LgDXKyVZMfTngO8Hgoy7FeGX1xMft
	k/SQwaHfU8tEegRhpAu9/kLzNsLrCDHqaJ8XYSp1PkRMerm1pAtBwpKGxQeV891O3IaWPHlItDZJ1
	rQaXCDiiU3KTd3ggvkU6Swn5VBBX+jyGjCCxcIi8U8B4MHHGnV75OoCvJrVOECObpPD4XiKTv+V82
	0iSk5oFUPbpNzmiAGK0RzOzfpF8AjUAuKqikRQ3cKxJ9ZHq4qX8egMYeqBa5D6Quh3g7ci/GLEk2k
	jHdpAkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muk5n-00ALif-WB; Tue, 07 Dec 2021 23:41:52 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muk5k-00ALhr-AX
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 23:41:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638920505; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DKZYj2D2ozIike5afQtrah0cMUGtTdAKUDAOIu8jYCg=;
 b=H4Qk6yngVWJ4uOB8/ir/mN8N9m8O8uBwEfCGHtNjeB2tGQH7MF0U12oA+slqTInRuHJ4qPb2
 tBcH2nNOJHsWmhCwJb1x0mQyLFdZRGzBUZEzc4M/9RwBiFdmNq0KKS0e1+6oIQFgU9+qIaap
 wSU8Ei5jZV/FRA2U9gqmpl62CAo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61aff1384fca5da46df1b36e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Dec 2021 23:41:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B8A2DC43617; Tue,  7 Dec 2021 23:41:44 +0000 (UTC)
Received: from [10.110.103.130] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hemantk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C55B2C4338F;
 Tue,  7 Dec 2021 23:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C55B2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Add support for forced PM resume
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 mhi@lists.linux.dev
Cc: bbhatt@codeaurora.org, loic.poulain@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, stable@vger.kernel.org, Pengyu Ma <mapengyu@gmail.com>
References: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <7eb05d7c-ddda-5ec1-73a0-e696d2b5a236@codeaurora.org>
Date: Tue, 7 Dec 2021 15:41:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_154148_473911_7F87C6D4 
X-CRM114-Status: GOOD (  24.79  )
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

Hi Mani,

On 12/6/2021 8:10 AM, Manivannan Sadhasivam wrote:
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
> ---
>   drivers/bus/mhi/core/pm.c             | 10 +++++++---
>   drivers/bus/mhi/pci_generic.c         |  2 +-
>   drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
>   include/linux/mhi.h                   |  3 ++-
>   4 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 7464f5d09973..4ddd266e042e 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -881,7 +881,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>   }
>   EXPORT_SYMBOL_GPL(mhi_pm_suspend);
>   
> -int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> +int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
>   {
>   	struct mhi_chan *itr, *tmp;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -898,8 +898,12 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>   	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>   		return -EIO;
>   
> -	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> -		return -EINVAL;
> +	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
	in case if mhi_get_mhi_state(mhi_cntrl) returns SYS_ERR (assuming while 
doing this check SYS_ERR is set) do we still want to continue pm resume 
when force is true? Just want to make sure SYS_ERR handling with and 
without this change remains the same or atleast does not cause any 
regression with this change. or if we need to continue pm resume only 
for MHI_STATE_RESET when MHI_STATE_M3 is not set?
> +		dev_warn(dev, "Resuming from non M3 state (%s)\n",
> +			 TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> +		if (!force)
> +			return -EINVAL;
> +	}
>   
[..]

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
