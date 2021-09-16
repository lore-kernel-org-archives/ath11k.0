Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1086EC433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 05:29:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCA7A61130
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 05:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCA7A61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efeZLruhv20VChtUVR5FhkBKOIAVyjlFiLxV4+JMXxg=; b=IE3JRF3ro/fRS1
	e5vQ9eeWRqeg/yPE9ltCDbJSlzMuqqclZoAHk6oUp0DB1bIEHdzDq5T1lWCR4/LMyJxJGfc6kwuZl
	Zab7eHGWEjLnXUuG6nnbN/jiOTa5+PhWhJF2uzrXO0BdYv5xFaGZXcz3Qd/dKMW8vFD7EUOW1sOAi
	ihkKv9IOKI8Rhv9+i7b/7hniV9+PAhfZSz5YtP6zyVCVnsMoAZ5IFWdVK0POOBP0b6dLpBrHIPlLK
	p8eFk3DB9ZPCcylh9Vu2uXZYOrGahGJNd+Y6iWSYOT2ckfDZtu+EjY5WM/K1cfa1FMbeuPPr9bKuB
	4wnYZ//EE4uwENTZRaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQjxW-00ALnd-9y; Thu, 16 Sep 2021 05:29:18 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQjxR-00ALn6-HD
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 05:29:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631770155; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=fOhYzZ+UiFCYWAUStU6MsbEzNyurKGfmDelClbmSdhU=;
 b=ORNFBxX4HZgNYZOlnZ8WFB2Z+7zDnmOZhGEOhOmGaJ0E1ZEp8Li6yJ5YPrQNOGEg/9Unhw6C
 OsiQpBCIdZIs0H5MSpHM0Iyh1MPQD8L2E6/B0CSygKUsl3ahjEbwHEOtYjhvkhdpzi48yWXC
 j/dkRMmQzlwuSGYyJZAGnilpewU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6142d619bd6681d8edd40c37 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 05:28:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2F30BC4360D; Thu, 16 Sep 2021 05:28:57 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 945DEC4338F;
 Thu, 16 Sep 2021 05:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 945DEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5] bus: mhi: core: Add support for processing priority of
 event ring
References: <1624641728-3886-1-git-send-email-bbhatt@codeaurora.org>
 <20210716114926.GH3323@workstation>
 <9300cf49a498521f471d6106131bd675@codeaurora.org>
 <9561c5a41e1707d694b1c872fea399de@codeaurora.org>
Date: Thu, 16 Sep 2021 08:28:50 +0300
In-Reply-To: <9561c5a41e1707d694b1c872fea399de@codeaurora.org> (Bhaumik
 Bhatt's message of "Wed, 28 Jul 2021 17:06:24 -0700")
Message-ID: <87bl4t1431.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_222915_405472_3E5615AF 
X-CRM114-Status: GOOD (  22.26  )
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

Hi Bhaumik,

Bhaumik Bhatt <bbhatt@codeaurora.org> writes:

> On 2021-07-16 11:22 AM, Bhaumik Bhatt wrote:
>> Hi Mani,
>>
>> On 2021-07-16 04:49 AM, Manivannan Sadhasivam wrote:
>>> On Fri, Jun 25, 2021 at 10:22:08AM -0700, Bhaumik Bhatt wrote:
>>>> From: Hemant Kumar <hemantk@codeaurora.org>
>>>>
>>>> Event ring priorities are currently set to 1 and are unused.
>>>> Default processing priority for event rings is set to regular
>>>> tasklet. Controllers can choose to use high priority tasklet
>>>> scheduling for certain event rings critical for processing such
>>>> as ones transporting control information if they wish to avoid
>>>> system scheduling delays for those packets. In order to support
>>>> these use cases, allow controllers to set event ring priority to
>>>> high.
>>>>
>>>
>>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>
>>> Just curious, what are the event rings you are going to make as high
>>> priority? If you are going to do that for existing controllers, please
>>> submit a patch now itself.
>>>
>>> Thanks,
>>> Mani
>>>
>> Idea for this patch came from 914b72a6948b ("bus: mhi: Wait for M2
>> state during system resume").
>>
>> If WLAN ath11k controller driver wants to avoid the scenario
>> mentioned in
>> the above patch, it will help them to have a high priority for their
>> dedicated
>> control events ring.
>>
>> I would defer to Kalle and others in ath11k, whether or not they are
>> OK to take that route.
>> as an update to priority will just help return from resume faster.
>> It will also depend on system load/reproducibility rate of the
>> scenario.
>>
>> I can provide a patch for them to review/test since I do not have the
>> setup for it.
>>
> Would you like to try this patch out? It basically increases the
> priority
> at which the control events for M0/M1/M3 state changes are handled.
>
> Let me know if you have any questions.

At the moment I'm seriously lagging with patches so I don't really have
any free time. Can some other ath11k developer help here?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
