Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5037FC3DA6E
	for <ath11k@archiver.kernel.org>; Wed, 20 Dec 2023 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N39PxtHZcFs3qJ4hh3xlM/jq0KDCehSTsf7Y9YbXRRw=; b=sgy7s6x3AFW951Y/HGNxiDGU68
	WQ9JDdqrP3btDVgousMMweExA0AgfdMw0to47s314hy5I5V04R7gkcTVFPf88W685pYb07EjkbjCy
	Q/qlVU3+g7Tm3EM5xm1dFq6TsaqbSqJT9nklLDDK9wPcJ+5QtwCzPgoPzEbbP1xRzQc5OhfDLI8hs
	0tjMwmZv5+QlLCUAtK8mSczr+w3mg6gomT2nSyKf/r1BUDph0FKMlWipObzi3cHsiLs/UehQ3QxkY
	rBJuDQZwcEF3kzoY+BpeLod/JZ2PtzQjYT5NLgofg7bAqPcD3MkNBSTuBEomzK94jMW0/Mgt3/QPt
	r9JR5Cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFxbB-0005q7-1K;
	Wed, 20 Dec 2023 14:31:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFxb9-0005pZ-0B
	for ath11k@lists.infradead.org;
	Wed, 20 Dec 2023 14:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16C556167E;
	Wed, 20 Dec 2023 14:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D71C433C8;
	Wed, 20 Dec 2023 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703082657;
	bh=N39PxtHZcFs3qJ4hh3xlM/jq0KDCehSTsf7Y9YbXRRw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WuTVSssMIulKIbbWlo4i1oWwARMyVJUI7d0DJg80mE4ZHhFPADvIsTOei8eL3KR49
	 sMZ3I6MlXXRqUjlIbQ8VfmucTRmNQIqsC/rPl6eYyFlA3mvn5vfHq7dMmphuQVj4X2
	 O0EVsMmvuP/j2K4QDgIzb+wewQcrEHICYQe1FeoHVQVcARxDyNalvcys6bATFuOg/j
	 z0gKGoaSj+Cz+vLR7swu9qfXKQzZQQ9dIEAk109veC3tTelcNWrjjXyMFfNF07VtLk
	 1+mTQ4TxfQ0U5okWzETz/0Ah2u42SV+QNzIkjx/Zda+BnWTyXBsU5hUTpUf5bmZ0U0
	 uslLPYScy5mzA==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>,  ath11k@lists.infradead.org
Subject: Re: Ath11k warnings, and eventual phy going away requiring reboot
References: <ab00ff77-23de-43a1-9eb9-6ac036ab80e3@gmail.com>
	<87edfiqcdi.fsf@kernel.org>
	<6122eb4e-66f5-4772-b211-8fc69ac88ebe@gmail.com>
Date: Wed, 20 Dec 2023 16:30:54 +0200
In-Reply-To: <6122eb4e-66f5-4772-b211-8fc69ac88ebe@gmail.com> (James
	Prestwood's message of "Wed, 20 Dec 2023 04:42:31 -0800")
Message-ID: <87o7elosip.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_063059_197286_53F2D113 
X-CRM114-Status: GOOD (  18.78  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

James Prestwood <prestwoj@gmail.com> writes:

> Hi Kalle,
>
> On 12/19/23 10:24 AM, Kalle Valo wrote:
>> James Prestwood <prestwoj@gmail.com> writes:
>>
>>> I noticed this after one of our devices dropped offline. The device
>>> had roamed 7 minutes prior so I doubt that had anything to do with it.
>>> But then we get this, and then tons of warnings. I'm happy to provide
>>> full stack traces but its quite a few, not sure which ones are
>>> relevant or not. After all the warnings IWD got an RTNL del link event
>>> and was unable to recover from that. It seems after that ath11k tried
>>> to power back on but failed.
>>>
>>> This is a stock 6.2 ubuntu kernel, WCN6855:
>> BTW I don't know how it's nowadays, but back in the day Ubuntu heavily
>> modified ath11k. And we can't support distro kernels anyway as we don't
>> know what they have changed in the kernel.
>
> Ok. I understand where your coming from, but at the same time Ubuntu
> is the largest linux distribution so it seems like these type of
> reports wouldn't be uncommon. OTOH maybe users just go directly to
> Ubuntu.

Isn't the recommendation that distro kernel bugs should be reported to
distro bug trackers? At least that's what I have understood. At least
our bugzilla says that:

https://bugzilla.kernel.org/

> Anyways, this is a list of patches isn't huge according to the
> changelog (for 6.2):
>
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: fix registration of 6Ghz-only ph=
y without the
> full channel
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: add support default regdb while =
searching
> board-2.bin for
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: fix memory leak in WMI firmware =
stats
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: Add missing check for ioremap
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: Ignore frags from uninitialized =
peer in dp.
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: Fix SKB corruption in REO destin=
ation ring
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: reduce the MHI timeout to 20s
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: Use platform_get_irq() to get th=
e interrupt
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: fix SAC bug on peer addition wit=
h sta band migration
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: fix deinitialization of firmware=
 resources
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: fix writing to unintended memory=
 region
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: Fix memory leak in ath11k_peer_r=
x_frag_setup
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: fix monitor mode bringup crash
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: debugfs: fix to work with multip=
le PCI devices
> =C2=A0=C2=A0=C2=A0=C2=A0 - wifi: ath11k: allow system suspend to survive =
ath11k
>
> I see the dilemma of not wanting to waste time debugging when there
> are unknown changes applied. I was hoping someone would recognize the
> behavior and could suggest a patch/kernel/firmware to try

Sure, I also get where you are coming from :) Just wanted to make sure
you know the problem with distro kernels.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

