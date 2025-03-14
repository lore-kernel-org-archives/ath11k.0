Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C91DC282EC
	for <ath11k@archiver.kernel.org>; Fri, 14 Mar 2025 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSHpRfudomt1+AaKesezGs0x3pN3M5StEnb5ZNKlRqw=; b=1dtzKQJ8W+qRizCvMPmopIRY2I
	po/80qBV8itSliYWpab7xLoC01DGhEVPJ0MVS2qMFXopHzqu5BU5mNf0oTJYvkic23KWlNTWzV6Jo
	CWvwq8a0BLN2tE2DE1ApWxlp65cOz08JStN7GYd//kN38cx/IjQRlSW6xUKj38CLFjS6HLn70eHsL
	HyEMzMODK2pIaFfWgu3n/kXhSgz3sIYhhn+/29mHKoKpNGebeZr3fFklxo7OEZd567PximBeNNFvX
	uKzlvYNLcukFfLU/UVz2vkkycjKzloCIM5TSpfb8KHorWyc8F1GYz5VgcYSOkrged6mx5mhOs1eop
	JPHmttFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5Xw-0000000ELY7-13Ok;
	Fri, 14 Mar 2025 13:57:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5WG-0000000ELBy-3qqu
	for ath11k@lists.infradead.org;
	Fri, 14 Mar 2025 13:56:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EDu5UG024754;
	Fri, 14 Mar 2025 13:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSHpRfudomt1+AaKesezGs0x3pN3M5StEnb5ZNKlRqw=; b=NqoP6jpbD/PULXN7
	6I7zo+8IfD02R6gJ6uHuGGAwk7QjIIDuUOPO0eNHbQDNInSSIOiuGF4J0zVMn2tw
	rE8KuMGmRy3Zva/C95nZVp7YS4WSoEAvJe5bKM76Ue5jN/XHO4jVpTK7hHh/0tek
	k6jobTfCbvWVMHm+W7Z2s4cJrZRbe3d7nJZz6jjc0CUY1mT9l8aUq3wOuw91W98j
	Rq2eqGuaUqmkxUwWYDx/F2Qxh2P/e/nqYcZdEokLxSrVMuV1HHP2AaCgmIqe7utd
	rUWEzB51stuSC5NyLVsxtFJWB6Np80k/dHaPRBLub4msp9VnKwWVBHWcwTqsaQzL
	keVoPw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cnscr00x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 13:56:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52EDu7cD008662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 13:56:07 GMT
Received: from [10.253.39.117] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Mar
 2025 06:56:05 -0700
Message-ID: <c34f7d6c-0565-4ff6-aed6-902657938b39@quicinc.com>
Date: Fri, 14 Mar 2025 21:56:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
To: Johan Hovold <johan@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <johan+linaro@kernel.org>
References: <20250314061353.106194-1-quic_miaoqing@quicinc.com>
 <20250314061353.106194-3-quic_miaoqing@quicinc.com>
 <Z9Pm56Xx7kYZl8fk@hovoldconsulting.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <Z9Pm56Xx7kYZl8fk@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Qbxmvtbv c=1 sm=1 tr=0 ts=67d43578 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=zvfRP35NZ5SxQhbWGWEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q-UnRDT5vKxIkVsA9GpuaaNJ4RkeofkG
X-Proofpoint-GUID: Q-UnRDT5vKxIkVsA9GpuaaNJ4RkeofkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_065613_100378_FF58EF6D 
X-CRM114-Status: GOOD (  25.19  )
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



On 3/14/2025 4:20 PM, Johan Hovold wrote:
> On Fri, Mar 14, 2025 at 02:13:53PM +0800, Miaoqing Pan wrote:
>> A relatively unusual race condition occurs between host software
>> and hardware, where the host sees the updated destination ring head
>> pointer before the hardware updates the corresponding descriptor.
>> When this situation occurs, the length of the descriptor returns 0.
>>
>> The current error handling method is to increment descriptor tail
>> pointer by 1, but 'sw_index' is not updated, causing descriptor and
>> skb to not correspond one-to-one, resulting in the following error:
>>
>> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
>> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
>>
>> To address this problem and work around the broken hardware,
>> temporarily skip processing the current descriptor and handle it
>> again next time. However, to prevent this descriptor from
>> continuously returning 0, use the skb control block (cb) to set
>> a flag. If the length returns 0 again, this descriptor will be
>> discarded.
>>
>> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>>
>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
>> @@ -387,18 +387,36 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
>>   
>>   	ath11k_hal_srng_access_begin(ab, srng);
>>   
>> -	desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
>> +	desc = ath11k_hal_srng_dst_peek(ab, srng);
>>   	if (!desc) {
>>   		ret = -EIO;
>>   		goto err;
>>   	}
>>   
>>   	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
> 
> As I mentioned elsewhere, this function also sets the length field in
> the descriptor to zero. So if there's a racing update, you may never see
> the updated length.
> 

Will add below check.

--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -602,7 +602,11 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
         u32 len;

         len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, desc->flags);
-       desc->flags &= ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;
+       /* Avoid setting the length field in the descriptor to zero when 
length
+        * is 0, as there's a racing update, may never see the updated 
length.
+        */
+       if (likely(len))
+               desc->flags &= ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;



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
> 
> If you add the memory barrier and make sure not to clear the length
> field above, do you still see the length sometimes always reading zero
> if you retry more than once (i.e. drop the is_desc_len0 flag)?
> 
> Perhaps the device is really passing you a zero-length descriptor that
> can simply be discarded straight away?
> 
> Johan

Will verify your suggestion, thanks.


