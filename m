Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C50C433ED
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 17:38:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E09760C3D
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 17:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E09760C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hP9gzl3As9qeJHbxdF7fn2ejhmuIDcPV5fzD/mYuvaA=; b=OADTu1ZMTMTeJ1
	bzuGoIEuz4tOkxWjxNfQZncpY8RTq05xyT+JnzvX8rAIhSGxHKHgTJf7MUaPpSIM39p0O+8tH304y
	sqEr8x0GlEz5pNzgy+RF51ya1g+LxXfyLHWQ0Qmia7KOwUg/RKpf/4Juq2zTGfYvpAf3aPAmIcgDk
	hiO84LkaTnShbxPB0bnfbAVxiYNYZIc/ZHQptXR5HJoYKCu5I/VRu3hRLHFqZ07cxIc+Nw4afGabH
	ngq433UurzOIUBtUR7OfLe90Hypaeo0VaJ72l3wewDx+A+j0VcK3alEFpYA30/M6fZbBFPcqHnQJx
	pmFYnY395Ub4eWgOJruQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljmdH-0027JG-2F; Thu, 20 May 2021 17:38:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljmdE-0027In-5g
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 17:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Sender:Content-ID:Content-Description;
 bh=nLriIgWHIbCb7oQKXFd+r7F47RE5SfPuCnd0RQSTbk8=; b=aWQO5ikIyo4naz9pPQL07Vu0U4
 tBiTtH7UI7u37RYbMXZ56UmM7qrVNeqoboPy2w9rdIYNLg/J5aKo0tmdytJUwrBDsx9AcVQEv8Zt8
 xQ6PJGytcYow5g0pgmUUJnsxsb7mnaN+YmjO9GQ7fKKtgMzwDTxxufkMe9riaitCEg2ApIVVKnETW
 codtJBgWAJBXzplMBWl9Awrx1QRrFeRw0/wRyJdte11rEgPlQ6LWFYmW6hx/6bGRia64h385vPfZQ
 Yo0ZJ0y3xuGroAMVyJJUoiYvu6oMB1D5ZCZibjDAwE2IiK2LiZmZDN6Gmt1l6z+qV7vbmIxPXauug
 muUX51+g==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljmcx-00GXsz-KZ
 for ath11k@lists.infradead.org; Thu, 20 May 2021 17:38:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621532324; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nLriIgWHIbCb7oQKXFd+r7F47RE5SfPuCnd0RQSTbk8=;
 b=PkMLKkT9wRxGIBQVpkftMY2jqpIP+/NzCllqTQ6fdH2lpqLKD7Qd71ckO+pL4Fu+sT3KCU+Z
 JkNoihktUXj3Qp6ndlQDTs/VKRmwY2Z+EJr+9D5W9ccyUy2Lc86VW4y7qnlac31FChy5CPe1
 qlUPLBHUgBFn8XVqjfRlm2Hjzz4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60a69e865f788b52a5b71516 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 17:38:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9E042C4338A; Thu, 20 May 2021 17:38:14 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbhatt)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A3CF6C433D3;
 Thu, 20 May 2021 17:38:12 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 May 2021 10:38:12 -0700
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
Organization: Qualcomm Innovation Center, Inc.
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <87r1i1h9an.fsf@codeaurora.org>
References: <87v97dhh2u.fsf@codeaurora.org> <YKYzwBJNTy4Czd1A@kroah.com>
 <20210520104313.GA128703@thinkpad> <87r1i1h9an.fsf@codeaurora.org>
Message-ID: <3e8bac3b02e3549a55b7c9b78b699965@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_103844_249875_FE6A4E1B 
X-CRM114-Status: GOOD (  21.39  )
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

On 2021-05-20 05:36 AM, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
>> On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
>>> On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
>>> > Hi,
>>> >
>>> > I got several reports that this mhi commit broke ath11k in v5.12.3:
>>> >
>>> > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
>>> > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>> > Date:   Wed Feb 24 15:23:04 2021 -0800
>>> >
>>> >     bus: mhi: core: Process execution environment changes serially
>>> >
>>> >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
>>> >
>>> > Here are the reports:
>>> >
>>> > https://bugzilla.kernel.org/show_bug.cgi?id=213055
>>> >
>>> > https://bugzilla.kernel.org/show_bug.cgi?id=212187
>>> >
>>> > https://bugs.archlinux.org/task/70849?project=1&string=linux
>>> >
>>> > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
>>> > have not tested v5.12.3 myself. Can someone revert this commit in the
>>> > stable release so that people get their wifi working again, please?
>>> 
>>> How does the mhi bus code relate to a ath11k driver?  What bus is 
>>> that
>>> on?
>>> 
>> 
>> MHI is the transport used by the ath11k driver to work with the WLAN 
>> devices
>> over PCIe.
>> 
>> Regarding the bug, I'd suggest to wait for Bhaumik (the author of 
>> 29b9829718c5)
>> to comment on the possible commit which needs backporting from 
>> mainline.
> 
> Ok, but if a quick fix is not available I think we should just revert
> this in the stable releases. I also got a report that v5.11.21 is
> broken:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=213055#c11

Please pick [1] as the dependency to [ Upstream commit 
ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ].

That is missing in older kernels and did not get backported.
This explains why 5.13.x works.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bus/mhi/core?h=v5.13-rc2&id=4884362f6977fc05cbec736625665241c0e0732f

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
