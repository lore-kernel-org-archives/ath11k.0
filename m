Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03051C433FE
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJECFRXT/W3Y+7iv3Ht5erT6/nH75z87a3g1fiAMpLg=; b=0WcCb+2dMo5YR3
	XPtCJ8i1gC64I6S/17LQ/ypsuqvuSBOg6c6a7RfdvC91iboWj3bmcM4nGNYug0rIRb33mNYRXIOyO
	dq0iLF1OAlD3DoRg7BEd5kQc6aLYHeSK5aa6fxJ+KYYKGIo3H/wFCliGCQ4mFnuglyYOxpmJb48QM
	+J4E9L1auyhecVFRWLNO1NNAFpwJUPBUuxvKY2ZDZGexGodpPT4VkviCZ3EhHXXb5s4uagHH0/mCk
	syhRE2OVl1SAjYiNgBw+iKFmcn0cm49htAbKR0WhczBnfwwzUECnh/75gotKb6NY3l5VT4oYin2jT
	Hf08PTqXEFf+HQSQbLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6HY-00575x-DC; Mon, 21 Feb 2022 10:51:04 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5nC-004rE7-KM
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 10:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645438782; x=1676974782;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9Lvkdrfwn4Se5WxxxQS9bol5uM0W7Ns0n6IHIzV9UPU=;
 b=S+u7r5cgV+9M7aYG+KqBpraVtemaNkU9cw4at97ui0dSNnbykAcqyDKH
 5k9Do1lMyaGoMygyMx5mkSfpUl2idbIp1cbn+0a2y41XGEOnxjpo6rY8k
 uj1H8tW0BhzxDvF3abQnmYqHaFDgxLQvglkg8VORV8OtsKJjRXsagqjuA s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Feb 2022 02:19:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 02:19:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 21 Feb 2022 02:19:40 -0800
Received: from [10.216.7.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 21 Feb
 2022 02:19:38 -0800
Message-ID: <b33be970-73ec-51c1-7552-677c71c53fd6@quicinc.com>
Date: Mon, 21 Feb 2022 15:49:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 02/19] ath11k: Refactor PCI code to support hybrid bus
 devices
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-3-git-send-email-quic_mpubbise@quicinc.com>
 <87h79of470.fsf@kernel.org>
 <9acca69c-3d5d-b6b9-b5ca-c2411e206908@quicinc.com>
 <871qzwzidr.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <871qzwzidr.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_021942_768103_967698FD 
X-CRM114-Status: GOOD (  13.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2/21/2022 2:49 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> On 1/28/2022 5:43 PM, Kalle Valo wrote:
>>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>>
>>>> Unlike other ATH11K PCIe devices which are enumerated by APSS
>>>> processor (Application Processor SubSystem), WCN6750 gets
>>>> enumerated by the WPSS Q6 processor (Wireless Processor SubSystem);
>>>> In simple terms, though WCN6750 is PCIe device, it is not attached
>>>> to the APSS processor, APSS will not know of such a device being
>>>> present in the system and therefore WCN6750 will be registered as
>>>> a platform device to the kernel core like other supported AHB
>>>> devices.
>>>>
>>>> WCN6750 uses both AHB and PCI APIs for it's operation, it uses
>>>> AHB APIs for device probe/boot and PCI APIs for device setup
>>>> and register accesses; Because of this nature, it is referred
>>>> as a hybrid bus device.
>>>>
>>>> Refactor PCI code to support hybrid bus devices like WCN6750.
>>>>
>>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>>
>>> [...]
>>>
>>>> --- /dev/null
>>>> +++ b/drivers/net/wireless/ath/ath11k/pci_cmn.c
>>>
>>> [...]
>>>
>>>> +static inline void ath11k_pci_select_window(struct ath11k_pci *ab_pci, u32 offset)
>>>> +{
>>>> +	struct ath11k_base *ab = ab_pci->ab;
>>>> +
>>>> +	u32 window = FIELD_GET(ATH11K_PCI_WINDOW_VALUE_MASK, offset);
>>>> +
>>>> +	lockdep_assert_held(&ab_pci->window_lock);
>>>> +
>>>> +	if (window != ab_pci->register_window) {
>>>> +		iowrite32(ATH11K_PCI_WINDOW_ENABLE_BIT | window,
>>>> +			  ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
>>>> +		ioread32(ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
>>>> +		ab_pci->register_window = window;
>>>> +	}
>>>> +}
>>>
>>> So the style used in ath11k is ath11k_<filename>_foo, so that a function
>>> ath11k_pci_foo() should be in pci.c. This patch is now breaking that
>>> style. Maybe pci_cmn.c should renamed to cpci.c, pcic.c or something
>>> like that? Then the function prefix could be ath11k_cpci_, ath11k_pcic_
>>> or similar.
>>>
>>
>> Makes sense, pcic.c and ath11k_pcic_* looks better, I'll make these changes.
> 
> Of course another possiblity, which I forgot to mention in my previous
> email, is to keep pci_cmn.c filename but rename the functions to
> ath11k_pci_cmn_foo(). Though don't know which one is better.
> 

I was contemplating on having ath11k_pci_cmn_* for a very long time; In 
fact, in the patches which I worked on had the pci_cmn prefix for all 
the APIs, I felt the prefix is long and dropped the idea :)

At least to me, pcic.c and ath11k_pcic* looked good.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
