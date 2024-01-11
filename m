Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6B1C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCpHewP0jB6Ti/qhlfUnfxomLJfTCmKYQ/eSlKtxlcw=; b=WxDBpoUFUYvbSEU/Bu9oXqxFyD
	ZV7FSUg7eWdX5Sruc49a4nMicrV8xLl1EMB4uwvq88Oo6F3n76yLaEOk3ywLEqGYZLIcXNkwZ65eF
	/GFxDMVXWkQ5u+MElrsAkPdblbD9Zj7EDdamGqrB+vQZThE8j1qIfCHgyiGVju92NSyxx/yCfnOTB
	jhbtaswMhikm63PpCtqv1ZhwqyTta+k0Mm44T06i+Bbbtbf6Yk0ROyBtxG2ywqaOP4N7Ww4CiLPpS
	ELCYBQzMjk245FflHzk7kZU1ctP5fbNG1tQGLh4ssnH8IJgdbbVEpPUL7OLlIbDIJNAERbcOYhsK3
	Cd00FkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNt5T-00HDg9-2n;
	Thu, 11 Jan 2024 11:19:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNt5Q-00HDeW-1M
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 11:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EC180B80C0A;
	Thu, 11 Jan 2024 11:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF51C433F1;
	Thu, 11 Jan 2024 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704971938;
	bh=5Cix56vFM6aAxtW3khDlrq6pP687nQKFNumsJmKbMYY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=d1s59qoECwgrm6ZwVOwT2yWKfAPFlbPs2RlqLtly+eh9VLMhj0djZQfdeTNNprcX+
	 7jiFdqzGYx1Clmtp9dg+4cI3//xlpQASap+IeZBSmfriMYos5uJDkaDpd4HENUQadr
	 Nt3SBGpQ6Tyc7E/PH3mjXgkIbNF4FsS2RaXi0IXY7CFQVYwgR9mtt+uL3aJIwKLiiU
	 6Mo3OMuok+ORxOn/1g02YWDVMrCMT/Dd44Qe3EyhNenEo1g42AG6bljsIE6L0OzOZq
	 u2wqrVJVmWH68w8pQ8rXYnrwxB2NBl8WlSqhlcyMIIF1nrp5RdqfOtYBG0AlNTNAuv
	 U5GrRaQppYikg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath11k: fix IOMMU errors on buffer rings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231212031914.47339-1-imguzh@gmail.com>
References: <20231212031914.47339-1-imguzh@gmail.com>
To: Zhenghao Gu <imguzh@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Zhenghao Gu <imguzh@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170497193566.659902.18362636200509021901.kvalo@kernel.org>
Date: Thu, 11 Jan 2024 11:18:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_031900_591265_FD35D8E9 
X-CRM114-Status: GOOD (  10.07  )
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

Zhenghao Gu <imguzh@gmail.com> wrote:

> virt_to_phys() doesn't work on systems with IOMMU enabled, which have
> non-identity physical-to-IOVA mappings.  It leads to IO_PAGE_FAULTs like this:
> 
> [IO_PAGE_FAULT domain=0x0023 address=0x1cce00000 flags=0x0020]
> 
> And no association to the AP can be established.
> 
> This patch changes that to dma_map_single(), which works correctly. Even
> virt_to_phys() documentation says device drivers should not use it:
> 
>     This function does not give bus mappings for DMA transfers. In
>     almost all conceivable cases a device driver should not be using
>     this function
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Zhenghao Gu <imguzh@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

aaf244141ed7 wifi: ath11k: fix IOMMU errors on buffer rings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


