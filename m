Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF272C4345F
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcQOQiaw49a6Byd+wL3ttICwNnp01XH3mPEp8NhAlQo=; b=OVIAFcrkVUkeMZcyLg4LMUK1Xi
	hHMh88xt2o2fnvV1fIUYf/4PQFB1zFFIZ41Ln8D1hYzZS8WjCZ3u6fbXR4sFmkzcMbf8HLIUTZ187
	xtlALD2RQtpv1EhEOOPrW2Cl6TUuTa7DE8VppTlZNVTsqdPrt5HN6omQBTSGDlcYwIbWomZbe3d0C
	VIS6OJR4NXL6WwbgMWz09wGGgeWtdF9w5CNoLdqH2TMkXP2oviz2HLDnNA0+bI6PXECdPT1pZwLhZ
	knqohtTunY89H3gu703eaTk0xp3L7sn3uUHT5xTld1HXm6yX8YbTXoC/NJianCEKVQN1JgMPw+9/A
	tvlv84Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nqs-00000006bWv-1D4M;
	Tue, 30 Apr 2024 13:48:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1nqp-00000006bWB-1mIE
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 13:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2865161423;
	Tue, 30 Apr 2024 13:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94350C4AF18;
	Tue, 30 Apr 2024 13:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484933;
	bh=6WTKqUfG5kN4YNoATVxd08lZG8BIH87ncCi8h2kONA8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=f3lICaCLV6tAhH0BT5FnBShhKYOpmQZQHyzJv08Or7dA7e3pL0b38kuL8uypgQUYU
	 9uNgvcu0ER+CJQ6GPd/CpuVytPWDpP/n36QXUuUZf/GZdBLQx168XBYhXtJfymads9
	 kyEWLJbUwDvZSSleY9j106wHlgcgXI6YZSu8mEAECCyOqjiP0CfyCVMB0sSGyqKHHU
	 ZUf/6kuQ4Uljd/R2vwyIrAaBVfWSF4BlsSyTjVsZjQCPdz3xl1iWEU5s1iKtxHLYNI
	 LOsKLuWDAIPwlZPfhviMdvqx38VP/NkdEAQgRFfTL8DUheyshiciXgK/VWWG/T3tTq
	 3NGPBu0kOld+g==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Subject: Re: [PATCHv5] wifi: ath11k: skip status ring entry processing
References: <20240429073624.736147-1-quic_tamizhr@quicinc.com>
	<35f114c4-1ff7-4a4b-aadf-ed147f19e170@quicinc.com>
Date: Tue, 30 Apr 2024 16:48:50 +0300
In-Reply-To: <35f114c4-1ff7-4a4b-aadf-ed147f19e170@quicinc.com> (Jeff
	Johnson's message of "Mon, 29 Apr 2024 11:12:49 -0700")
Message-ID: <87cyq7ota5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_064855_594263_EFEB3130 
X-CRM114-Status: GOOD (  23.94  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 4/29/2024 12:36 AM, Tamizh Chelvam Raja wrote:
>
>> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>> 
>> If STATUS_BUFFER_DONE is not set for a monitor status ring entry,
>> we don't process the status ring until STATUS_BUFFER_DONE set
>> for that status ring entry.
>> 
>> During LMAC reset it may happen that hardware will not write
>> STATUS_BUFFER_DONE tlv in status buffer, in that case we end up
>> waiting for STATUS_BUFFER_DONE leading to backpressure on monitor
>> status ring.
>> 
>> To fix the issue, when HP(Head Pointer) + 1 entry is peeked and if DMA
>> is not done and if HP + 2 entry's DMA done is set,
>> replenish HP + 1 entry and start processing in next interrupt.
>> If HP + 2 entry's DMA done is not set, poll onto HP + 1 entry DMA
>> done to be set.
>> 
>> Also, during monitor attach HP points to the end of the ring and
>> TP(Tail Pointer) points to the start of the ring.
>> Using ath11k_hal_srng_src_peek() may result in processing invalid buffer
>> for the very first interrupt. Since, HW starts writing buffer from TP.
>> 
>> To avoid this issue call ath11k_hal_srng_src_next_peek() instead of
>> calling ath11k_hal_srng_src_peek().
>> 
>> Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>> Co-developed-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
>> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
> however note...
>
>> +
>> +				/* If done status is missing:
>> +				 * 1. As per MAC team's suggestion,
>> +				 *    when HP + 1 entry is peeked and if DMA
>> +				 *    is not done and if HP + 2 entry's DMA done
>> +				 *    is set. skip HP + 1 entry and
>> +				 *    start processing in next interrupt.
>> +				 * 2. If HP + 2 entry's DMA done is not set,
>> +				 *    poll onto HP + 1 entry DMA done to be set.
>> +				 *    Check status for same buffer for next time
>> +				 *    dp_rx_mon_status_srng_process
>> +				 */
>> +
>> + reap_status = ath11k_dp_rx_mon_handle_status_buf_done(ab, srng,
>> + rx_ring);
>
> ath11k-check reports:
>
> drivers/net/wireless/ath/ath11k/dp_rx.c:3116: line length of 95 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/dp_rx.c:3117: line length of 95 exceeds 90 columns

Tamizh, please ALWAYS run ath11k-check. We are wasting time for trivial
stuff like this.

> Kalle, in this case we may want to make an exception since I don't think there
> is a clean way to fix this other than refactoring.

The new function name looked quite long so I shortened it to
ath11k_dp_rx_mon_buf_done() and the warning is now gone. Does that look
reasonable name?

Also I removed one unrelated change and removed unnecessary else. Please
check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6e88d559268779107715008c51e006f7a5f62045

But now I noticed that the warning message needs some work:

ath11k_warn(ab, "mon status DONE not set %lx, buf_id %d\n",
	    FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl),
	    buf_id);

Please use understandable warning and error messages in plain english.
Any suggestions? I can edit the commit in the pending branch.

> FWIW I'd like to see this function refactored to avoid the excessive
> indentation, but that should be a separate exercise.

Indeed, the indentation in this function is getting close to the limit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

