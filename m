Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DE8C433FE
	for <ath11k@archiver.kernel.org>; Wed, 23 Nov 2022 16:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vglCaVjFWucpky1xx2AZYAsw4wmlyZns6geZyAo5jHM=; b=qaXj+//L55UKPX
	oVjBmwYeE/RkwVCeiLhZpnrOXaNQBdBmlrAmD7j/WDRqHwQ/T9Pbcl6SKDrGn4mUHqHEx4JSPSWtU
	9vKVKEow2si1hTlNF73Kbw0DzUOim0cJ7tcFE8/ExBohc0zhyccVAzT7v2UHG93nheslIcQ0qae/f
	DpDa37pacIFB6JI7DjAP6E7i1VVKj+a2FSr1+CParaeB9lZ+cWXiErwa6+Ihmjvw4/8xKIjpJUoIP
	NhGUT4eWtYiYcNYSNinvdUhhHRVD+yGZfhb8mOdDVcDCJBn2ETv3Yq0lbUaBNN8ZBswiAMLXmVnXZ
	iYcYyTleBjhtM2iAZ78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsG1-000jWT-7K; Wed, 23 Nov 2022 16:05:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsFx-000jUP-Vg
	for ath11k@lists.infradead.org; Wed, 23 Nov 2022 16:05:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7CE5F61DD6;
	Wed, 23 Nov 2022 16:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2830EC433D6;
	Wed, 23 Nov 2022 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669219548;
	bh=rPBZpdey+wlD577Iq7xu+PZhQ8jYJpnS5RXmoGt7JHU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DKxOBom/wfQKst49stTQ8sdJ74NL2Hyb5DdEchQGfOt62bmS1h/dFG6f1HqG+u9CO
	 C/Hiap/c34RC0uzhUnesK4TDGYrCXLY5uFwUs7Zc4eZIRef3qSjO9g3RJOWw6M8kVW
	 U/49GvQ5sqoAFdVTIGfqS0XolNfP2HDs3BXwBSBufnJm+8ULlQyMZlVkY3B2H64IlT
	 HZ5OhC/V2atC65YHHif/liKg9f4Dca5yHLGRQYBpfb777gN1t27DPo3N74UkedfT6R
	 kbTT+F0bi70C/B9q0RogMEpBOvwvQNze3KtV05+iTTIc1bWf0qJfv/De4RsYWLflFX
	 t+f5a59HjNgfQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Enable low power mode when WLAN is not active
References: <20221121110359.4652-1-quic_mpubbise@quicinc.com>
	<87bkoz8ica.fsf@kernel.org>
Date: Wed, 23 Nov 2022 18:05:44 +0200
In-Reply-To: <87bkoz8ica.fsf@kernel.org> (Kalle Valo's message of "Tue, 22 Nov
	2022 11:11:01 +0200")
Message-ID: <87y1s17j1j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_080550_115931_2A919E62 
X-CRM114-Status: GOOD (  18.67  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>
>> Currently, WLAN chip is powered once during driver probe and is kept
>> ON (powered) always even when WLAN is not active; keeping the chip
>> powered ON all the time will consume extra power which is not
>> desirable for battery operated devices. Same is the case with non-WoW
>> suspend, chip will not be put into low power mode when the system is
>> suspended resulting in higher battery drain.
>>
>> Send QMI MODE OFF command to firmware during WiFi OFF to put device
>> into low power mode.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>>
>> Manikanta Pubbisetty (3):
>>   ath11k: Fix double free issue during SRNG deinit
>>   ath11k: Move hardware initialization logic to start()
>>   ath11k: Enable low power mode when WLAN is not active
>> ---
>> V3:
>>  - Removed patch "ath11k: Fix failed to parse regulatory event print" as it is not needed anymore
>>  - Fixed a potential deadlock scenario reported by lockdep around ab->core_lock with V2 changes
>>  - Fixed other minor issues that were found during code review
>>  - Spelling corrections in the commit messages
>
> I still see a crash, immediately after the first rmmod:
>
> Nov 22 11:05:47 nuc2  [  139.378719] rmmod ath11k_pci
> Nov 22 11:05:48 nuc2 [ 139.892395] general protection fault, probably
> for non-canonical address 0xdffffc000000003e: 0000 [#1] PREEMPT SMP
> DEBUG_PAGEALLOC KASAN
> Nov 22 11:05:48 nuc2 [ 139.892453] KASAN: null-ptr-deref in range
> [0x00000000000001f0-0x00000000000001f7]
>
> Really odd that you don't see it. Unfortunately not able to debug this
> further right now.
>
> This is with:
>
> wcn6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9

A bit more information how I see the crash. So first I have all modules
loaded:

$ lsmod
Module                  Size  Used by
ath11k_pci             57344  0
ath11k               2015232  1 ath11k_pci
mac80211             3284992  1 ath11k
libarc4                16384  1 mac80211
cfg80211             2494464  2 ath11k,mac80211
qmi_helpers            57344  1 ath11k
qrtr_mhi               20480  0
mhi                   217088  2 ath11k_pci,qrtr_mhi
qrtr                   98304  5 qrtr_mhi
nvme                  122880  3
nvme_core             299008  5 nvme
$

Then I just remove ath11k_pci module and boom:

$ sudo rmmod ath11k_pci

[  153.658409] general protection fault, probably for non-canonical address 0xdffffc000000003e: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC KASAN

This happens every time, there doesn't seem to be any randomness on the
behaviour.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
