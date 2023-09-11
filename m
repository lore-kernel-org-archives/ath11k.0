Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A21AEE57DF
	for <ath11k@archiver.kernel.org>; Mon, 11 Sep 2023 11:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMSlMbITVGVVH+TGYHZ42vEFmevb3jOPdo6rYQhODn4=; b=CR69ou1iZBYo36
	rMQubOgGafWmpyMKNQwaDYvrMv8i5TTjOnGAhOn2VORAfwtgFJyrX2btNUUuhZ1UVzkNqgkodp15H
	02yhfbg/15YPcd7I4nKaM/JqivPW+ASg3p+g1ahNhlqk/ll8det63Xj6U7Q0IQ3SDzvKeEPldy26f
	vdtx5t1XszgjxevikPE6mnVccvVFMMh3b5Z8PM5qAGk2m8OG7A5RmJA+UVo5vzWgIj+HJkZZeR8FW
	bLrr4wIH/aGBsE+zGgAEWE8f4Gj7UTuKZVEblRLUo91PvhwLRemMURkWCJkU8e2AbdpTjlM1JqoYN
	aBgH2EGcE9q6Ye8STBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qff4M-000Nad-0k;
	Mon, 11 Sep 2023 11:27:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qff4I-000Na7-18
	for ath11k@lists.infradead.org;
	Mon, 11 Sep 2023 11:27:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3D7D7CE129B;
	Mon, 11 Sep 2023 11:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C16CC433C7;
	Mon, 11 Sep 2023 11:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694431618;
	bh=DF/qfsszTcv7zwe+8RhA/+c3s6dIAdavwqlf2ypN4Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcBXNWTexE90psRMN83fptBA97QX3ucM+BD51tQpZLd6l2++qCLsHSkXmRla6/rZS
	 RZAtYAwo18iRX6NiCfdREkp11Zz4AII+q4ZoOPHecCAmZLGV1+S/gZC7lgr/uuYEIJ
	 pkZBQZCJ8tIfva7rOlIf6fLO99rr/gCCAPbWREKaMtDSyhhvTjdwrn/u1YdOAWM6Sl
	 +mkcyF72O1pQzMA2QfvyrcF+tA6D70iwC94lvqrHO+JC9G46wdF59Hxv/OVlW0w2Tj
	 JCc4HCfWxNSW45RiyT12vrkHnHQstwOM70bEu2nvGm3SfiTMuHqpnu9vh6mweZHofU
	 F24w6TlhP6OJA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qff4C-0003t0-09;
	Mon, 11 Sep 2023 13:26:56 +0200
Date: Mon, 11 Sep 2023 13:26:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Alex R <alex@ironrobin.net>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
Message-ID: <ZP75gMQVajZIJlIL@hovoldconsulting.com>
References: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
 <87jzt3ellx.fsf@kernel.org>
 <ZPhCq32KlaZteCzG@hovoldconsulting.com>
 <d191d35f-f006-45e6-bf69-3d4d251a892b@quicinc.com>
 <ZPiS7EJe7teOpOyw@hovoldconsulting.com>
 <aMi4zXfWxMWs2QxBRyLwLb30U-nf6DPgkOd27if32rD-T5rYfBcS5q8fXgUE-FAarK7NlWmNjDt12o81fDVLJMtygm5mpracZ2TuvrVoFQg=@ironrobin.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMi4zXfWxMWs2QxBRyLwLb30U-nf6DPgkOd27if32rD-T5rYfBcS5q8fXgUE-FAarK7NlWmNjDt12o81fDVLJMtygm5mpracZ2TuvrVoFQg=@ironrobin.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_042702_850360_14BE199B 
X-CRM114-Status: GOOD (  28.96  )
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

On Thu, Sep 07, 2023 at 03:16:15PM +0000, Alex R wrote:
> Q. Did this module ever work, and if so with which kernel version?
> A. It seems to work more reliably on my archiso kernel, which is 5.19.0. 
> 
> IIRC this is where we were using the wifi hack, before we got the new
> X13s board file.

Yes, but it seems you never get as far as loading the board file so I
don't think that one's involved here.

> Q. How is this module identified when it starts successfully? 
> 
> A. Here is the dmesg from a "successful" bootup: https://pastebin.com/1kLDzXSD
> (I was able to get the wlan0 device to come up by booting into Windows
> 11, checking for updates, and then shutting down (not rebooting) 
> 
> (fast boot Windows 11 setting is disabled)

Ok, so you do have a different chip_id than I do (0x2 instead of 0x12),
but both ids have an entry in board-2.bin (otherwise it would not work
"sometimes"):

	ath11k_pci 0006:01:00.0: chip_id 0x2 chip_family 0xb board_id 0x8c soc_id 0x400c0210

You could compare it with what the chip in your other machine which does
not have this issue is identified as (compare all the values above).

> Q. How did things change in 6.5?
> A. On both 6.4 and 6.5 of those versions, we have the same issue in
> the dmesg logs. 
> 
> Although it seems I am able to get "successful" boots more often with 6.4.
> I have no data on this though and could be wrong.

Ok, got it. But with 5.19 you never saw this issue at all?

> Q. Have you verified that you're using the same fw on both the working
> and non-working machine (not just board-2.bin, which does not seem to
> be involved here)?
> A. I use my own distro based on Arch Linux ARM project, and use the
> same x13s-firmware package on both machines, so firmware must be the
> same.
> https://github.com/ironrobin/x13s-alarm/tree/trunk/x13s-firmware

Ok, the fw version is also logged on successful probe and you appear to
use the same version as I do:

	ath11k_pci 0006:01:00.0: fw_version 0x110b196e fw_build_timestamp 2022-12-22 12:54 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Could you check what fw version you were using with your 5.19 iso image?

> Q. You also said something on IRC about dual-booting Windows making a
> difference, etc. etc.
> A. On my faulty machine, I've tried both dual booting Windows and
> running linux as the only root partition on a nvme drive.
> The only difference I've noticed is that I can more reliably bring
> back the wlan0 device by booting into Windows 11, connecting to the
> internet, and then rebooting into Linux.

Hmm... Not sure what's going on here, and I'm afraid I won't have time
to look at this myself for a while.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
