Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C27C54EE9
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sRvBx3Olqcj/gOTsZxzK5ohXELbua2H581dOVWc8qs=; b=Npcr7bH2ivu/9X
	RTHwiEjdXgd8bGeNf7S2BTxcq1v8ExGPr86evFDkA8gg0AEbxX+Ht0e4yvOa10rxUpjFZIuRCzyJC
	PWIeIOEO1pvCvWEBpxrcTSm5uur/eHLSa+wdqV4x0Ab/NQgdpMIg/st+0LKBBmSeXRnnDkMUEP5LM
	aK7fHPCGGYr597CWpddSg08R4vySgUJ9RVPLAJuoqEMqmksz+zqsdsjbZi0aVnhhLlIyvY79LID6T
	rDvfXyarDLjXbeCInF42LXs15urFGPLCHH6NP0ZEbqBYrZAdTeHfUnPikCK/aGGW7dWPKx3NoHK4A
	8nMyoUpmNKtgh/TJy5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6ER-004rjP-CO; Fri, 02 Sep 2022 12:57:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU65z-004jiv-EB
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 12:48:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9115DB82A94;
	Fri,  2 Sep 2022 12:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972F0C433C1;
	Fri,  2 Sep 2022 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662122904;
	bh=X7k9u03NrCRVi1tPAxl93m0OI4CnrSnokeidvxHnYzI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KsJay/KZ77dM8LXcQJjVxL3Y4YHQQdGGUF+k3YBLnF4MZMoCloBCBRvznOcGQaNg+
	 Ob3UIyj+/GDKem869n+lS0wiZnKoD+pCoGbqLhwvldtSZV8mGc8CPtUXtqkYNwoDwH
	 iJcyt4a9XjxPFhgH1HzWl/9xEPIHqAIuXkhM7NZc9k1hTIOs2VQzEFyVoNr41yOpa0
	 9XQSbT02cTOTt3wtjCLAhImcM+RCTENCKJPDfra1UALdbMfydFCYuxgpq2VU5eHEmE
	 +CNpE321HzAdIPAV7dVlsug6BS4rqE1PgHx9+zxZ8diZx9tM15DEujanvu+uHaOc6/
	 xI/2P6tNNTDRA==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] ath11k: Enable threaded NAPI on WCN6750
References: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
	<20220720135113.15755-2-quic_mpubbise@quicinc.com>
Date: Fri, 02 Sep 2022 15:48:19 +0300
In-Reply-To: <20220720135113.15755-2-quic_mpubbise@quicinc.com> (Manikanta
	Pubbisetty's message of "Wed, 20 Jul 2022 19:21:11 +0530")
Message-ID: <87czceaqng.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_054827_822557_0C089DD9 
X-CRM114-Status: GOOD (  22.48  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> Enable threaded NAPI on WCN6750. Unlike traditional NAPI poll which
> runs in softirq context and on the core which scheduled the NAPI,
> threaded NAPI makes use of kernel threads which are under direct
> control of the scheduler and helps in balancing the NAPI processing
> load across multiple CPUs thereby improving throughput.
>
> In the case of WCN6750, enabling threaded NAPI has improved
> 160 MHz RX throughput by nearly 400 Mbps. This should give similar
> gains for other ath11k devices as well, therefore enable threaded
> NAPI on all other devices.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c  | 1 +
>  drivers/net/wireless/ath/ath11k/pcic.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index d7d33d5cdfc5..e44e2f29a88f 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -314,6 +314,7 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
>  		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
>  
>  		if (!irq_grp->napi_enabled) {
> +			dev_set_threaded(&irq_grp->napi_ndev, true);
>  			napi_enable(&irq_grp->napi);
>  			irq_grp->napi_enabled = true;
>  		}
> diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
> index cf12b98c480d..c703db19de51 100644
> --- a/drivers/net/wireless/ath/ath11k/pcic.c
> +++ b/drivers/net/wireless/ath/ath11k/pcic.c
> @@ -440,6 +440,7 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
>  		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
>  
>  		if (!irq_grp->napi_enabled) {
> +			dev_set_threaded(&irq_grp->napi_ndev, true);
>  			napi_enable(&irq_grp->napi);
>  			irq_grp->napi_enabled = true;
>  		}

The commit log claims that this enabled _only_ on WCN6750 but aren't we
enabling it on all ath11k hardware, or am I missing something? I admit I
didn't check this very carefully.

(reads the commit log one more time)

Ah, in the last sentence you mention that it's enabled on all hardware.
That's quite easy to miss and the commit log is quite misleading, please
emphasise already in the title and the first sentence that this is for
all hardware.

Also more testing would be nice. Enabling something like this with
testing only on one hardware family (WCN7850) can be risky. I always get
warm fuzzy feelings if a patch is tested with all three hardware
families we currently support:

* IPQ8074 etc
* QCA6390 etc
* WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
