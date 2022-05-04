Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3C8C433F5
	for <ath11k@archiver.kernel.org>; Wed,  4 May 2022 06:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ue7aCnD0q/h8LasgCwxdfpy5l+CBUmxOEFPGYsCoXY0=; b=XkAonrWC+qmvws
	trbNAeGCJfksVAAeGtTwRzYmaQIhN+i1eCSdrdGLwtTvhZLKeyAq0+BW9Cp+OH0sRR2l6ZOMmXhNO
	M5wkhLliX1gTnIMli0fsSAeLaGelx42h01M2BYwYwe33ORULeum+0n6ofgTCJwzjorHhadwMJ2dCn
	ZX/LPRUiIkXSkxp1E8tuWBrHydzIrJdgoYngIGVFIB+CUGBpZxUXzSJf4MaTD2QNU2LmXN7KIDYaC
	XYx97KXUTQuos3hV9eEsFmC9iTX3CtW3+FxvQt5AXYQ3KGN1HnIkITZjCH24QJusM6vvnR5So8ckk
	Hc6gcE4TY3q6C/G9cofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm8ig-0093K9-CR; Wed, 04 May 2022 06:42:42 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm8id-0093Gq-Iu
 for ath11k@lists.infradead.org; Wed, 04 May 2022 06:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651646559; x=1683182559;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MNV4tPKjw+sU2P/KHe9Zp17alX1Ngr43TpGbZuOl74g=;
 b=hoebPPHNGYPbxzENdk9WoWlA7Tv9Y2wUr2AG3s56a011YzHdzlalEybK
 LG1Kg4KEsGGTynxDihtCMgCxn1818fgV7TP4ihy93OUoJRGOp9FFmWElC
 M5hPL10hnB49W7dkxlNMVCzKPMMUETjaZf1KAMno0xJrBOQBVnnp/0pet g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 May 2022 23:42:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 23:42:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 23:42:35 -0700
Received: from [10.50.12.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 23:42:33 -0700
Message-ID: <b126ba5d-035c-3218-2847-5ac86063ebd6@quicinc.com>
Date: Wed, 4 May 2022 12:12:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] ath11k: Fix RX de-fragmentation issue on WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220328061947.28813-1-quic_mpubbise@quicinc.com>
 <87bkwgau67.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87bkwgau67.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_234239_706257_53B08526 
X-CRM114-Status: GOOD (  14.57  )
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

On 5/2/2022 7:55 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> The offset of REO register where the RX fragment destination ring
>> is configured is different in WCN6750 as compared to WCN6855.
>> Due to this differnce in offsets, on WCN6750, fragment destination
>> ring will be configured incorrectly, leading to RX fragments not
>> getting delivered to the driver. Fix this by defining HW specific
>> offset for the REO MISC CTL register.
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
>> @@ -2229,6 +2229,9 @@ const struct ath11k_hw_regs wcn6855_regs = {
>>   
>>   	/* Shadow register area */
>>   	.hal_shadow_base_addr = 0x000008fc,
>> +
>> +	/* REO MISC CTRL */
>> +	.hal_reo1_misc_ctl = 0x00000630,
>>   };
> 
> I don't really see the benefit from the comment, it doesn't bring any
> extra information.
> 

You are right, let me check if I can add any info or I'll remove the 
comment.

>>   const struct ath11k_hw_regs wcn6750_regs = {
>> @@ -2311,6 +2314,9 @@ const struct ath11k_hw_regs wcn6750_regs = {
>>   
>>   	/* Shadow register area */
>>   	.hal_shadow_base_addr = 0x00000504,
>> +
>> +	/* REO MISC CTRL */
>> +	.hal_reo1_misc_ctl = 0x000005d8,
> 
> Ditto.
> 
> What about other ath11k_hw_regs tables:
> 
> <global>[1906]                 const struct ath11k_hw_regs ipq8074_regs = {
> <global>[1988]                 const struct ath11k_hw_regs qca6390_regs = {
> <global>[2070]                 const struct ath11k_hw_regs qcn9074_regs = {
> 
> You don't mention anything about those in the commit log. If they don't
> use this register (didn't check) we should at least initialise the
> fields to zero, deadbeef or something to make it clear they are unused.
> 

Let me make the changes to initialize the register to 0(zero) for other 
unsupported hardware.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
