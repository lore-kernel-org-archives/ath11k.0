Return-Path: <SRS0=4E4+=LI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900EBC2B9F4
	for <ath11k@archiver.kernel.org>; Mon, 14 Jun 2021 17:50:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5229F611EE
	for <ath11k@archiver.kernel.org>; Mon, 14 Jun 2021 17:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5229F611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQioN9deCZqEjDt+Zj5qzq5RxtmB+gOxa98ueQMnrzI=; b=zSES173+D45sy3
	wSlSNoOippMUhkmJmmq0l1On+mbNDuUTi2K03FYC4kMN/Q32FUqu4r+9TsLs+buSSqopQQ0m/o/dl
	fmgebWCrKEdf1Dc/KPWYphRm1PSFvoOsHR6bnVjOUL81AGjMDZy3HNkx6rkdC2C/bTQSzcmVfYDRN
	5+TnxcUrkNy5mLhgCRjas3iLVBqryGOSMUoqxC4gKulcVtj5To9U+0weayP40/Gq0DxD9zEEBat8c
	8KK/Q/DFZbtWLBtgM8fB7n+fxHjSoZXErlpWlIGldT0RQnS31lF1OB4HcJeTjLvMoFP5iPPau7sc8
	BEYWLPOIQpl0xsKOITNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsqip-00FUyB-Fr; Mon, 14 Jun 2021 17:50:03 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsqik-00FUwl-2B
 for ath11k@lists.infradead.org; Mon, 14 Jun 2021 17:50:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623692999; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KEdYtHQyiUtt7ZlGjdInmYZxYY3b99OgSBMH10I1Gwk=;
 b=fIRfhLkhnrYPyeBXE9vEM47GTPU0+UjUj+EcXJCdD/040u+ZVwKwtMXckoQBX8pjqOzJb/dp
 PMMHQHm3UXP5pn9BhEyxahLKB679oOEXvFEXb+OQ0KIKrmjjEQZMWAFfYDPirgTiukmnMsvp
 kdsSWvyfyk/hN4go20HW8h79sdI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60c796c2e27c0cc77f42f545 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 17:49:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5A09DC433D3; Mon, 14 Jun 2021 17:49:53 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 837CFC4338A;
 Mon, 14 Jun 2021 17:49:51 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 14 Jun 2021 10:49:51 -0700
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 4/6] ath11k: set register access length for MHI driver
Organization: Qualcomm Innovation Center, Inc.
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <87h7i0juxt.fsf@codeaurora.org>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-5-git-send-email-bbhatt@codeaurora.org>
 <20210521135152.GL70095@thinkpad> <87h7i0juxt.fsf@codeaurora.org>
Message-ID: <37184e28dcc952ba9ad5ed0dc2c1a6da@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_104959_543308_0DBC55EC 
X-CRM114-Status: GOOD (  26.64  )
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
Reply-To: bbhatt@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On 2021-06-14 09:02 AM, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
>> On Thu, May 06, 2021 at 12:51:43PM -0700, Bhaumik Bhatt wrote:
>>> MHI driver requires register space length to add range checks and
>>> prevent memory region accesses outside of that for MMIO space.
>>> Set it before registering the MHI controller.
>>> 
>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
>> 
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> 
>> Kalle, should we do immutable branch for this patch or I can pick it 
>> up via MHI
>> tree (if there are no other patches expected from ath11k for this 
>> controller)?
> 
> I'm not expecting any conflicts with this, and if there are, they 
> should
> be easy for Stephen or Linus to fix. So it's easiest to route this via
> your tree. But I'm not giving my ack yet, see below.
> 
> I'm worried that this patchset breaks bisect. Every patch in the
> patchset should not break existing functionality, what if only patches
> 1-3 are included in the tree but not patch 4? Wouldn't ath11k be broken
> then? I didn't review the whole patchset, but I suspect the fix is to
> include the ath11k change in the actual mhi patch which changes the
> functionality. So that way we would not have a separate ath11k patch at
> all.
> 
> Also I'm not able to test this patchset at the moment. Can someone else
> help and do a quick test with QCA6390 to verify these doesn't break
> ath11k?

I have requested someone to try and test this patch series with QCA6390.

I or the testers will get back to you with the test results when they 
are
available.

As far as your concerns go, you can choose to pick patches 1-3 and that 
would
be just fine.

Things will break if patchset 4 is _not_ in place with patchset 6 being 
part of
the tree.

It would, however, be nice to pick the whole series instead and ensure 
that
the functionality MHI introduces for boot-up sanity is in place for any
controllers such as ath11k.

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
