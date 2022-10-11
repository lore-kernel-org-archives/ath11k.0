Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FF6C433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZ+///iaM41OKacsI+PYLl7LxMwzXUCzdYD13l3QX9k=; b=pFcfsctx/lgpLW
	0mvNOhSFk5x+Or+9bvupdVlDVfM1i+irm2rsoqK7i6e0aZgu57N01I1GwIkXuJFd/lAwCUAVp4RYf
	d6to4gDdQpm3bE5lPD1YfWyY/sw837XJNJy4prhYS7g1+P3Vjad4q5HeMNgAyXX3T45Kfe+PJydRB
	fdtB5U5IqW23u8omef2UT5SSsPh/5D3kN2D9xApplpe6JRd5u0QiGwksiaJ25SGxnSAaPFUvuhJkI
	7CH6BEcwkj55Sb11TErI7tm8YogGAz4r8igr8X2p8uaFm5dPBOnY9Zq1bKfoHkZrsKpoLRUGTTC4w
	6568lQFFFfVH7Ju1gQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAvL-003lZe-Fx; Tue, 11 Oct 2022 08:47:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAvI-003lYb-I1
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 08:47:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2323ACE176F
	for <ath11k@lists.infradead.org>; Tue, 11 Oct 2022 08:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63D5C433B5;
	Tue, 11 Oct 2022 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665478048;
	bh=saxwjGV6hGTefLrXaszgH3oibC7+Saqip5+hLH2o8I8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=F7jlc94pkNG+shZJ1+jRgxWaC1FnONUOcMfJhsEpEQDux021GPLBIvmkgsvOvAP4V
	 NZocqz49Ex4FnT4/5Rm99Ewdb7iTGYEHZO3eMxGDDO2Cw7Kj+Rb247faRYK1J4XbHu
	 9RYLLhBkcXkXhtz7Qkc2m/Q8Atk75RiwOKEL9Ks2hU379QubU+JAqZvhkNl/7o01yr
	 nQqBSf7ggc8DqOXaaA8A6e+wtHAl2WX7LLnCpUeRVYhCf2/caQXscwcA4bFDMSeT25
	 Q7/M7sp0IMaO8JZJqje5rt8vrjeUuQ4BQxsd7vyHI2U1zKI78Z2yskzPLQBS4OghMH
	 w5Y5wl/5lL3Kg==
MIME-Version: 1.0
Subject: Re: [v6.1] wifi: ath11k: mac: fix reading 16 bytes from a region of
 size 0 warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221010160638.20152-1-kvalo@kernel.org>
References: <20221010160638.20152-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166547804564.14345.9360761569012199041.kvalo@kernel.org>
Date: Tue, 11 Oct 2022 08:47:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_014736_801643_1A15185A 
X-CRM114-Status: GOOD (  14.07  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Linaro reported stringop-overread warnings in ath11k (this is one of many):
> 
> drivers/net/wireless/ath/ath11k/mac.c:2238:29: error: 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Werror=stringop-overread]
> 
> My further investigation showed that these warnings happen on GCC 11.3 but not
> with GCC 12.2, and with only the kernel config Linaro provided:
> 
> https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/config
> 
> I saw the same warnings both with arm64 and x86_64 builds and KASAN seems to be
> the reason triggering these warnings with GCC 11.  Nobody else has reported
> this so this seems to be quite rare corner case. I don't know what specific
> commit started emitting this warning so I can't provide a Fixes tag. The
> function hasn't been touched for a year.
> 
> I decided to workaround this by converting the pointer to a new array in stack,
> and then copying the data to the new array. It's only 16 bytes anyway and this
> is executed during association, so not in a hotpath.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Link: https://lore.kernel.org/all/CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com/
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to wireless.git, thanks.

abf93f369419 wifi: ath11k: mac: fix reading 16 bytes from a region of size 0 warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221010160638.20152-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
