Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247E9C433E6
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 17:45:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D068D64ED3
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 17:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D068D64ED3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PW3+G1yWSMN5EGq85mA1kej1oHIflItP1mtbVJ4nRNk=; b=IwyHDVJgYsif/f5PTw7xAfClK
	v1BCR16ggv/SD5+fCcyD2nTUi0nc9v16xh3AgQr4b5FV7kvIq2cR/eI7epdnKuqUI4zb1Nm0aq8Ef
	DorA0D0O8KbmREKIrrAnWXMXd13NTd2+ADB4CWMgS6+R5evOG7uERlf+09EYQfc3PsFWo3F6haqt+
	wghHnUFz0jomed0s8cxgAqgU6ze6h+zgWnEwwsV5cTNXGBCIM75JwzJRLHEgJ2SkPD3lkpdVptZeI
	Wj5joD1HE9ez9/xB3g412DojI+su7JrKqQoBScd/kLSlyTvQnLAP5FlSBtJFBK3wdDtBC8Zn6nhgW
	4gE+nNgig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9tYG-0007BD-OG; Wed, 10 Feb 2021 17:45:20 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9tYE-0007AP-0l
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 17:45:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612979117; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F1GpcX34diCDt4/f/fDxZq3DY8kVl7gzwfc9irW1MRA=;
 b=D4MqEewHQjv8CkAyxtrWtLA4sD6H97uKPOz8N0F7uYCtOFx9MKkXybN/Psiw2ecBYgzNpbOi
 EIDl/3rKSAX838toMFJvpgoLZo98bPUfQF22lJ1q4AQBlWhAmPisrDQd5pXmYGcygkrdKkkW
 2FoBkCXIv9yyX3dp7zMDg6Z+SXE=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60241bab3919dfb4558da540 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 17:45:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 59ECEC43464; Wed, 10 Feb 2021 17:45:14 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 76594C43461;
 Wed, 10 Feb 2021 17:45:13 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 10 Feb 2021 09:45:13 -0800
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/1] mhi: Fix double dma free
Organization: Qualcomm Innovation Center, Inc.
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210210082538.2494-2-manivannan.sadhasivam@linaro.org>
References: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
 <20210210082538.2494-2-manivannan.sadhasivam@linaro.org>
Message-ID: <a6771f11aa2b3e032223e94f744d2f32@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_124518_110168_AB84E1DC 
X-CRM114-Status: GOOD (  18.07  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: bbhatt@codeaurora.org
Cc: loic.poulain@linaro.org, jhugo@codeaurora.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hemantk@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-02-10 12:25 AM, Manivannan Sadhasivam wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
s/functionthat/function that, uninitializing
> resources, including unmapping coherent MHI areas, can be called
> from different path in case of controller unregistering/removal:
>  - From a client driver remove callback, via mhi_unprepare_channel
>  - From mhi_driver_remove that unitialize all channels
uninitialize
> 
> mhi_driver_remove()
> |-> driver->remove()
> |    |-> mhi_unprepare_channel()
> |        |-> mhi_deinit_chan_ctxt()
> |...
> |-> mhi_deinit_chan_ctxt()
> 
> This leads to double dma freeing...
> 
> Fix that by preventing deinit for already uninitialized channel.
> 
> Fixes: a7f422f2f89e ("bus: mhi: Fix channel close issue on driver 
> remove")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reported-by: Kalle Valo <kvalo@codeaurora.org>
> Tested-by: Kalle Valo <kvalo@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Link:
> https://lore.kernel.org/r/1612894264-15956-1-git-send-email-loic.poulain@linaro.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index aa575d3fb3ae..be4eebb0971b 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -557,6 +557,9 @@ void mhi_deinit_chan_ctxt(struct mhi_controller 
> *mhi_cntrl,
>  	tre_ring = &mhi_chan->tre_ring;
>  	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
> 
> +	if (!chan_ctxt->rbase) /* Already uninitialized */
> +		return;
> +
>  	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
>  			  tre_ring->pre_aligned, tre_ring->dma_handle);
>  	vfree(buf_ring->base);

As mentioned in my previous email, I see some improvements can be made 
to the commit
message and title of this patch. Highlighted those above.

Please update title to "bus: mhi: core: Fix double DMA free from 
mhi_deinit_chan_ctxt()".

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
