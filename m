Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37A8C433FE
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 07:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbKKvUY/gK4KQa7ROvtInL33vFVp75WinNami1fpu0U=; b=t/wzedOrYzBPE/
	4QcOU6/25r+NvEukdUmfN9k3yLiFeSoibRg3nvlFWoI/DIGMTiqNmJE7fD9EuJH6plWYRUIr29pQc
	YAje9YSxRO9laRjXIXn3aeMnP9YT/DkcHliE2Nv9z4DalQWmZ8xZpSDviIlcnefm5o82h+x6REjxG
	QNaIWkNefmnNBOkLSPJrxX4rlh1nxBGPE+/FhCf58PH6Tq4mvD/CtaS5kdxIT9Kmtof+VkFTpT/NX
	6EopPZewhYRBoG1d9MyjdYoD+zKw/b9kE51lKjO5840shs8oil44DL86QQ75WxOyOTFdg+CXRpp6n
	8iWJbqt9UUdoZdGWcn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2ne-003uzl-J8; Mon, 21 Feb 2022 07:07:58 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2nb-003uyg-K7
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 07:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645427276; x=1676963276;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sV7G7H3FRpvSMYsrKqiLWIsBg3WAv9FuYrMkuC4PuLg=;
 b=VfMgEsqWpraOMmM4RlG4YBlJu+JN7q0wSj6//u666OUnJ1uJl+fpORBn
 2CodKWI8HekGIAHQTuqdW+JKGElzw+fubfP/4SLIw/MzOorB8ZON4COri
 uEPC9faA+YHI8nzpsRLchiZgvRH4aZcRMY8pSqPbywJatLh8k1uuK2WHH Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 20 Feb 2022 23:07:51 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 23:07:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 20 Feb 2022 23:07:50 -0800
Received: from [10.216.7.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sun, 20 Feb
 2022 23:07:47 -0800
Message-ID: <3b8b03ba-c6a1-d794-79e5-f244bc1dffae@quicinc.com>
Date: Mon, 21 Feb 2022 12:37:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 05/19] ath11k: Remove core PCI references from PCI
 common code
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-6-git-send-email-quic_mpubbise@quicinc.com>
 <87a6fggo0h.fsf@kernel.org> <871r0sgn7n.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <871r0sgn7n.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_230755_736363_9DF7235A 
X-CRM114-Status: GOOD (  15.31  )
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



On 1/28/2022 4:07 PM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>
>>> Remove core PCI and ath11k PCI references(struct ath11k_pci)
>>> from PCI common code. Since, PCI common code will be used
>>> by hybrid bus devices, this code should be independent
>>> from ATH11K PCI references and Linux core PCI references
>>> like struct pci_dev.
>>>
>>> Since this change introduces function callbacks for bus wakeup
>>> and bus release operations, wakeup_mhi HW param is no longer
>>> needed and hence it is removed completely. Alternatively, bus
>>> wakeup/release ops for QCA9074 are initialized to NULL as
>>> QCA9704 does not need bus wakeup/release for register accesses.
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
>>> @@ -651,6 +653,13 @@ struct ath11k_bus_params {
>>>   	bool fixed_bdf_addr;
>>>   	bool fixed_mem_region;
>>>   	bool static_window_map;
>>> +	struct {
>>> +		void (*wakeup)(struct ath11k_base *ab);
>>> +		void (*release)(struct ath11k_base *ab);
>>> +		int (*get_msi_irq)(struct ath11k_base *ab, unsigned int vector);
>>> +		void (*window_write32)(struct ath11k_base *ab, u32 offset, u32 value);
>>> +		u32 (*window_read32)(struct ath11k_base *ab, u32 offset);
>>> +	} ops;
>>>   };
>>
>> Please don't use bus_params for this, I'm starting to suspect that we
>> actually need to remove struct ath11k_bus_params altogether. It would be
>> cleaner to have separate 'struct ath11k_pci_ops' or something like that.
> 
> And after looking at this more it seems .get_msi_irq is the only
> function which actually has two different implementations. The other
> four are either run or not run, there's no difference in the
> implementation. So would it be cleaner to have a some sort check within
> the function for these other four, instead using function pointers?
> 

WCN6750 has it's own wakeup() and release(), I'll send that patch 
separately. QCN9074 doesn't need wakeup() and release() functions.

The intention of the patch was to remove all Linux and ATH11K PCI 
reference like struct pci_dev and ath11k_pci in the common code.
TBH, WCN6750 doesn't need these references since it is a AHB device
in ATH11K. If we have these references in common code, first thing is
the code will look kind of messed up and another aspect is we need to
enable CONFIG_PCI unnecessarily. This was the reason behind defining
other two callbacks window_write32() and read32().

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
