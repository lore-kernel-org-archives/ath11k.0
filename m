Return-Path: <SRS0=F7Ac=LR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A05C4743C
	for <ath11k@archiver.kernel.org>; Wed, 23 Jun 2021 17:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C4E60231
	for <ath11k@archiver.kernel.org>; Wed, 23 Jun 2021 17:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52C4E60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne2QUI5Ob5IsZNE2XAqXl3J6H/CzC6YUgMrJ7sz2EIA=; b=lbDgUYVlBm2dKS
	CxlrzKhzRyVEMg965jy+Og8/3Y50Qz2CwC0WQ5zrWVzGPrxwZ9eufDnKBx2W5xyCH6LPXDdbMwH6x
	cNVFDkeia8VLdT32eMO5UzoEpNz/NGopxIk/3XNcJvjtRZbunCz6qr1HQ+YrIZmLkDkbnoM+HohAG
	ksJGqZf+vyzu/8HFhwrN5vKzKQS1GWUyXmKmITOfX3ihFNEdbxyQbdyofWN6nrYy7zX6l4EKAwJbc
	B8IOUAXKa25V4zPXT8TzritzlKeGgv40IBZBRW5SWZbr0Ah/3zgTm+xkwByhJRw4EJ3EPVSTBCFbQ
	64gHC/fuPpdx/U4ZW4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw6mB-00BQZL-Ph; Wed, 23 Jun 2021 17:34:59 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw6m2-00BQUf-7X
 for ath11k@lists.infradead.org; Wed, 23 Jun 2021 17:34:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624469696; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=IIQCwdK7TFh8FgtUV+3MnvrVYUHcl6vu82d9dovgdYY=;
 b=ItIkeXfjJIKvcfazSy9rPPa5pHJnWzPv83tE4VpoA2pK/FmEO+KAWT8j2JDO5He9k/5Y2ouM
 YAZo2FuH0XNVrfLfzXyPQJ1L2w4Vb8GFruewviaSuhBgYTwZjHcbjdqUPgEwGdSv4aPTKrhS
 vBdTPAWBH/H50DgKvJ8pxv/5tus=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60d3708f638039e99711601f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 17:34:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 96D83C43147; Wed, 23 Jun 2021 17:34:07 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E217C43217;
 Wed, 23 Jun 2021 17:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E217C43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 4/6] ath11k: set register access length for MHI driver
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-5-git-send-email-bbhatt@codeaurora.org>
 <20210521135152.GL70095@thinkpad> <87h7i0juxt.fsf@codeaurora.org>
 <37184e28dcc952ba9ad5ed0dc2c1a6da@codeaurora.org>
Date: Wed, 23 Jun 2021 20:34:02 +0300
In-Reply-To: <37184e28dcc952ba9ad5ed0dc2c1a6da@codeaurora.org> (Bhaumik
 Bhatt's message of "Mon, 14 Jun 2021 10:49:51 -0700")
Message-ID: <87fsx8h4dx.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_103457_053624_C4D8F2EB 
X-CRM114-Status: GOOD (  29.85  )
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

Bhaumik Bhatt <bbhatt@codeaurora.org> writes:

> Hi Kalle,
>
> On 2021-06-14 09:02 AM, Kalle Valo wrote:
>> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>>
>>> On Thu, May 06, 2021 at 12:51:43PM -0700, Bhaumik Bhatt wrote:
>>>> MHI driver requires register space length to add range checks and
>>>> prevent memory region accesses outside of that for MMIO space.
>>>> Set it before registering the MHI controller.
>>>>
>>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>>> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
>>>
>>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>
>>> Kalle, should we do immutable branch for this patch or I can pick
>>> it up via MHI
>>> tree (if there are no other patches expected from ath11k for this
>>> controller)?
>>
>> I'm not expecting any conflicts with this, and if there are, they
>> should
>> be easy for Stephen or Linus to fix. So it's easiest to route this via
>> your tree. But I'm not giving my ack yet, see below.
>>
>> I'm worried that this patchset breaks bisect. Every patch in the
>> patchset should not break existing functionality, what if only patches
>> 1-3 are included in the tree but not patch 4? Wouldn't ath11k be broken
>> then? I didn't review the whole patchset, but I suspect the fix is to
>> include the ath11k change in the actual mhi patch which changes the
>> functionality. So that way we would not have a separate ath11k patch at
>> all.
>>
>> Also I'm not able to test this patchset at the moment. Can someone else
>> help and do a quick test with QCA6390 to verify these doesn't break
>> ath11k?
>
> I have requested someone to try and test this patch series with QCA6390.
>
> I or the testers will get back to you with the test results when they
> are available.
>
> As far as your concerns go, you can choose to pick patches 1-3 and
> that would be just fine.
>
> Things will break if patchset 4 is _not_ in place with patchset 6
> being part of the tree.
>
> It would, however, be nice to pick the whole series instead and ensure
> that the functionality MHI introduces for boot-up sanity is in place
> for any controllers such as ath11k.

Just to be clear, this is not about me picking up any patches
separately. I was instead making sure git-bisect works correctly, as it
can randomly choose to test any commit in the tree. But based on your
description everything seems to be in order in this patchset and bisect
will work correctly.

git-bisect is an important tool for me when I'm searching the root cause
for ath11k regressions, that's why I'm so careful to make sure it works.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
