Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C9FC6FD18
	for <ath11k@archiver.kernel.org>; Wed, 19 Apr 2023 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeCZQ0RDq1CWua8LyAvjykU+zN9kFVRf6NjrMJiKH3Q=; b=mzzEz1gKVSS0Yt
	zqwFvQ0A/G/Y7pemDgk8AFv2Yp92bNwPNNPWsetrtIyWDOlIFqysBzNDALERoMQjN3ecMKAr2Tr0U
	0OribGaWFJjyC71TjHbTQ76V9Iucx3EkI00Yyzk0C8KuKGvEEiod8XVmRUvAjtkMztjXOwVFh8MGQ
	7xKdf6l13zobLpBJGTzmdy3QoGfCN4nHhbZTx1NKCTDOWNovGjG+wdtiak/DdzYy1dITgiNHdWK7B
	L1uD3QZ2YSVnLtos7fSTeHvcPgWXlaL3P3YaUOeNXe3Z6XkM6+SDc3/7YzE9oCq3PCmA2XFjFTKnO
	D+k19stYIIbqOU3oyUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8jP-005ejw-10;
	Wed, 19 Apr 2023 14:24:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8jL-005eia-2M
	for ath11k@lists.infradead.org;
	Wed, 19 Apr 2023 14:24:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DDAE63AB7;
	Wed, 19 Apr 2023 14:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68BFC433D2;
	Wed, 19 Apr 2023 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914258;
	bh=tJZZqrGqSqQb66lSfUCypSSZbSXjYgIzHCvjRylaWUg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bYfdTw413uby8FkU9x+mjUBSKt8iOBQP2drrJI7QEhrZlPVWUSjOJnCCTvmnA5YOt
	 K0c1Jf86GPrtEzNIhk4oifMm4LKiIDzcUBcGqt0UKEFWSp4YoMDC6gu+r4TNXBIWDZ
	 pX6W53O6LiWTTUonO9/0eDdLD6s0HYCoLiDpqCoQqf58lZ7RwUXXwbxMC8vIjNbNXM
	 pQmKZj2IN5CsQN9QJ4QV0L92ntl9/sMOmgEZrkszupPdmql0ebOUanR0ng/Gdtbqvw
	 EfAIziV01vO9hgCRPYsAR6hRA5WhXMUJ2HCX0Pw/BThtUuT6GzdFeAXW5eqqE9mutH
	 PEebccMSfPp3Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Fix SKB corruption in REO destination ring
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230403191533.28114-1-quic_nmaran@quicinc.com>
References: <20230403191533.28114-1-quic_nmaran@quicinc.com>
To: Nagarajan Maran <quic_nmaran@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Nagarajan Maran <quic_nmaran@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168191425579.18451.5661406318387164374.kvalo@kernel.org>
Date: Wed, 19 Apr 2023 14:24:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072419_808754_400CD673 
X-CRM114-Status: GOOD (  12.53  )
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

Nagarajan Maran <quic_nmaran@quicinc.com> wrote:

> While running traffics for a long time, randomly an RX descriptor
> filled with value "0" from REO destination ring is received.
> This descriptor which is invalid causes the wrong SKB (SKB stored in
> the IDR lookup with buffer id "0") to be fetched which in turn
> causes SKB memory corruption issue and the same leads to crash
> after some time.
> 
> Changed the start id for idr allocation to "1" and the buffer id "0"
> is reserved for error validation. Introduced Sanity check to validate
> the descriptor, before processing the SKB.
> 
> Crash Signature :
> 
> Unable to handle kernel paging request at virtual address 3f004900
> PC points to "b15_dma_inv_range+0x30/0x50"
> LR points to "dma_cache_maint_page+0x8c/0x128".
> The Backtrace obtained is as follows:
> [<8031716c>] (b15_dma_inv_range) from [<80313a4c>] (dma_cache_maint_page+0x8c/0x128)
> [<80313a4c>] (dma_cache_maint_page) from [<80313b90>] (__dma_page_dev_to_cpu+0x28/0xcc)
> [<80313b90>] (__dma_page_dev_to_cpu) from [<7fb5dd68>] (ath11k_dp_process_rx+0x1e8/0x4a4 [ath11k])
> [<7fb5dd68>] (ath11k_dp_process_rx [ath11k]) from [<7fb53c20>] (ath11k_dp_service_srng+0xb0/0x2ac [ath11k])
> [<7fb53c20>] (ath11k_dp_service_srng [ath11k]) from [<7f67bba4>] (ath11k_pci_ext_grp_napi_poll+0x1c/0x78 [ath11k_pci])
> [<7f67bba4>] (ath11k_pci_ext_grp_napi_poll [ath11k_pci]) from [<807d5cf4>] (__napi_poll+0x28/0xb8)
> [<807d5cf4>] (__napi_poll) from [<807d5f28>] (net_rx_action+0xf0/0x280)
> [<807d5f28>] (net_rx_action) from [<80302148>] (__do_softirq+0xd0/0x280)
> [<80302148>] (__do_softirq) from [<80320408>] (irq_exit+0x74/0xd4)
> [<80320408>] (irq_exit) from [<803638a4>] (__handle_domain_irq+0x90/0xb4)
> [<803638a4>] (__handle_domain_irq) from [<805bedec>] (gic_handle_irq+0x58/0x90)
> [<805bedec>] (gic_handle_irq) from [<80301a78>] (__irq_svc+0x58/0x8c)
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f9fff67d2d7c wifi: ath11k: Fix SKB corruption in REO destination ring

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230403191533.28114-1-quic_nmaran@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
