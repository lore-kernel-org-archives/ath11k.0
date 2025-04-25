Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BC8C369C2
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4DUDdg/nGvqN1UdcxVddkB5BkoJ1f3+rZUXbIsl6cU=; b=smplRxxd2q7b6kqK2DYfl9BBw+
	PmGxukAOvSLlcceQMNqAUbu/xI4lgtog7ZU6arbWbOFv8tjPEXwhI/dQwEEfk/a6dDU/2KTlbXwp1
	MthL/GF7yMVzOT1HDMSYASSIVMkCH2osZwQxCVDvEOBtTPkchV+Ui/n9K3213DCt+W+dDVnMKH/gt
	dL1/lamCITc6jShYod6vdAesOHluwF00bxLJqXPM3ylQDbAKDMtGe/1PdQlWQA9ca7Zh2WHy34DLW
	k4+4c8DlrPTF1GDQNQwvnBn/oDsoglRo/UAFjVrekdnwwXZMI74k55ISpEipPAxMAQV1B3RA1hdwU
	RSAaR8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ima-0000000HDuE-07jP;
	Fri, 25 Apr 2025 13:07:56 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HRd-0000000H0AE-1vkU
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 11:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745581316; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ATO62M49i6OKXGbXEsqzcVCpnUqkaDPw41NH+jE9uXMYRr4A4p2GnT2e0ExLoNzJYGZ6GttFkpGgICVCqQngHe8+x4QlmH61vOP07dPzlGvfOOsVfd4vVgth8vpIrq2T4mVivjRtmjIBRsjcOEFelzTs66eAlHm37O6yz5T376Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745581316; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l4DUDdg/nGvqN1UdcxVddkB5BkoJ1f3+rZUXbIsl6cU=; 
	b=Wl8eOBZW8/wRHV/gJMpTqYzRfliBCChHOlLNx29kS1HVg2S5FQGYP+5/Ca7vK9csP/rUT4XZjctRmffH3h9BJpETshlcRklQKmL1kCbsgjs5JiEXyNkz2fIqzdgp9m5jfYUVt/3it37EOCG/8eD2oafhiLBQ+gfqBw8CX0Dlwm4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745581316;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=l4DUDdg/nGvqN1UdcxVddkB5BkoJ1f3+rZUXbIsl6cU=;
	b=KjRgrNMd+H1um2Hg8ung+jJ23G975Y9PLhHqT5paYiZ0mF18EGWqr9wlZRxNU1P8
	YjGYi2bAbmEGxGhCj6Lo/aQSfqsRexvLRKagUlK+LBmKKEi2ZWwmai+dA4QflPJA1b2
	rlHBTSYt1sYqeLLFRGJRxGE7hjRatpYkBqjjdGdg=
Received: by mx.zohomail.com with SMTPS id 1745581313535618.4441025554677;
	Fri, 25 Apr 2025 04:41:53 -0700 (PDT)
Message-ID: <a403eb91-c90d-444c-b508-c428a8ef1447@collabora.com>
Date: Fri, 25 Apr 2025 16:41:43 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>,
 Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kunwu Chan <chentao@kylinos.cn>, kernel@collabora.com, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
 <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
 <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
 <4d87ef88-3533-4255-adc6-6c268818fe25@collabora.com>
 <y5odcxzms6mwpz5bdxhbjxo7p6whsdgwm772usmmzqobhf6nam@p4ul7vn7d3an>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <y5odcxzms6mwpz5bdxhbjxo7p6whsdgwm772usmmzqobhf6nam@p4ul7vn7d3an>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_044213_542622_A57D5B67 
X-CRM114-Status: GOOD (  26.08  )
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

On 4/25/25 1:59 PM, Manivannan Sadhasivam wrote:
> On Fri, Apr 25, 2025 at 12:42:38PM +0500, Muhammad Usama Anjum wrote:
>> On 4/25/25 12:32 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Apr 25, 2025 at 12:14:39PM +0500, Muhammad Usama Anjum wrote:
>>>> On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
>>>>> On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
>>>>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>>>>> allocation. There is a crash report where at resume time, the memory
>>>>>> from the dma doesn't get allocated and MHI fails to re-initialize.
>>>>>> There may be fragmentation of some kind which fails the allocation
>>>>>> call.
>>>>>>
>>>>>
>>>>> If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
>>>>> workaround that in the device drivers. What is the guarantee that other drivers
>>>>> will also continue to work? Will you go ahead and patch all of them which
>>>>> release memory during suspend?
>>>>>
>>>>> Please investigate why the allocation fails. Even this is not a device issue, so
>>>>> we cannot add quirks :/
>>>> This isn't a platform specific quirk. We are only hitting it because
>>>> there is high memory pressure during suspend/resume. This dma allocation
>>>> failure can happen with memory pressure on any device.
>>>>
>>>
>>> Yes.
>> Thanks for understanding.
>>
>>>
>>>> The purpose of this patch is just to make driver more robust to memory
>>>> pressure during resume.
>>>>
>>>> I'm not sure about MHI. But other drivers already have such patches as
>>>> dma_direct_alloc() is susceptible to failures when memory pressure is
>>>> high. This patch was motivated from ath12k [1] and ath11k [2].
>>>>
>>>
>>> Even if we patch the MHI driver, the issue is going to trip some other driver.
>>> How does the DMA memory goes low during resume? So some other driver is
>>> consuming more than it did during probe()?
>> Think it like this. The first probe happens just after boot. Most of the
>> RAM was empty. Then let's say user launches applications which not only
>> consume entire RAM but also the Swap. The DMA memory area is the first
>> ~4GB on x86_64 (if I'm not mistaken). Now at resume time when we want to
>> allocate memory from dma, it may not be available entirely or because of
>> fragmentation we cannot allocate that much contiguous memory.
>>
> 
> Looks like you have a workload that consumes the limited DMA coherent memory.
> Most likely the GPU applications I think.
> 
>> In our testing and real world cases, right now only wifi driver is
>> misbehaving. Wifi is also very important. So we are hoping to make wifi
>> driver robust.
>>
> 
> Sounds fair. If you want to move forward, please modify the exisiting
> mhi_power_down_keep_dev() to include this partial unprepare as well:
> 
> mhi_power_down_unprepare_keep_dev()
> 
> Since both APIs are anyway going to be used together, I don't see a need to
> introduce yet another API.
I've looked at usages of mhi_power_down_keep_dev(). Its getting used by
ath12k and ath11k both. We would have to look at ath12k as well before
we can change mhi_power_down_keep_dev(). Unfortunately, I don't have
device using ath12k at hand.

Should we keep this new API or what should we do?

> 
> - Mani
> 
>>>
>>>> [1]
>>>> https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
>>>> [2]
>>>> https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
>>>>
>>>> What do you think can be the way forward for this patch?
>>>>
>>>
>>> Let's try first to analyze why the memory pressure happens during suspend. As I
>>> can see, even if we fix the MHI driver, you are likely to hit this issue
>>> somewhere else.>
>>> - Mani
>>>
>>>>>
>>>
>>> [...]
>>>
>>>>> Did you intend to leak this information? If not, please remove it from
>>>>> stacktrace.
>>>> The device isn't private. Its fine.
>>>>
>>>
>>> Okay.
>>>
>>> - Mani
>>>
>>
>>
>> -- 
>> Regards,
>> Usama
> 


-- 
Regards,
Usama

