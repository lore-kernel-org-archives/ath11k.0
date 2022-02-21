Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602A2C433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kwk6h5h6T8Qv5BWjrANP4K4ootCXKI9x+g+rcKcjfOk=; b=hkyRlcytECKNd/
	CMyhITMnQAxQRPzWaxI2GHaz/kQ8riBM1reqyzYEh2vyM2FXVGWnvezyty7lnhj0rrgpbLpnaP3pL
	C2goaHhZm9p7Bq+XPfVvi/St+IIRqTyfUAQ3+ukwZSdDHONHJCMjgk4ULOaVgEtAM5+j8GeWlygWj
	zMsmYJAL+zzEeYIKsK/mG/yAVmZzljnlde7nvVxNAK02Vi3BjNaDkralzNiv+yGgFWVHGlWQYYN3I
	1bvwe4/z4gEvMdoeeJ62zmor7J2kAibkx8keLETe/gMdRJqgFwoMhvl5z7IBl1U5aKXAKTKdc8jAY
	/wtlEvQbg+a/huCNdx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM5ma-004qrO-Bb; Mon, 21 Feb 2022 10:19:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4rE-004Z6L-8F
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 09:19:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88D12608C4;
 Mon, 21 Feb 2022 09:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFEEC340EB;
 Mon, 21 Feb 2022 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645435187;
 bh=zWFf2DIgu11basYMV6UOcFEYQXmcDx6HRp6do0gP0RY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=b9ZpdI7Tz6WIjvBZ/hJiixAlZvMiaUf33cRWcYwv2XiMp5Fh0xsmlkLruN8w2b5XY
 mbDwXZ0kOTwyD9FAPI7XIsL44//pjjRs9fIpBfIcBODWE6EAZhBmJLK57xGWGkr9hk
 +lPeTzYQliz2+yKqe7Qx00bTaaVu9cOmRgwYZ9iRdQPUy1l+S2rfMi0U7QU/re3Nen
 lut8gB6X+dcL5PnQ9yAOaOAIWPQL4c3UxcJySPVMULFxUQMVYKDcSm8qmAtfy3kmLQ
 ia+OJU4m34IOxPaCJqJLZ9pjyf98tlF9dOeAa8fDmUJyxMcoCPI4pMXn1AmaC12Nkn
 gYMulX6Ptq8sQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 02/19] ath11k: Refactor PCI code to support hybrid bus
 devices
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-3-git-send-email-quic_mpubbise@quicinc.com>
 <87h79of470.fsf@kernel.org>
 <9acca69c-3d5d-b6b9-b5ca-c2411e206908@quicinc.com>
Date: Mon, 21 Feb 2022 11:19:44 +0200
In-Reply-To: <9acca69c-3d5d-b6b9-b5ca-c2411e206908@quicinc.com> (Manikanta
 Pubbisetty's message of "Mon, 21 Feb 2022 13:34:14 +0530")
Message-ID: <871qzwzidr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_011948_413753_83D2C3D6 
X-CRM114-Status: GOOD (  17.11  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> On 1/28/2022 5:43 PM, Kalle Valo wrote:
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>
>>> Unlike other ATH11K PCIe devices which are enumerated by APSS
>>> processor (Application Processor SubSystem), WCN6750 gets
>>> enumerated by the WPSS Q6 processor (Wireless Processor SubSystem);
>>> In simple terms, though WCN6750 is PCIe device, it is not attached
>>> to the APSS processor, APSS will not know of such a device being
>>> present in the system and therefore WCN6750 will be registered as
>>> a platform device to the kernel core like other supported AHB
>>> devices.
>>>
>>> WCN6750 uses both AHB and PCI APIs for it's operation, it uses
>>> AHB APIs for device probe/boot and PCI APIs for device setup
>>> and register accesses; Because of this nature, it is referred
>>> as a hybrid bus device.
>>>
>>> Refactor PCI code to support hybrid bus devices like WCN6750.
>>>
>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>
>> [...]
>>
>>> --- /dev/null
>>> +++ b/drivers/net/wireless/ath/ath11k/pci_cmn.c
>>
>> [...]
>>
>>> +static inline void ath11k_pci_select_window(struct ath11k_pci *ab_pci, u32 offset)
>>> +{
>>> +	struct ath11k_base *ab = ab_pci->ab;
>>> +
>>> +	u32 window = FIELD_GET(ATH11K_PCI_WINDOW_VALUE_MASK, offset);
>>> +
>>> +	lockdep_assert_held(&ab_pci->window_lock);
>>> +
>>> +	if (window != ab_pci->register_window) {
>>> +		iowrite32(ATH11K_PCI_WINDOW_ENABLE_BIT | window,
>>> +			  ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
>>> +		ioread32(ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
>>> +		ab_pci->register_window = window;
>>> +	}
>>> +}
>>
>> So the style used in ath11k is ath11k_<filename>_foo, so that a function
>> ath11k_pci_foo() should be in pci.c. This patch is now breaking that
>> style. Maybe pci_cmn.c should renamed to cpci.c, pcic.c or something
>> like that? Then the function prefix could be ath11k_cpci_, ath11k_pcic_
>> or similar.
>>
>
> Makes sense, pcic.c and ath11k_pcic_* looks better, I'll make these changes.

Of course another possiblity, which I forgot to mention in my previous
email, is to keep pci_cmn.c filename but rename the functions to
ath11k_pci_cmn_foo(). Though don't know which one is better.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
