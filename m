Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3467ECCA489
	for <ath11k@archiver.kernel.org>; Fri, 22 Jul 2022 08:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TKnOKktPX6M7pZ2uz5DEnADSdxxXmk7Pwgck9YbmJ0=; b=4hP48piuHwEFPQ
	gf3J8DFgmt4704KaY8lU9tCYBm/qsHZxl10LUxolwCUANokiDhHuzHo5WYap0sA275oSGzSecrMyn
	MGjwFoocZN0OkO2JAhOEKph4ZPpI89kVxsLI4iO1uYoyRiOEsB7CsRzpOK+ZXrEM90c+i1Qwyv3RE
	X/lBGhleK4SxSDqypMDTgw62OWp0K+kojQMUo6M64QZpIZeOhZtAflaQ3is4blZtriysG85X3wsWM
	h6ya6V6D4H1QqAvhJTHQBlf4f7cftmJFEiMSdXNsoZWSYmsEg6sdxfWbx9dfwtKVxkP/gUxmoWPq7
	lsYBONYBeW5RortfWi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnf2-000rf5-KU; Fri, 22 Jul 2022 08:05:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnez-000rcY-KP
	for ath11k@lists.infradead.org; Fri, 22 Jul 2022 08:05:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 12EF1B826B0;
	Fri, 22 Jul 2022 08:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC80C341C7;
	Fri, 22 Jul 2022 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658477118;
	bh=yUhsbre7Stproz/pyPmCOnXy2UEDnrMFtsx9JT7/4UE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTaP3UZI7UI3JMkZGYSU9epa2+hQZ1e5A9IqSPVyI4OtTLWec61P5nBM4ta3SdVTS
	 h6UVPj07kXmxF5hNfY3qI1UG1aToKlbJ29ZEHR4W8fISDRhKcDXkE0M6Oi4deKUV5X
	 QBCB/ZHtOrGqk1rsfAr7xnudGr2wd9AqXk9dafqfIpbgiMV5z3Ribdjr/3VHMT+9Yg
	 XMQ4pgPYqc8Zb8k0+DdrT70JHOR4P6q+ZRduKXVN9UyIfMIvn5rpCbH9x+NNt8LGBo
	 LunegZ4ObeD8G/yweaKTK2EiP2BKXLWc6CLWKUJh50A4xh7nYGZdBdciU81yeLXS9d
	 lM4ja2j5OT4jw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oEnez-0001XR-8R; Fri, 22 Jul 2022 10:05:21 +0200
Date: Fri, 22 Jul 2022 10:05:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mac80211/ath11k regression in next-20220720
Message-ID: <YtpaQXhM5wuz4Zbq@hovoldconsulting.com>
References: <YtpXNYta924al1Po@hovoldconsulting.com>
 <0a400422546112e91e087ce285ec5a532193ada3.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a400422546112e91e087ce285ec5a532193ada3.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_010521_856639_C92A8EE9 
X-CRM114-Status: GOOD (  23.59  )
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

On Fri, Jul 22, 2022 at 09:54:57AM +0200, Johannes Berg wrote:
> On Fri, 2022-07-22 at 09:52 +0200, Johan Hovold wrote:
> > Hi,
> > 
> > After moving from next-20220714 to next-20220720, ath11k stopped
> > working here and instead spits out a bunch of warnings (see log below).
> > 
> > I noticed that this series from Johannes was merged in that period:
> > 
> > 	https://lore.kernel.org/all/20220713094502.163926-1-johannes@sipsolutions.net/
> > 
> > but can't say for sure that it's related. I also tried adding the
> > follow-up fixes from the mld branch:
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/log/?h=mld
> > 
> > but it didn't seem to make any difference.
> > 
> > Any ideas about what might be going on here?
> > 
> 
> We think the "fix" is this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/commit/?h=mld&id=dd5a559d8e90fdb9424e0580b91702c5838928dc
> 
> Do you want to try it?

Thanks for the quick reply. And yes, that fixes the problem.

I apparently failed to apply all commits from that mld branch, but this
one alone fixes it.

> Note that if that fixes it, it's still a bug in the driver, but one that
> you'd otherwise not hit.

Yeah, those warnings looked like secondary issues if that's what you're
referring to?
 
> Anyway I'll do some tree shuffling today and get that in.

Thanks!

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
