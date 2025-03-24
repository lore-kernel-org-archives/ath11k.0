Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8C9C3600C
	for <ath11k@archiver.kernel.org>; Mon, 24 Mar 2025 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi4CVr3GtlQhvD/I+ByhhWaSETgIU2ed6dKS2oDNOCo=; b=IIoujiaTyqSmUBdlgW1cKof6sK
	XfI5xSiZrCdVxwW2ZSmcLqlftkULlvkDztGRwAlRbvAsEvNLg/LMGJv24f9THlzyUgEFnoTVJm1II
	JLcneIzZx3X2Wkgka4sLfhtApdHF6wqCqQ+/WDqgWxVqJf6K4YVVc9W0rCCkqv8v+6/hWDt/Usb0W
	7lTCodj2fvYcf8H2blghAYQ/yYIm5JQsTLzoU2Y5RvaXZjzApFDlG3SELpQCECH2xHEZLPAa/WxZT
	7MEOud2zh1A+fAgjs2QUTAKAlUw4rsoWwzcjlslZL3MDq3eJke8W0T8GPoZBR33DnS+tfsuXhKY05
	t8i9q6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcbY-00000002V1I-3bSi;
	Mon, 24 Mar 2025 07:52:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcZH-00000002Uka-2tNS
	for ath11k@lists.infradead.org;
	Mon, 24 Mar 2025 07:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECA1B5C59E3;
	Mon, 24 Mar 2025 07:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625CBC4CEEF;
	Mon, 24 Mar 2025 07:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742802594;
	bh=jNLDCdJFoig06EFMoOmwsoZUr7jPMKWh4pnzp/qGePI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQ7H+DKr4qbzeYG15TxlnrwjiGM974B0SG2GEAKppknwg7rZqtovB9o1PA5hFPSrd
	 +8PRrF/Zc9/KSf5QETr7yITWJp/v4ZN4v1EXv2buBta6Jy621IQX24Pg/llOeRY0x2
	 AbPs/923M5SMwRlWmpZk3I+IXX4YwfN+6ak0sjj8PHkm2yOH6IHtrCBSIZHdH1XsgA
	 kXcPaqmDG9b1mDdR37RtiQmCkvp5jukdfsEnnEo1jGDEB4SqLEbMg1j/AHHj81bqDH
	 VPhsXwo4T29SQP4whsqfESGYkw/gDdEQqRPaIE8x4w9kPFJj23+bDifu6uMczoeagp
	 shSPxqW4OaUfA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twcZE-000000001Vo-2hf6;
	Mon, 24 Mar 2025 08:49:53 +0100
Date: Mon, 24 Mar 2025 08:49:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Clayton Craft <clayton@craftyguy.net>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix rx completion meta data corruption
Message-ID: <Z-EOoIjhOXrT84gX@hovoldconsulting.com>
References: <20250321145302.4775-1-johan+linaro@kernel.org>
 <51a59b41-4214-4e24-bfe8-3d8174ba1a3b@craftyguy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51a59b41-4214-4e24-bfe8-3d8174ba1a3b@craftyguy.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_004955_841264_40BC178F 
X-CRM114-Status: GOOD (  24.76  )
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

On Sun, Mar 23, 2025 at 11:15:54PM -0700, Clayton Craft wrote:
> On 3/21/25 07:53, Johan Hovold wrote:
> > Add the missing memory barrier to make sure that the REO dest ring
> > descriptor is read after the head pointer to avoid using stale data on
> > weakly ordered architectures like aarch64.
> > 
> > This may fix the ring-buffer corruption worked around by commit
> > f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
> > ring") by silently discarding data, and may possibly also address user
> > reported errors like:
> > 
> > 	ath11k_pci 0006:01:00.0: msdu_done bit in attention is not set
> > 
> > Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> > 
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> > Cc: stable@vger.kernel.org	# 5.6
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=218005
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> > 
> > As I reported here:
> > 
> > 	https://lore.kernel.org/lkml/Z9G5zEOcTdGKm7Ei@hovoldconsulting.com/
> > 
> > the ath11k and ath12k appear to be missing a number of memory barriers
> > that are required on weakly ordered architectures like aarch64 to avoid
> > memory corruption issues.
> > 
> > Here's a fix for one more such case which people already seem to be
> > hitting.
> > 
> > Note that I've seen one "msdu_done" bit not set warning also with this
> > patch so whether it helps with that at all remains to be seen. I'm CCing
> > Jens and Steev that see these warnings frequently and that may be able
> > to help out with testing.
> 
> Before this patch I was seeing this "msdu_done bit" an average of about 
> 40 times per hour... e.g. a recent boot period of 43hrs saw 1600 of 
> these msgs. I've been testing this patch for about 10 hours now 
> connected to the same network etc, and haven't seen this "msdu_done bit" 
> message once. So, even if it's not completely resolving this for 
> everyone, it seems to be a huge improvement for me.
> 
> 0006:01:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 
> Wireless Network Adapter (rev 01)
> ath11k_pci 0006:01:00.0: chip_id 0x2 chip_family 0xb board_id 0x8c 
> soc_id 0x400c0210
> ath11k_pci 0006:01:00.0: fw_version 0x11088c35 fw_build_timestamp 
> 2024-04-17 08:34 fw_build_id 
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Tested-by: Clayton Craft <clayton@craftyguy.net>

Thanks for testing and confirming my suspicion.

Johan

