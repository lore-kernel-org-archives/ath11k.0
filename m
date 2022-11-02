Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C159CC4332F
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgUM1FnGYnCyuG8YFSCMlGaDcuQpWBtxEceMr5JpiKk=; b=NF+a8Thp7kdHax
	eNCCV2nxGfmnz4Nap84hLdKm0E9sk6PNAV3vm+TjNHhUszDZ8y2JQMs8sMZG6YjB3Kvhw+DWYU7Db
	3ndfA31Y9GP2YCMJOC9MnwixMqnZvLq9uIMUw1aDyTKTC9HrqMXMiN8UsADpFtcCbM4qgGrM+qBP0
	ufjVN3Jf4hATnbsX96wu0aqi1j8N1PCupkf+mBwVORsDHV7XnS2NewogcBJ5/GWssD5lZo1Ui3GlN
	Xu2VbTpPqP1w8yTcpkXION4X495sbvlZw32PjMIqZWwTdTa8dkMp5E3D5V4BMLEadpLXBMyAxvk5Q
	iEHz4zrifXVzaxc+JMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHRS-00CW1r-7T; Wed, 02 Nov 2022 17:22:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHRP-00CW0b-PM
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 17:22:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3837261AC9
	for <ath11k@lists.infradead.org>; Wed,  2 Nov 2022 17:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E57C433C1;
	Wed,  2 Nov 2022 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667409734;
	bh=IL/3iQLa6R8xJ383aPHlvPg6a1VpYruKDC3i+uDeEUA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PvjaCCZ9ByL/2YsZz6wsiYICoRVBLj/zaoUbT7O2MDrjbzr7EDoDbG/HWqJNrzTWP
	 Ku0kDCNiXANx8DF1e/iISzj8YRxMIheCdFwp7GnjYVP6kVy3EVzan33RBM85GVYakI
	 nT+6et5FtFDva0FShojOtX2789gJTHR+vdz3xmGBviTtlxkBULwzC+Ec0aeRz0iC9H
	 YcpHsafFeXFS4wWx6AF8LdwC/BmsJwf/weohyFDobvLiR4No/J8FopIm/u5CWmsP8S
	 NgYfS1QKrynLHxldS27gjZdwN0reMJRaf6YkNEzcBIJsrWCayDfNtfy4tdQJiR52BE
	 r2KsdAZO51ilQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v6.1] wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()
References: <20221102114803.13485-1-kvalo@kernel.org>
Date: Wed, 02 Nov 2022 19:22:09 +0200
In-Reply-To: <20221102114803.13485-1-kvalo@kernel.org> (Kalle Valo's message
	of "Wed, 2 Nov 2022 13:48:03 +0200")
Message-ID: <87leotff0e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_102215_918968_D577D4BA 
X-CRM114-Status: GOOD (  19.07  )
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

Kalle Valo <kvalo@kernel.org> writes:

> From: Wen Gong <quic_wgong@quicinc.com>
>
> (cherry picked from commit d99884ad9e3673a12879bc2830f6e5a66cccbd78 in ath-next
> as users are seeing this bug more now, also cc stable)
>
> Running this test in a loop it is easy to reproduce an rtnl deadlock:
>
> iw reg set FI
> ifconfig wlan0 down
>
> What happens is that thread A (workqueue) tries to update the regulatory:
>
>     try to acquire the rtnl_lock of ar->regd_update_work
>
>     rtnl_lock+0x17/0x20
>     ath11k_regd_update+0x15a/0x260 [ath11k]
>     ath11k_regd_update_work+0x15/0x20 [ath11k]
>     process_one_work+0x228/0x670
>     worker_thread+0x4d/0x440
>     kthread+0x16d/0x1b0
>     ret_from_fork+0x22/0x30
>
> And thread B (ifconfig) tries to stop the interface:
>
>     try to cancel_work_sync(&ar->regd_update_work) in ath11k_mac_op_stop().
>     ifconfig  3109 [003]  2414.232506: probe:
>
>     ath11k_mac_op_stop: (ffffffffc14187a0)
>     drv_stop+0x30 ([mac80211])
>     ieee80211_do_stop+0x5d2 ([mac80211])
>     ieee80211_stop+0x3e ([mac80211])
>     __dev_close_many+0x9e ([kernel.kallsyms])
>     __dev_change_flags+0xbe ([kernel.kallsyms])
>     dev_change_flags+0x23 ([kernel.kallsyms])
>     devinet_ioctl+0x5e3 ([kernel.kallsyms])
>     inet_ioctl+0x197 ([kernel.kallsyms])
>     sock_do_ioctl+0x4d ([kernel.kallsyms])
>     sock_ioctl+0x264 ([kernel.kallsyms])
>     __x64_sys_ioctl+0x92 ([kernel.kallsyms])
>     do_syscall_64+0x3a ([kernel.kallsyms])
>     entry_SYSCALL_64_after_hwframe+0x63 ([kernel.kallsyms])
>     __GI___ioctl+0x7 (/lib/x86_64-linux-gnu/libc-2.23.so)
>
> The sequence of deadlock is:
>
> 1. Thread B calls rtnl_lock().
>
> 2. Thread A starts to run and calls rtnl_lock() from within
>    ath11k_regd_update_work(), then enters wait state because the lock is owned by
>    thread B.
>
> 3. Thread B continues to run and tries to call
>    cancel_work_sync(&ar->regd_update_work), but thread A is in
>    ath11k_regd_update_work() waiting for rtnl_lock(). So cancel_work_sync()
>    forever waits for ath11k_regd_update_work() to finish and we have a deadlock.
>
> Fix this by switching from using regulatory_set_wiphy_regd_sync() to
> regulatory_set_wiphy_regd(). Now cfg80211 will schedule another workqueue which
> handles the locking on it's own. So the ath11k workqueue can simply exit without
> taking any locks, avoiding the deadlock.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> [kvalo: improve commit log]
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Manually applied to ath-current branch of ath.git.

f45cb6b29cd3 wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
