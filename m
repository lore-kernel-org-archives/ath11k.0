Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125FFC48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mURvE2uGGILYDli2lzQcpu/FLaa1U78HVSbHyRgIir0=; b=WH29A1kpM4CT1sNRytdKBds7Pi
	0m4Qh3rb7PVPOhOniwv3NHURfDD2AAg5qEr6ejsdez0px1ydGKQwvRE7KGrbsaWVRwmVpb8WdZCqk
	e75QNAPG2diVrROT3Kwtvs54mJAEMWFqnO3HbWeAbUF0lv5261bSpBXbSukUz4m0U2pC1E/mOtHYv
	sfyG1NrBDyBsf16NQ/AxIDDuisx9dWz1Icyw1Iiorbqa3WCFNYlUCKI5C2smgC0xvscpR/0AVUzcn
	0MhImVeROLkxf5Y89BD4mtZLoFouln63xt6Uf4WXluHwuF3oVydHxhK10yeS/yivDcEMK3//7acPK
	gDNZBPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redIu-00000001WV9-1jxh;
	Mon, 26 Feb 2024 15:54:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redIn-00000001WR8-21hh
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 15:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C695ACE1345;
	Mon, 26 Feb 2024 15:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C920C433F1;
	Mon, 26 Feb 2024 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708962838;
	bh=hOcwgVVHllRsU7aOePk2RzhuPZQC9eu4t3f3aZeY32c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qNtQoZMFDz+VHlsa4B62y3eo3/x/5WQh3VbvMLZj31L0fMzVYtYrgBGU0GnnGX+XO
	 Pij5+oELlOGfHx936vmoB8ppZgs4SWNIcaGpPNLhcnHc+f8Mn3pdIqVBWST8AVGnwf
	 RGXxx7QqxF4WpzFFOv7G3S+KPnbtrH78XzY4RMF3Cmnz5VMxCixHgP46v3nK0sEM9X
	 cBcdtZnqw6QnGB7nWElLZW+NhzQ81MWYnAcw3SgmHJaXytwU16QQJEzZM0AFgZ9ZMr
	 IG6AUzNwr7fBT+R+xUkOE0OtsEvCQsEmLCBYz+R9kk/3njVEDLDrGbadmPhAj+x8sh
	 Qg3eeMzOqOBTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: Tanjeff Moos <Tanjeff.Moos@westermo.com>,
  openwrt-devel@lists.openwrt.org,  Felix Fietkau <nbd@nbd.name>,
    ath11k@lists.infradead.org,
    Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: Question to recent Qualcomm CVEs
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
	<5e5c35eb-336b-4e92-b506-506e9fbeef7d@nbd.name>
	<2668032.usQuhbGJ8B@ripper>
Date: Mon, 26 Feb 2024 17:53:54 +0200
In-Reply-To: <2668032.usQuhbGJ8B@ripper> (Sven Eckelmann's message of "Mon, 26
	Feb 2024 16:38:02 +0100")
Message-ID: <87ttlvjk6l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_075402_135661_373EDB33 
X-CRM114-Status: GOOD (  23.46  )
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

+ ath11k, jeff

Sven Eckelmann <sven@narfation.org> writes:

> On Monday, 26 February 2024 15:50:44 CET Felix Fietkau wrote:
> [...]
>>> The Qualcomm bulletin[1] says "Patches are being actively
>> > shared with OEMs".
>> > 
>> > Were these bugfixes made available for OpenWRT? Is there an established
>> > procedure for such cases, where closed-source firmware gets bugfixes?
> [...]
>> > [1]
>> > https://docs.qualcomm.com/product/publicresources/securitybulletin/
> december-2023-bulletin.html
>> 
>> The fixes were not shared with OpenWrt. Qualcomm does not care about 
>> OpenWrt support for their platforms.
>
> I've asked (using their qualcomm-cdmatech-support portal) for an official 
> release of their WiFi firmware with all gathered bugfixes via 
> linux-firmware.git. I got statements that the ath10k firmware is no longer 
> supported + ath11k firmware is not developed further. But for some of them it 
> is possible to request a release of the firmwares via Kalle's repositories. 
> But also that Kalle's repositories are now replaced. Which seems to be 
> confirmed by Kalle's statement [1] regarding the firmware-N.bin files on 
> ath12k@lists.infradead.org .
>
> The new positions for firmware files were not revealed but I found a couple of 
> places [2,3,4,5] in my search.

Yeah, the ath1?k-firmware.git repos are being moved to
git.codelinaro.org and we will send an announcement once everything is
ready.

> And to the request to get the latest versions released via linux-firmware.git 
> (or maybe even only in Kalle's repositories), I got (some weeks ago) the 
> answer "Let me check with our team.".
>
> It is rather hard to make statements about Qualcomm  - simply because it is 
> not just a single person and I have no idea about the internal structures. But 
> it doesn't seem to be the highest priority (for the "internal team"?) to make 
> fixes available for everyone. I still hope that it is just delayed due to some 
> unfortunate circumstances. But this is just the current state.

Thanks for letting me know, I was not aware any of this. Me and Jeff
will investigate and get back to you.

For others, here's a link to the thread in openwrt-devel:

https://lists.openwrt.org/pipermail/openwrt-devel/2024-February/042341.html

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

