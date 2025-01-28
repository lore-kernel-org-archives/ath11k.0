Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9D4C02193
	for <ath11k@archiver.kernel.org>; Tue, 28 Jan 2025 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8M8lrf8noK+Ne0YHkld4BpzCrLtpOos1EWzqxeT/r8=; b=yl4DMAocXfqEa2nF7H9NDQHaSb
	lBFGsx+Jw2bDTaJuTTAGKMoA8d1921CMyCG6993uu2uWTmgn6xGdVjHHhF9uEqYuHJDLkNIULE55h
	z4wosts2hkXs8mIne+1y3j/gHqyc9GMKFZ1W0mRpX4Xsu0VCc0+Pc3kKe/YJcyWQSCaP2hqxG2wQ+
	ziIQAipICVFfs1T9sxsn505vxgfxps+vygjWpZrJfz6V5YNPNeXyu+j5BCEdckKwBywHHAu6cDIOb
	Ok246Foxpfob6l6LbBPgzJHXkuHymze7AeaubBsEWoosp2rFrdYsqalhRb0ExPTvzh2qVHc+WxTKG
	zTboPEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu0J-00000005vRg-0yrM;
	Tue, 28 Jan 2025 22:24:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu0F-00000005vQi-45OR;
	Tue, 28 Jan 2025 22:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07CF0A4134E;
	Tue, 28 Jan 2025 22:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC1EC4CED3;
	Tue, 28 Jan 2025 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738103054;
	bh=WEytLMAl7cwCDJw/5DRZVkqcz9UySDzwuhOZNmFaZTs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=upPXOBtFrPxgXwmb7BJKBgHroVTxe4QEsdbSuLn7DexDjFoeMtlnPE79wU4LFs3Uc
	 7BcQbtvsc/ZDUiwi/yv4h19+0XeYKCdCCvj1M55FMF1+OXse+WA5Llbn7RfcE2ecOm
	 omrMJeFFTupyJRMfm0+9DzmDatGzptrKL8bQuBvAy9mQaeldC+va9foKb06x+OOY0+
	 BuuYf4v+HaTf2NNUj31WN7DXonSqQiNbM3evFN0BHfHETZhD2AlpCOKzeFCPVRDjp9
	 g5MDn2D6aLJQE0PAN3Oo9qZEYwstcs2ZekRLsWbo7CbVTwcjSzmjl54BYPE/rnJLpj
	 BfXuNublVg8kg==
Date: Tue, 28 Jan 2025 14:24:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 ath12k@lists.infradead.org, ath11k@lists.infradead.org,
 ath10k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>
Subject: Re: Stepping down as maintainer
Message-ID: <20250128142413.3a86418e@kernel.org>
In-Reply-To: <87wmefguqt.fsf@kernel.org>
References: <87wmefguqt.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_142416_078208_A70C1623 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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

On Tue, 28 Jan 2025 11:20:26 +0200 Kalle Valo wrote:
> Hi everyone,
> 
> I'm stepping down from all my maintainer roles. My first commit
> feed9bab7b14 ("spi: omap2_mcspi PIO RX fix") to the kernel was back in
> 2008 for v2.6.24 so I have been here for a long time. Thank you everyone
> who I have worked with, there are too many to list here.

Thank you for all the hard work over the years, Kalle!

You will certainly be missed

