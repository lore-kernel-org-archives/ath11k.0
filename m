Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5BEC25B4F
	for <ath11k@archiver.kernel.org>; Tue,  7 May 2024 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xfs8N4U+vT2MI2nsmlNvcKvzNGT9xPUHbYLxWy/r4hs=; b=KeFrCoc8k9dB9eFZuyR0uUU6wP
	Q9QgAwgmC17kp1+9sv3r0XjuCjh3XxQtdMZP7fr8aJJJtXfuYlyLQb9QFJe9Afy8elt31DbQajrjC
	MDDuxO7b5+BO1K6kTCMhtuo/7EMB2DWuUvpbB8B2GFkuODaM3AVRkha/F8NFTVND+olUXBeDmuTBv
	dEL+jLt3sY2h63UjGnrshPZ3P8PIKTOtJDevW4wpRxnL/jayVtAVAvFVRRi9N/mWKdExLTBKDDDAF
	VAg9sjCHtG0fWpNmyXdnwRxT2xaCBJsXTqFnd2R9Yv+39OFX1LpOD2CUZHdiPm28XRIPRSAvUdHFC
	yp/1Umxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HcX-0000000ARWL-0QLC;
	Tue, 07 May 2024 10:00:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HcU-0000000ARVN-4544
	for ath11k@lists.infradead.org;
	Tue, 07 May 2024 10:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4A94CCE1263;
	Tue,  7 May 2024 10:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606F0C2BBFC;
	Tue,  7 May 2024 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715076018;
	bh=OcSKTZStAaD9u1j/juI/j/X8r7AGIVvhSWiWUCvhUaA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=o8MamacXrpNlPFoEPNXuwJC3ch1F7W7FNc//rfB4KfTBxilGqX/3ovdoirwA5/817
	 TXRzwR7RX1eUBC5/SW0pgBfWn1gQOxMJTp/0hWtz2MojfA9C839czYOgBKMoGNaUYK
	 PqDbWLsHpjleGnSrzsM0PKi8outTTKOMHFUUT5vTUA5v2xTTmVWuXLhPTO35sEVTR/
	 9H5d/X/sZ32A7DiG8s+keYE/dYcEiOvG+pUrLynizeigt9N05r0wLeZbmrZQLAdjy/
	 3ksw6PQuveMe1hdp9EbYpYTYHwwSsxcMLbNIBdyksqHBM88eA2IRNiL5RLW0vWpmm3
	 VpxLFHyb16OmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCHv5] wifi: ath11k: skip status ring entry processing
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240429073624.736147-1-quic_tamizhr@quicinc.com>
References: <20240429073624.736147-1-quic_tamizhr@quicinc.com>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty
	<quic_vnaralas@quicinc.com>, Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171507601530.3751691.1245928656021241727.kvalo@kernel.org>
Date: Tue,  7 May 2024 10:00:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_030023_228455_8E80072E 
X-CRM114-Status: GOOD (  10.95  )
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

Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> wrote:

> If STATUS_BUFFER_DONE is not set for a monitor status ring entry,
> we don't process the status ring until STATUS_BUFFER_DONE set
> for that status ring entry.
> 
> During LMAC reset it may happen that hardware will not write
> STATUS_BUFFER_DONE tlv in status buffer, in that case we end up
> waiting for STATUS_BUFFER_DONE leading to backpressure on monitor
> status ring.
> 
> To fix the issue, when HP (Head Pointer) + 1 entry is peeked and if DMA is not
> done and if HP + 2 entry's DMA done is set, replenish HP + 1 entry and start
> processing in next interrupt. If HP + 2 entry's DMA done is not set, poll onto
> HP + 1 entry DMA done to be set.
> 
> Also, during monitor attach HP points to the end of the ring and TP (Tail
> Pointer) points to the start of the ring.  Using ath11k_hal_srng_src_peek() may
> result in processing invalid buffer for the very first interrupt. Since, HW
> starts writing buffer from TP.
> 
> To avoid this issue call ath11k_hal_srng_src_next_peek() instead of
> calling ath11k_hal_srng_src_peek().
> 
> Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Co-developed-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4c2b796be3a1 wifi: ath11k: skip status ring entry processing

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240429073624.736147-1-quic_tamizhr@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


