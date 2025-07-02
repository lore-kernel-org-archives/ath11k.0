Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F13C83F10
	for <ath11k@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vToI/q0SLNdevcT5MHyyQG4DzTsgKvzxpzAhoFP37GM=; b=Amv3c+XZB1m1+L3QgTMGLa4TCM
	vaVfbh9TNoxzeA+QqEDphun+yl93w8g6CHH5MhlXV4B2mTiyBvrZynVZfv+osh6xjkWy+R9xS88ol
	QPHFfOuOBeaQIca0EYxIcb3ryK3oYEJRGC/AS3z/EiDLJfD7C8YP5VrFpSpAwGUxhjUsUBlcaJfe7
	NqR4ejD/sZKqiamVCsKXCh5AzvFNfBDPwsQA1j6FjwyOEDDvilIDoitejIzGgQERuA3RqfSUEMwcd
	xFM100hXKYe1ZZjxv3/HFUY2gxsjnoYA1+4xy3vT5RqMm5QhuAKosmFCWLGOqtYqiWoBJnhbMhAXY
	FNQxEO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VL-00000008zXE-2EeH;
	Wed, 02 Jul 2025 16:40:15 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzON-00000008nL5-2KvE
	for ath11k@lists.infradead.org;
	Wed, 02 Jul 2025 15:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751470104; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SRAugPz6P+3S6Ww1NMrFW+rBm8a+V/pHxmp0f5e9ImTqsgawHg7mJ3Xv9atJN5EKT1ZGw8mwJRFq1hX7WPxk1CMyR2dPjoyHcLt+xkq8x6mI7GysxsLtbA4Ds0cxxe6uJUN7IYYTTKw4cx3BI+QILpcUI9pyfjn1h07LFLqZsEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751470104; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vToI/q0SLNdevcT5MHyyQG4DzTsgKvzxpzAhoFP37GM=; 
	b=nT+2wCpivFckHAfh8BQVmjtTtjGhJuqX+kjQ778zgcWJ3Jmqpis2mWAbdbLKFmMss1DyOVPrCQ9qJ18+ftHPw+yzClb5wrtrPRTQwTby6V4zvD7qN9orRHbZAK++NesCIC3GZJxIOQjXXAd5gEKAmT3AKsyunyBVt22WEQi+O3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751470104;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vToI/q0SLNdevcT5MHyyQG4DzTsgKvzxpzAhoFP37GM=;
	b=CuThlUxt/Ev8mupL8U0sZk7gy1qW3SfjKatxNKRlQuqNCOSgV3j+CfBgEql6mOSR
	i6SLjaLJfhb/hEp1z4LZ7ipJk62qa1BFHIH2LjXjOVK7PuNYDJnYP4IeWWmkSAPcewL
	h1YyybETUyOAT4RKpRGgY+YaSBtbtQZTzLJRUSms=
Received: by mx.zohomail.com with SMTPS id 1751470102160518.2344574890795;
	Wed, 2 Jul 2025 08:28:22 -0700 (PDT)
Message-ID: <defad9df-e248-48d2-a3b6-3f057c6f0b76@collabora.com>
Date: Wed, 2 Jul 2025 20:28:13 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Youssef Samir <quic_yabdulra@quicinc.com>,
 Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
 Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Siddartha Mohanadoss <smohanad@codeaurora.org>,
 Sujeev Dias <sdias@codeaurora.org>, Julia Lawall <julia.lawall@lip6.fr>,
 John Crispin <john@phrozen.org>, Muna Sinada <quic_msinada@quicinc.com>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
 <855ae20a-3675-4cce-b87d-6f25fb69e0a8@oss.qualcomm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <855ae20a-3675-4cce-b87d-6f25fb69e0a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082859_659138_6EC21460 
X-CRM114-Status: GOOD (  16.08  )
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

Thank you for reviewing!

On 7/1/25 7:49 PM, Jeff Johnson wrote:
> On 6/30/2025 12:43 AM, Muhammad Usama Anjum wrote:
> 
> Subject has incorrect prefix, should be "wifi: ath11k: "
> 
> And ideally it should mention HAL SRNG since it is specific to that allocation
I'll fix the subject.

> 
>> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
>> deallocated and there is high possibility that we'll not be able to get
>> the same memory allocated from dma when there is high memory pressure.
>>
>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> not quite the right format since it is missing hw version and bus
I've been using the same tag from last accepted patches. How to construct the
correct patch?

> 
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>> index 4488e4cdc5e9e..bc4930fe6a367 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>  	mutex_unlock(&ab->core_lock);
>>  
>>  	ath11k_dp_free(ab);
>> -	ath11k_hal_srng_deinit(ab);
>>  
>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>  
>> -	ret = ath11k_hal_srng_init(ab);
>> -	if (ret)
>> -		return ret;
>> -
>>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>>  
>>  	ret = ath11k_core_qmi_firmware_ready(ab);
> 
> does this patch have any dependency upon the 1/3 patch?
No

> if not, then it should be sent separately since it should go through the ath
> tree instead of through the mhi tree.
Ohh... I see. I'll send it separately.

> 
> /jeff


