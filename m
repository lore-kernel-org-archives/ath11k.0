Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C5C61DA3
	for <ath11k@archiver.kernel.org>; Fri, 24 Feb 2023 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFpmQVkIzq9nOP4PiFvluCqD2VXBpoVuT4tyi0iHV/I=; b=Aw86+/bDY4VItT
	uXG2FRScaPzQWms7DOc19fii54lmTjBcCIHs04l0Gy0Ld6SUKOfIPaaN7TzqQu4BO8JHsKSNsbXNd
	l6cF4Pj4spWL8PE2IIESgJPo/GWRFToBMQzrWo9ib0ZRhQU26ZSJ1fNsZs5H+e7valhPMyRrDKiTs
	+PKMvM56csBKO7Y3/48xJH4jdVwWgfo71tyXFSR0Mg69fGfuNKZpYuCngRZm5ZuPCO7oFe9OySIbf
	ZMeGapgdGNVXEo6UxQZYzS9JzVFa5dqM+yCbU1JZZ0D3T+J8jIgaXqgBnj9AnEPZQmPyMf9aauwWq
	XsNEUB1Bi0EylcR0E6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZLP-002np6-Hm; Fri, 24 Feb 2023 14:46:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZLM-002noG-Gj
	for ath11k@lists.infradead.org; Fri, 24 Feb 2023 14:46:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E2234B81C87;
	Fri, 24 Feb 2023 14:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC29C4339B;
	Fri, 24 Feb 2023 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677249997;
	bh=peavsqg3yenBn7QYS5SDS1x3WO3lozC0ZMCB4rY0fq0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qzDxEPZESXm4rZnZ7XMi7/exNMnHAFbUNiurGfGjGAzPmtL5aVBweXUICr0/Gdi29
	 ewrxnCt4zOLBwPJy1LpKRJUaaxUYAu7fHGIX9YA80FItxsoGz/wjSJdu/shF9TYDw5
	 llJoI8JElrKGB1LqZ2XgXRGvMNKz2vlHAVm8L+bBxHZm8RAnxRpL72X3Snm0KSursJ
	 DPsMYQwmriIQq8igBts6UKYHIPPEKNgdFwNpcfgD58faQ7m50yFjWvANJqRdekMMUE
	 LiBf0ZgcvvGCFJNt9+j20M01oZlRSBI4y79jvwKhgXG+noUwVP7c5lDS67AxAh5OwT
	 C8f01EOr1PjaQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] ath11k: Enable low power mode when WLAN is not active
References: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
	<20230203060128.19625-4-quic_mpubbise@quicinc.com>
Date: Fri, 24 Feb 2023 16:46:31 +0200
In-Reply-To: <20230203060128.19625-4-quic_mpubbise@quicinc.com> (Manikanta
	Pubbisetty's message of "Fri, 3 Feb 2023 11:31:28 +0530")
Message-ID: <87h6vbruig.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_064640_869629_F4ABA045 
X-CRM114-Status: GOOD (  21.97  )
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

> Currently, WLAN chip is powered once during driver probe and is kept
> ON (powered) always even when WLAN is not active; keeping the chip
> powered ON all the time will consume extra power which is not
> desirable for a battery operated device. Same is the case with non-WoW
> suspend, chip will never be put into low power mode when the system is
> suspended resulting in higher battery drain.
>
> As per the recommendation, sending a PDEV suspend WMI command followed
> by a QMI MODE OFF command will cease all WLAN activity and put the device
> in low power mode. When WLAN interfaces are brought up, sending a QMI
> MISSION MODE command would be sufficient to bring the chip out of low
> power. This is a better approach than doing hif_power_down()/hif_power_up()
> for every WiFi ON/OFF sequence since the turnaround time for entry/exit of
> low power mode is much less. Overhead is just the time taken for sending
> QMI MODE OFF & QMI MISSION MODE commands instead of going through the
> entire chip boot & QMI init sequence.
>
> Currently the changes are applicable only for WCN6750. This can be
> extended to other targets with a future patch.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

This is still crashing for me every time with WCN6855 on a NUC x86
device when I rmmod ath11k. Interestingly enough QCA6390 on a Dell XPS
13 9310 does not crash.

I investigated the crash more, the crash happens in
ath11k_dp_process_rxdma_err() on this line:

	srng = &ab->hal.srng_list[err_ring->ring_id];

Here are the debug messages before the crash (first and last are my
own messages):

[  226.766111] rmmod ath11k_pci
[  227.003678] ath11k_pci 0000:06:00.0: txpower from firmware NaN, reported -2147483648 dBm
[  227.082283] ath11k_pci 0000:06:00.0: qmi wifi fw del server
[  227.195760] ath11k_pci 0000:06:00.0: cookie:0x0
[  227.195843] ath11k_pci 0000:06:00.0: WLAON_WARM_SW_ENTRY 0x15b894d
[  227.216022] ath11k_pci 0000:06:00.0: WLAON_WARM_SW_ENTRY 0x0
[  227.216086] ath11k_pci 0000:06:00.0: soc reset cause:0
[  227.236170] ath11k_pci 0000:06:00.0: MHISTATUS 0xff04
[  227.270816] ath11k_pci 0000:06:00.0: ext irq:167
[  227.271231] ath11k_dp_process_rxdma_err() 4187 ab ffff888145520000 err_ring 00000000000001d0

So we get irq 167 which is:

 167:          0          0          0          0          0          0          0          0  IR-PCI-MSI-0000:06:00.0   14-edge      DP_EXT_IRQ

But in ath11k_pcic_ext_interrupt_handler() ATH11K_FLAG_EXT_IRQ_ENABLED
is still enabled so the irq is processed:

	if (!test_bit(ATH11K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags))
		return IRQ_HANDLED;

It looks like that, after applying this patch 3, whenever
ath11k_pci_remove() is called we are not calling
ath11k_hif_irq_disable() anymore. I checked that without patch 3
ath11k_hif_irq_disable() is always called. So this patch is definitely
breaking something fundamental, but I ran out of time to invetigate
further. I hope this still helps.

Do note I have concerns about this patchset, it just changes quite a lot
of the driver logic and I'm worried what else this breaks. Also we
should definitely test with another AHB device like IPQ8074, this
patchset needs extensive testing.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
