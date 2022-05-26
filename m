Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE2AC433F5
	for <ath11k@archiver.kernel.org>; Thu, 26 May 2022 03:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NrKxlxm6mQF0LnPT7ztaqjsRlS/tvfiw+Zzswey82o=; b=m9ImGQyXK2PhfK
	3U4LhxjK/k8Fkj5lQTyjsQNR8sQGSP5ql/uU/3u+TE5VIonTQwEMBsA7BjzXoLrRZ/D+IAP/IFraW
	13tybd6e8reLHlF0hBZ1q5cbqtzii0Inri66FExE3egG62/AuSUejwIGZBbYsteoDb1ig50SDnEcx
	QR6918r+v7HXYYgY/ZH7s24Kk/lloDggTJ712Lpe3M8E5aWKJocdQD/+mui2RXEUqJ2YAgz+ZybVC
	+n1pk/w2argzA5NHhwEOm17R6qP5GWWBcSAGXpfeEGoDMDVR7RBoJQFvMOo5JZj5BsM7oubit4ZkM
	HOsL9s6FB51edoSNhs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu4Or-00DOhF-VM; Thu, 26 May 2022 03:43:01 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu4Op-00DOgU-BF
	for ath11k@lists.infradead.org; Thu, 26 May 2022 03:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653536579; x=1685072579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qz/KHqk3byoT6h2h00AP8qTrIFo+MV2teTZS41oryWs=;
  b=lintARiu0svxir5xrqJtTTzyNtzz9TDEYnkNmk2PrqowkCO63Gce5Yni
   uCwwfmBjuyj5XmKFV18/FK234FCZ0RU9iJD6B6ZN74n3svoB7hvA9SkB3
   Xti9j3bgq78pALf8LkHC+EZxDurZpJ2OQ3tb2nvAoRTA7S5wPxVmnl71S
   0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 25 May 2022 20:42:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 20:42:54 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 25 May 2022 20:42:54 -0700
Received: from [10.50.35.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 25 May
 2022 20:42:51 -0700
Message-ID: <c57e8791-b6ce-0752-52ca-a1cb938187d7@quicinc.com>
Date: Thu, 26 May 2022 09:12:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 4/9] ath11k: Add register access logic for WCN6750
Content-Language: en-US
To: <mbizon@freebox.fr>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <mka@chromium.org>
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
 <20220429170502.20080-5-quic_mpubbise@quicinc.com>
 <bd6d97a4cc6665d0ee632444f75e3480160387ec.camel@freebox.fr>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <bd6d97a4cc6665d0ee632444f75e3480160387ec.camel@freebox.fr>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_204259_459141_BBEBC9B0 
X-CRM114-Status: GOOD (  17.80  )
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

On 5/26/2022 12:16 AM, Maxime Bizon wrote:
> 
> On Fri, 2022-04-29 at 22:34 +0530, Manikanta Pubbisetty wrote:
> 
> Hello Manikanta,
> 
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-
>> QCAHKSWPL_SILICONZ-1
> 
> Nope your patch breaks QCN9074:
> 
> [   13.660963] ath11k_pci 0000:03:00.0: failed to set pcie link register 0x01e0e0a8: 0xffffffff != 0x00000010
> [   13.675994] ath11k_pci 0000:03:00.0: failed to set sysclk: -110
> 
> device still seem to work though

Thanks for letting me know about this, IIRC I don't remember 
encountering this problem in my testing. Just for my understanding, have 
you reverted this change and confirmed that these errors go away ?

> 
>> @@ -134,16 +134,13 @@ EXPORT_SYMBOL(ath11k_pcic_init_msi_config);
>>   static inline u32 ath11k_pcic_get_window_start(struct ath11k_base *ab,
>>   					       u32 offset)
>>   {
>> -	u32 window_start;
>> +	u32 window_start = 0;
>>   
>> -	/* If offset lies within DP register range, use 3rd window */
>>   	if ((offset ^ HAL_SEQ_WCSS_UMAC_OFFSET) < ATH11K_PCI_WINDOW_RANGE_MASK)
>> -		window_start = 3 * ATH11K_PCI_WINDOW_START;
>> -	/* If offset lies within CE register range, use 2nd window */
>> -	else if ((offset ^ HAL_CE_WFSS_CE_REG_BASE) < ATH11K_PCI_WINDOW_RANGE_MASK)
>> -		window_start = 2 * ATH11K_PCI_WINDOW_START;
>> -	else
>> -		window_start = ATH11K_PCI_WINDOW_START;
>> +		window_start = ab->hw_params.dp_window_idx * ATH11K_PCI_WINDOW_START;
>> +	else if ((offset ^ HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab)) <
>> +		 ATH11K_PCI_WINDOW_RANGE_MASK)
>> +		window_start = ab->hw_params.ce_window_idx * ATH11K_PCI_WINDOW_START;
>>   
>>   	return window_start;
>>   }
> 
> 
> for some offsets, previous code could return ATH11K_PCI_WINDOW_START,
> whereas new code now returns 0
> 
> 
>> @@ -162,19 +159,12 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
>>   
>>   	if (offset < ATH11K_PCI_WINDOW_START) {
>>   		iowrite32(value, ab->mem  + offset);
>> -	} else {
>> -		if (ab->hw_params.static_window_map)
>> -			window_start = ath11k_pcic_get_window_start(ab, offset);
>> -		else
>> -			window_start = ATH11K_PCI_WINDOW_START;
>> -
>> -		if (window_start == ATH11K_PCI_WINDOW_START &&
>> -		    ab->pci.ops->window_write32) {
>> -			ab->pci.ops->window_write32(ab, offset, value);
>> -		} else {
>> -			iowrite32(value, ab->mem + window_start +
>> -				  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
>> -		}
>> +	} else if (ab->hw_params.static_window_map) {
>> +		window_start = ath11k_pcic_get_window_start(ab, offset);
>> +		iowrite32(value, ab->mem + window_start +
>> +			  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
>> +	} else if (ab->pci.ops->window_write32) {
>> +		ab->pci.ops->window_write32(ab, offset, value);
>>   	}
>>
> 
> with previous code on QCN9074, when ath11k_pcic_get_window_start()
> returned ATH11K_PCI_WINDOW_START, then it would call window_write32()
> 
> with new code on QCN9074, static_window_map is true, so window_write32
> will never be called.
> 
>>   u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
> 
> ditto here
> 

If you could please confirm that reverting this change helps, I can send 
a patch to fix this.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
