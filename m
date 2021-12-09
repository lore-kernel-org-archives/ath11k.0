Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763D6C433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yujl9oWXhkUEBhpaQ4+dHkDnTQ6ylT8DSwA8R1h0MWs=; b=Eure5U7JJ1uUcH
	RtMlsZ5VJI9c+c2pPnuVvl7m2EB3UgFsJSHY+/4/9OLN2xMKRW8zOPq1kR6iaiteK9KigtOUn944t
	WMSiHq+Z9jbyeVM5MfSgXDvY4kZTuGF+hb8X9jqxCMZBw0f1GpAiUX0CwTU2b1B7+HijVupZRpjkq
	CcIks3c3INLvBYGAgD+HNpK7GAmEj7hgGMFMOdm93rjEF63Czusl+EurqqVc33TJmz4tcJcqBtps4
	0jlhiMOYxpeSYfr6syrKHASolV7rxtb79yYg7QVfwyYBuJEdW1YxyaOb6p8S34yfb+hwo2lewdFBt
	ffIdwjqLMp3wrRKKmZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvL6K-00GUGQ-DP; Thu, 09 Dec 2021 15:12:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvL6H-00GUFe-HY
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 15:12:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AA64ECE267E;
 Thu,  9 Dec 2021 15:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435D7C341D3;
 Thu,  9 Dec 2021 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639062765;
 bh=Ay1H3UkuOG3XRGF9LlD5nYbVi0tr6vvRkKWIqwX7qDs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=BtPKqBqovhLSZqaKRWplYuFmNBfkkQhvChM6aVMKbNEWbZaEKtip4TCmmvpeudvOh
 Q7mUn620lNAsVSwPAXzPggIbFkSpg5umIZFZK87c2XAuVExrWxCpr/ccWf6ZWJCFqV
 J4//16qYH87kSWfkTVUd1Bna6aQq85GSfSKqL+ybnojBQmmrGqVioGV9K3ZFhURibo
 OBB6o0C6r9SVGqVFnAVdYqPm7SUpH6g6oe38lN/QGtn1OzkCj20oXARxrrzCq8O+Vk
 Oq+EjtT2xHKkGYANX13sJD6JJtnb2aVp1U638kOjd6VY0PLPAHxFnaoxTJ2XnGT72I
 HGDnsSKzd88vg==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 4/6] ath11k: purge rx pktlog when entering WoW
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-5-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 17:12:41 +0200
In-Reply-To: <20211011193750.4891-5-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:48 -0400")
Message-ID: <87v8zxzuae.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_071249_783943_14CE1E9B 
X-CRM114-Status: GOOD (  15.78  )
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

Carl Huang <cjhuang@codeaurora.org> writes:

> This change is to purge rx pktlog when entering WoW and reap
> the mon_status buffer to keep it empty. When leaving WoW, host
> restarts the reap timer. In WoW state, it's not allowed to feed
> into mon_status rings per firmware request.

"per firmware request" is not clear for me. Do you "per firmware team's
recommendation" or what?

> @@ -327,12 +327,7 @@ int ath11k_core_resume(struct ath11k_base *ab)
>  	ath11k_hif_ce_irq_enable(ab);
>  	ath11k_hif_irq_enable(ab);
>  
> -	ret = ath11k_dp_rx_pktlog_start(ab);
> -	if (ret) {
> -		ath11k_warn(ab, "failed to start rx pktlog during resume: %d\n",
> -			    ret);
> -		return ret;
> -	}
> +	ath11k_dp_rx_pktlog_start(ab);

Why remove error handling? We should always handle the errors.

>  
>  	ret = ath11k_wow_wakeup(ab);
>  	if (ret) {
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 6d769ba..ae6db5d 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -5105,13 +5105,11 @@ int ath11k_dp_rx_pdev_mon_detach(struct ath11k *ar)
>  	return 0;
>  }
>  
> -int ath11k_dp_rx_pktlog_start(struct ath11k_base *ab)
> +void ath11k_dp_rx_pktlog_start(struct ath11k_base *ab)
>  {
>  	/* start reap timer */
>  	mod_timer(&ab->mon_reap_timer,
>  		  jiffies + msecs_to_jiffies(ATH11K_MON_TIMER_INTERVAL));
> -
> -	return 0;
>  }

Ah, you remove it here as well. But for consistency it's better to have
this return an error code.

> @@ -640,6 +657,8 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
>  	ath11k_hif_ce_irq_enable(ar->ab);
>  	ath11k_hif_irq_enable(ar->ab);
>  
> +	ath11k_dp_rx_pktlog_start(ar->ab);

Error handling here as well, please.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
