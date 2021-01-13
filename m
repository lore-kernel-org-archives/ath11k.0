Return-Path: <SRS0=juds=GQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3E9C433E0
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 07:40:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1545D23333
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 07:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1545D23333
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pUynTnTtmyFG7NlWDW3kMXD6Dlcj2DzU1KORIvBNDBw=; b=NFXdUcU5DoRIqy0tkWupaBY5Q
	f/PBpHj7dKvgAkjsnQFuYe27aaw3rCaOkEZsJSOC5JxUXWKGskAeHD2K39Z/n6beNm1c/EDiKjOA9
	hgb8ubcOqfhw/n4Gs8kI7mtYOYsZ8Ag7SRFoIl+UD2PjTCPvnja9aXQ+xaM1iju4bZ4DWfaD9U6PO
	J9lJhh5CEOTa7ypR+BR9xfDAZzBgw8hS11yePn6Lx5pRoIV8Yx7czk//VUEfbPR78px4+l0ZdJehb
	R/FKFfjFfYR766mCi8jNbMxzQGtm3jpCqRFJFIOY5KQzekjgsRsW4+g9rwlnD/j8brhRzCFJZsCcB
	SfuUeVasw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzalf-0000V1-L4; Wed, 13 Jan 2021 07:40:35 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzala-0000Tk-Rv
 for ath11k@lists.infradead.org; Wed, 13 Jan 2021 07:40:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610523633; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=o+bEyOuV8qLl66hULtpvyiZg0Sf1gcXndJpcnNWYXRg=;
 b=XYAZPve8OlBqM2gxmMmQeQgiVsZdXX3PzmdU2n9vfdSt/PQjQkcIc0EWlSLjknuWdlR58xlS
 AbyMm0uTSgRXePoBKuEOcUllLzS6WLzu/a/H/D6OJq59gjPMLKGLQy+0evC75FWyIeLb9Qu8
 g1mNSvi72bh2LROXvw8W2KlKt/A=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ffea3e98fb3cda82f641493 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 07:40:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4D31EC433ED; Wed, 13 Jan 2021 07:40:24 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CCA8AC433CA;
 Wed, 13 Jan 2021 07:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCA8AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
 <20210104170359.GE2256@work>
Date: Wed, 13 Jan 2021 09:40:19 +0200
In-Reply-To: <20210104170359.GE2256@work> (Manivannan Sadhasivam's message of
 "Mon, 4 Jan 2021 22:33:59 +0530")
Message-ID: <87o8hti8t8.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_024033_471840_2765327F 
X-CRM114-Status: GOOD (  16.19  )
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
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Mon, Jan 04, 2021 at 06:11:28PM +0800, Carl Huang wrote:
>> If controller driver has specified the irq_flags, mhi uses this specified
>> irq_flags. Otherwise, mhi uses default irq_flags.
>> 
>> The purpose of this change is to support one MSI vector for QCA6390.
>> MHI will use one same MSI vector too in this scenario.
>> 
>> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
>> is requested. The reason is if irq migration happens, the msi_data may
>> change too. However, the msi_data is already programmed to QCA6390
>> hardware during initialization phase. This msi_data inconsistence will
>> result in crash in kernel.
>> 
>> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
>> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
>> 
>> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
>> of one MSI vector when mhi_register_controller is called.
>> 
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> Applied to mhi-next!

Would it be possible again to have an immutable branch for this commit?
We need it for implementing one MHI support to ath11k[1] required by
Dell XPS 13 9310 laptops, which a lot of people are waiting. Otherwise I
can only apply the feature for v5.13, which will be released on July.

[1] https://patchwork.kernel.org/project/linux-wireless/list/?series=405591&state=*

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
