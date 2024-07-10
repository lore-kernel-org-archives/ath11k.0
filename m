Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D35C3DA42
	for <ath11k@archiver.kernel.org>; Wed, 10 Jul 2024 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWDDv43aWHDvo5rPdgsy2R0OWGSWQ0gdVk2GKHVEm6Q=; b=08qJXWwgQdxQ61+WyxlsXLoNKo
	nxi8tFcA0vhr+0XVjsbL+X2164InZE2JeBeNtuPc4DZwMg469zBHvrq441joz3HeQ2WpJeG1CuYUU
	a8ZJiHnBDY5S25l1Eqxch99azasJVLAb7GQGgeZ/ArmXZMd6cM5Mmz73L2FOaX0TC7hLVOeqZU46K
	RiD/Dve8lGX/ADyY+1VjQOY/Jw6Z1RQOhRhQqO0aCRQTe4PUIgLwo6Oes4bsV1k5iHMpUIkc2pbTE
	pe99lS2LU3Nr1VjUYOhR7Nswn+aUJnC6lZXgjTvtNOmOrl6MzN6Olxil2uDSS8HPd+yhKMtAEOkg4
	M51klKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRUnG-0000000AErT-36wJ;
	Wed, 10 Jul 2024 10:43:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRUnD-0000000AEpn-2El8
	for ath11k@lists.infradead.org;
	Wed, 10 Jul 2024 10:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C888FCE13C7;
	Wed, 10 Jul 2024 10:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61171C32781;
	Wed, 10 Jul 2024 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720608201;
	bh=G9NwXGpGLcXkv6JUI+e8M58AnR80AbxHg3gV1n3+gzM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UFGHn+viX5H47ArAAQEtTKaFAacMdGdbbNEsnC6pLpvvPVwOErqAaEG2DTC7iiT0z
	 U+CMMF3Dp/fZuDsNP8T9w2Li45KiOYEz+fF0PF+/C+K3zkuDP1csGgIdPtYjJeihdK
	 2EvSZGsIc4LZ3R4mDKiYAYCjMPpTFZSnnAvrVICV6AmdpabfyfIx/L2HjlKu4i5zw5
	 HFCkQUeiZjbMKAxmxYD1wGq4CJkUt526jgDZ7EmnYKZSuxwoLYaZn6E+0dCofNhkLj
	 C4pgPm6emOlaafCdbLF9RjtKC5/BSPGMYKZH0lmB+dwSp2COvFCsnGo37rmoXzejQN
	 zWjF1Bfe/5+BA==
From: Kalle Valo <kvalo@kernel.org>
To: Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: IPQ6018: support for 802.11s MESH
References: <3581dfd05dd3468d97b3fd06072d206732da9482.camel@azg-tech.com>
	<87frsjdhzn.fsf@kernel.org>
	<196d7fb9f411cbfad0c8cf690efcf55da01469c0.camel@azg-tech.com>
Date: Wed, 10 Jul 2024 13:43:18 +0300
In-Reply-To: <196d7fb9f411cbfad0c8cf690efcf55da01469c0.camel@azg-tech.com>
	(Stefan Zegenhagen's message of "Tue, 09 Jul 2024 10:24:15 +0200")
Message-ID: <87cynlbk8p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_034323_769898_B9644A45 
X-CRM114-Status: GOOD (  18.47  )
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

Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com> writes:

> Dear Kalle, dear all,
>
> I can understand your concern regarding unknown patches. I've checked
> carefully that there's no OpenWRT patch on the ath11k driver that could
> possibly cause this behaviour. Most patches are vanilla kernel
> backports, others do harmless things like
>  - disabling coldboot calibration on IPQ6018
>  - setting FW memory mode via DTB
>  - tweaking QRTR instance IDs to allow multiple ath11k cards to be used

So there are changes to ath11k and mac80211?

> However, vanilla kernel still requires numerous patches to actually
> work on the Mango board. So it's difficult to test without any patches,
> since the IPQ6018 is a built-in AHB core and I cannot simply plug it
> somewhere else.

Sure, I understand that. But we have been bitten by distro changes so
many times in the past that we simply don't have time to support them.

> Could you please at least answer the question whether mesh is supposed
> to be working on IPQ6018 with vanilla kernel, which firmware version is
> required and whether it is required to enable raw mode data path? Is
> there some knowledge around? With ath10k, there was at least a WMI
> services file in debugfs and a feature list in the 'bin' file. Both are
> no longer available and I can no longer see anything about firmware
> capabilities.

I have not tested mesh mode myself with IPQ6018 but I did saw a report
claiming that at least this firmware has working mesh mode:

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ6018/hw1.0/2.6.0.1/WLAN.HK.2.6.0.1-01291-QCAHKSWPL_SILICONZ-1?ref_type=heads

Though that's not the most reliable source so I'm taking the report as a
grain of salt.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

