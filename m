Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579F1C6FA8B
	for <ath11k@archiver.kernel.org>; Thu, 22 Sep 2022 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fp6zd+OrsNySK70C/NkHA5+6hz8/+kmPlzM4DdtiK74=; b=SIsH8r/3j88sq+
	ZWERIcg62d4KZWFOvCHw2Hz3FxknaV0hbFynVaSdlQSkeoOy5dow4rKD1CZEaLdBjb0IfxYboG/+b
	U2csT6UMkdkhCAGZLFaLYH32yjdVIN0lHQa7TfQWR5YHex3RdmTqtMBOhXs4CtJfSY0X1dS5ubpyl
	hvoJHALgj3wTwhW+8eU4hZjB9YtbGRhYbuB9PKABpzHBGT8gL8qu7CVkHd6Gt6tpLBJXVW7jQQcdU
	YFUiUQYJe9XWTvqrm4OWFM3dEn8Yee8uQuBcaRI8pNHWyOCsqgwfjz9ASxNatXuJT5XzLlXBPJpg+
	VUQnFTxXLrzGvmxMGn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHSi-00E715-JM; Thu, 22 Sep 2022 08:21:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHRT-00E6Qb-9F
	for ath11k@lists.infradead.org; Thu, 22 Sep 2022 08:20:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80AE263468;
	Thu, 22 Sep 2022 08:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11109C433D7;
	Thu, 22 Sep 2022 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663834817;
	bh=/7gUoLzauu+dmK9A1PFDAC5/NoEv2CimpEi0k4Q2w10=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tvAyBqG1BzAru48WoiiWLvw8e5KaSSfW7wA/Sc36ujetVROq+7eEZrpjrmR/F39Fe
	 VPAM1Lk0hAVsdnwQYYAT8rzB+cJl5m4icRVnrw5ae5ek6iulTHJQClslGyV34+Acbo
	 qKlD4ELpiN1eg2ncnuioZElfbBZXLyRhRPOh7e9iF/pfHSR9ir/Nau88oPvGnnjBV3
	 6ldTwoTwjNG34JBUkir+uQqIwrbwNY6EGhyY7N/HifdhPfpaStQaKw2sWykbWmN5u2
	 SvZccwvRUu+/En3huK1PcdN97UKqZbgki2xrumnu/ZLSndyhTN0ftaDedvZpvf9GQv
	 zW8ZQjqfzMjzw==
From: Kalle Valo <kvalo@kernel.org>
To: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: add wmi ctrl path stats
References: <1654176800-29003-1-git-send-email-quic_tmariyap@quicinc.com>
	<165424060628.24941.10656719779515709897.kvalo@kernel.org>
	<87czfqnojt.fsf@kernel.org>
Date: Thu, 22 Sep 2022 11:20:14 +0300
In-Reply-To: <87czfqnojt.fsf@kernel.org> (Kalle Valo's message of "Fri, 03 Jun
	2022 11:23:18 +0300")
Message-ID: <87tu4z6csh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_012019_465014_4DF87C90 
X-CRM114-Status: GOOD (  13.07  )
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

> Kalle Valo <kvalo@kernel.org> writes:
>
>> Thiraviyam Mariyappan <quic_tmariyap@quicinc.com> wrote:
>>
>>> Currently, ath11k HTT debugfs uses the HTT interface to send stats request
>>> to target and response from target. Here HTT interface already overloaded
>>> with the data path stats. To reduce the load from HTT, using WMI interface
>>> to print the control path stats. This patch come up with framework for
>>> control path stats using wmi interface.
>>> For now, this framework supports PDEV_STAT and further stats will be
>>> added.
>>> 
>>> WMI control path stats command and results are below:
>>> echo <stats_id> <action> >
>>>         sys/kernel/debug/ieee80211/phy3/netdev\:wlan3/wmi_ctrl_stats
>>> cat sys/kernel/debug/ieee80211/phy3/netdev\:wlan3/wmi_ctrl_stats
>>> stats_id:
>>> 1 -> WMI_REQ_CTRL_PATH_PDEV_STATS
>>> action:
>>> 1 -> stats get
>>> 2 -> stats reset
>>> 
>>> WMI_CTRL_PATH_PDEV_STATS:
>>> req_id = 26
>>> fw_tx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:109, 6:0, 7:0, 8:344, ...
>>> fw_rx_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, ...
>>> scan_fail_dfs_violation_time_ms = 0
>>> nol_chk_fail_last_chan_freq = 0
>>> nol_chk_fail_time_stamp_ms = 0
>>> tot_peer_create_cnt = 2
>>> tot_peer_del_cnt = 1
>>> tot_peer_del_resp_cnt = 1
>>> vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt = 0
>>> 
>>> Tested-on: WLAN.HK.2.5.0.1-00517-QCAHKSWPL_SILICONZ-1
>>> 
>>> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> This added new warnings:
>>
>> drivers/net/wireless/ath/ath11k/debugfs.c:1600: line length of 92 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/debugfs.c:1666: line length of 93 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/wmi.c:2702: line length of 94 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/wmi.c:2703: line length of 97 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/wmi.c:7037: line length of 97 exceeds 90 columns
>> drivers/net/wireless/ath/ath11k/wmi.c:7085: line length of 97 exceeds 90 columns
>>
>> I fixed them in the pending branch. But in the future please use ath11k-check.
>>
>> There was one way too long field:
>>
>> 	u32 vdev_pause_fail_rt_to_sched_algo_fifo_full_cnt;
>>
>> I renamed that to:
>>
>> 	u32 vdev_pause_fail_rt;
>>
>> In ath11k_wmi_send_wmi_ctrl_stats_cmd() the error handling was unnecessarily
>> using else branch which caused long lines, I fixed that by avoiding else
>> branches.
>>
>> Also I saw some other things, like calling kzalloc() in variable declarations,
>> but I will look at them in detail later.
>>
>> Here's what I did now:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=28bc80a6a9c675fdc7003934a9493d9e95570f5f
>
> And in my regression testing with WCN6855 I see new warnings:
>
> [ 422.555328] debugfs: File 'wmi_ctrl_stats' in directory
> 'netdev:wlan0' already present!

For the archives, here's a link to the commit in the pending branch with
my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-deferred&id=4f8f38d0c5b752a7d4bacf4f099915a7b705562b

I'll drop this now from my queue.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
