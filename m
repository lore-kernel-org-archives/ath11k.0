Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FCEC369D1
	for <ath11k@archiver.kernel.org>; Mon, 28 Apr 2025 02:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ry/gvYyfmaVfNkedSDaTq+oPl2tD9g2MgdxbWL4JXFw=; b=WKIhBiG1jYAHY/LNr1PmfEwf0t
	Pl0hJ97LzkQrxvrkyTnVJwMSJ2ur973JOpFYd5lkpT8vjbOvi095xjLHqAdUwqbvOJvKo4DuzoSvZ
	XLdcs2XEZ12SE/HBrPMU2+8BeIxAomKPUoXArP31CwncUOc1odZy53HoKunt0+R+0wj6WwJceIBK/
	cNC0VSzJ8MQke2E9PK+Z1RbiHiG7dpnE61iAmoojfWtEv/omMSQBbu3CcGEzVw+SfOl2Hc2TQYGQz
	wJW/qOFm/4fpw2/2wydl9eCPRjeZzCmmvsN2UDE0oIY4fA0zCZprZX1ilAOrYN5RdQQek5BxNOr1w
	tB3j1wdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DqB-00000004KI8-1dwT;
	Mon, 28 Apr 2025 02:03:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Dq8-00000004KHc-1XVD
	for ath11k@lists.infradead.org;
	Mon, 28 Apr 2025 02:03:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RCiPpG026812;
	Mon, 28 Apr 2025 02:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ry/gvYyfmaVfNkedSDaTq+oPl2tD9g2MgdxbWL4JXFw=; b=OlYRwfjxrSXTL0TJ
	yORwWjJstKfOgTZqm5SEil9Qmw6w5QRR/8H/z5Wrm/vtMoM/LggM+w6zYcjEuJ0f
	QrrvzxfIVMdlRHDbpBqJwG4azf0tZkNj2vN1bKvzgV7DDNqKJs0b1ZEJoCGSUTXY
	7KwvLTxQh/Tr2WCGAnwLq4i15cFvdnd75gsguOxEOc+gaUHIa3hX8ZXx2l4WL6O8
	gHB8dZktSYY1lOV3pjMvOlWiqdhtmL7QD+S3+9pHgr/1t4W53vA4sEyg+wWHPTwi
	J46SuNre3UR7XoR/ztizVeVC1BCFhBiHXQzN0X175X5T0rIOdeSQRW7nNP0G9zvL
	sVuvDg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb59m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 02:03:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53S23K0A020564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 02:03:20 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Apr
 2025 19:03:17 -0700
Message-ID: <4b3a18e3-14ac-4876-9b51-acee142464b3@quicinc.com>
Date: Mon, 28 Apr 2025 10:03:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath11k: Fix MHI target memory reuse logic
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        <jeff.johnson@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>
CC: <kernel@collabora.com>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250425110424.2530460-1-usama.anjum@collabora.com>
 <dee649f1-0516-4a59-a70d-ba206388e568@quicinc.com>
Content-Language: en-US
In-Reply-To: <dee649f1-0516-4a59-a70d-ba206388e568@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAxNSBTYWx0ZWRfXyXy7ULkk/EtN Y3MmrYYlqKXSbjL9MTKtvQPpDyiHPfO7JAss3irAUSbnzTVt3yuM2B2UqKUqOR5mrNVa0CnIlW/ D94cCjlZxlUN+oqfae1W9HKn/ov5GpUh21tTr8xH6LWkVhpEId6FDwlB99rUkZhzZJTY9IjZoJt
 csvoKE4UGQwqe6zDDEsFI2MACmH4v7DOstmSl7mSGQZ2EWodePYe8fz3ZQq9tDCnNu/Yj7MdwIU KVq80hsimGBo7Rqb9tD83ifmcVmvACfjtdH5LMU0ryz5lh8utDeXmmNyVlZX2mlPCOmIh3g5tpV zZLtbGizSHEUB9wvUAXo9R/aM7rDS1FHolVWE7GbmyFxGZk8YoJ84c/xPrDggcOqzX2n+IwxKwb
 Iq7OjU38H9jnHJQ7gEM9r/4ohVIA+kp8WJeSje6nq9CuAZQ1RNM4A3SH4hMa3nyoCjBO/HxG
X-Proofpoint-GUID: Ig6s0WvLLKgxgO7K9ytZNOqP7T_G4Vcj
X-Proofpoint-ORIG-GUID: Ig6s0WvLLKgxgO7K9ytZNOqP7T_G4Vcj
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680ee1e8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=COk6AnOGAAAA:8 a=OC3NTexeB3fIAc-p7tYA:9
 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_190324_439494_8FAA49C2 
X-CRM114-Status: GOOD (  18.52  )
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



On 4/25/2025 7:08 PM, Baochen Qiang wrote:
> 
> 
> On 4/25/2025 7:04 PM, Muhammad Usama Anjum wrote:
>> Firmware requests 2 segments at first. The first segment is of 6799360
>> whose allocation fails due to dma remapping not available. The success
>> is returned to firmware. Then firmware asks for 22 smaller segments
>> instead of 2 big ones. Those get allocated successfully. At suspend/
>> hibernation time, these segments aren't freed as they will be reused
>> by firmware after resuming.
>>
>> After resuming, the firmware asks for the 2 segments again with the
>> first segment of 6799360 size. Since chunk->vaddr is not NULL, the
>> type and size are compared with the previous type and size to know if
>> it can be reused or not. Unfortunately, it is detected that it cannot
>> be reused and this first smaller segment is freed. Then we continue to
>> allocate 6799360 size memory which fails and ath11k_qmi_free_target_mem_chunk()
>> is called which frees the second smaller segment as well. Later success
>> is returned to firmware which asks for 22 smaller segments again. But
>> as we had freed 2 segments already, we'll allocate the first 2 new
>> smaller segments again and reuse the remaining 20. Hence 20 small
>> segments are being reused instead of 22.
>>
>> Add skip logic when vaddr is set, but size/type don't match. Use the
>> same skip and success logic as used when dma_alloc_coherent() fails.
>> By skipping, the possibility of resume failure due to kernel failing to
>> allocate memory for QMI can be avoided.
>>
>> 	kernel: ath11k_pci 0000:03:00.0: failed to allocate dma memory for qmi (524288 B type 1)
>> 	ath11k_pci 0000:03:00.0: failed to allocate qmi target memory: -22
>>
>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes since v1:
>> - Update description
>>
>> Changes since v2:
>> - Update description
>>
>> Changes since v3:
>> - Update description

The subject since previous is changed, but not mentioned here.

Please describe all your changes.

>> ---
>>  drivers/net/wireless/ath/ath11k/qmi.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>> index 47b9d4126d3a9..2782f4723e413 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>> @@ -1993,6 +1993,15 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
>>  			    chunk->prev_size == chunk->size)
>>  				continue;
>>  
>> +			if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "size/type mismatch (current %d %u) (prev %d %u), try later with small size\n",
>> +					    chunk->size, chunk->type,
>> +					    chunk->prev_size, chunk->prev_type);
>> +				ab->qmi.target_mem_delayed = true;
>> +				return 0;
>> +			}
>> +
>>  			/* cannot reuse the existing chunk */
>>  			dma_free_coherent(ab->dev, chunk->prev_size,
>>  					  chunk->vaddr, chunk->paddr);
> 
> LGTM
> 
> Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>

Withdraw above tag as I didn't notice that the patch subject is incorrect since v3.

The QMI memory has nothing to do with MHI. IMO the v1/v2 subject is good:

	wifi: ath11k: Fix memory reuse logic

while even better mention QMI:

	wifi: ath11k: Fix QMI memory reuse logic


> 


