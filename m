Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39671C4345F
	for <ath11k@archiver.kernel.org>; Fri,  3 May 2024 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+7ecq40+oDZ500fCz2rEtnBnAykoerzuJBxSHLdkpM=; b=EaxSeFEmZZ+Sz3N1lqY2BzqX6w
	Ay0kforAHJ83j0KEtfriUdUoRUkq5k0fyWv8caEpgfa20HOX7Wofr9K1lzSOdpriK9R2eJ/vYuQZW
	/JPJVBRz7DRwCOCtL+IhY6UaELlr0c1GTZGfaY9tuByRfhobRC7cc2Eb9DKNi2N8MV4NJ/0zagaH+
	/HL42CC4aDv9Be0KshstiUOdho+3flEQsK3mwixNkOo11LcPIXPQqDd4APpbFaXFxnrAaDwS6VTvv
	oYfVln6YzDtdzNNIYe8DVXPSGkS091kfmh8V3wyETX3YVsN/YJqpprirXuMcHtDCB5OC+U0Niyirt
	n3arCNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2uKA-0000000GwKq-2RYu;
	Fri, 03 May 2024 14:55:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2uK7-0000000GwIm-2wBA
	for ath11k@lists.infradead.org;
	Fri, 03 May 2024 14:55:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443DLqpM024506;
	Fri, 3 May 2024 14:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=l+7ecq40+oDZ500fCz2rEtnBnAykoerzuJBxSHLdkpM=; b=Em
	yv+1LfIygR1LS6NYi9Hor7jvi0dp+1uAdiXQMbxMNLZVp9rIpuufJkZTuUUYyX+K
	WN4bes0PMD3/RMiv55V/50MoKaVIcu7MZzblg0djt3YiGUN2ZNwuj6WoSTZpFJRQ
	C37eHpr8hI9Ggc2fjfjli1EtKfSLyKrj+ixP319mF3ddwoUABhc/ZbCePI5wzKMq
	BoTI3FTTfELgoX8VZmq02AzT0NIvKkg0cpgDsdsGJqXlS3dRUa3Q6W8wQB9ogPbf
	HG1ghNC6PhfICxmp9RR7w4mMoo7soO+4VT3ZUEeyauPExcZ7mulQbsZD1z6DuHsu
	SKK+HSu6pKOw8wF60fRg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xvtbpry1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 14:55:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 443Eta4x016274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 May 2024 14:55:36 GMT
Received: from [10.110.94.246] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 07:55:35 -0700
Message-ID: <143e04a0-3bda-4718-8647-1ed31e1f5774@quicinc.com>
Date: Fri, 3 May 2024 07:55:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5] wifi: ath11k: skip status ring entry processing
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Venkateswara
 Naralasetty" <quic_vnaralas@quicinc.com>
References: <20240429073624.736147-1-quic_tamizhr@quicinc.com>
 <35f114c4-1ff7-4a4b-aadf-ed147f19e170@quicinc.com>
 <87cyq7ota5.fsf@kernel.org>
 <4f9abe89-a004-45e8-b369-5c2b39bff440@quicinc.com>
 <871q6jnipu.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <871q6jnipu.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j63a8rZHP8r7iI6Gp0GfRVE5zjnXxlHv
X-Proofpoint-ORIG-GUID: j63a8rZHP8r7iI6Gp0GfRVE5zjnXxlHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_09,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=787 lowpriorityscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_075543_891698_D85DA37F 
X-CRM114-Status: GOOD (  13.86  )
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

On 5/3/2024 6:11 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>>> Also I removed one unrelated change and removed unnecessary else. Please
>>> check my changes:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6e88d559268779107715008c51e006f7a5f62045
>>
>> So looking at the 'pending' change I have the observation that
>> ath11k_dp_rx_mon_buf_done() only returns one of two values:
>> DP_MON_STATUS_NO_DMA
>> DP_MON_STATUS_REPLINISH
>>
>> And the return value handling has explicit handling for those values, without
>> any logic for other values:
>> +				if (reap_status == DP_MON_STATUS_NO_DMA)
>> +					continue;
>> +
>> +				if (reap_status == DP_MON_STATUS_REPLINISH) {
>>
>> if we only expect these two values to ever be returned, then we could remove
>> the testing for DP_MON_STATUS_REPLINISH since, it it isn't NO_DMA then it must
>> be REPLINISH
> 
> Nice, I simplified this error handling now. Less indentation now which
> is much better.
> 
>> + ath11k_warn(ab, "mon status DONE not set %lx, buf_id %d\n",
>> + FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl),
>> +						    buf_id);
>>
>> I don't think we should log anything here. we already warn before calling the
>> new function. if we get here it means the next buffer had DONE set so we can
>> replenish the current buffer
> 
> Yeah, I removed the warning altogether. Please check my changes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=49c28a9720959fb5daf702fe1732a716f3cff15c
> 
LGTM, thanks!

