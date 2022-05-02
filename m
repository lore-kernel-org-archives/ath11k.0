Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C34C433FE
	for <ath11k@archiver.kernel.org>; Mon,  2 May 2022 14:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFzHPYzUjm9Huf+DSl9YKi+aqS1bjz8HIWjo2QmMpXo=; b=LKgfdP0+i65nZc
	4oCfiSGNN4k7CZDqoEX6QuFJR/OA/DSecMrnODhTWllNnLFHvz+chkMu4D1tGycQRfr5SvSISbcLd
	/Q8YtLsmfqkqPW5gKxhGvqRxiws+2OBM807A074wNpWW2SVZcJXnWhjZpZ09VDUAR3X2SAXnivwZX
	oSzPVzqpkg+HDv1bjyqgyd0kowLzejH6HBs3lqyhTdQKSTE0CFbP5p1/jQlasfFwty981YSxaGuyJ
	neZ662NAW5OcW7jCwreF1I+tt+KhGnTvDIfCm2tVBokEKU7UBqB+DPShzpHGZxg+XCcap6mkuxRqE
	VioYdKUZC7ljTa3mDUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlWzP-001Nn9-05; Mon, 02 May 2022 14:25:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlWzG-001Njt-6U
 for ath11k@lists.infradead.org; Mon, 02 May 2022 14:25:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB797B816E4;
 Mon,  2 May 2022 14:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D918AC385A4;
 Mon,  2 May 2022 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651501509;
 bh=rYy4mpAx6EyxzNfDAK8Zp5xCShNoIUSIErNAxKOZE1o=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=nm2I33v4dmGau/a2WmCkzYyxbFqRIfac0f719qLFowSTDqcyF64cGKUuSfqTTcXB8
 beIm6Bsu9XCy3C8++HhKWK1+LotmtWbqLBqDVMSnEkJfd+WBOYicpgCzQ16y2//8ps
 SCi+MIp/+V/c8N6W6C7MuIqf3ipxKr366T78bcKrHoOwf9wv0IxqsVHiUiV9MtwDtl
 lBVJCoP5p71ZL5dax+wtIRqYDlPpIfhxKLKLPE2iKRyvXTf0xm5hNK5wF4sVEn04u6
 a3gubEOs+iFljmb9pbhy0OtBkoziszXxzk84h7u9e9e6GUf27E34hni5DW+o5seplq
 gyzTrVWPthD2w==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3] ath11k: Fix RX de-fragmentation issue on WCN6750
References: <20220328061947.28813-1-quic_mpubbise@quicinc.com>
Date: Mon, 02 May 2022 17:25:04 +0300
In-Reply-To: <20220328061947.28813-1-quic_mpubbise@quicinc.com> (Manikanta
 Pubbisetty's message of "Mon, 28 Mar 2022 11:49:47 +0530")
Message-ID: <87bkwgau67.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_072521_473100_725DBC14 
X-CRM114-Status: GOOD (  15.61  )
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

> The offset of REO register where the RX fragment destination ring
> is configured is different in WCN6750 as compared to WCN6855.
> Due to this differnce in offsets, on WCN6750, fragment destination
> ring will be configured incorrectly, leading to RX fragments not
> getting delivered to the driver. Fix this by defining HW specific
> offset for the REO MISC CTL register.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

[...]

> @@ -2229,6 +2229,9 @@ const struct ath11k_hw_regs wcn6855_regs = {
>  
>  	/* Shadow register area */
>  	.hal_shadow_base_addr = 0x000008fc,
> +
> +	/* REO MISC CTRL */
> +	.hal_reo1_misc_ctl = 0x00000630,
>  };

I don't really see the benefit from the comment, it doesn't bring any
extra information.

>  const struct ath11k_hw_regs wcn6750_regs = {
> @@ -2311,6 +2314,9 @@ const struct ath11k_hw_regs wcn6750_regs = {
>  
>  	/* Shadow register area */
>  	.hal_shadow_base_addr = 0x00000504,
> +
> +	/* REO MISC CTRL */
> +	.hal_reo1_misc_ctl = 0x000005d8,

Ditto.

What about other ath11k_hw_regs tables:

<global>[1906]                 const struct ath11k_hw_regs ipq8074_regs = {
<global>[1988]                 const struct ath11k_hw_regs qca6390_regs = {
<global>[2070]                 const struct ath11k_hw_regs qcn9074_regs = {

You don't mention anything about those in the commit log. If they don't
use this register (didn't check) we should at least initialise the
fields to zero, deadbeef or something to make it clear they are unused.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
