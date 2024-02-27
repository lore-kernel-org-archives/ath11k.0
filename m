Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F122C5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 03:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1EYml9I8uUX68qopRdWwypN4YJkvfIiTuFVjh4+3xw=; b=Ki3yDMQTdKqy8yFRvw5yJJFeKG
	hZoI5QvQwWndMnlq8bQJ17m1eUlmUCpm8o2bm/2r9/SJIHaCy0MBMR3HuuXGOkZ7NKZ/KfjJuNwl7
	NL1EywBWuSI0iXvT23/NxbZgKetIV0TQ/9RYIRe8cUkmh+YrW1vCFHp2Ycl/kmqfDgSJl38x0Xwn9
	ANOfXWZhBVoCix/F6WCduljdqBuBsVa7wHAuGoul0M8XJkv5brBgn6Kx9e/2N4Or/7HQnJVb+X0KC
	+oxjRzCDjovCJjITS3FrpVVh/SImCRERG5nxXI8GPW13lz2PYNFZ8FlI34iccOTqhraY0PysjVEwb
	g0E0FTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1renwC-00000003a1J-3smt;
	Tue, 27 Feb 2024 03:15:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1renwA-00000003a0V-09Ji
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 03:15:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R2plhV016968;
	Tue, 27 Feb 2024 03:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=l1EYml9I8uUX68qopRdWwypN4YJkvfIiTuFVjh4+3xw=; b=oj
	L0OXoDrT3XzHOgHaem1IKCwcpNmX3KxQsadQT6C4Zh5B9CZWOjH7Us2CWf+w4IkU
	78G/SwXAVY9k9/3w1T/Osnb8KwKVUo9VtJwbVDpGXYvaya8eQpEkBXIFHrifjgaf
	bo3IF1/sJb61H1n50sff0OyRociEhIyvThgZCRWoqZHJPrW16COhbZIrqa/2SXZl
	i9mhvn9V908AJK01aQeQQC9XTkt9/Q5jYnG43DDAb7DrPRXz/jhPbJrRBe8YIH1C
	Ecf+kbI25ZvyVNLGIJSc8mxvxhEnjBkOX8lh63H22rqdUNG55EuA5ixMZShen33d
	WQhq+X+mvQ4OgpL580Ag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh7ar01at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 03:15:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41R3FJTi002337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 03:15:19 GMT
Received: from [10.253.12.70] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 19:15:18 -0800
Message-ID: <1ab07c55-8add-46c6-85b9-7506260be73e@quicinc.com>
Date: Tue, 27 Feb 2024 11:15:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] wifi: ath11k: invert scan flag
 WMI_SCAN_FILTER_PROBE_REQ for QCA6390/WCN6855/QCA2066
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
 <20240226060203.2040444-6-quic_kangyang@quicinc.com>
 <00db4b62-4cd4-474f-bbe9-33f64d5e3853@quicinc.com>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <00db4b62-4cd4-474f-bbe9-33f64d5e3853@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xWwSqWBVONC72MzNb8M3PN26StimW6Sx
X-Proofpoint-GUID: xWwSqWBVONC72MzNb8M3PN26StimW6Sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402270025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_191522_235925_483E0699 
X-CRM114-Status: GOOD (  16.48  )
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



On 2/27/2024 4:40 AM, Jeff Johnson wrote:
> On 2/25/2024 10:02 PM, Kang Yang wrote:
>> Current ROC scan will filter probe request. But probe request is
>> necessary for P2P mode. A P2P device cannot be discovered by others if
>> it doesn't respond to others' probe request.
>>
>> So invert scan flag WMI_SCAN_FILTER_PROBE_REQ for
>> QCA6390/WCN6855/QCA2066.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
>> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
>> index bbccddd7d729..1dd0cbdda199 100644
>> --- a/drivers/net/wireless/ath/ath11k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
>> @@ -2317,6 +2317,9 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
>>   	ether_addr_copy(cmd->mac_addr.addr, params->mac_addr.addr);
>>   	ether_addr_copy(cmd->mac_mask.addr, params->mac_mask.addr);
>>   
>> +	if (ar->ab->hw_params.single_pdev_only)
>> +		cmd->scan_ctrl_flags ^=  WMI_SCAN_FILTER_PROBE_REQ;
>> +
> 
> Why is this being done in WMI? Ideally WMI should just be doing host to
> firmware translation, so seems this should be further up the stack, i.e.
> in ath11k_mac_op_hw_scan() / ath11k_mac_op_remain_on_channel()
> 

I referred to ath10k
you are right, i will move to hw_scan().


> It also seems strange to invert the flag (which assumes a known starting
> value) instead of just explicitly setting it to the required value.
> 

When work as P2P, will call remain_on_channel(), then hw_scan().
scan_ctrl_flags will set WMI_SCAN_FILTER_PROBE_REQ in 
remain_on_channel(). so later should reset this flag to 0 (1 -> 0, 
accept probe request).

When work as station, won't call remain_on_channel(). There is no need 
to accept probe request for station(i should also explain this point), 
so need to set this flag to 1 (0 -> 1).

That's why i invert this flag here, but move to hw_scan() is better.



>>   	ptr += sizeof(*cmd);
>>   
>>   	len = params->num_chan * sizeof(u32);
> 

