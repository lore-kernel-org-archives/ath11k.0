Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602DBE7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxH0eZ9LNHDPGfk3qaAm4q3xcGm8b8egpk/kZ4q87u0=; b=kPTVm7lugZQQHMKdTi2DKrWs0g
	98El0i24BbVK7HOVwIMZb97QamcT0DxKCRtLmOY6pITssQGuzS0Phm55KjrRbhTMeQE4I9VvT9ZWY
	VGGMLuDWTS76emnu0AirUyqt3jbczhrHOisLeae6uWcGLvwr4QdT4ZlUzPuC35VK+of9CMATOFJbn
	pl4ttYfnwbuEXdpe5A9OfpKHfJDrlCzOMW5KLlp3wfzhtmHpdDhqMaIdqGMWktTmJUxyJPJ+yg6qb
	zgX3pbCNkj6c9EOoo1MS62zVxXlmA8AoA16evG+b95/l79HLsEfER21fdEyK1ZauJq7TQqXE1gF8m
	K3dBpZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjqq-00000000ZHW-2uVf;
	Thu, 12 Dec 2024 14:07:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjqn-00000000ZHA-418m
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 14:07:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1201E5C579D;
	Thu, 12 Dec 2024 14:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA78C4CECE;
	Thu, 12 Dec 2024 14:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734012453;
	bh=eyznZ2mkLy7ZoKxsgj/okX7js0JkRxEsD12qrlawO5E=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Dij1jZYPa+HRpr4w2vrwGi333lyWewebepgZTfUfOSF3UAhVlCf8zvSSj1PQrTt68
	 g/TMk1YidH56X1oZr4LrZYAT9/3jWtAz+bXZoIfo6Lkhc+ZNWnjsMWjhQ4jh03fTUD
	 YcQOwMG9rqCSMDJI5vI0Y2mtw8hbRWrQ5hU1kHv/NMBl/mwTiZTS3A9qiPBKDazY2i
	 djVV5iZ9hvxl+ASCa3nzZka5dLuR8sjwykJDA1CyiyH2sp6KvpdrxFa7IgcVmHecl7
	 RIDe5xGmpyoIDici4vu8DTQY5ECDWOX8s4LTsZ3reDdfax7yVKVvrDJSWrcyDtBdbx
	 dMtbh80V3Dl2w==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] wifi: ath11k: move update channel list to worker
 for wait flag
References: <20241129070714.226-1-quic_kangyang@quicinc.com>
	<20241129070714.226-3-quic_kangyang@quicinc.com>
Date: Thu, 12 Dec 2024 16:07:30 +0200
In-Reply-To: <20241129070714.226-3-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Fri, 29 Nov 2024 15:07:14 +0800")
Message-ID: <87y10lngf1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_060734_079327_F7200EF6 
X-CRM114-Status: GOOD (  23.11  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> From: Wen Gong <quic_wgong@quicinc.com>
>
> When wait flag is set for ath11k_reg_update_chan_list(), it will wait
> the completion of 11d/hw scan if 11d/hw scan is running.
>
> With the previous patch "wifi: ath11k: move update channel list from
> update reg worker to reg notifier", ath11k_reg_update_chan_list() will
> be called when reg_work is running. The global lock rtnl_lock will be
> held by reg_work in the meantime. If the wait_for_completion_timeout()
> is called due to 11d/hw scan is running, the occupation time of
> rtnl_lock will increase. This will increase blocking time for other
> threads if they want to use rtnl_lock.
>
> Move update channel list operation in ath11k_reg_update_chan_list() to
> a new worker, then the wait of completion of 11d/hw scan will not
> happen in reg_work and not increase the occupation time of the rtnl_lock.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Co-developed-by: Kang Yang <quic_kangyang@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

Same here, I think the commit message should be more or less rewritten.

> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -743,6 +743,10 @@ struct ath11k {
>  	struct completion bss_survey_done;
>  
>  	struct work_struct regd_update_work;
> +	struct work_struct channel_update_work;
> +	struct list_head channel_update_queue;
> +	/* protects channel_update_queue data */
> +	spinlock_t channel_update_lock;

Do you really need a new lock? Why not use data_lock?

> @@ -6318,6 +6320,15 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw, bool suspend)
>  	}
>  	spin_unlock_bh(&ar->data_lock);
>  
> +	spin_lock_bh(&ar->channel_update_lock);

Empty line here, please.

> +	while ((params = list_first_entry_or_null(&ar->channel_update_queue,
> +						  struct scan_chan_list_params,
> +						  list))) {
> +		list_del(&params->list);
> +		kfree(params);
> +	}

Here also empty line.

> +	spin_unlock_bh(&ar->channel_update_lock);
> +
>  	rcu_assign_pointer(ar->ab->pdevs_active[ar->pdev_idx], NULL);
>  
>  	synchronize_rcu();

[...]

> +void ath11k_regd_update_chan_list_work(struct work_struct *work)
> +{
> +	struct ath11k *ar = container_of(work, struct ath11k,
> +					 channel_update_work);
> +	struct scan_chan_list_params *params;
> +	struct list_head local_update_list;
> +	int left;
> +
> +	INIT_LIST_HEAD(&local_update_list);
> +
> +	spin_lock_bh(&ar->channel_update_lock);
> +	while ((params = list_first_entry_or_null(&ar->channel_update_queue,
> +						  struct scan_chan_list_params,
> +						  list))) {
> +		list_del(&params->list);
> +		list_add_tail(&params->list, &local_update_list);
> +	}
> +	spin_unlock_bh(&ar->channel_update_lock);

What about list_splice_tail_init() or similar?

> +
> +	while ((params = list_first_entry_or_null(&local_update_list,
> +						  struct scan_chan_list_params,
> +						  list))) {
> +		if (ar->state_11d != ATH11K_11D_IDLE) {
> +			left = wait_for_completion_timeout(&ar->completed_11d_scan,
> +							   ATH11K_SCAN_TIMEOUT_HZ);
> +			if (!left) {
> +				ath11k_dbg(ar->ab, ATH11K_DBG_REG,
> +					   "failed to receive 11d scan complete: timed out\n");
> +				ar->state_11d = ATH11K_11D_IDLE;
> +			}

Empty line here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

