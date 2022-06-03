Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63AEC43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 07:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5b4351ghwYR2j5AhQqHHUKqa6ubCm2E516V3thHwqA=; b=eaeGFwJCdH7lN2
	3RpY75n7iMMe3WGF4UDAnWSW+HC70c2R624aiSI40Tzkvu3yhc5oBbvhpS9IcNumOH33FUzlgTgzy
	hm0oVCVdkf9F3QuQ1RWiGIuusrsP2OH4IITfQuLjY2AJrZknHXmDnlZWok78W8cky3GgRsGZa+LTA
	UL8MDcApn28BRs6qYYjGIFVKOs9FoOKWDh0kp51RHHW2FNHA8D4KrVP5HBC3WKJPkjDBJfHY3Q8mY
	qoEACB+mqNkzaFZuoZcN4+m52ksQdzYYNBRoMVhE1xWvNR8SixMTKiXB6mZCGXNbhR+BmIgjKkQH2
	3PmvkRnYp/bZmyJem6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx1YE-006Fvm-L9; Fri, 03 Jun 2022 07:16:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx1YC-006Fuz-5G
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 07:16:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82068617FF;
	Fri,  3 Jun 2022 07:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023F3C385A9;
	Fri,  3 Jun 2022 07:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654240610;
	bh=FlVVz2JA4/jKmb9ZJzSNebZGnixWxPza/BZ9EhqFGKg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=s5eNDre4JZr8/w5WerNGBF4XviuxhI3bk2P11xW8yKOVxXN5boJFPVa/eWIYRJw6j
	 Ytu+DQkEIKCDYAcs6NrUtFdkInKO7V2iHzjOj2ZYcXtxyGO0AMUsC72pc9dAY+SIsS
	 W+ssFF0JVj4rxFAB2sd2tNAwdH8wWLqSZdk1KT+13fbt2p9zDjIVD35nTr+7L+E2Pf
	 BWf+fosertxGXDHMdNmxpuec08XwGd+I7duiPoOdR9B05B1N0Tw1ePMmNRUOpwTVKV
	 s/3MwoxotjIrlbZLnz+W81IASkZN3HyvPDC56zKFkYNzdlGzOLsqmZE5RdRhEMQWl3
	 JJl38iwt+qsMg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add wmi ctrl path stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1654176800-29003-1-git-send-email-quic_tmariyap@quicinc.com>
References: <1654176800-29003-1-git-send-email-quic_tmariyap@quicinc.com>
To: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165424060628.24941.10656719779515709897.kvalo@kernel.org>
Date: Fri,  3 Jun 2022 07:16:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_001652_325469_2D9EB943 
X-CRM114-Status: GOOD (  10.34  )
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

Thiraviyam Mariyappan <quic_tmariyap@quicinc.com> wrote:

> Currently, ath11k HTT debugfs uses the HTT interface to send stats request
> to target and response from target. Here HTT interface already overloaded
> with the data path stats. To reduce the load from HTT, using WMI interface
> to print the control path stats. This patch come up with framework for
> control path stats using wmi interface.
> For now, this framework supports PDEV_STAT and further stats will be
> added.
> 
> WMI control path stats command and results are below:
> echo <stats_id> <action> >
>         sys/kernel/debug/ieee80211/phy3/netdev\:wlan3/wmi_ctrl_stats
> cat sys/kernel/debug/ieee80211/phy3/netdev\:wlan3/wmi_ctrl_stats
> stats_id:
> 1 -> WMI_REQ_CTRL_PATH_PDEV_STATS
> action:
> 1 -> stats get
> 2 -> stats reset
> 
> WMI_CTRL_PATH_PDEV_STATS:
> req_id = 26
> fw_tx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:109, 6:0, 7:0, 8:344, ...
> fw_rx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, ...
> scan_fail_dfs_violation_time_ms = 0
> nol_chk_fail_last_chan_freq = 0
> nol_chk_fail_time_stamp_ms = 0
> tot_peer_create_cnt = 2
> tot_peer_del_cnt = 1
> tot_peer_del_resp_cnt = 1
> vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt = 0
> 
> Tested-on: WLAN.HK.2.5.0.1-00517-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This added new warnings:

drivers/net/wireless/ath/ath11k/debugfs.c:1600: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs.c:1666: line length of 93 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:2702: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:2703: line length of 97 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:7037: line length of 97 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:7085: line length of 97 exceeds 90 columns

I fixed them in the pending branch. But in the future please use ath11k-check.

There was one way too long field:

	u32 vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt;

I renamed that to:

	u32 vdev_pause_fail_rt;

In ath11k_wmi_send_wmi_ctrl_stats_cmd() the error handling was unnecessarily
using else branch which caused long lines, I fixed that by avoiding else
branches.

Also I saw some other things, like calling kzalloc() in variable declarations,
but I will look at them in detail later.

Here's what I did now:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=28bc80a6a9c675fdc7003934a9493d9e95570f5f

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1654176800-29003-1-git-send-email-quic_tmariyap@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
