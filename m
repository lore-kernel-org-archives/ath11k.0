Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EE1C4332F
	for <ath11k@archiver.kernel.org>; Thu,  8 Dec 2022 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/N6PLU7KfOG5IB2WgCvBOvhA+r3qIJmb0J20tX4RktQ=; b=JWQdkTVVPkM6dm
	INeVpyDHxN7fBbdnLwTdjieWD6YE/rhDw4DfuLZewnsPW7SEIho5Mab48maN3e7WWNTgWXYVMjOKC
	bLsQU4NjuLPSsFKmerhVORBzoELHGhzQ+gN4jDpPpjvOdiMSh8yc9AK9IUEjDHW14I7+50E6MBJM+
	eiHc21390dzPvaxa8GdUwVRTgyRf2ib7s2PMEyUcaKIaq2qZ8qOTq7UJQBIYdfgmzK/xSWdWesvSS
	IrxRSzcjd8X9qlMZ3D3cog9Ub92m9d2BmMzQplfudRQvrktpV24sntu37x/j6OHDgJBHqkr3z6meb
	2SWxacgk+mvGvyfFEK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3LlS-008QKQ-69; Thu, 08 Dec 2022 18:36:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3LlP-008QAo-Bu
	for ath11k@lists.infradead.org; Thu, 08 Dec 2022 18:36:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF1ADB82564;
	Thu,  8 Dec 2022 18:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C391AC433D2;
	Thu,  8 Dec 2022 18:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670524612;
	bh=Lo2BauI4KNxyzOZQDY1TBYyVV/KbNUE6bE2jeel2FDA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pEiVx71ZYOVSgNvLfjA+xxBpuzrlaxifwWZhVierjVD0DDKjCqvZPrzlaW+HUJ3cU
	 jgtBwreXGoTGa6FjRFuWcIyOEThqmeb03Jg2/lbsng9NcPLVXrkKZ7N5wXcZGJr/g1
	 RcO0iuraWryI0meG7sbaJdJHFscZsX1S3ZcltCNemwJWHXFh/bVoXqqyZVjRwnxcUP
	 9ocFHT+fkHG1bNEGwUpxldk5pO9sU8tef6yKAuPbZS7Rf8Xjoc3wRPPNPqgeTJyIGF
	 zjUyIPFd/VkcKHrBSqbFHB+95W4JbLKAbqJ16jOCcIVBdTB7KYjRzclSyWC88Qno5o
	 BpmkMbQeWqxZw==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Legale Legage <legale.legale@gmail.com>,  ath11k@lists.infradead.org
Subject: Re: wifi: ath11k: ipq6018 monitor mode is not working properly
References: <CACDmYyc7G=pv5gBpwxm=tYChnbnmtTV990aEDCieLeKvwr=pOg@mail.gmail.com>
	<878rjj2ww9.fsf@kernel.org>
	<CA+HBbNF4MrEKjG=cVmu0d6UyO6NDyw=cVoG93hrkxVKQLF1h+w@mail.gmail.com>
	<874ju72w7g.fsf@kernel.org>
	<CA+HBbNHQvgt+_ihFST=ZPeuxjRzovL71oKgbP2X5B8a6ZBq0HA@mail.gmail.com>
Date: Thu, 08 Dec 2022 20:36:46 +0200
In-Reply-To: <CA+HBbNHQvgt+_ihFST=ZPeuxjRzovL71oKgbP2X5B8a6ZBq0HA@mail.gmail.com>
	(Robert Marko's message of "Wed, 7 Dec 2022 14:27:18 +0100")
Message-ID: <87pmct214x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_103655_717993_652E0F75 
X-CRM114-Status: GOOD (  26.13  )
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

Robert Marko <robert.marko@sartura.hr> writes:

> On Wed, Dec 7, 2022 at 2:13 PM Kalle Valo <kvalo@kernel.org> wrote:
>> Robert Marko <robert.marko@sartura.hr> writes:
>>
>> > The issue with mainline kernels is that there is no remoteproc support
>> > for IPQ8074 nor IPQ6018, I have been working towards getting the
>> > IPQ8074 and its working with remoteproc patches added but the
>> > situation is not ideal as for example coldboot calibration does not
>> > work which could be a bug in the remoteproc patches I am using.
>>
>> Nice, do you have the patches available somewhere? What distro are you
>> using?
>
> Yes, they are available on my GitHub kernel repo under the
> ipq807x-next branches:
> https://github.com/robimarko/linux.git

Thanks, I will take a look.

> I am testing the next based branches with Buildroot as its quick and
> easy as I regularly update on newer next as I am upstreaming and stuff
> is getting merged. A lot of stuff got merged so the SoC is in a way,
> way better shape than a year or two ago but we are still missing
> upstream remoteproc support as well as CPR support and there is no
> offloading obviously.

Great that you brought this up. I have been thinking how could I do easy
and quickly do some smoke testing on IPQ8074 using latest ath11k from my
ath.git master branch and latest firmware from ath11k-firmware.git.
Currently I'm only testing PCI devices, so quite limited testing.

What you are using sounds like just what I would need as well :) Would
you happen to have any notes, pointers etc how to get started with that?
Unfortunately I can't use much time for this, so the simpler the
instructions are the better. I haven't used Buildroot for years.

> I am also maintaining an OpenWrt ipq807x target that is based on 5.15
> and 6.1 backports for which I plan to make a PR to get it officially
> included once 6.1 backports are merged. This is what a lot of users
> are currently using as it's gotten into quite a good state.

Excellent, looking forward to that.

> The one thing that has been bothering is move to FW 2.7 which is not
> working on a number of routers as their BDF-s were generated for way
> older BDF as well as outdated regulatory information.

The board files are always a major problem. But can you tell more about
this? Are you saying that firmware branches 2.5.0.1 [1] and 2.7.0.1 [2]
are using different board file formats?

[1] https://github.com/kvalo/ath11k-firmware/tree/master/IPQ8074/hw2.0/2.5.0.1

[2] https://github.com/kvalo/ath11k-firmware/tree/master/IPQ8074/hw2.0/2.7.0.1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
