Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76ACC433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=za5+m+ALVLViimAfYl4G1wmTSCSTu+06CHOkyk8rNrs=; b=JZBFLbKpg0Fd5u
	K5XbyzQEYpa8cP8a8hWpwzeZ1nSJb3Oxro6GkYdixuEsWQKTNEq86E9XJoY80tfXVIGFR9bYzlJQd
	z8sTMyK0FKAeBgCnAaUiYClaacb4uNjqCQYxmXevcAnDaXsRwTE5Bz4rGY7xv9w9hdh/nnGUhhhYX
	ei/EhhGI08M6uV5Z4Es3c92431NOb75jlLvHbs9ox2dG40qi81Fiud3YykH3Ku95Tog8/jvSam6Gk
	lycDneF2O4Azx2n4UW1jcDOdFZQZ0klLlKdaskO1rq5LjvQEUW3NkOdw75/jICz8f+hABC7a4AX/Y
	R20tEO42ZqrcyVfkPCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njafS-00HWXE-CC; Wed, 27 Apr 2022 05:56:50 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njafQ-00HWWk-CI
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651039008; x=1682575008;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g7QfMsSD24xuQB98/BEJJRRc0HDLtJCNhPGgrCcWoT4=;
 b=e7s4h6tujVYQ6tpssyDD7RPMWUdhz/d8LrcecCpQeW+sciDNQKz6uLwU
 RUgWtTe9CUzZxvtT+V7MkLgBugUffdgDm5M/r9rGksbna57KYhYx+JgpA
 kAKbqmanQch5FIhrDCV02uTJaDD4HO56/newb89hG9anIWqLLuQK1QaYl U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 22:56:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 22:56:47 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 22:56:47 -0700
Received: from [10.50.15.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 22:56:44 -0700
Message-ID: <d377a595-c816-30f6-0386-442e10a81b9e@quicinc.com>
Date: Wed, 27 Apr 2022 11:26:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 12/19] ath11k: Datapath changes to support WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-13-git-send-email-quic_mpubbise@quicinc.com>
 <87ilqvgkgo.fsf@kernel.org>
 <bd125d43-2f0c-f791-7bbe-f4333896722b@quicinc.com>
 <878rrrgjpb.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <878rrrgjpb.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_225648_486764_F9024F3E 
X-CRM114-Status: GOOD (  12.04  )
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

On 4/27/2022 11:18 AM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> On 4/27/2022 11:02 AM, Kalle Valo wrote:
>>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>>
>>>> HAL RX descriptor for WCN6750 is same as QCN9074, so use
>>>> the DP APIs of QCN9074 for WCN6750. There is one change
>>>> wrt to REO configuration though, REO configuration for
>>>> WCN6750 is same as WCN6855; Therefore, use reo_setup()
>>>> of WCN6855 for WCN6750.
>>>>
>>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>>> ---
>>>>    drivers/net/wireless/ath/ath11k/core.c |  1 +
>>>>    drivers/net/wireless/ath/ath11k/hw.c   | 31 +++++++++++++++++++++++++++++++
>>>>    2 files changed, 32 insertions(+)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>>> index 347131a..f65347c 100644
>>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>>> @@ -458,6 +458,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>>>>    		.num_vdevs = 16 + 1,
>>>>    		.num_peers = 512,
>>>>    		.supports_suspend = false,
>>>> +		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
>>>
>>> You mention nothing about this change in the commit log, I'll add that.
>>>
>>
>> I did mention that "HAL RX descriptor for WCN6750 is same as QCN9074",
>> you were looking at something specific?
> 
> If I'm understanding correctly, by accident hal_desc_sz was not
> initialised for qcn9074. If that's the case, it would be good to mention
> that in the commit log.
> 

If I understand your comment correctly, since HAL RX descriptor is 
related to data path, I thought of adding it as part of the data path
patch.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
