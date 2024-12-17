Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEB1E7717F
	for <ath11k@archiver.kernel.org>; Tue, 17 Dec 2024 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyXrmgqcogEQln9iS5HJ5qfVturYJU9CXItnIOyfttg=; b=Nw6GNB4krhNVf9FUZaSyXty79q
	sz4gFJekHiqpOWDQeC0r8mGodvNhvA7CmAHAbNJnuQTIlHR0jsppnf6D6sGFt26GHayB1yfVp+MUe
	mhbweJfYXjxCGs7vQmyhUT5kVl3nQAw47PXW9eACnd+hWxZn0+ScXY6L2ql+g63s7pm5+bAExO6en
	6ZJsugrd1FZna7g0oy5fv8XgvjqOjcNW40u8qPqmCrG/yK1NpAAuIRyvPaYP8C1KeUfbQACL6VSOa
	glGQ4Vf/Jz/Xfw8f81jB/xRqZAABHKrP8FwcR1bO/Z44fWCLg/A43+6na/jkAbbwPRDAd3J6zIhzR
	OtgRiJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYyE-0000000DqLy-3OAG;
	Tue, 17 Dec 2024 14:54:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYwk-0000000Dq1X-3Cdp
	for ath11k@lists.infradead.org;
	Tue, 17 Dec 2024 14:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45891A4016C;
	Tue, 17 Dec 2024 14:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD638C4CED4;
	Tue, 17 Dec 2024 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447193;
	bh=+F90y8yls9W+2OroXzCpT7EdDHjsL2jMmqwYVQ7bUCw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OuAZVrqJXJn9gY7aiJM1N53OFgO7gnCfUrxldRA4Xfs/4NDkEq5MwQt2Bir94mQs8
	 jAvqKz+cWBHpsEpDSVtSrw+NVnnVMkA2qTFTYxuHMZmWtT3rLaMGbRY5ufEAoonJr2
	 5bIOW3VoJvK95r1c66aRHG2XsKYZnEZT3plxm8p6NKsEhmmWT2MTXHqkJEa+4kTCBp
	 2Xb/NuUJzObkrpqTbbDW0tV0mcVd7989okmPt9WneX5zyL7pis86Cmx+hPwPpqiHVZ
	 OdH0hJ0DaOILF0TM4NOy/pzN6NDILo82AP4xmJYxcfLdTRFOeaTsu2/SNAPj9rfa5J
	 Lxwpw1yE9cNFw==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] wifi: ath11k: move update channel list to worker
 when wait flag is set
References: <20241213093909.629-1-quic_kangyang@quicinc.com>
	<20241213093909.629-3-quic_kangyang@quicinc.com>
Date: Tue, 17 Dec 2024 16:53:11 +0200
In-Reply-To: <20241213093909.629-3-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Fri, 13 Dec 2024 17:39:09 +0800")
Message-ID: <87bjxamkdk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_065314_928744_70806B0A 
X-CRM114-Status: GOOD (  19.04  )
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
> With previous patch "wifi: ath11k: move update channel list from update
> reg worker to reg notifier", ath11k_reg_update_chan_list() will be
> called during reg_process_self_managed_hint().
>
> reg_process_self_managed_hint() will hold rtnl_lock all the time.
> But ath11k_reg_update_chan_list() may increase the occupation time of
> rtnl_lock, because wait flag is set and wait_for_completion_timeout()
> will be called when 11d/hw scan is running.
>
> Should minimize the occupation time of rtnl_lock as much as possible.
>
> Move update channel list operation to a new worker, so that
> wait_for_completion_timeout() won't be called and will not increase the
> occupation time of rtnl_lock.

Maybe the last two paragraphs could be merged (and edited) like this:

We should minimize the occupation time of rtnl_lock as much as possible
to avoid interfering with rest of the system. So move the update channel
list operation to a new worker, so that wait_for_completion_timeout()
won't be called and will not increase the occupation time of rtnl_lock.

> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -685,7 +685,7 @@ struct ath11k {
>  	struct mutex conf_mutex;
>  	/* protects the radio specific data like debug stats, ppdu_stats_info stats,
>  	 * vdev_stop_status info, scan data, ath11k_sta info, ath11k_vif info,
> -	 * channel context data, survey info, test mode data.
> +	 * channel context data, survey info, test mode data, channel_update_queue.
>  	 */
>  	spinlock_t data_lock;

Usually is best to add a comment the data you are protecting, in this
case the new fields in struct ath11k.

> @@ -743,6 +743,8 @@ struct ath11k {
>  	struct completion bss_survey_done;
>  
>  	struct work_struct regd_update_work;
> +	struct work_struct channel_update_work;
> +	struct list_head channel_update_queue;

So here add '/* protected with data_lock */' or similar before channel_update_queue.

> @@ -231,8 +206,16 @@ int ath11k_reg_update_chan_list(struct ath11k *ar, bool wait)
>  		}
>  	}
>  
> -	ret = ath11k_wmi_send_scan_chan_list_cmd(ar, params);
> -	kfree(params);
> +	if (wait) {
> +		spin_lock_bh(&ar->data_lock);
> +		list_add_tail(&params->list, &ar->channel_update_queue);
> +		spin_unlock_bh(&ar->data_lock);
> +
> +		queue_work(ar->ab->workqueue, &ar->channel_update_work);
> +	} else {
> +		ret = ath11k_wmi_send_scan_chan_list_cmd(ar, params);
> +		kfree(params);
> +	}

You can avoid the else branch like this:

if (wait) {
	spin_lock_bh(&ar->data_lock);
	list_add_tail(&params->list, &ar->channel_update_queue);
	spin_unlock_bh(&ar->data_lock);

	queue_work(ar->ab->workqueue, &ar->channel_update_work);

        return 0;
}

ret = ath11k_wmi_send_scan_chan_list_cmd(ar, params);
kfree(params);

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

