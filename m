Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C38BC28B2E
	for <ath11k@archiver.kernel.org>; Tue, 11 Mar 2025 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0NKMUQKXKn/4hsWmllOKkwAuEuIvvOI01hYmoagsz8=; b=Rj2mhHoulCisrjVgszEzI9jHT5
	nx4dF9oAQ0+uvLqUi0JVyb8ERJO8Cmx7N0nWpR4SfikFS3mCcFwKYb/pg2pH7xov51XlU2rLBE9ze
	8b5GY4V89lJWluO6lzTKbDUYMIDJyAx79exWqpK+xsE0oOg2eENITZeKPECd1MMlBVpMmkIfBKile
	Y0n5Vus6rhLcilCzuWM5grfotukOS6lHdTsAAkHHqzHTJUOz0EO7SuZdVfOYoyCsSIwv7g7mZMI/5
	k3hVEf37yeul1qmDhOtmwI9ohciPGZot2EpYlbbSEgQXOJAyxYI8UB0ikq+g0bH1MJGaaoYsF3XUy
	TWdWbGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1truzp-000000050BM-2mdS;
	Tue, 11 Mar 2025 08:29:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1truzn-000000050Az-38pV
	for ath11k@lists.infradead.org;
	Tue, 11 Mar 2025 08:29:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7oJRI009265;
	Tue, 11 Mar 2025 08:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0NKMUQKXKn/4hsWmllOKkwAuEuIvvOI01hYmoagsz8=; b=WhT9zCpiIdNFLuED
	d3/nVL7qvN5WUFwzPTbl9YBrz0PXH6VLevUgz5FO/svdn4KQsc0qXKQrFCTEolLB
	mYwdQfCo1uhQ+k0r7VoukaZ/qx7fSlFKMpqYS6y9ZHpB4Ioy0nlCxUOFJX5q4Jl6
	JVB0BnLmKlW3/UTNcI7V2Lrpb4/AdZBAKQwkkkXSh0vjAwb6uw8f7zNoW4JknjsQ
	YjUW/lMcHMkPnD0k0sZc4i/H9XHxGZUmM7yDiVwDGh1sEvQgsnH2WLHTk+Ss0nUU
	KZm9RZL8+tPa7mAG1k56AQwS514e+9S7WV2+kWF/H8x1sHagheAPutPCGKzNS/Kg
	j5bmFg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah4s03r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:29:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52B8Tkr2012253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:29:46 GMT
Received: from [10.239.29.24] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 01:29:44 -0700
Message-ID: <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
Date: Tue, 11 Mar 2025 16:29:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
To: Johan Hovold <johan@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <johan+linaro@kernel.org>
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
 <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
 <Z866cCj8SWyZjCoP@hovoldconsulting.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <Z866cCj8SWyZjCoP@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYVH5xRf c=1 sm=1 tr=0 ts=67cff47b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=zvfRP35NZ5SxQhbWGWEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: N17Se1jF52_h2D2k7tD-l38nPVcfbSgk
X-Proofpoint-ORIG-GUID: N17Se1jF52_h2D2k7tD-l38nPVcfbSgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503110056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_012951_912930_82E7BF01 
X-CRM114-Status: GOOD (  30.01  )
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



On 3/10/2025 6:09 PM, Johan Hovold wrote:
> On Mon, Mar 10, 2025 at 09:02:17AM +0800, Miaoqing Pan wrote:
>> A relatively unusual race condition occurs between host software
>> and hardware, where the host sees the updated destination ring head
>> pointer before the hardware updates the corresponding descriptor.
>> When this situation occurs, the length of the descriptor returns 0.
> 
> I still think this description is too vague and it doesn't explain how
> this race is even possible. It sounds like there's a bug somewhere in
> the driver or firmware, but if this really is an indication the hardware
> is broken as your reply here seems to suggest:
> 
> 	https://lore.kernel.org/lkml/bc187777-588c-4fa0-ba8c-847e91c78d43@quicinc.com/
> 
> then that too should be highlighted in the commit message (e.g. by
> describing this as "working around broken hardware").
> 
Ok, will do.

>> The current error handling method is to increment descriptor tail
>> pointer by 1, but 'sw_index' is not updated, causing descriptor and
>> skb to not correspond one-to-one, resulting in the following error:
>>
>> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
>> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
>>
>> To address this problem, temporarily skip processing the current
>> descriptor and handle it again next time. However, to prevent this
>> descriptor from continuously returning 0, use skb cb to set a flag.
>> If the length returns 0 again, this descriptor will be discarded.
> 
> The ath12k ring-buffer handling looks very similar. Do you need a
> corresponding workaround in ath12k_ce_completed_recv_next()? Or are you
> sure that this (hardware) bug only affects ath11k devices?
>   
Yes, will submit a similar patch.

>>   	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
>> -	if (*nbytes == 0) {
>> -		ret = -EIO;
>> -		goto err;
>> +	if (unlikely(*nbytes == 0)) {
>> +		struct ath11k_skb_rxcb *rxcb =
>> +			ATH11K_SKB_RXCB(pipe->dest_ring->skb[sw_index]);
>> +
>> +		/* A relatively unusual race condition occurs between host
>> +		 * software and hardware, where the host sees the updated
>> +		 * destination ring head pointer before the hardware updates
>> +		 * the corresponding descriptor.
>> +		 *
>> +		 * Temporarily skip processing the current descriptor and handle
>> +		 * it again next time. However, to prevent this descriptor from
>> +		 * continuously returning 0, set 'is_desc_len0' flag. If the
>> +		 * length returns 0 again, this descriptor will be discarded.
>> +		 */
>> +		if (!rxcb->is_desc_len0) {
>> +			rxcb->is_desc_len0 = true;
>> +			ret = -EIO;
>> +			goto err;
>> +		}
>>   	}
> 
> I'm still waiting for feedback from one user that can reproduce the
> ring-buffer corruption very easily, but another user mentioned seeing
> multiple zero-length descriptor warnings over the weekend when running
> with this patch:
> 
> 	ath11k_pci 0006:01:00.0: rxed invalid length (nbytes 0, max 2048)
> 
> Are there ever any valid reasons for seeing a zero-length descriptor
> (i.e. unrelated to the race at hand)? IIUC the warning would only be
> printed when processing such descriptors a second time (i.e. when
> is_desc_len0 is set).
> 

That's exactly the logic, only can see the warning in a second time. For 
the first time, ath12k_ce_completed_recv_next() returns '-EIO'.


