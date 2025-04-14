Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F408C369B2
	for <ath11k@archiver.kernel.org>; Mon, 14 Apr 2025 07:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6Hcb7CoSvel25wAUR0OKJ4456sj4HsUlowzVIyObhI=; b=qLoV9hklPjSL9QgR5duqkdxXxL
	wv6ypFI1RC9SGTAj3eaOEzmSfjHlahHiUQjv/QCRwt+/T6tVUF4iEi4HdnEkBzVAV7h4q98U+fJ26
	W5NeSRdTBM0rYQIJWUiMhgJ4GPv2CHtunKI+cd9hgDg0GS+DhqTpsebQ3DwUi08SGt+QxPrMnPcYc
	0VmN0K4kS7Jae2b/dCnd//Zh38m1OuZ89qQBotuBjA6On7s/y5xCf20/LgJkMR8PpANPt5Pf7cFPI
	rX6vtjtjkR/hbKgU8kR/SS6G9n/pQRin+Z1uSb7lUYD1BS82mkEneeYZV5GinT+ygI/aUBeigQ2wT
	ctdx8pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EJa-00000000wHi-46P9;
	Mon, 14 Apr 2025 07:33:10 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EJY-00000000wGs-2Brc
	for ath11k@lists.infradead.org;
	Mon, 14 Apr 2025 07:33:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744615967; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S0354nrgj9hb6NeQadl1Jgb85f2XZ6MReFCZUBNsZDdDAzQrzRFwGnwr8EweP211SA50Xn4y+hioKW/Bz7wmSJyQzWGG86Adf+RIiSkVsJrAFwnk++2k92Nh+A0bocClaD6qEvMeHhwgCJW3OQZKy63j5AuNqVz9pD0HTHtwTRk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744615967; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r6Hcb7CoSvel25wAUR0OKJ4456sj4HsUlowzVIyObhI=; 
	b=Qqza8kx+/OPX6Vbfz/xlS+1wWb4D/S0YtI/H9orFvcpgSpGFzTD7ZWXicQMorRRfkLY8zw0Zasu2X+LL5lPj0154UKv9ZEh+w1uw3aNmD0SyOa03w9DM4n1pwHykJNqkny8yw6F3vlYRtsis62vfJZSL6b8wVLirN7KXsEnTp8A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744615967;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=r6Hcb7CoSvel25wAUR0OKJ4456sj4HsUlowzVIyObhI=;
	b=dw158rFsigQq+3WvSfq3Kgi3Rvj53BgokKnVLW2u3VAHfgNngg/+0puXeBCjJE+y
	/UGjtVvi3ANtObQaDu9BNvu0glsKVKO/GPUw9KS+PaIttwYgkUOw3xT4m8cT96ClSuA
	71V/M5BsqaGYHQ1v/2k7u++MKga8gbd8jKW1CeHc=
Received: by mx.zohomail.com with SMTPS id 1744615966149258.692739802746;
	Mon, 14 Apr 2025 00:32:46 -0700 (PDT)
Message-ID: <7d6b074c-8499-4984-b235-d1285b006ab3@collabora.com>
Date: Mon, 14 Apr 2025 12:32:34 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson
 <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>,
 Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kunwu Chan <chentao@kylinos.cn>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: kernel@collabora.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <ba09ae0c-fe8d-8f4e-a1b8-9c7e5913c84e@quicinc.com>
 <fc9ca0da-9f6a-42b5-aa79-abcd43c97043@collabora.com>
 <e0159cb8-fe21-7f71-1ebe-744ed26bd698@quicinc.com>
 <85580a01-289a-461b-b0f1-38fa1b96717c@collabora.com>
 <1c0b2217-49d9-360c-ed60-db517eaf2ccc@quicinc.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <1c0b2217-49d9-360c-ed60-db517eaf2ccc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_003308_643237_80A30E24 
X-CRM114-Status: GOOD (  15.63  )
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

On 4/12/25 6:22 AM, Krishna Chaitanya Chundru wrote:
> 
> On 4/12/2025 12:02 AM, Muhammad Usama Anjum wrote:
>> On 4/11/25 1:39 PM, Krishna Chaitanya Chundru wrote:
>>>
>>>
>>> On 4/11/2025 12:32 PM, Muhammad Usama Anjum wrote:
>>>> On 4/11/25 8:37 AM, Krishna Chaitanya Chundru wrote:
>>>>>
>>>>>
>>>>> On 4/10/2025 8:26 PM, Muhammad Usama Anjum wrote:
>>>>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>>>>> allocation. There is a crash report where at resume time, the memory
>>>>>> from the dma doesn't get allocated and MHI fails to re-initialize.
>>>>>> There may be fragmentation of some kind which fails the allocation
>>>>>> call.
>>>>>>
>>>>>> To fix it, don't free the memory at power down during suspend /
>>>>>> hibernation. Instead, use the same allocated memory again after every
>>>>>> resume / hibernation. This patch has been tested with resume and
>>>>>> hibernation both.
>>>>>>
>>>>>> The rddm is of constant size for a given hardware. While the
>>>>>> fbc_image
>>>>>> size depends on the firmware. If the firmware changes, we'll free and
>>>>> If firmware image will change between suspend and resume ?
>>>> Yes, correct.
>>>>
>>> why the firmware image size will change between suspend & resume?
>>> who will update the firmware image after bootup?
>>> It is not expected behaviour.
>> I was trying to research if the firmware can change or not. I've not
>> found any documentation on it.
>>
>> If the firmare is updated in filesystem before suspend/hibernate, would
>> the new firwmare be loaded the next time kernel resumes as the older
>> firmware is no where to be found?
>>
>> What do you think about this?
>>
> I don't think firmware can be updated before suspend/hibernate. I don't
> see any reason why it can be updated. If you think it can be updated
> please quote relevant doc.
I've not found any documentation on it. Let's wait for others to review
and it it cannot be updated, I'll remove this part.

-- 
Regards,
Usama

