Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC04FC369D1
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 07:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8tWFVeEPdpMtiUtY+e6f8fdZdq5OaJQE3ekwAwYymg=; b=ku4cTzK1d6lelRVDRvZyw0vMop
	NVZZhM5sqOVVU26slDVTx9InpKeZnpcGvZivTiYW9DGgSjU4iI5DXYhKt2RdCblekbvXvq/DTP4tB
	hkx/agyilmaBbKKR9qZsC7E7+daPwp/pDYCLx8/HBNxC4gtdJCevVWOBOUw7aTBi+tz4/ELfg56OF
	aH7ghjWUq6TvoI/BLD4sXg7328fV/Dq0bSRVolvxhKHXtcU1UJDJlVmTbQCRJEejDmOSbE7G9dv6W
	0oR30YZEYaxYQG5wTOK8oi0+kZmCuy5anU7WUZSiATf4eelBgemj3+CU9bwXMnS43ePjDsqdwPQ/P
	O/J2tpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DiJ-0000000GDfn-1may;
	Fri, 25 Apr 2025 07:43:11 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DiG-0000000GDfE-27YZ
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 07:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745566970; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JnQDKjYH3rYWCAwKmiyLBZ2hmlwp0/jemeMxGKdoBD3v02+NNczdU/EHbnloUIZvsYGwW+d1QSDGiD9/WzZk+LG9i1aMX3WwqqpnIXLvmr3sefkhoT48Lan5gNeh/RHVfQLWhRAhKkILOGLHQ41EPAqii3Uu5f2+TpqUeaOt4X8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745566970; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T8tWFVeEPdpMtiUtY+e6f8fdZdq5OaJQE3ekwAwYymg=; 
	b=nngvDYq6pk51V1sVhc3mTV2rbaOhDVdkJB4gt8OfGAmDBm2TFuwzQvM4CQX1hUt2hvbjOhAZFX0miga2pu1P4Pq0+wLLy0ACClwizXLCg0OYa07+MdOA8jEmAjC/USNXK+nmEF89uEd3oZJRtIubkEWTYVT26eI9nVh5NtbvYYg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745566970;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=T8tWFVeEPdpMtiUtY+e6f8fdZdq5OaJQE3ekwAwYymg=;
	b=Np4Ar/u5k/y7WTdImrJp1bJPZ3yjxCjUIudP8B4CtZ9Esy3hZKSvpNu5ql/TZwOJ
	khDO3sai5xoFSmT6JH1qrVZUuEyqzLP+yJSqtnyZGSUFAwADWYS1L+VcJ9opqhTVq/d
	uxq6Jdwp+bq5GjMllXqRx6J/q4y6iVAbIRRN8qLU=
Received: by mx.zohomail.com with SMTPS id 1745566967087809.0756023391033;
	Fri, 25 Apr 2025 00:42:47 -0700 (PDT)
Message-ID: <4d87ef88-3533-4255-adc6-6c268818fe25@collabora.com>
Date: Fri, 25 Apr 2025 12:42:38 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>,
 Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kunwu Chan <chentao@kylinos.cn>, kernel@collabora.com, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
 <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
 <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_004308_630502_5AFBC189 
X-CRM114-Status: GOOD (  24.70  )
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

On 4/25/25 12:32 PM, Manivannan Sadhasivam wrote:
> On Fri, Apr 25, 2025 at 12:14:39PM +0500, Muhammad Usama Anjum wrote:
>> On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
>>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>>> allocation. There is a crash report where at resume time, the memory
>>>> from the dma doesn't get allocated and MHI fails to re-initialize.
>>>> There may be fragmentation of some kind which fails the allocation
>>>> call.
>>>>
>>>
>>> If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
>>> workaround that in the device drivers. What is the guarantee that other drivers
>>> will also continue to work? Will you go ahead and patch all of them which
>>> release memory during suspend?
>>>
>>> Please investigate why the allocation fails. Even this is not a device issue, so
>>> we cannot add quirks :/
>> This isn't a platform specific quirk. We are only hitting it because
>> there is high memory pressure during suspend/resume. This dma allocation
>> failure can happen with memory pressure on any device.
>>
> 
> Yes.
Thanks for understanding.

> 
>> The purpose of this patch is just to make driver more robust to memory
>> pressure during resume.
>>
>> I'm not sure about MHI. But other drivers already have such patches as
>> dma_direct_alloc() is susceptible to failures when memory pressure is
>> high. This patch was motivated from ath12k [1] and ath11k [2].
>>
> 
> Even if we patch the MHI driver, the issue is going to trip some other driver.
> How does the DMA memory goes low during resume? So some other driver is
> consuming more than it did during probe()?
Think it like this. The first probe happens just after boot. Most of the
RAM was empty. Then let's say user launches applications which not only
consume entire RAM but also the Swap. The DMA memory area is the first
~4GB on x86_64 (if I'm not mistaken). Now at resume time when we want to
allocate memory from dma, it may not be available entirely or because of
fragmentation we cannot allocate that much contiguous memory.

In our testing and real world cases, right now only wifi driver is
misbehaving. Wifi is also very important. So we are hoping to make wifi
driver robust.

> 
>> [1]
>> https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
>> [2]
>> https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
>>
>> What do you think can be the way forward for this patch?
>>
> 
> Let's try first to analyze why the memory pressure happens during suspend. As I
> can see, even if we fix the MHI driver, you are likely to hit this issue
> somewhere else.>
> - Mani
> 
>>>
> 
> [...]
> 
>>> Did you intend to leak this information? If not, please remove it from
>>> stacktrace.
>> The device isn't private. Its fine.
>>
> 
> Okay.
> 
> - Mani
> 


-- 
Regards,
Usama

