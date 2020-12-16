Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A93C4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 18:35:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC66233EB
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 18:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC66233EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sfUcSBlYZg9oJoXdDOX3hS9RjNvISRj+jlTd1LeVWLo=; b=mziV+zk4CSFf74krLeeoZAN9l
	GjPaHMaEP68LnZC9x9Cm/n2atgys9SvM7+XueiYqeBsvPQ1C44WKO0fGZIkBQUPJD2cyyAPnif9vZ
	RIMIPP7jt/NKLISYo51+1x98t50rDvsg8rd18dQD8lwarn7XR1CoMrbyRbeLWJzICfMjGLBn5kHWy
	jBuhlEMwRFPkVwFHrTEe5bITGUQiMgpeqPl7yJNv47r+CTbPi2fE8tREf3arPqNKUymnZuOPQ3/Ec
	T85ZQCqY1T5ddLXGrW3Utrr+UZBUcyjbQUB2YcVWcVpgj6/n7xaH0bZtt4kBHkdGLozAxbjtCcU4w
	qz/coFo5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpbdl-0002ZZ-N0; Wed, 16 Dec 2020 18:35:09 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpbdg-0002Yq-NR
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 18:35:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608143707; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=d+gh/fylH0hrmnaA52j5UKNxuzxbDoS81ggDzi83+Hw=;
 b=iqdI9E0liiDazBdVqDe3sXzB1OH4vhSJwWJOR9pHHh9wDxUWOQi6fF+a3vp8DEgBKfabX3HL
 /XCRG11YriIIhrBMppUrHkCHnzotaID6Zictu1G7z//DhM92h4mSm6PW6CbqJKIGAE2OBp4h
 yUHnqsQj/tOioyfgcy75UXTckA0=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fda535375ab652e875ab834 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 18:34:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 65F9CC43462; Wed, 16 Dec 2020 18:34:59 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 74C5DC433C6;
 Wed, 16 Dec 2020 18:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 74C5DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
References: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
 <878sa34ni7.fsf@codeaurora.org>
 <CAA8EJppwnfy-Hi9pabGL-g9BgEcac6bs3jn8J1n=PPr9-y-d-A@mail.gmail.com>
Date: Wed, 16 Dec 2020 20:34:55 +0200
In-Reply-To: <CAA8EJppwnfy-Hi9pabGL-g9BgEcac6bs3jn8J1n=PPr9-y-d-A@mail.gmail.com>
 (Dmitry Baryshkov's message of "Sun, 13 Dec 2020 00:04:45 +0300")
Message-ID: <87y2hxvbu8.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_133507_219559_B8DF663C 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 ath11k@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Sat, 12 Dec 2020 at 08:11, Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > Hello,
>> >
>> > I've noticed the following backtrace during shutdown stage when
>> > rebooting RB5 board,
>> > using linux-next/master:
>> >
>> > [   31.060483] ath11k_pci 0000:01:00.0: shutdown
>> > [   31.067844] ------------[ cut here ]------------
>> > [   31.073111] WARNING: CPU: 4 PID: 101 at
>> > drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550
>>
>> Do you have CONFIG_DMA_API_DEBUG disabled? There is one commit fixing a
>> DMA API debug warning but that should be in linux-next already:
>>
>> cd6181ff7e93 ath11k: dp_rx: fix monitor status dma unmap direction
>
> I have enabled CONFIG_DMA_API_DEBUG (and _SG too). Got no additional
> traces during boot and the same trace during reboot.

On x86 I see this during rmmod when iommu is enabled:

[  +0.012066] DMAR: DRHD: handling fault status reg 2
[  +0.000022] DMAR: [DMA Write] Request device [06:00.0] PASID ffffffff fault addr 0 [fault reason 05] PTE Write access is not set
[  +0.014657] DMAR: DRHD: handling fault status reg 2
[  +0.000017] DMAR: [DMA Write] Request device [06:00.0] PASID ffffffff fault addr 0 [fault reason 05] PTE Write access is not set

Is that the similar issue you are seeing, but just the printouts are
different due to different iommu implementation?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
