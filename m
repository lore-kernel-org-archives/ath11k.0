Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DB6C369D1
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1A1UyE1ArDNBmuD9T7lBr0kbJd8hCw/QiuuSdI6FFkk=; b=QvkCbv0Sc9HTAqSRzOfKS91fre
	w39uGemxRzFcDUekh9M9DHvwGekHkOIRj3SqKS0rt5YYoWKt/TeCdOacZsKefAtMOweB0iywSTFO8
	lMoxNrpXo+k4j7Gv5UAFS+XSS38WkitnhMdQD3q62fIvg8OhAxUM8QIoYZunWrky2/XmkTqq889kv
	zMvFns0AEYK5ehvReUYgFY6ZV6Ztacd8tIUFrKkvnZ9jjReCuGhpUg9CcqjbU0JlrbGhUpfsG8mrj
	PS7l+H46omIuzqk1bBvu/dZdJDTRbCuzedn/MCYxMstHJC2SThLXT8WiBxEabOmzPTWE1iSlSVAiS
	9nOwuoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DJ2-0000000GAOb-0Vlx;
	Fri, 25 Apr 2025 07:17:04 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DHd-0000000GA5e-1iNL
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 07:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745565290; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YyQgNK8HmwLBQP4OOWsBKMVEzu6HZKCu7JIRNVf8SGC7gPtyCeDwKNoTvn5seWl78nwevm2wWKj4L3Ebo7INFHOOj3U2Iz1Zh1ZldL2eYALoqF6W0HotVexxfPEmNl9l+G1A1GTF3p16bo7FBmil3J5WlTm7ZTUHxfWUY6XSxIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745565290; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1A1UyE1ArDNBmuD9T7lBr0kbJd8hCw/QiuuSdI6FFkk=; 
	b=ff5Ur5fQTTDGMgxynufXRjKyetG6JFTfAxwmh69Y1spCstClmqpTlqEwZ9udGRpqLUsbB4TbIVCYFcmlyMBfyHYCYZWvG/l5qgs5/OGjHrfGVXcgZBsb1VelN/IMgxPxgx2pOhDjctKftNqvQajyABNfCvoN7KHySdrurBO+j2I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745565290;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1A1UyE1ArDNBmuD9T7lBr0kbJd8hCw/QiuuSdI6FFkk=;
	b=b2lKQNy15zGClN03B/PSKhyixTKv1b7hPjazsoSqmucX4rOZ2kH87/M8/tknr1Ud
	HaZ5xeiazUrtQ6EXSZquFQy9IMGac0g31oXuZqylSFI1WgMWNEsAqdQblZaBeNoRMh3
	ZEj6TD5xI/6PcNtCGo15aA4YIOjtymcUnG6GqG2g=
Received: by mx.zohomail.com with SMTPS id 1745565289014360.3511868676079;
	Fri, 25 Apr 2025 00:14:49 -0700 (PDT)
Message-ID: <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
Date: Fri, 25 Apr 2025 12:14:39 +0500
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
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_001537_517083_F16CF354 
X-CRM114-Status: GOOD (  20.29  )
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

On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
>> Fix dma_direct_alloc() failure at resume time during bhie_table
>> allocation. There is a crash report where at resume time, the memory
>> from the dma doesn't get allocated and MHI fails to re-initialize.
>> There may be fragmentation of some kind which fails the allocation
>> call.
>>
> 
> If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
> workaround that in the device drivers. What is the guarantee that other drivers
> will also continue to work? Will you go ahead and patch all of them which
> release memory during suspend?
> 
> Please investigate why the allocation fails. Even this is not a device issue, so
> we cannot add quirks :/
This isn't a platform specific quirk. We are only hitting it because
there is high memory pressure during suspend/resume. This dma allocation
failure can happen with memory pressure on any device.

The purpose of this patch is just to make driver more robust to memory
pressure during resume.

I'm not sure about MHI. But other drivers already have such patches as
dma_direct_alloc() is susceptible to failures when memory pressure is
high. This patch was motivated from ath12k [1] and ath11k [2].

[1]
https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
[2]
https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/

What do you think can be the way forward for this patch?

> 
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
> 
> Did you intend to leak this information? If not, please remove it from
> stacktrace.
The device isn't private. Its fine.

> 
> - Mani
> 


-- 
Regards,
Usama

