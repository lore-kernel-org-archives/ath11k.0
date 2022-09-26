Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1830C32771
	for <ath11k@archiver.kernel.org>; Mon, 26 Sep 2022 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tb8hx5fHYRcq14pUdzl/53M6otv/ZoEMHUcXqN+WCiE=; b=QBvC0xBRrcb7MW
	B6vmVJYPXuIjsZDQ7kw4NJRriPWY+Thd8gxYV4mQswqQpUE+WZDyhmxLK9Dv0NM2GvojKZ+3rvZaN
	3VLYF2C8hVB/ss2sj8z9bqECcyeXq3MUivDfiIuUsQUpncn1uARFojrE16qKWta1GBl4Z86Hzogh/
	4iUSL0hVcq8kogSt9uwGYnYUj5Qz2azTvFkCEjbuVkEsoi70kXF1/429ZQsqqJxlnBD3IkV1UB1Se
	vYv44RG63iHa5fbjZuAKsxo0Q/FJAfR/xBfAT99FoT5wJ60LDIs7j1lnaTr/J8ranuUJ1ofNhlhlt
	L19IMpAN+ZdPtkZBcNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockmy-003oOu-HL; Mon, 26 Sep 2022 09:52:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockby-003j5k-21
	for ath11k@lists.infradead.org; Mon, 26 Sep 2022 09:41:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55EF3B80835;
	Mon, 26 Sep 2022 09:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B46FC433D6;
	Mon, 26 Sep 2022 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664185271;
	bh=f00h5sF3WBB/NQzTissBhyroT5VCQxGpAmwnvW6QaiY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=QF2gy5Alv5ZmF3jltTiYGfeVLoCOTgWwzATe5Wk/eHec0TrBOpZu7pYkiU+d5pZry
	 GIXarnTuZllFT6U9P2b7NLh2hYxBtTPCnd//YiuHl4jrc3JdUcM21DotjVvMJ4ifbA
	 UT0l7LcoDk5kh+M6hp4ruZpOkwo/hy2UWhXl2Hoq1EZtDPYJRkNLcMkg9W3F6JllIV
	 ljtzYS1f/MlZyCCeMm2ImjyH5SbAnJnsT2gUvzRTRzvQp4gEYGXLSPoDJFTrbo+qP2
	 fVjCv4d06JAHphuChLBy4iMOvYF7dtTnGUnZIo99Ize/dUvLQdEc0JPs7krXphZdvP
	 IMrSR5aynYPGg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Fix deadlock during WoWLAN suspend
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220919021435.2459-1-quic_bqiang@quicinc.com>
References: <20220919021435.2459-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166418526848.13691.14908006715046928554.kvalo@kernel.org>
Date: Mon, 26 Sep 2022 09:41:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_024114_442533_964CCB3B 
X-CRM114-Status: GOOD (  11.01  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> We are seeing system hangs during WoWLAN suspend, and get below
> two stacks:
> 
> Stack1:
> [ffffb02cc1557b20] __schedule at ffffffff8bb10860
> [ffffb02cc1557ba8] schedule at ffffffff8bb10f24
> [ffffb02cc1557bb8] schedule_timeout at ffffffff8bb16d88
> [ffffb02cc1557c30] wait_for_completion at ffffffff8bb11778
> [ffffb02cc1557c78] __flush_work at ffffffff8b0b30cd
> [ffffb02cc1557cf0] __cancel_work_timer at ffffffff8b0b33ad
> [ffffb02cc1557d60] ath11k_mac_drain_tx at ffffffffc0c1f0ca [ath11k]
> [ffffb02cc1557d70] ath11k_wow_op_suspend at ffffffffc0c5201e [ath11k]
> [ffffb02cc1557da8] __ieee80211_suspend at ffffffffc11e2bd3 [mac80211]
> [ffffb02cc1557dd8] wiphy_suspend at ffffffffc0f901ac [cfg80211]
> [ffffb02cc1557e08] dpm_run_callback at ffffffff8b75118a
> [ffffb02cc1557e38] __device_suspend at ffffffff8b751630
> [ffffb02cc1557e70] async_suspend at ffffffff8b7519ea
> [ffffb02cc1557e88] async_run_entry_fn at ffffffff8b0bf4ce
> [ffffb02cc1557ea8] process_one_work at ffffffff8b0b1a24
> [ffffb02cc1557ee0] worker_thread at ffffffff8b0b1c4a
> [ffffb02cc1557f18] kthread at ffffffff8b0b9cb8
> [ffffb02cc1557f50] ret_from_fork at ffffffff8b001d32
> 
> Stack2:
> [ffffb02cc00b7d18] __schedule at ffffffff8bb10860
> [ffffb02cc00b7da0] schedule at ffffffff8bb10f24
> [ffffb02cc00b7db0] schedule_preempt_disabled at ffffffff8bb112b4
> [ffffb02cc00b7db8] __mutex_lock at ffffffff8bb127ea
> [ffffb02cc00b7e38] ath11k_mgmt_over_wmi_tx_work at ffffffffc0c1aa44 [ath11k]
> [ffffb02cc00b7ea8] process_one_work at ffffffff8b0b1a24
> [ffffb02cc00b7ee0] worker_thread at ffffffff8b0b1c4a
> [ffffb02cc00b7f18] kthread at ffffffff8b0b9cb8
> [ffffb02cc00b7f50] ret_from_fork at ffffffff8b001d32
> 
> From the first stack, ath11k_mac_drain_tx calls
> cancel_work_sync(&ar->wmi_mgmt_tx_work) and waits all packets to be sent
> out or dropped. However, we find from Stack2 that this work item is blocked
> because ar->conf_mutex is already held by ath11k_wow_op_suspend.
> 
> Fix this issue by moving ath11k_mac_wait_tx_complete to the start of
> ath11k_wow_op_suspend where ar->conf_mutex has not been acquired. And
> this change also makes the logic in ath11k_wow_op_suspend match the
> logic in ath11k_mac_op_start and ath11k_mac_op_stop.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d78c8b7131dc wifi: ath11k: Fix deadlock during WoWLAN suspend

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220919021435.2459-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
