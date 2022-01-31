Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC244C433F5
	for <ath11k@archiver.kernel.org>; Mon, 31 Jan 2022 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqrs1btLJT23Hl5caWqtvSDgvQlCPTlKg2vy9/kT+Mw=; b=oRRZv8iP8M9XMm
	nyZEFjilU2cB9j1QQ633kz5cNP8IKSmS88LpQmLZQqMcA4sByRFDmnPerzc8lDhs+ICl+gh2sxsQO
	42NZn6MSSq1JbbP4UnGsTYevAG+r8EJkIZDD72Pe9UbdE79ebZmw5x3/eqUMz2fQG27/1qT8ZIYc9
	J6Cfn8GKgIFK2l+OiVjqn7f2p4HCnNzI7mR5eLeG+CcS5ahbg7PWXJaQPaaVnitoqRFGkXlT4vYAa
	wsbzSk/F0o1ITCUiD/41TVCLcVk8Tn2ZQmCdx0hJLUI2d4xIlaa8IGO1M7OjnOWpiFzUznrOZU5Fc
	AsLE/SrEyHn+Uzj7jghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEXPa-009ZPL-4d; Mon, 31 Jan 2022 14:12:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEXPW-009ZOj-B4
 for ath11k@lists.infradead.org; Mon, 31 Jan 2022 14:12:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EDC88B829CA
 for <ath11k@lists.infradead.org>; Mon, 31 Jan 2022 14:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE839C340E8;
 Mon, 31 Jan 2022 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643638319;
 bh=YU7TaJqeauA937fSwiCYXYSI3m1ungNdIsl6bBrEflg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=EZI6WsS0nwKnrpfTa4eO96loijNkH+9seA0mI7wYWhl/4I86KkZwKwhc+X91/rr/+
 U60IrEKzefZTJfVb/GclMwGPKIoHjmbYv4+iGEM407M3hhXtWhFOW8Nr0eorzt2aTs
 bX/xwB0dVgejCkcWTWmpwsSMbrab9n2RlfFHgClC0uwN/6wAbh8sDr1mi9BrQLj7/N
 GCmzWkoSTAYf8K2QEU3aoNLVPY4dUZ9WaYjQUIi1mav20OZFjiXc3NDgGRlTismOS5
 80dGYyxudH2ZfRQJHaPB1F4R5guB47OfqEhzXaGyK13rEJRxCsvDUeU5WsAq0Fg8OE
 KJSmFyGqkQhnA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: pci: fix crash on suspend if board file is not
 found
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220127090117.2024-1-kvalo@kernel.org>
References: <20220127090117.2024-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164363831457.10147.8395289928134509530.kvalo@kernel.org>
Date: Mon, 31 Jan 2022 14:11:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_061202_699212_43B3D06F 
X-CRM114-Status: GOOD (  12.53  )
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

> Mario reported that the kernel was crashing on suspend if ath11k was not able
> to find a board file:
> 
> [  473.693286] PM: Suspending system (s2idle)
> [  473.693291] printk: Suspending console(s) (use no_console_suspend to debug)
> [  474.407787] BUG: unable to handle page fault for address: 0000000000002070
> [  474.407791] #PF: supervisor read access in kernel mode
> [  474.407794] #PF: error_code(0x0000) - not-present page
> [  474.407798] PGD 0 P4D 0
> [  474.407801] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  474.407805] CPU: 2 PID: 2350 Comm: kworker/u32:14 Tainted: G        W         5.16.0 #248
> [...]
> [  474.407868] Call Trace:
> [  474.407870]  <TASK>
> [  474.407874]  ? _raw_spin_lock_irqsave+0x2a/0x60
> [  474.407882]  ? lock_timer_base+0x72/0xa0
> [  474.407889]  ? _raw_spin_unlock_irqrestore+0x29/0x3d
> [  474.407892]  ? try_to_del_timer_sync+0x54/0x80
> [  474.407896]  ath11k_dp_rx_pktlog_stop+0x49/0xc0 [ath11k]
> [  474.407912]  ath11k_core_suspend+0x34/0x130 [ath11k]
> [  474.407923]  ath11k_pci_pm_suspend+0x1b/0x50 [ath11k_pci]
> [  474.407928]  pci_pm_suspend+0x7e/0x170
> [  474.407935]  ? pci_pm_freeze+0xc0/0xc0
> [  474.407939]  dpm_run_callback+0x4e/0x150
> [  474.407947]  __device_suspend+0x148/0x4c0
> [  474.407951]  async_suspend+0x20/0x90
> dmesg-efi-164255130401001:
> Oops#1 Part1
> [  474.407955]  async_run_entry_fn+0x33/0x120
> [  474.407959]  process_one_work+0x220/0x3f0
> [  474.407966]  worker_thread+0x4a/0x3d0
> [  474.407971]  kthread+0x17a/0x1a0
> [  474.407975]  ? process_one_work+0x3f0/0x3f0
> [  474.407979]  ? set_kthread_struct+0x40/0x40
> [  474.407983]  ret_from_fork+0x22/0x30
> [  474.407991]  </TASK>
> 
> The issue here is that board file loading happens after ath11k_pci_probe()
> succesfully returns (ath11k initialisation happends asynchronously) and the
> suspend handler is still enabled, of course failing as ath11k is not properly
> initialised. Fix this by checking ATH11K_FLAG_QMI_FAIL during both suspend and
> resume.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
> 
> Reported-by: Mario Limonciello <mario.limonciello@amd.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215504
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

b4f4c56459a5 ath11k: pci: fix crash on suspend if board file is not found
3df6d74aedfd ath11k: mhi: use mhi_sync_power_up()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220127090117.2024-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
