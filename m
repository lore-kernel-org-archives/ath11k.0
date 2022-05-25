Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B2CC433EF
	for <ath11k@archiver.kernel.org>; Wed, 25 May 2022 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsGzjfiLqZO6i0seb/KJuRlANs3+M/rXhq8wt/2JCfQ=; b=p8bztifqLHNY97
	WskYpt6qOOHToPxjb67+IzAeWTliKEV05hq6ld0a6xlRZeU13P/TGQkbEqNTINBQlbHhbSnBcR5bn
	mZMtwz50GVK3DvxR94vjyZB/hDRrL/xVgLy1OP63RCWJQ3AT+zUQUuu/dSF1DdC8QwpDXtL3Kt4lX
	DWOU8E1CKO6pbekqjqZhxWbx10RVoqUW43jvAPiNMgm//WOHoEP2gM0reF0m1PJeKtANhd183Y8VL
	bg9mmYjSezrw7e16Mo1YPUKpQTgnfm4mUHkgEmf5+Xnra1IB41199xTPL6B0HKKdtHwKuRloLknlG
	qzIv1RhquOPmU+hxY8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntw7K-00C9oj-2y; Wed, 25 May 2022 18:52:22 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntw7G-00C9nt-2A
	for ath11k@lists.infradead.org; Wed, 25 May 2022 18:52:20 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 1735520041;
	Wed, 25 May 2022 20:46:44 +0200 (CEST)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 121931FFE1;
	Wed, 25 May 2022 20:46:44 +0200 (CEST)
Message-ID: <bd6d97a4cc6665d0ee632444f75e3480160387ec.camel@freebox.fr>
Subject: Re: [PATCH v7 4/9] ath11k: Add register access logic for WCN6750
From: Maxime Bizon <mbizon@freebox.fr>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org,  mka@chromium.org
Date: Wed, 25 May 2022 20:46:43 +0200
In-Reply-To: <20220429170502.20080-5-quic_mpubbise@quicinc.com>
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
	 <20220429170502.20080-5-quic_mpubbise@quicinc.com>
Organization: Freebox
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed May 25 20:46:44 2022 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_115218_308989_8966E5D6 
X-CRM114-Status: GOOD (  13.43  )
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
Reply-To: mbizon@freebox.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On Fri, 2022-04-29 at 22:34 +0530, Manikanta Pubbisetty wrote:

Hello Manikanta,

> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-
> QCAHKSWPL_SILICONZ-1

Nope your patch breaks QCN9074:

[   13.660963] ath11k_pci 0000:03:00.0: failed to set pcie link register 0x01e0e0a8: 0xffffffff != 0x00000010
[   13.675994] ath11k_pci 0000:03:00.0: failed to set sysclk: -110

device still seem to work though

> @@ -134,16 +134,13 @@ EXPORT_SYMBOL(ath11k_pcic_init_msi_config);
>  static inline u32 ath11k_pcic_get_window_start(struct ath11k_base *ab,
>  					       u32 offset)
>  {
> -	u32 window_start;
> +	u32 window_start = 0;
>  
> -	/* If offset lies within DP register range, use 3rd window */
>  	if ((offset ^ HAL_SEQ_WCSS_UMAC_OFFSET) < ATH11K_PCI_WINDOW_RANGE_MASK)
> -		window_start = 3 * ATH11K_PCI_WINDOW_START;
> -	/* If offset lies within CE register range, use 2nd window */
> -	else if ((offset ^ HAL_CE_WFSS_CE_REG_BASE) < ATH11K_PCI_WINDOW_RANGE_MASK)
> -		window_start = 2 * ATH11K_PCI_WINDOW_START;
> -	else
> -		window_start = ATH11K_PCI_WINDOW_START;
> +		window_start = ab->hw_params.dp_window_idx * ATH11K_PCI_WINDOW_START;
> +	else if ((offset ^ HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab)) <
> +		 ATH11K_PCI_WINDOW_RANGE_MASK)
> +		window_start = ab->hw_params.ce_window_idx * ATH11K_PCI_WINDOW_START;
>  
>  	return window_start;
>  }


for some offsets, previous code could return ATH11K_PCI_WINDOW_START,
whereas new code now returns 0


> @@ -162,19 +159,12 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
>  
>  	if (offset < ATH11K_PCI_WINDOW_START) {
>  		iowrite32(value, ab->mem  + offset);
> -	} else {
> -		if (ab->hw_params.static_window_map)
> -			window_start = ath11k_pcic_get_window_start(ab, offset);
> -		else
> -			window_start = ATH11K_PCI_WINDOW_START;
> -
> -		if (window_start == ATH11K_PCI_WINDOW_START &&
> -		    ab->pci.ops->window_write32) {
> -			ab->pci.ops->window_write32(ab, offset, value);
> -		} else {
> -			iowrite32(value, ab->mem + window_start +
> -				  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
> -		}
> +	} else if (ab->hw_params.static_window_map) {
> +		window_start = ath11k_pcic_get_window_start(ab, offset);
> +		iowrite32(value, ab->mem + window_start +
> +			  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
> +	} else if (ab->pci.ops->window_write32) {
> +		ab->pci.ops->window_write32(ab, offset, value);
>  	}
> 

with previous code on QCN9074, when ath11k_pcic_get_window_start()
returned ATH11K_PCI_WINDOW_START, then it would call window_write32()

with new code on QCN9074, static_window_map is true, so window_write32
will never be called.

>  u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)

ditto here

-- 
Maxime




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
