Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D649C433ED
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:37:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8464610CB
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8464610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLrN8VMYW0NCmzhjmyCWMuOIPcEvLuC2ALtw7k5itCo=; b=iGeIJfA2CPS3fZl+w1nV7GQpzm
	3fYynACqrblOH3sGqi5CTieh44oD+r5xY0T9k7NWSkYoQe5kNS2N/yB4GT49Mo3K6kp8L8CUkVB1p
	07bkWMSIQHkqu5WouCEkL3xeQckDaw6rEmG1cII5iaXgJR30jLT4+OJDSlb8f3MQCq+x9TsApH2Z8
	TeWJ22uVedykeSpa911I2YT8RLwmhUKE16N73ro+ilWkuEMnwncLirkTru/fPk1IoxmU4NoQoLGiA
	TuUthOginl4BRf1kuoNgrwxd1qy2cwpPZGtTGcWr/HpJAopmp7jeXsHcDKGqfWStl318AVDSA441V
	YIcZFyCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5LR-005Ye9-OQ; Fri, 21 May 2021 13:37:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5LP-005YdI-Rt
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 13:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nzIp4CTB0Ko5hCbu81q6hCHF0LVHS1GcT5QmPpOE7M0=; b=F2Mdb3e65QH7ZdBxRjWELS1p4x
 urhHoAA8hSPdnrGv8GJlDDwQJbZnWsl+hu7R+rEZ4h/hNrkaP+7ZHq3hqLKEITx5x9yRyFi4ABdER
 dAOl//u0DmfGDL+nSTTPcQe4wN5h7Dux1CgumsMe/6oeaFoAuFOAhs16HA9QL+L6oDXbdImpRQzi0
 KO9fMPvh44JNoCsn8rJXovNGWVI4c1StQl7kwGd7tGcQsC6N12hvIXJhO/N9jiJ4Rv9ikyb3burH7
 Y5KM0FW9cQ1Gvt4kn6WXlhoV4ybAl5K+x8uvlewOYvTPsRAhPRKrnDSW0pQHSNNignNGAzcfVqfyU
 r7FXoMKA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5LN-00H9Tf-F0
 for ath11k@lists.infradead.org; Fri, 21 May 2021 13:37:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42CDE6109F;
 Fri, 21 May 2021 13:37:32 +0000 (UTC)
Date: Fri, 21 May 2021 19:07:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 2/6] bus: mhi: core: Set BHI and BHIe pointers to NULL
 in clean-up
Message-ID: <20210521133728.GJ70095@thinkpad>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-3-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620330705-40192-3-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063737_538578_F532A7E9 
X-CRM114-Status: GOOD (  14.48  )
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

On Thu, May 06, 2021 at 12:51:41PM -0700, Bhaumik Bhatt wrote:
> Set the BHI and BHIe pointers to NULL as part of clean-up. This
> makes sure that stale pointers are not accessed after powering
> MHI down.
> 
> Suggested-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 11c7a3d..1cc2f22 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1132,6 +1132,9 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>  		mhi_cntrl->rddm_image = NULL;
>  	}
>  
> +	mhi_cntrl->bhi = NULL;
> +	mhi_cntrl->bhie = NULL;
> +
>  	mhi_deinit_dev_ctxt(mhi_cntrl);
>  }
>  EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
