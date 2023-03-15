Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7F0C6FD1D
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9290R7zgbm089dbxFYUuyNLZ0FLPv4SxvCRCDB0IBU=; b=OhZ0+hKYKFTD2D
	7VVvjuJ/Y1+jMyTDEao5YF9tfCewuuDZjjCao7nUdggD805Wa/twzZeHr35rvkCHaS7H/kGP2TBqs
	5YIF7yVTFB4vqz4Gzzd1+FltWk6CB3ID6LLHA0pok9vjbTpQ0H9oKyGbzoylcd+bzPjcn5nkWYVi3
	/kagZKzl4H2fnPX1ALXee+QVo6Ulx3h8nGRgn9W8z1Oo91YEtisp9hQF2SHJGKeH2fspJLce7CmrE
	RX5UO6xTjMX6WsEWH+Q2n3mmpKpyoR4PV2ukyqfsaUrtc7O1yCsQ0i/djPMXavPUa+F7SoZs8h2HY
	MweQO35D079a+QkcoZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOGG-00D2xE-2j;
	Wed, 15 Mar 2023 10:21:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOGD-00D2wJ-2N
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 10:21:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43E9F61CD6;
	Wed, 15 Mar 2023 10:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5330C4339B;
	Wed, 15 Mar 2023 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678875692;
	bh=CuHPYZZEYCp8iU6q5/5BzNx9Ip0l/TQ3a8JBLM6iskk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Uhm1FKOjTO1m14oHb8RgCTAIGoUKPacBxVB8EZva3oQu13TmxQmI93QzEbL60Si82
	 EMHV9IufvrQl1r1LmW2UocnauilErO06BwAJVYVFgLljq/AqX2bXphyDHh567FGWYv
	 JYxx/6rEx8SVsI0eOZlHeFhYOSjjh5wzDFZ/eqbhmOK/y7qNlWYHdRU4Giex4VARPC
	 //KB8T3Zv7O44YeUhwMn1opepOBOqg3RSK3GE75yWWyK/TVXLbAAcP0Ewn6nseLgOq
	 zSH43YBCGm15Sr9I1XEeMwNv2zJADi0Pqa5fwR3wgAp8/aV+kui23sYdMFGStNjhGz
	 alG0Yqrtg0Vvw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix deinitialization of firmware resources
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230309095308.24937-1-quic_adisi@quicinc.com>
References: <20230309095308.24937-1-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167887568997.27926.1136689205156252077.kvalo@kernel.org>
Date: Wed, 15 Mar 2023 10:21:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_032133_847554_920E79C9 
X-CRM114-Status: GOOD (  15.82  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Currently, in ath11k_ahb_fw_resources_init(), iommu domain
> mapping is done only for the chipsets having fixed firmware
> memory. Also, for such chipsets, mapping is done only if it
> does not have TrustZone support.
> 
> During deinitialization, only if TrustZone support is not there,
> iommu is unmapped back. However, for non fixed firmware memory
> chipsets, TrustZone support is not there and this makes the
> condition check to true and it tries to unmap the memory which
> was not mapped during initialization.
> 
> This leads to the following trace -
> 
> [   83.198790] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> [   83.259537] Modules linked in: ath11k_ahb ath11k qmi_helpers
> .. snip ..
> [   83.280286] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   83.287228] pc : __iommu_unmap+0x30/0x140
> [   83.293907] lr : iommu_unmap+0x5c/0xa4
> [   83.298072] sp : ffff80000b3abad0
> .. snip ..
> [   83.369175] Call trace:
> [   83.376282]  __iommu_unmap+0x30/0x140
> [   83.378541]  iommu_unmap+0x5c/0xa4
> [   83.382360]  ath11k_ahb_fw_resource_deinit.part.12+0x2c/0xac [ath11k_ahb]
> [   83.385666]  ath11k_ahb_free_resources+0x140/0x17c [ath11k_ahb]
> [   83.392521]  ath11k_ahb_shutdown+0x34/0x40 [ath11k_ahb]
> [   83.398248]  platform_shutdown+0x20/0x2c
> [   83.403455]  device_shutdown+0x16c/0x1c4
> [   83.407621]  kernel_restart_prepare+0x34/0x3c
> [   83.411529]  kernel_restart+0x14/0x74
> [   83.415781]  __do_sys_reboot+0x1c4/0x22c
> [   83.419427]  __arm64_sys_reboot+0x1c/0x24
> [   83.423420]  invoke_syscall+0x44/0xfc
> [   83.427326]  el0_svc_common.constprop.3+0xac/0xe8
> [   83.430974]  do_el0_svc+0xa0/0xa8
> [   83.435659]  el0_svc+0x1c/0x44
> [   83.438957]  el0t_64_sync_handler+0x60/0x144
> [   83.441910]  el0t_64_sync+0x15c/0x160
> [   83.446343] Code: aa0103f4 f9400001 f90027a1 d2800001 (f94006a0)
> [   83.449903] ---[ end trace 0000000000000000 ]---
> 
> This can be reproduced by probing an AHB chipset which is not
> having a fixed memory region. During reboot (or rmmod) trace
> can be seen.
> 
> Fix this issue by adding a condition check on firmware fixed memory
> hw_param as done in the counter initialization function.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f9eec4947add ("ath11k: Add support for targets without trustzone")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

5a78ac33e3cb wifi: ath11k: fix deinitialization of firmware resources

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230309095308.24937-1-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
