Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1143C433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mLNs/CfTmfmtlvGxdEebFUBzOnRrYAgKJ7+yeRm2qY=; b=2omFxvqfyT+VMg
	zhknWg/2guzTnOM2IJe4DQmbn7E9jO9+jxHnKhD6dDWqgk4B/5rn4geTxlDS7sXAeWLdxeohfdinp
	txZU9AcRdHGg7lEeziihVkYEPWI/fmhB+UDf3cr3v1oHH9/vX/DbO65zTWppQ6LrJ1wr1FKe2RG+F
	3+3J2mo1XR/Lg/jiWr7+7RZayDAxNMNDy6I78D7WUN2HwQ65q/xYgK4BIAXtTfl/szm4L2717chV3
	55tJ4mbZEzY7y6LvUv91uK8c+/OZSvNO+RGSGZDL4QxlVAVaLtTUq3a/cW5BvOGfRvrvQlNqJw/up
	sRdgtFqx9GEIWSMOq4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3gI-004Ay7-Kl; Mon, 21 Feb 2022 08:04:26 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3gE-004AwG-U6
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 08:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645430663; x=1676966663;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KCB9+fgfvX79/Zhwfz6+z0T5e6wEWBako053p3e7e2A=;
 b=ymyD8wToeWaVKWcbfvf5PfsDlL2Oc5f7kbwBeSxo6tHO/OWNiTTVWpMC
 03azO3Y5VPPliYaAaKSKYjwkFejenLeD8eZisB+LHyk2phZB+xfsc1Olo
 rcJ+6olNMjJmzmxRi7c1CYlu/08XkFlbw8Gv9sMGkLlLs0MnAtYm4jQPh E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Feb 2022 00:04:22 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 00:04:22 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 21 Feb 2022 00:04:22 -0800
Received: from [10.216.7.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 21 Feb
 2022 00:04:19 -0800
Message-ID: <9acca69c-3d5d-b6b9-b5ca-c2411e206908@quicinc.com>
Date: Mon, 21 Feb 2022 13:34:14 +0530
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
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87h79of470.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_000423_050246_B4F6CD71 
X-CRM114-Status: GOOD (  14.09  )
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



On 1/28/2022 5:43 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Unlike other ATH11K PCIe devices which are enumerated by APSS
>> processor (Application Processor SubSystem), WCN6750 gets
>> enumerated by the WPSS Q6 processor (Wireless Processor SubSystem);
>> In simple terms, though WCN6750 is PCIe device, it is not attached
>> to the APSS processor, APSS will not know of such a device being
>> present in the system and therefore WCN6750 will be registered as
>> a platform device to the kernel core like other supported AHB
>> devices.
>>
>> WCN6750 uses both AHB and PCI APIs for it's operation, it uses
>> AHB APIs for device probe/boot and PCI APIs for device setup
>> and register accesses; Because of this nature, it is referred
>> as a hybrid bus device.
>>
>> Refactor PCI code to support hybrid bus devices like WCN6750.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> [...]
> 
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath11k/pci_cmn.c
> 
> [...]
> 
>> +static inline void ath11k_pci_select_window(struct ath11k_pci *ab_pci, u32 offset)
>> +{
>> +	struct ath11k_base *ab = ab_pci->ab;
>> +
>> +	u32 window = FIELD_GET(ATH11K_PCI_WINDOW_VALUE_MASK, offset);
>> +
>> +	lockdep_assert_held(&ab_pci->window_lock);
>> +
>> +	if (window != ab_pci->register_window) {
>> +		iowrite32(ATH11K_PCI_WINDOW_ENABLE_BIT | window,
>> +			  ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
>> +		ioread32(ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
>> +		ab_pci->register_window = window;
>> +	}
>> +}
> 
> So the style used in ath11k is ath11k_<filename>_foo, so that a function
> ath11k_pci_foo() should be in pci.c. This patch is now breaking that
> style. Maybe pci_cmn.c should renamed to cpci.c, pcic.c or something
> like that? Then the function prefix could be ath11k_cpci_, ath11k_pcic_
> or similar.
> 

Makes sense, pcic.c and ath11k_pcic_* looks better, I'll make these changes.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
