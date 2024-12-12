Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF127E7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vk4RIbwnHYFgZStquE/igLiWSmA3b6Ej3U//obT2tCU=; b=RcqPgNv/t/8vdzoQ5ZOncbnzXi
	uLogQ19QHyzptCdbNI2bQSu43IGLHhrQsCynMrhgv1N3dXYSO2HN8FNZ93YqEsnpiDeCf/xPiwRl9
	FMYjXy8zX2X1CMz/itfZlwiv6+B30jmGQU7F0IpiNHT+C8FE5tWMryiHpymtwLLAjf01uh5rptHXd
	IG04NHzva9lYvP1a1i24vM+WcYkE65hToizN5jJslB9PSgMhEOU2ZL+gPPc4/w9SqcCoWB/LR6XG/
	Oa8UB0zZExeclNpAls4fDtnqdqZaEBmuiEOyo2NKMkslkRv9XWLYw14hdNxK2Fko6O2UeU3k9+3LK
	PzI+GFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkah-00000000fys-1Wla;
	Thu, 12 Dec 2024 14:54:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkZR-00000000fqy-0gWN
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 14:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC11F5C65EA;
	Thu, 12 Dec 2024 14:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C34C4CECE;
	Thu, 12 Dec 2024 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734015219;
	bh=OY3GhRgWTrJpMq7G4x3kgzAeJmhXstpLimNOpeOAYds=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=g+T6r0ANPqeSEBPZVvY1SOu8liOnZnWEQcSNfPx4VkT6u25BUmENhc6/cNfmVBaVf
	 LGSCxFJUfz0EJ948PZgvMu1VGRVZ+MOw+kpr3HvUBXRLCz0E64tIOxo2XYsdkYWxHy
	 yRyBqOzDxAyZ2HNLxK/w1nRxfCSmHWrKfc5j9ANElDRN9MppXuc1kEH0a/t02cT9oT
	 5cEmRsv55+YoON7gWrp0BD4GCfrpH6cyEbTIWd54jvGON76Bl82sUuWT5Dq8SabfNU
	 6lfQiWEpYN19Ae3pQBj6+VW93UhkrNQTIN+oPQNu4kmiHjgCJkdfO2Pmf3tdMtvk47
	 OyhVYHzxdUoag==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] wifi: ath11k: add srng->lock for
 ath11k_hal_srng_* in monitor mode
References: <20241008053744.1070-1-quic_kangyang@quicinc.com>
	<20241008053744.1070-3-quic_kangyang@quicinc.com>
Date: Thu, 12 Dec 2024 16:53:37 +0200
In-Reply-To: <20241008053744.1070-3-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Tue, 8 Oct 2024 13:37:44 +0800")
Message-ID: <87ttb9nea6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_065341_243131_ABE0A3D5 
X-CRM114-Status: GOOD (  10.82  )
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

> ath11k_hal_srng_* should be used with srng->lock to protect srng data.
>
> For ath11k_dp_rx_mon_dest_process() and ath11k_dp_full_mon_process_rx(),
> they use ath11k_hal_srng_* for many times but never call srng->lock.
>
> So when running (full) monitor mode, warning will occur:
> RIP: 0010:ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
> Call Trace:
>  ? ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
>  ath11k_dp_rx_process_mon_status+0xc45/0x1190 [ath11k]
>  ? idr_alloc_u32+0x97/0xd0
>  ath11k_dp_rx_process_mon_rings+0x32a/0x550 [ath11k]
>  ath11k_dp_service_srng+0x289/0x5a0 [ath11k]
>  ath11k_pcic_ext_grp_napi_poll+0x30/0xd0 [ath11k]
>  __napi_poll+0x30/0x1f0
>  net_rx_action+0x198/0x320
>  __do_softirq+0xdd/0x319
>
> So add srng->lock for them to avoid such warnings.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

[...]

> @@ -5607,7 +5609,7 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
>  	struct hal_sw_mon_ring_entries *sw_mon_entries;
>  	struct ath11k_pdev_mon_stats *rx_mon_stats;
>  	struct sk_buff *head_msdu, *tail_msdu;
> -	void *mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
> +	struct hal_srng *mon_dst_srng;
>  	void *ring_entry;
>  	u32 rx_bufs_used = 0, mpdu_rx_bufs_used;
>  	int quota = 0, ret;
> @@ -5623,6 +5625,9 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
>  		goto reap_status_ring;
>  	}
>  
> +	mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
> +	spin_lock_bh(&mon_dst_srng->lock);

Why initialise mon_dst_srng differently? The commit message mentions
nothing about this change.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

