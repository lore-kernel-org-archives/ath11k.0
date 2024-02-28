Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CAAC47DD9
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbyg7PyWRPkYa6Iqwx5I0p3AWV0DWSA8GiMI4A+1+NY=; b=3VrH4VyrhoOb8nIaWHasnHCzDs
	iSYes0YrVcpGdwFdZbaWIkCqVJEy50SJgvqnRg3W25MwjJYuGJlQfR0sOI497lAoythwpJ8M+Erqq
	kespSk/2/KJqvQWpeVK4zCjvx19G2yavy+KW+r/jrV9H+kGuGX3JBRdYLtclH7mAipUnQSb2deMDQ
	htvZTxBNWCSBP9AaXSDBV0TT7J83rqW7BoA60nBD1BiYNP98r7yeOdqFiejYPllgwmh6LNxZh5pL1
	HfFZrhGsrmBo1sdxGYYgsqQbGk/NFPz7i8RMj7jiIk5fTD7H1YJjuZxEUhnnmGjkcCDHWnuGYhhqL
	fEpJle3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKaR-00000009dKC-0wX6;
	Wed, 28 Feb 2024 14:07:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKaO-00000009dJk-1JVG
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 14:07:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08EDBCE1AA5;
	Wed, 28 Feb 2024 14:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A13C433C7;
	Wed, 28 Feb 2024 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709129221;
	bh=LLiUQxAIFIKWPBJQ3sMl02IvWthafFFY0702VaoxBZE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=B+dkZJ2XP66+zwsgVIjdTyOx2BR0EMp3xxQNd3yCo7pisfBPRjH8da1zSTYuqDfBz
	 KH0j6CNTkvBA1YR64Yr+TmG1mD5zT9VUGCf78K7vFRBMPByFFzzRCFr9W69PXzIuHh
	 6quCqIKz9H1xjgxtQLYjQ2C4mjUmIxNCBpFR7QTIpVBk3ow5DxofSHjrhujnXJ1AA2
	 HQrDMwUKahzyHJbfSbeFnyoa7NLpisoQC7EaLbzyF6IOzp1KLB3gIWUI+iIh+aH7dc
	 5lA8zuBUEMH0xyx09y1Kok5foyMeVRndNNgzbyMJofA0ruuDp5wTt+4kks9N2j+o59
	 F3bxOoIr1fktA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: decrease MHI channel buffer length to 8KB
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240223053111.29170-1-quic_bqiang@quicinc.com>
References: <20240223053111.29170-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170912921854.3989537.5989822587227176426.kvalo@kernel.org>
Date: Wed, 28 Feb 2024 14:07:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_060704_872069_278A1CBC 
X-CRM114-Status: UNSURE (   9.64  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently buf_len field of ath11k_mhi_config_qca6390 is assigned
> with 0, making MHI use a default size, 64KB, to allocate channel
> buffers. This is likely to fail in some scenarios where system
> memory is highly fragmented and memory compaction or reclaim is
> not allowed.
> 
> There is a fail report which is caused by it:
> kworker/u32:45: page allocation failure: order:4, mode:0x40c00(GFP_NOIO|__GFP_COMP), nodemask=(null),cpuset=/,mems_allowed=0
> CPU: 0 PID: 19318 Comm: kworker/u32:45 Not tainted 6.8.0-rc3-1.gae4495f-default #1 openSUSE Tumbleweed (unreleased) 493b6d5b382c603654d7a81fc3c144d59a1dfceb
> Workqueue: events_unbound async_run_entry_fn
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x47/0x60
>  warn_alloc+0x13a/0x1b0
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? __alloc_pages_direct_compact+0xab/0x210
>  __alloc_pages_slowpath.constprop.0+0xd3e/0xda0
>  __alloc_pages+0x32d/0x350
>  ? mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  __kmalloc_large_node+0x72/0x110
>  __kmalloc+0x37c/0x480
>  ? mhi_map_single_no_bb+0x77/0xf0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  ? mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  __mhi_prepare_for_transfer+0x44/0x80 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  ? __pfx_____mhi_prepare_for_transfer+0x10/0x10 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  device_for_each_child+0x5c/0xa0
>  ? __pfx_pci_pm_resume+0x10/0x10
>  ath11k_core_resume+0x65/0x100 [ath11k a5094e22d7223135c40d93c8f5321cf09fd85e4e]
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ath11k_pci_pm_resume+0x32/0x60 [ath11k_pci 830b7bfc3ea80ebef32e563cafe2cb55e9cc73ec]
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  dpm_run_callback+0x8c/0x1e0
>  device_resume+0x104/0x340
>  ? __pfx_dpm_watchdog_handler+0x10/0x10
>  async_resume+0x1d/0x30
>  async_run_entry_fn+0x32/0x120
>  process_one_work+0x168/0x330
>  worker_thread+0x2f5/0x410
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0xe8/0x120
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x34/0x50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>
> 
> Actually those buffers are used only by QMI target -> host communication.
> And for WCN6855 and QCA6390, the largest packet size for that is less
> than 6KB. So change buf_len field to 8KB, which results in order 1
> allocation if page size is 4KB. In this way, we can at least save some
> memory, and as well as decrease the possibility of allocation failure
> in those scenarios.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Reported-by: Vlastimil Babka <vbabka@suse.cz>
> Closes: https://lore.kernel.org/ath11k/96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1cca1bddf9ef wifi: ath11k: decrease MHI channel buffer length to 8KB

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240223053111.29170-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


