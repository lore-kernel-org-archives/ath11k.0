Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A37AE784BF
	for <ath11k@archiver.kernel.org>; Mon,  2 Oct 2023 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNXrxyCltQFobnq7Efp+CuSv0p66CdPlDnOFt7yagRY=; b=IvqIncyBNeE8S3
	tyDL/gDFiCNgVbVTNU6xGAYSjT6W0jn0u637xLR4Yg2M/FL1huv75r/P91Vb1ITTAHl+xcEYG557G
	vHnpgF/Lc3N28AuevVyvXIe0aDQvSep7/6qDl8sUyfhIWOUrfBW+h6NeK+yaETyLZYwRH5jBMWGpG
	s3W4IJ9A31JQxA1PsWZemrPCSEUU38FCf74zNyW70eX5EEZD16h69kFXC0OWOw2g7DX32VD5F3Pnz
	+5y6QmY8XhaLYaoFaThUu0+HgLZs5iTYkIFsHlyj+ekSxXjsc7gu4RK686VG238cG+0ur2hsijv7B
	83b81pB843CtTD5UNK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLCt-00D1Cr-1z;
	Mon, 02 Oct 2023 15:51:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLCq-00D1CV-0k
	for ath11k@lists.infradead.org;
	Mon, 02 Oct 2023 15:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B6E5DB811AE;
	Mon,  2 Oct 2023 15:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5772C433C7;
	Mon,  2 Oct 2023 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696261894;
	bh=+B2SrbBWimw4oqZWFj446YyLdZVqab4fu390vSjipXE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=cmF4nW6KN3sxUzXq7xYa30rVRyLbSOnGwAq72bTNiDYBrZVs7qpy4oY0ME769Ioiy
	 yChmcl4c1azo/n5lIuafEqv7dzXm96y4WAi8EWFDRUQZ1qL8K7eSsz1b3F8w9hpm/t
	 KwViVDPmfHejgFha0OKEjE2z1JPVMryqiCj+0GrTTH+3y1m85d/M/SGbj7hDLZwYrz
	 7h3XLdAla0qUF7ZlegtDk66QlCSM7aesgHlC2XwuPJdryiMSk/81IzZoiobE1LUUHs
	 DL/XqntkA+LWu5RZE7C0y2Vq76bfGpokcrFJPohdBH+FLRHz7msMDOdHw931xYga3R
	 pXuKm2S34kQvg==
MIME-Version: 1.0
Subject: Re: [PATCH v6 03/13] wifi: ath11k: fix a possible dead lock caused by
 ab->base_lock
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230920082349.29111-4-quic_wgong@quicinc.com>
References: <20230920082349.29111-4-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>,
 Baochen Qiang <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169626189059.3911795.14308656119733371331.kvalo@kernel.org>
Date: Mon,  2 Oct 2023 15:51:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_085136_551567_11A9F9B8 
X-CRM114-Status: GOOD (  10.08  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> spin_lock/spin_unlock are used in ath11k_reg_chan_list_event to
> acquire/release ab->base_lock, for now this is safe because that
> function is only called in soft IRQ context.
> 
> But ath11k_reg_chan_list_event() will be called from process
> context in an upcoming patch, and this can result in a deadlock if
> ab->base_lock is acquired in process context and then soft IRQ occurs
> on the same CPU and tries to acquire that lock.
> 
> Fix it by using spin_lock_bh and spin_unlock_bh instead.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Fixes: 69a0fcf8a9f2 ("ath11k: Avoid reg rules update during firmware recovery")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This patch seems to leak memory:

unreferenced object 0xffff8881110f5840 (size 64):
  comm "softirq", pid 0, jiffies 4295335213 (age 79.445s)
  hex dump (first 32 bytes):
    32 14 82 14 50 00 17 00 00 02 00 00 82 14 d2 14  2...P...........
    50 00 17 00 08 02 00 00 72 15 62 16 a0 00 1e 00  P.......r.b.....
  backtrace:
    [<ffffffffa1f891ca>] __kmem_cache_alloc_node+0x1ca/0x2d0
    [<ffffffffa1e57950>] __kmalloc+0x50/0x1a0
    [<ffffffffc076640e>] create_ext_reg_rules_from_wmi+0x2e/0x430 [ath11k]
    [<ffffffffc07705c4>] ath11k_pull_reg_chan_list_ext_update_ev+0x1d24/0x4f30 [ath11k]
    [<ffffffffc07a4a44>] ath11k_reg_chan_list_event.isra.0+0x64/0xd0 [ath11k]
    [<ffffffffc07a562f>] ath11k_wmi_tlv_op_rx+0xb7f/0x27e0 [ath11k]
    [<ffffffffc07f3a54>] ath11k_htc_rx_completion_handler+0x3b4/0x6f0 [ath11k]
    [<ffffffffc0838b3a>] ath11k_ce_recv_process_cb+0x5da/0x920 [ath11k]
    [<ffffffffc0839b68>] ath11k_ce_per_engine_service+0xe8/0x130 [ath11k]
    [<ffffffffc084ba75>] ath11k_pcic_ce_tasklet+0x65/0x120 [ath11k]
    [<ffffffffa196df5c>] tasklet_action_common.isra.0+0x24c/0x3d0
    [<ffffffffa196e12f>] tasklet_action+0x4f/0x70
    [<ffffffffa448b355>] __do_softirq+0x1c5/0x867
unreferenced object 0xffff8881110f5f40 (size 64):
  comm "softirq", pid 0, jiffies 4295335238 (age 79.439s)
  hex dump (first 32 bytes):
    32 14 82 14 50 00 17 00 00 02 00 00 82 14 d2 14  2...P...........
    50 00 17 00 08 02 00 00 72 15 62 16 a0 00 1e 00  P.......r.b.....
  backtrace:
    [<ffffffffa1f891ca>] __kmem_cache_alloc_node+0x1ca/0x2d0
    [<ffffffffa1e57950>] __kmalloc+0x50/0x1a0
    [<ffffffffc076640e>] create_ext_reg_rules_from_wmi+0x2e/0x430 [ath11k]
    [<ffffffffc07705c4>] ath11k_pull_reg_chan_list_ext_update_ev+0x1d24/0x4f30 [ath11k]
    [<ffffffffc07a4a44>] ath11k_reg_chan_list_event.isra.0+0x64/0xd0 [ath11k]
    [<ffffffffc07a562f>] ath11k_wmi_tlv_op_rx+0xb7f/0x27e0 [ath11k]
    [<ffffffffc07f3a54>] ath11k_htc_rx_completion_handler+0x3b4/0x6f0 [ath11k]
    [<ffffffffc0838b3a>] ath11k_ce_recv_process_cb+0x5da/0x920 [ath11k]
    [<ffffffffc0839b68>] ath11k_ce_per_engine_service+0xe8/0x130 [ath11k]
    [<ffffffffc084ba75>] ath11k_pcic_ce_tasklet+0x65/0x120 [ath11k]
    [<ffffffffa196df5c>] tasklet_action_common.isra.0+0x24c/0x3d0
    [<ffffffffa196e12f>] tasklet_action+0x4f/0x70
    [<ffffffffa448b355>] __do_softirq+0x1c5/0x867

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230920082349.29111-4-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
