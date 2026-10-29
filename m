Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CBA606A31E
	for <ath11k@archiver.kernel.org>; Thu, 29 Oct 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ktOul8lt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISwL3c+2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NUoVKO4u1i9msND1k3Skax2mOLj1SPEw/WwPEoecEyc=; b=ktOul8ltZe7Uzj
	rcnCWNDnACoy+WUF1ZX/9UlMll6n05xTboz4aeOgeX9igjBlhetsUZk/VE9bcjmL0HQuFgDwfAyvV
	upc5sDYNIXKZr4ARU2OhXVaPh+pV843nRYDcKEqY37hRqrBA9gVbRnr0Cj+DdFA1D3USTnmushLvw
	XOZeWeTSmeS5pjpEEGN5HNnT8CvAUbtHucyt8kXzvNmpJb+i79K1hp1bWXVxMtxo9Le4+HNdf5eMI
	4R5LancPgUa6gA/y8j40ZBg3hajemzJ9hYb5z95IaHmMobxjQsT/k7sgSg00N3hl6xaxy/nfpYTcY
	QVxoa+6joPVLcX8Ckyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLk5-00000008kvH-1GBA;
	Thu, 29 Oct 2026 08:44:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLk3-00000008ku9-14mm
	for ath11k@lists.infradead.org;
	Thu, 29 Oct 2026 08:44:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7274041FE6;
	Thu, 29 Oct 2026 08:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483F51F01828;
	Thu, 29 Oct 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263450;
	bh=NUoVKO4u1i9msND1k3Skax2mOLj1SPEw/WwPEoecEyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ISwL3c+2iRpXyO9egBLaJ8kSaif+l8RfruKdWfWhN3Or0bjihi1E+Z+oDfauX5qVq
	 2eJMsfxxmwXQ2EmdgRntjngwnfnGOM6PLjkN+kXFs7qTeX+CvDwmXiC/u2f6xpyAE9
	 TDHa+mqdcaro6vVVah93Fa7gZC4xwemuSCdDWkLHHzHw8+w+moQXezb/+OCuSo/pNM
	 z6yNugBtrA74wtEwxBB7hGruNnph54PH66Er6kMTXp4hC75//yz0MX5ssVmAOsFBgk
	 BRyY4Nj7nnF6eCrAqqNiEjrCKoHUyRaoItEhVg2O/bjALrN0GsldHwUvSfi/8okENX
	 w6ebV3s4Kb29g==
Message-ID: <be98ff8a-2124-472a-8072-aa7e6d3b4893@kernel.org>
Date: Thu, 29 Oct 2026 10:43:56 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Unprepare MHI on power up failure
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20261028104336.1686334-1-vz@kernel.org>
 <e67e9442-03d3-425f-85d9-0983a16ae5f7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <e67e9442-03d3-425f-85d9-0983a16ae5f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Baochen.

On 10/29/26 07:38, Baochen Qiang wrote:
> 
> 
> On 10/28/2026 6:43 PM, Vladimir Zapolskiy wrote:
>> If MHI power up fails, for instance it happens due to a missing firmware,
>> ath11k_mhi_start() returns without undoing mhi_prepare_for_power_up().
>> Then the failed probe or power up unwinding frees the MHI controller,
>> but the MHI device context and the RDDM image table allocated by
>> mhi_prepare_for_power_up() are leaked along with their DMA buffers:
>>
>>    % cat /sys/kernel/debug/kmemleak
>>    unreferenced object 0xffff00079156a140 (size 64):
>>      comm "(udev-worker)", pid 595, jiffies 4294893781
>>      hex dump (first 32 bytes):
>>        00 d0 f1 80 00 80 ff ff 00 50 f1 80 00 80 ff ff  .........P......
>>        00 d0 f7 80 00 80 ff ff 00 30 fc ff 00 00 00 00  .........0......
>>      backtrace (crc 62662f0a):
>>        kmemleak_alloc+0x34/0x40
>>        __kmalloc_cache_noprof+0x224/0x3b8
>>        mhi_prepare_for_power_up+0x58/0x548 [mhi]
>>        ath11k_mhi_start+0x30/0xb8 [ath11k_pci]
>>        ath11k_pci_power_up+0xcc/0x188 [ath11k_pci]
>>        ath11k_core_init+0x8c/0x190 [ath11k]
>>        ath11k_pci_probe+0x4e0/0x870 [ath11k_pci]
>>        local_pci_probe+0x40/0xa8
>>        pci_call_probe+0x64/0x190
>>        pci_device_probe+0xac/0x138
>>        really_probe+0xbc/0x298
>>        __driver_probe_device+0x16c/0x19c
>>        driver_probe_device+0x3c/0x114
>>        __driver_attach+0x98/0x19c
>>        bus_for_each_dev+0x74/0xd0
>>        driver_attach+0x24/0x30
>>    unreferenced object 0xffff0007916fb800 (size 512):
>>      comm "(udev-worker)", pid 595, jiffies 4294893781
>>      hex dump (first 32 bytes):
>>        00 60 04 81 00 80 ff ff 0a 00 00 00 00 00 00 00  .`..............
>>        00 10 e0 82 00 80 ff ff 00 00 00 00 00 00 00 00  ................
>>      backtrace (crc 52e9e075):
>>        kmemleak_alloc+0x34/0x40
>>        __kmalloc_noprof+0x280/0x440
>>        mhi_alloc_bhie_table+0x54/0x168 [mhi]
>>        mhi_prepare_for_power_up+0x318/0x548 [mhi]
>>        ath11k_mhi_start+0x30/0xb8 [ath11k_pci]
>>        ath11k_pci_power_up+0xcc/0x188 [ath11k_pci]
>>        ath11k_core_init+0x8c/0x190 [ath11k]
>>        ath11k_pci_probe+0x4e0/0x870 [ath11k_pci]
>>        local_pci_probe+0x40/0xa8
>>        pci_call_probe+0x64/0x190
>>        pci_device_probe+0xac/0x138
>>        really_probe+0xbc/0x298
>>        __driver_probe_device+0x16c/0x19c
>>        driver_probe_device+0x3c/0x114
>>        __driver_attach+0x98/0x19c
>>        bus_for_each_dev+0x74/0xd0
>>
>> The MHI device is already powered down by mhi_sync_power_up() on
>> failure, but mhi_unprepare_after_power_down() still has to be
>> called on error path to release the allocated resources.
>>
>> Fixes: 3df6d74aedfd ("ath11k: mhi: use mhi_sync_power_up()")
>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
>> ---
>>   drivers/net/wireless/ath/ath11k/mhi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
>> index a6c9ff112c68..76c194573ec7 100644
>> --- a/drivers/net/wireless/ath/ath11k/mhi.c
>> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
>> @@ -446,6 +446,7 @@ int ath11k_mhi_start(struct ath11k_pci *ab_pci)
>>   	ret = mhi_sync_power_up(ab_pci->mhi_ctrl);
>>   	if (ret) {
>>   		ath11k_warn(ab, "failed to power up mhi: %d", ret);
>> +		mhi_unprepare_after_power_down(ab_pci->mhi_ctrl);
> 
> For the probe path itself this is fine: when probe fails the driver is not bound, so no
> remove or shutdown follows and this is the only unprepare.
> 
> The problem is that in runtime, ath11k_hif_power_up() is also called from reset and resume:
> 
> reset:
> 	ath11k_core_reset() {
> 		...
> 		ath11k_hif_power_up()
> 	}
> 
> resume:
> 	ath11k_core_resume_early() {
> 		...
> 		ath11k_hif_power_up()
> 	}
> 
> The later teardown in rmmod path or shutdown path then calls power_down unconditionally,
> regardless of whether the last power_up succeeded:
> 
> rmmod:
>    mhi_unprepare_after_power_down()   <- 2nd call
>    ath11k_mhi_stop()
>    ath11k_pci_power_down()
>    ath11k_hif_power_down()
>    ath11k_core_deinit()
>    ath11k_pci_remove()
> 
> shutdown:
>    mhi_unprepare_after_power_down()   <- 2nd call
>    ath11k_mhi_stop()
>    ath11k_pci_power_down()
>    ath11k_pci_shutdown()
> 
> so the unprepare is called twice, while in the second call we can hit NULL pointer
> dereference or double free ...
> 
> This comes from the fact the existing code does not handle power up failure correctly in
> reset and resume. I don't see a proper solution to this, maybe we need a new flag telling
> us whether the unprepare has been done already ?

Thank you for your review!

Due to my check the analysis is correct, and apparently the proposed solution
will work also, but I'd prefer to introduce a "prepared" flag set right after
mhi_sync_power_up() successful return rather than to toggle "unprepared" flag.

By the way, there is a memory leak on error path in ath12 driver also, but
the rootcause and its solution are different, there is a missing state set to
ATH12K_MHI_DEINIT, if ATH12K_MHI_POWER_ON fails in ath12k_mhi_start().

After the testing I'll prepare a changeset including both fixes for review.

-- 
Best wishes,
Vladimir

