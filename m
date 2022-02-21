Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247CAC433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 08:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AY04BNm3E4lW5au+6jc3xBVOoxPKe/5d3HrnjegGcUY=; b=LAqrdm3neCKPMM
	lcKwMJNUiXelYszPZCu0hD7XCiPrJPvqznsKOfkD5txQcFf7yQH/9/N4nFt+FMfId3RIJ2Z1mnW0I
	x3e8DntNt16Fc4LpbOI0wxR342q92iaRqOjwxCx1MJjp3DWb8cxG3SyDC/4MAVYaXR7nmHPYMt5DH
	svDptmtaLAU9ON0UlvRhKWvAhZ6jKLiaYtL8LLouIwBo+q7gu66kzlb7c2RBqlZK/T1VCjPr30BXn
	FpYHM4BpY54iQ2pm34uwTrU+OJ23KjFY9LJRPKKYPFu5kFRPVrhbD3gl2klKZdHgFQu66Zq5/3F3n
	vqezwKFWOfuwfnyk2M/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3ef-004AD0-Ny; Mon, 21 Feb 2022 08:02:45 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3eG-004A0A-Ja
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 08:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645430540; x=1676966540;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y/cyXO8yRCKsmSfHSbaK7L7wvV6G8gdM36lM+3LriEw=;
 b=NzSHnMDErxMaBdfudY6RLk5X1IegUqmmngYrkMrIPMgqHXvFZriWU6oF
 /nHH12d8ew89RPZa6yVQmVqFjcr8nLIrF14s0viV68doX74J8KiKTrrZa
 pZQou7qTo7EdJ/X0O/vZziH8a6IkVXbnfAdCWC0i+TWhauHz3g1cS++pX U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Feb 2022 00:02:20 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 00:02:20 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 21 Feb 2022 00:02:19 -0800
Received: from [10.216.7.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 21 Feb
 2022 00:02:16 -0800
Message-ID: <72c74a65-27a7-ad1c-07db-59d478ed8cef@quicinc.com>
Date: Mon, 21 Feb 2022 13:32:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 10/19] ath11k: Add QMI changes for WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-11-git-send-email-quic_mpubbise@quicinc.com>
 <87o83wf821.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87o83wf821.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_000220_731399_6690AFDA 
X-CRM114-Status: GOOD (  13.34  )
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



On 1/28/2022 4:20 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> In the case of WCN6750, FW doesn't request for DDR memory
>> via QMI, instead it uses a fixed 12MB reserved Memory region
>> in the DDR which is called as MSA region. As a result, QMI
>> message sequence is not same as other ath11k supported devices.
>>
>> Also, M3 firmware will be bundled into the FW and will be
>> downloaded to the target as part of Q6 boot.
>>
>> This is the QMI flow in the case of WCN6750,
>>
>> 1) QMI firmware indication REQ/RESP
>> 2) QMI host capability REQ/RESP
>> 3) QMI target capability REQ/RESP
>> 4) QMI device info REQ/RESP
>> 5) QMI BDF download
>> 6) QMI FW ready
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
>> @@ -2490,6 +2497,13 @@ static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
>>   	struct qmi_txn txn;
>>   	int ret = 0;
>>   
>> +	/* In the case of WCN6750, M3 is bundled into the FW
>> +	 * binary, and will be downloaded as part of Q6 boot.
>> +	 */
>> +	if (!ab->bus_params.m3_fw_support &&
>> +	    ab->bus_params.hybrid_bus_type)
>> +		return 0;
> 
> A check like this makes me think if it's just better to m3_fw_support to
> ath11k_hw_params. That way you could disable m3 for WCN6750 via
> hw_params.
> 

You are right, it's better to have a hw_param instead.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
