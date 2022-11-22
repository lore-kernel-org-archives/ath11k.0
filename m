Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF7BC4332F
	for <ath11k@archiver.kernel.org>; Tue, 22 Nov 2022 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Kso8cX01YAvo5QD6Pd6nCGpaKrY2QCtgx8Ag4/aUG8=; b=gp3sNcPhwLeWtJ
	8UZE9LU2Ffje5/3bcKbByjR2N6jq+F6JmyTlQWGS40BECL6UDFgtOUc7lxFp81kvOc0/1Hw2MvCbO
	R8tZZ+W3hg+I0oelxuZeVCkl07MxdojQmryqlulUG+jD6otdzWqzHXZ/N8FMeBHjDJxhXFA8V7yQF
	UdzU1vYgqSLIEwK30wqMgLkjlai4pSyLZB9o7zxxzbltX/UWt+oBUuBo6A4ds6mKi6ZVpJ2zm6eEy
	bVlXAvElrEmP/uDwD3GALzFUv6FpPK0Zcdy2MWb1kIMp9oOE7X7rvRlMCkbmAN8Whud3FPKhaVSQx
	/0LwUWh8Y+e2ihn2etow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPJC-006p9F-Bq; Tue, 22 Nov 2022 09:11:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPJ7-006p4R-2c
	for ath11k@lists.infradead.org; Tue, 22 Nov 2022 09:11:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A6629B8199C;
	Tue, 22 Nov 2022 09:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E85C433C1;
	Tue, 22 Nov 2022 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669108266;
	bh=06WBHnIaeJF8wvV9xffzaRx2sY/eraCrCD+NYMHPGno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e3AzE1HoD9iRF+0+3MSo5WnQRd0xCHgZT+kBxj3g9cneCUwJL/e+lMEeTU1hhYukU
	 aBjD/x8oRgvtfyLh65P9nlwoIovFM5tWNb75nvukfimsZv8GfxLc2jM2gCtHEmfyS7
	 NzuMGW48h+FcVM/3/JjuKqoSJZSoKBUxsRm+rujZ02ASGjdgaYXE70j2veEHixAXZL
	 knqOWYme7SCscfPm6odlSFBvom6VsimN5EQdJ7E/8xRRVNPSaOiLZ09U34Ode10aZh
	 2mw0CyiwDVwdILIXlVkLm4CiT6UNcraJYTzsudhtzHwk/2pEZD9QI6rVUaQsRO+ZKr
	 XbQzXr+chcBjQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Enable low power mode when WLAN is not active
In-Reply-To: <20221121110359.4652-1-quic_mpubbise@quicinc.com> (Manikanta
	Pubbisetty's message of "Mon, 21 Nov 2022 16:33:56 +0530")
References: <20221121110359.4652-1-quic_mpubbise@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 22 Nov 2022 11:11:01 +0200
Message-ID: <87bkoz8ica.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_011109_316356_86083E79 
X-CRM114-Status: GOOD (  15.43  )
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
> desirable for battery operated devices. Same is the case with non-WoW
> suspend, chip will not be put into low power mode when the system is
> suspended resulting in higher battery drain.
>
> Send QMI MODE OFF command to firmware during WiFi OFF to put device
> into low power mode.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>
> Manikanta Pubbisetty (3):
>   ath11k: Fix double free issue during SRNG deinit
>   ath11k: Move hardware initialization logic to start()
>   ath11k: Enable low power mode when WLAN is not active
> ---
> V3:
>  - Removed patch "ath11k: Fix failed to parse regulatory event print" as it is not needed anymore
>  - Fixed a potential deadlock scenario reported by lockdep around ab->core_lock with V2 changes
>  - Fixed other minor issues that were found during code review
>  - Spelling corrections in the commit messages

I still see a crash, immediately after the first rmmod:

Nov 22 11:05:47 nuc2  [  139.378719] rmmod ath11k_pci
Nov 22 11:05:48 nuc2  [  139.892395] general protection fault, probably for non-canonical address 0xdffffc000000003e: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC KASAN
Nov 22 11:05:48 nuc2  [  139.892453] KASAN: null-ptr-deref in range [0x00000000000001f0-0x00000000000001f7]

Really odd that you don't see it. Unfortunately not able to debug this
further right now.

This is with:

wcn6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
