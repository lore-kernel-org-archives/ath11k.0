Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8F6C433FE
	for <ath11k@archiver.kernel.org>; Mon, 10 Oct 2022 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0fUygDDrrDEC4YWUaBlYZFAtvYfzU4MtV/uRyJAmmQ=; b=FSlGktbSy2RrvC
	a0p+yvHw7bJzYd5Xl7wx+1IJVelt9YfRs6ZwlvAIz43lX2FtlICqDNobxkGySVXCaf3VLAz2r/FiZ
	DMnIcfFxsMWXOb1yN01uU7rMJz80rRxwSXA4ezXJrw1ZIEKNTCTROoA0gOBU2tM+Iw0zs7j8QuhEK
	QtT722wdTC40el2PCTwEWPN3J42kcBfMGMSUG7jNZwp6apC8s/lwoS+GxBZ5XZFouFuBAhiRIknlG
	/v9Y80sJMlqRcV9muCO3LIc6O6f2cHqoKMOkdbAW3jigucy0m1Tib8wLcSiWghNv4B7H4cGGTUNND
	r6roJ2SFeQehUlL8k6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpFG-000DmS-GM; Mon, 10 Oct 2022 09:38:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpFD-000DlP-Te
	for ath11k@lists.infradead.org; Mon, 10 Oct 2022 09:38:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3C7360EC6
	for <ath11k@lists.infradead.org>; Mon, 10 Oct 2022 09:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7CBC433D7;
	Mon, 10 Oct 2022 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665394721;
	bh=8KZLPndei0SJtrdqxp0cnPnc7Efw0GxPCNx9YT/+z1o=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=q+TJu8yc33XhXodU074NkxAceGcsZmT0AnyKSimMaAV7gsE6RMUI9zr5v7V+R5t9W
	 HVKGmcfCjHp26/kG1vSJO0jX2Mxx5fs+yboB8dGXdBHawHfwSMHziU0c+JLPqthZqC
	 NuU9UQLKZw5Hz1WQie27SRTM2BRL5ZxNMXiTvYIJcoI9w8ykDXZkcHzkEfFATgvW3a
	 EQMgSxtG9qXsudeKWRccnxBK9e+4RSV89Djk4OuEedAWURHkOrBVfvv2O24NMVl3sl
	 I73Q8MSEG04tXIX95NNKBv5daSdekfOk2SgUGrrg/y1g81IUrU6BB0FpGAt1ACrTZl
	 OtqYUORswol3g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: avoid deadlock during regulatory update in
 ath11k_regd_update()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221006151747.13757-1-kvalo@kernel.org>
References: <20221006151747.13757-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166539471639.12656.4045155375066520132.kvalo@kernel.org>
Date: Mon, 10 Oct 2022 09:38:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_023844_085072_D31ADC4C 
X-CRM114-Status: GOOD (  15.51  )
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
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> [kvalo: improve commit log]
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d99884ad9e36 wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221006151747.13757-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
