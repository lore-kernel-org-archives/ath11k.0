Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA3CC433ED
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 18:04:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F196100A
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 18:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F196100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqZlHK0ESXQPQK4wEZpk96xOd7hn/ZBQxGR20YcWEWQ=; b=Sv+7c5EOu4tZIx
	sxUXBDjw7OhfOyVelLHWKqINBY1Rjarv4GJtTK/HOvB4KH3Na8EO5QVsa9A51poOIyJ46t+GhRwtX
	Jc4AEy+43fFKHUvQ1pItfIQmu2QtdVayRLHrt32QFy3b1dhcpZPwGeFa5fev37tmu6vMVhInLkW6g
	gUXGvyIzLl+G5Nd9XgCAYzRufgoX0rNSwoLch/Um5epHGdCU4QOr2CxCITIbJHcOvt7hR1Dvsj9dW
	igsTfR9obbh1gtPNI/yC8Hgtj4nYHHOJYIUgbLsx8ZoGW/mucVl6mo5Tx+Wmyn90uLjTUMSmfU73e
	itvVPyBoZjnQ3L8Gw11w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljn1q-002Cxf-QF; Thu, 20 May 2021 18:04:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljn1o-002Cwl-64
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 18:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Sender:Content-ID:Content-Description;
 bh=AFeMf3IUMl/U4pe6K8pI5cxfDW/3X5GMZL/kEyjcntY=; b=yyHhT/+lesuvOO5zSwfEa5/AUY
 ltQ3osO/9uakADnciB+kXpdcLiT7TPj92hR/S8hwjqvVKpMM4+0b1OWdAxlbXE/D0+HYlkC3gQbBG
 TrpZsiP32QDbNHBz4Pe+k6wplc4byzPQpZ/ObBHFX8f97tU/UyDiuhp44AjEL8rdlagYtqrGpSjb8
 vsM6nll3I1WLnmPvsxUBZS9bpy7v0TIavGgIyCYO0qghaJ7MDWAtRbpLB15E4SbcJWEhZQ7fFOsjU
 5SsmdwcuP5GG/989Vu3n1sZSKCZQvpLugQjvaxtHp1APB0tyowx1mNDMmMeK53lVhhhXWBWG6j2Jv
 3X5M7tPw==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljn1l-00GYxf-7c
 for ath11k@lists.infradead.org; Thu, 20 May 2021 18:04:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621533849; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AFeMf3IUMl/U4pe6K8pI5cxfDW/3X5GMZL/kEyjcntY=;
 b=Iwn5WK+7kr6yAdCzhZ98bsJXDz62ZxvSHTA/aJI9UpeUG3+SrztrzbGwpNP9vt99Aj5ueEUO
 iQfNrboo9lH/EotMUtcu8y4fPZsezy8LQJhSBEp+iTXu/e5dxbm8HkXO7+gpSjrxuYugI7CI
 pk7VvaFWCOr10flBHe5HwqLfChM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60a6a497063320cd13535733 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 18:04:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BE49BC4360C; Thu, 20 May 2021 18:04:06 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BCFFC4338A;
 Thu, 20 May 2021 18:04:05 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 May 2021 11:04:05 -0700
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Loic Poulain <loic.poulain@linaro.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
Organization: Qualcomm Innovation Center, Inc.
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <YKajWVPUSTzNVVm8@kroah.com>
References: <87v97dhh2u.fsf@codeaurora.org> <YKYzwBJNTy4Czd1A@kroah.com>
 <20210520104313.GA128703@thinkpad> <87r1i1h9an.fsf@codeaurora.org>
 <3e8bac3b02e3549a55b7c9b78b699965@codeaurora.org>
 <YKajWVPUSTzNVVm8@kroah.com>
Message-ID: <608474b9b9feae5bd0616ad16d6d6bbd@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_110409_369360_589CC3BE 
X-CRM114-Status: GOOD (  28.23  )
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

On 2021-05-20 10:58 AM, Greg KH wrote:
> On Thu, May 20, 2021 at 10:38:12AM -0700, Bhaumik Bhatt wrote:
>> On 2021-05-20 05:36 AM, Kalle Valo wrote:
>> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> >
>> > > On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
>> > > > On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
>> > > > > Hi,
>> > > > >
>> > > > > I got several reports that this mhi commit broke ath11k in v5.12.3:
>> > > > >
>> > > > > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
>> > > > > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > > > > Date:   Wed Feb 24 15:23:04 2021 -0800
>> > > > >
>> > > > >     bus: mhi: core: Process execution environment changes serially
>> > > > >
>> > > > >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
>> > > > >
>> > > > > Here are the reports:
>> > > > >
>> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=213055
>> > > > >
>> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=212187
>> > > > >
>> > > > > https://bugs.archlinux.org/task/70849?project=1&string=linux
>> > > > >
>> > > > > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
>> > > > > have not tested v5.12.3 myself. Can someone revert this commit in the
>> > > > > stable release so that people get their wifi working again, please?
>> > > >
>> > > > How does the mhi bus code relate to a ath11k driver?  What bus
>> > > > is that
>> > > > on?
>> > > >
>> > >
>> > > MHI is the transport used by the ath11k driver to work with the WLAN
>> > > devices
>> > > over PCIe.
>> > >
>> > > Regarding the bug, I'd suggest to wait for Bhaumik (the author of
>> > > 29b9829718c5)
>> > > to comment on the possible commit which needs backporting from
>> > > mainline.
>> >
>> > Ok, but if a quick fix is not available I think we should just revert
>> > this in the stable releases. I also got a report that v5.11.21 is
>> > broken:
>> >
>> > https://bugzilla.kernel.org/show_bug.cgi?id=213055#c11
>> 
>> Please pick [1] as the dependency to [ Upstream commit
>> ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ].
> 
> what is [1]???
> 
> What commit do I need to backport, a commit id would be nice...
> 
> thanks,
> 
> greg k-h
Sure Greg. Commit id is: 4884362f6977fc05cbec736625665241c0e0732f

Title of patch:
bus: mhi: core: Download AMSS image from appropriate function

It was supposed to be a link but not sure why it's not seen.

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
