Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8195C369A2
	for <ath11k@archiver.kernel.org>; Fri, 11 Apr 2025 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4VYQgUZUTAIbZwaL9rNIdwM4HSJ9e2mWGOC049gXec=; b=vNs533HX4Gx+wx+6IRPKcicDr+
	8HEwMWfY4L8/YD9idl+YQ165/86RwBrDXA7UyT2upl2VFN0UIDVhOg9ZNaOU6I52kGCcO89TZ927/
	4ISWlikwSXx2BL0VF/Sx1Ho3NPsByifWSNVnLiGd0BUVj0bDOS8y9l6pWooXnfCrqufBBnA10DW8E
	g0m4V8aCay9SZNNFcxc9/2LNlGL4Wv9BzBiWgWw4tEGXiDTrF3LjPrRQVX+Cpnwq7eoigfODu4jzq
	K4N5QuA0jyQ+cnAW0UNF1GnX/imII13WVoxIL5muT1sNudmPVre/w+nHzxowHkofYqlyVJyhEcLKi
	Smgvxxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3JSf-0000000EfhH-1Emx;
	Fri, 11 Apr 2025 18:50:45 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3JQM-0000000EfRY-2iIe
	for ath11k@lists.infradead.org;
	Fri, 11 Apr 2025 18:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744397285; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NQ2nvxaL5awMeOZSXUSpit+frxRsL9wjjd+2JHmizE+F72u7RJQxhnWC6GvclxBrFi6d2D00wrPNKKj3hyGKwbbedHzyJ3uhpzZ8n3BvzbCAgTdRho0itEd8OH5klBhDvBxEoSyTPjI3zhZy5ecIzLuVOPebAzsk7E3tt0AMpnI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744397285; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H4VYQgUZUTAIbZwaL9rNIdwM4HSJ9e2mWGOC049gXec=; 
	b=XzG5SoqDKtn2EA/+c4SPdgt+6sqn2ID+sbic2/sH3gseIBrP7Y+3M0ZO6Us5O+l5o+2h9R92WvZrmyJQ5dgfk/uor/G4FiJjSArOf4Jk6joqiYlYU2GGkVSLDf0/f0YaPD5AA6NnWy9qCEfprN2ODnst7ZjanRWbvie/JxnKxZg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744397285;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=H4VYQgUZUTAIbZwaL9rNIdwM4HSJ9e2mWGOC049gXec=;
	b=P3rhv1wqbnoFq5Cp5Oclw3g35slv6ZllfWNbUiBXcLOBGqix75vM+OGG3FyAuiww
	/KCZgHXtQHmh2zOxVgEHzr8SOqrasdPpvMuvHQYpWWnenkZa2qyEH4xqJnJJ5VV4H5B
	k14YHgidxE/KH/QYbGkkS2xQTYycAG45iAkenduw=
Received: by mx.zohomail.com with SMTPS id 1744397283575257.1353051014321;
	Fri, 11 Apr 2025 11:48:03 -0700 (PDT)
Message-ID: <6a2ad952-6a34-40d2-a6bc-f0f505fb9667@collabora.com>
Date: Fri, 11 Apr 2025 23:47:52 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>,
 Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>,
 Kunwu Chan <chentao@kylinos.cn>, kernel@collabora.com, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <2025041039-unhearing-undaunted-6244@gregkh>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <2025041039-unhearing-undaunted-6244@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_114822_728843_A387F85B 
X-CRM114-Status: GOOD (  16.07  )
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

On 4/10/25 10:00 PM, Greg Kroah-Hartman wrote:
> On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
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
>> [ 3029.668654] kworker/u33:8: page allocation failure: order:7, mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
>> [ 3029.668682] CPU: 4 UID: 0 PID: 2744 Comm: kworker/u33:8 Not tainted 6.11.11-valve10-1-neptune-611-gb69e902b4338 #1ed779c892334112fb968aaa3facf9686b5ff0bd7
>> [ 3029.668690] Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
>> [ 3029.668694] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
>> [ 3029.668717] Call Trace:
>> [ 3029.668722]  <TASK>
>> [ 3029.668728]  dump_stack_lvl+0x4e/0x70
>> [ 3029.668738]  warn_alloc+0x164/0x190
>> [ 3029.668747]  ? srso_return_thunk+0x5/0x5f
>> [ 3029.668754]  ? __alloc_pages_direct_compact+0xaf/0x360
>> [ 3029.668761]  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
>> [ 3029.668774]  __alloc_pages_noprof+0x321/0x350
>> [ 3029.668782]  __dma_direct_alloc_pages.isra.0+0x14a/0x290
>> [ 3029.668790]  dma_direct_alloc+0x70/0x270
>> [ 3029.668796]  mhi_alloc_bhie_table+0xe8/0x190 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668814]  mhi_fw_load_handler+0x1bc/0x310 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668830]  mhi_pm_st_worker+0x5c8/0xaa0 [mhi faa917c5aa23a5f5b12d6a2c597067e16d2fedc0]
>> [ 3029.668844]  ? srso_return_thunk+0x5/0x5f
>> [ 3029.668853]  process_one_work+0x17e/0x330
>> [ 3029.668861]  worker_thread+0x2ce/0x3f0
>> [ 3029.668868]  ? __pfx_worker_thread+0x10/0x10
>> [ 3029.668873]  kthread+0xd2/0x100
>> [ 3029.668879]  ? __pfx_kthread+0x10/0x10
>> [ 3029.668885]  ret_from_fork+0x34/0x50
>> [ 3029.668892]  ? __pfx_kthread+0x10/0x10
>> [ 3029.668898]  ret_from_fork_asm+0x1a/0x30
>> [ 3029.668910]  </TASK>
>>
>> Tested-on: QCNFA765 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes sice v1:
>> - Don't free bhie tables during suspend/hibernation only
>> - Handle fbc_image changed size correctly
>> - Remove fbc_image getting set to NULL in *free_bhie_table()
> 
> What commit id does this fix?
I think, these errors are happening because of the fragmentation. So
this patch is doing an improvement. Its hard to call it a fix for
something already added.

The following patch had added fbc_image allocation:
cd457afb1667
bus: mhi: core: Add support for downloading firmware over BHIe

The following commit had added rddm allocation:
3215d8e0691b
bus: mhi: core: Set BHI/BHIe offsets on power up preparation

Even if I want to add a fixes-by tag, it would be difficult to decide
which commit to chose. Maybe we divide the patch into 2 in these
scenarios or just select the earlier commit in Fixes tag. Please suggest
what is best way?

> 
> thanks,
> 
> greg k-h
> 


-- 
Regards,
Usama

