Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B56C433EF
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 09:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A62760F11
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 09:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A62760F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aY5i3021BXDyKjssQEZwan0yT87hKO7w6qt+RZuM0mA=; b=oCF1YIJA+iEmpZ
	0nnBB6m7Sy4XttfBPSx4cx3RBqVkcBrXxi+wLimrUz2nsvP7+pxBlLCZT1u1qsyZJLhFglqgE1CiD
	it+UBWJjC2+1gIMNFsvW3aHsb4Dm/4banrjVhSW1NCiENNWLdkgCPChVp44C4+bYTe5StjJciabea
	rK+KsmtJgr75oiLArIxvYaCVB5AthaAoVP/B+Fqyb0yEnlBs7vkIElnprGCjbqLN3wMe1jUNsVLSG
	cyrDKnp3Y3uyOHH2XYnAu6/1V9U95OSHQFZRcxsllo/CxD0TpLHO4v1dOCcGc96xKDCZ0BKhLlv0D
	OOz1nYa1SyrxlWaoZT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYPgS-00GgeL-4l; Thu, 07 Oct 2021 09:27:24 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYPgO-00GgdZ-K2
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 09:27:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633598841; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=UG+p5YLM6Eum4VbBhk0do8XgFzWdXG+uYfvVRUIhFuk=;
 b=r6L8foM53T4dsK32aTeqP9CY9GNFYV45D5yD6i3pgJFESC8TR+K2Kj4Nxy8el1PKW/MF/Zm3
 bnAhhHJN9M4W7/ofs1GAKspsWJlEKBMw3GAhy+NZr9d8E0otUbcmpyH9G9MMp6xl9SGLjuQ/
 o9wGzR67lDdO1jhG4140mZATOEo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 615ebd718ea00a941f49d43c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 09:27:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A868CC4360D; Thu,  7 Oct 2021 09:27:13 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 372A4C4338F;
 Thu,  7 Oct 2021 09:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 372A4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "open list\:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 ath11k@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
References: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
 <878sa34ni7.fsf@codeaurora.org>
 <CAA8EJppwnfy-Hi9pabGL-g9BgEcac6bs3jn8J1n=PPr9-y-d-A@mail.gmail.com>
 <87y2hxvbu8.fsf@codeaurora.org>
Date: Thu, 07 Oct 2021 12:27:09 +0300
In-Reply-To: <87y2hxvbu8.fsf@codeaurora.org> (Kalle Valo's message of "Wed, 16
 Dec 2020 20:34:55 +0200")
Message-ID: <871r4xchhu.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_022721_618831_E34C0A0A 
X-CRM114-Status: GOOD (  15.86  )
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

Kalle Valo <kvalo@codeaurora.org> writes:

> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
>> On Sat, 12 Dec 2020 at 08:11, Kalle Valo <kvalo@codeaurora.org> wrote:
>>>
>>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>>
>>> > Hello,
>>> >
>>> > I've noticed the following backtrace during shutdown stage when
>>> > rebooting RB5 board,
>>> > using linux-next/master:
>>> >
>>> > [   31.060483] ath11k_pci 0000:01:00.0: shutdown
>>> > [   31.067844] ------------[ cut here ]------------
>>> > [   31.073111] WARNING: CPU: 4 PID: 101 at
>>> > drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550
>>>
>>> Do you have CONFIG_DMA_API_DEBUG disabled? There is one commit fixing a
>>> DMA API debug warning but that should be in linux-next already:
>>>
>>> cd6181ff7e93 ath11k: dp_rx: fix monitor status dma unmap direction
>>
>> I have enabled CONFIG_DMA_API_DEBUG (and _SG too). Got no additional
>> traces during boot and the same trace during reboot.
>
> On x86 I see this during rmmod when iommu is enabled:
>
> [  +0.012066] DMAR: DRHD: handling fault status reg 2
> [ +0.000022] DMAR: [DMA Write] Request device [06:00.0] PASID ffffffff
> fault addr 0 [fault reason 05] PTE Write access is not set
> [  +0.014657] DMAR: DRHD: handling fault status reg 2
> [ +0.000017] DMAR: [DMA Write] Request device [06:00.0] PASID ffffffff
> fault addr 0 [fault reason 05] PTE Write access is not set
>
> Is that the similar issue you are seeing, but just the printouts are
> different due to different iommu implementation?

BTW, this patch should fix this:

https://patchwork.kernel.org/project/linux-wireless/patch/20210913180246.193388-5-jouni@codeaurora.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
