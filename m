Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BB2C369A2
	for <ath11k@archiver.kernel.org>; Fri, 11 Apr 2025 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYLTZ5CkQVuq21T5qkOtaeudKbBcekBWkmXQi3p1ZZ4=; b=C/15QmkingL93QtcCMQ7dx2rgy
	+fK/BWiMCsDCliAxmLD7bvCXGzlvPs2SK/QI1C66fytn0Dsje2kce5uZhyEZ114ZiqZO6GYA3A15A
	pFfpZ3bdmiNT2YCQG0hmvg+8yOMrZVrsKeSerB8O7GSTRNhaOIknXQIM80YoIvVOQivDH6pLiK1fs
	WzXJzLAixaL7WiaYbjifWpiNhGfgWAYyMDdivLzn7gbxCARqf4fMU3yiAxECwa6a4hpcGKnsdcLw9
	8ikd1d+Rs7ZM0bUpwQcq/GNj7cb4GbvpOWBXGW4MtTMQwptGeyxrA/tOtephsW/46xvf0H4jsnGC/
	T4DCy88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Jlz-0000000Egz0-2dQX;
	Fri, 11 Apr 2025 19:10:43 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Jlx-0000000Egya-1IEw
	for ath11k@lists.infradead.org;
	Fri, 11 Apr 2025 19:10:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744398617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LagLz1ji2d+DnEKve4azrMvZmlXBIo4NrshvcOZdargy7OWmrCVvft/Rm1he0ETz76+SopBJFXNG3jtb/4VB3XzymM52MlUdtNAPuF3Rbd9cQ8it5ea49+EEPX/QWkJkZdw7E0klgr9tGpIjkEJeFtjcW7mwxXqo+EqiYzhz76w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744398617; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PYLTZ5CkQVuq21T5qkOtaeudKbBcekBWkmXQi3p1ZZ4=; 
	b=UioHXixN9lK66lVbd9bfa/pnre5hr5zkIHgxrU20aYlS7eFiYbpCmcZ9zQCx54s4alrWQyhlt66VL4gDTne6TS1TUrmmkqttNOuoz32lifcXLJ6gfwgEe4EVDU6rbZzRvP7TkxFy8YRhBYM3q8QHpOXL8bT0GbS44wHNtTp566M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744398617;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PYLTZ5CkQVuq21T5qkOtaeudKbBcekBWkmXQi3p1ZZ4=;
	b=QONFRYzxehMOqIFIanmhHOwk9RhOCetDN5s+tYC+ChTYjgQ+twqT1/1z9FX1pmgV
	SdU9HmOooRv4o4qKRB+XsU4U+ydO9X+/Zo7lRIasTsRJZ5N8/JG4k5I28u2O1FyjNA/
	DuM3x+1fRvKOWUkCpojljdKc7UsvlM7thdVTTcpo=
Received: by mx.zohomail.com with SMTPS id 1744398616272298.2588265790662;
	Fri, 11 Apr 2025 12:10:16 -0700 (PDT)
Message-ID: <1443e736-5e83-4125-b754-7a2972d48e24@collabora.com>
Date: Sat, 12 Apr 2025 00:10:06 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Yan Zhen <yanzhen@vivo.com>,
 Youssef Samir <quic_yabdulra@quicinc.com>, Qiang Yu
 <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kunwu Chan <chentao@kylinos.cn>
Cc: kernel@collabora.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <37ea52d5-11de-49c7-a676-ec47cca7f91b@oss.qualcomm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <37ea52d5-11de-49c7-a676-ec47cca7f91b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_121041_428898_720B7377 
X-CRM114-Status: GOOD (  24.92  )
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

Hi Jeff,

Thank you for reviewing.

On 4/11/25 9:10 PM, Jeff Hugo wrote:
> On 4/10/2025 8:56 AM, Muhammad Usama Anjum wrote:
>> Fix dma_direct_alloc() failure at resume time during bhie_table
>> allocation. There is a crash report where at resume time, the memory
>> from the dma doesn't get allocated and MHI fails to re-initialize.
>> There may be fragmentation of some kind which fails the allocation
>> call.
>>
>> To fix it, don't free the memory at power down during suspend /
>> hibernation. Instead, use the same allocated memory again after every
>> resume / hibernation. This patch has been tested with resume and
>> hibernation both.
>>
>> The rddm is of constant size for a given hardware. While the fbc_image
>> size depends on the firmware. If the firmware changes, we'll free and
>> allocate new memory for it.
>>
>> Here are the crash logs:
>>
>> [ 3029.338587] mhi mhi0: Requested to power ON
>> [ 3029.338621] mhi mhi0: Power on setup success
>> [ 3029.668654] kworker/u33:8: page allocation failure: order:7,
>> mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
>> [ 3029.668682] CPU: 4 UID: 0 PID: 2744 Comm: kworker/u33:8 Not tainted
>> 6.11.11-valve10-1-neptune-611-gb69e902b4338
>> #1ed779c892334112fb968aaa3facf9686b5ff0bd7
>> [ 3029.668690] Hardware name: Valve Galileo/Galileo, BIOS F7G0112
>> 08/01/2024
>> [ 3029.668694] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
>> [ 3029.668717] Call Trace:
>> [ 3029.668722]  <TASK>
>> [ 3029.668728]  dump_stack_lvl+0x4e/0x70
>> [ 3029.668738]  warn_alloc+0x164/0x190
>> [ 3029.668747]  ? srso_return_thunk+0x5/0x5f
>> [ 3029.668754]  ? __alloc_pages_direct_compact+0xaf/0x360
>> [ 3029.668761]  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
>> [ 3029.668774]  __alloc_pages_noprof+0x321/0x350
>> [ 3029.668782]  __dma_direct_alloc_pages.isra.0+0x14a/0x290
>> [ 3029.668790]  dma_direct_alloc+0x70/0x270
>> [ 3029.668796]  mhi_alloc_bhie_table+0xe8/0x190 [mhi
>> faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668814]  mhi_fw_load_handler+0x1bc/0x310 [mhi
>> faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668830]  mhi_pm_st_worker+0x5c8/0xaa0 [mhi
>> faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668844]  ? srso_return_thunk+0x5/0x5f
>> [ 3029.668853]  process_one_work+0x17e/0x330
>> [ 3029.668861]  worker_thread+0x2ce/0x3f0
>> [ 3029.668868]  ? __pfx_worker_thread+0x10/0x10
>> [ 3029.668873]  kthread+0xd2/0x100
>> [ 3029.668879]  ? __pfx_kthread+0x10/0x10
>> [ 3029.668885]  ret_from_fork+0x34/0x50
>> [ 3029.668892]  ? __pfx_kthread+0x10/0x10
>> [ 3029.668898]  ret_from_fork_asm+0x1a/0x30
>> [ 3029.668910]  </TASK>
>>
>> Tested-on: QCNFA765 WLAN.HSP.1.1-03926.13-
>> QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes sice v1:
>> - Don't free bhie tables during suspend/hibernation only
>> - Handle fbc_image changed size correctly
>> - Remove fbc_image getting set to NULL in *free_bhie_table()
>> ---
>>   drivers/bus/mhi/host/boot.c           | 15 +++++++++++----
>>   drivers/bus/mhi/host/init.c           | 13 ++++++++++---
>>   drivers/net/wireless/ath/ath11k/mhi.c |  9 +++++----
>>   include/linux/mhi.h                   |  7 +++++++
>>   4 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>> index 9dcc7184817d5..0df26100c8f9c 100644
>> --- a/drivers/bus/mhi/host/boot.c
>> +++ b/drivers/bus/mhi/host/boot.c
>> @@ -487,10 +487,17 @@ void mhi_fw_load_handler(struct mhi_controller
>> *mhi_cntrl)
>>        * device transitioning into MHI READY state
>>        */
>>       if (mhi_cntrl->fbc_download) {
>> -        ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>> fw_sz);
>> -        if (ret) {
>> -            release_firmware(firmware);
>> -            goto error_fw_load;
>> +        if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
>> +            mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>> +            mhi_cntrl->fbc_image = NULL;
>> +        }
>> +        if (!mhi_cntrl->fbc_image) {
>> +            ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl-
>> >fbc_image, fw_sz);
>> +            if (ret) {
>> +                release_firmware(firmware);
>> +                goto error_fw_load;
>> +            }
>> +            mhi_cntrl->prev_fw_sz = fw_sz;
> 
> This seems confusing.  Why do we care about the previous fw size when we
> care about the allocated bhie table size?
The table size depends on seg_size and alloc_size. The seg_size remains
same. While alloc_size would change if firmware size changes. So I'm
checking just firmware size here.

> Also, if the fw size is
> smaller than the allocated table size it looks like we'll do a free/
> alloc, when it seems like we could jsut use the memory we already have.
This can be done. I'll do it if we can find out if the firmware can
change at resume time or not.

> 
>>           }
>>             /* Load the firmware into BHIE vec table */
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index 059dc94d20bb6..65a47c712b3a0 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -382,6 +382,7 @@ struct mhi_controller {
>>       const char *fw_image;
>>       const u8 *fw_data;
>>       size_t fw_sz;
>> +    size_t prev_fw_sz;
> 
> No documentation?
Sorry, I'll add:
 * @prev_fw_sz: Previous firmware image data size, used when
fbc_download is true


> 
>>       const char *edl_image;
>>       size_t rddm_size;
>>       size_t sbl_size;
>> @@ -662,6 +663,12 @@ void mhi_power_down_keep_dev(struct
>> mhi_controller *mhi_cntrl, bool graceful);
>>    */
>>   void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl);
>>   +/**
>> + * mhi_partial_unprepare_after_power_down - Free any allocated memory
>> after power down partially
> 
> This looks like it exceeds 80 char.
> Also what is a "power down partially"?
Fixing it:
 * mhi_partial_unprepare_after_power_down - Free any allocated memory after
 * 					    power down other than fbc_image
 * 					    and rddm_image


> 
> 


-- 
Regards,
Usama

