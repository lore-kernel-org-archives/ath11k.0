Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B10EB8FA5
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfgwA1oRKiy/GP8RRCKAsgm9o/7ax9EqN5Ooq1on+0U=; b=coL/7WYJdVf3mf
	TnbcH1ugIF1lZ1F9Fs17rhsMfJwpmfTjGl/VJH1id/R4qMwJWFnDkMbNom4gwqWQnJKBhVGImJ8Wg
	gojB5glcb5xBdDmXU4zVsVGxXVO/LL1RTFlEE1Rn3F7v1DHQW2w3YfTSkEvvuWOsAm0DP6FJQjS8P
	mNNZWe9MMSfBR5tPps85sLZh1py8gK9NNKdCiadGRnMAOPQB+EnUFV77locXtrg+43Ayz6ooLUZ3f
	jM7jUP53wRu0P9CAIGDB3wjgJ14eaZFnny3YSx6087HPSfI3f5+wmfl11FzN/peWDKUYkwyHeOmEC
	judKq5W6sylHQt5nSEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoao-007s6u-09;
	Wed, 06 Sep 2023 09:12:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoak-007s5N-2A
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 09:12:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 399CDCE13D0;
	Wed,  6 Sep 2023 09:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE80C433C7;
	Wed,  6 Sep 2023 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693991570;
	bh=c8LxhEs+G4wU8wLC9cBf4+u64WmfRNcIl9fmj4JU4rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zs0Jd+jakqWzadoWW4jwOXcAvIPoMuyT8zJIi4xgW2ECS0oj/o86S4LpJ57XPQbEZ
	 b3QkKvzhGqYsfNwC8DXHT/geDz2cM3LKHIeSRk0lZDlZskYZ4AK8AySJTK0dcQBf21
	 MzKflsY4gT8Jugmify+rIjSIxRv3irbXVW0eGIYaEt9JbfKVVc+Uxy8SLaR39JmAaF
	 OP89yQbvaj2hfuHeFo1cGmMX3PyJ9XWEp5c7tl8Dg6hlHeeqL+lanw3JR2pbBFM46+
	 YDv/+WiJvcMqOcJ9urzfUuuZf076wPMYahZDROQ4Mlithme5VeGn7FADMFa4NpYb6t
	 96arUxIcf6cRg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qdob5-0000iD-1Z;
	Wed, 06 Sep 2023 11:13:16 +0200
Date: Wed, 6 Sep 2023 11:13:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, Alex R <alex@ironrobin.net>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
Message-ID: <ZPhCq32KlaZteCzG@hovoldconsulting.com>
References: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
 <87jzt3ellx.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jzt3ellx.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_021254_931790_5136754A 
X-CRM114-Status: GOOD (  17.02  )
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

On Wed, Sep 06, 2023 at 11:45:14AM +0300, Kalle Valo wrote:
> Alex R <alex@ironrobin.net> writes:
> 
> > Trying the latest board-2.bin from
> > https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855 and my
> > wlan0 fails to come up. dmesg: https://pastebin.com/CWHpD0kC
> >
> > My other X13s system (21BX-0015US) works fine so I am wondering if my
> > new X13s (21BY-S03Y00) product type is unsupported.
> 
> For easier tracking can you please file a bug to bugzilla:
> 
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
> 
> Also adding Johan in case he has any ideas or knows what has changed in
> 21BY-S03Y00.

I've asked for some more details from Alex over IRC, but it's currently
not clear why there are problems with this particular machine.

It appears that firmware download fails, but apparently only sometimes.
And it fails before loading board-2.bin so that bit of the report looks
irrelevant:

	[    2.195948] ath11k_pci 0006:01:00.0: wcn6855 hw2.1
	...
	[    2.423948] mhi mhi1: Requested to power ON
	[    2.427589] mhi mhi1: Power on setup success
	...
	[    4.035111] mhi mhi1: Wait for device to enter SBL or Mission mode
	...
	[   23.518986] mhi mhi1: MHI did not load AMSS, ret:-5

IIUC, things got worse with 6.5, possible due to random changes in
timing.

You need to provide a lot more detail, Alex:

For example, did this module ever work, and if so with which kernel
version? How is this module identified when it starts successfully? How
did things change in 6.5? Have you verified that you're using the same
fw on both the working and non-working machine (not just board-2.bin,
which does not seem to be involved here)? You also said something on IRC
about dual-booting Windows making a difference, etc. etc.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
