Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CBBC433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 06:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVnkRLQH9jjNna3x5KgNR86/Gzzg/ZIvioIsdwUcBbI=; b=Fkte+AoAOzk6ie
	t6Nxj03aJljrC8Id8Z8BRPvM2b+5aUBfre0Oy66miBcISGjRIR8iNGQP69IcCg3rnqo2v7S1m1ulW
	LI4aO17NE3d1D4aqcrbLt13vG1gqhQi4qzIeIflLluTNk1vHB0dlv8u5GXqkEQr+PNORslWER4FRW
	Ut+Z0ZpkWCAJttzVe0yxqqVxS2G4XVRf80xY3vkDpHDG+a4/J5KncNMry0aB7u/0000WFe6bNw7NE
	bYDcNeU6dPsDhPT2HSHbZAo71OneNOH/SVhBRPCftFT9ofHtFd3iNp/1+LjpibDi0MSLZQzVnae/H
	qgJSB2cRi3DRsC+MdZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2c3-003s0r-2d; Mon, 21 Feb 2022 06:55:59 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2bz-003rz0-EC
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 06:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645426555; x=1676962555;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f247xkeOdcUQ3Zk9XkWSFcO4La446ONgMI9XPSjYtFk=;
 b=rBMR/IV9sPqm6F68id8lniGlcb80eJvCFkmcewtnqjREjkLVPy4NCJ4O
 OCX4r30usBUlHMDFULevOpvL4cHxoptF/ARG3oih8FDyL39dL0pm0+WJM
 S+0yt9oWtp/vZxPZseBprkGT17+Phbph26tZeqjTS1t9MBo4i+0UweJpW s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Feb 2022 22:55:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 22:55:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 20 Feb 2022 22:55:53 -0800
Received: from [10.216.7.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sun, 20 Feb
 2022 22:55:51 -0800
Message-ID: <df81787b-3ad4-62b7-7a39-fdca6775bae1@quicinc.com>
Date: Mon, 21 Feb 2022 12:25:45 +0530
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
 <87a6fggo0h.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87a6fggo0h.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_225555_591198_3AAD09E7 
X-CRM114-Status: GOOD (  10.45  )
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

On 1/28/2022 3:50 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Remove core PCI and ath11k PCI references(struct ath11k_pci)
>> from PCI common code. Since, PCI common code will be used
>> by hybrid bus devices, this code should be independent
>> from ATH11K PCI references and Linux core PCI references
>> like struct pci_dev.
>>
>> Since this change introduces function callbacks for bus wakeup
>> and bus release operations, wakeup_mhi HW param is no longer
>> needed and hence it is removed completely. Alternatively, bus
>> wakeup/release ops for QCA9074 are initialized to NULL as
>> QCA9704 does not need bus wakeup/release for register accesses.
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
>> @@ -651,6 +653,13 @@ struct ath11k_bus_params {
>>   	bool fixed_bdf_addr;
>>   	bool fixed_mem_region;
>>   	bool static_window_map;
>> +	struct {
>> +		void (*wakeup)(struct ath11k_base *ab);
>> +		void (*release)(struct ath11k_base *ab);
>> +		int (*get_msi_irq)(struct ath11k_base *ab, unsigned int vector);
>> +		void (*window_write32)(struct ath11k_base *ab, u32 offset, u32 value);
>> +		u32 (*window_read32)(struct ath11k_base *ab, u32 offset);
>> +	} ops;
>>   };
> 
> Please don't use bus_params for this, I'm starting to suspect that we
> actually need to remove struct ath11k_bus_params altogether. It would be
> cleaner to have separate 'struct ath11k_pci_ops' or something like that.
> 

Sure, something like 'struct ath11k_bus_ops' in ath11k_base struct would 
be appropriate.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
