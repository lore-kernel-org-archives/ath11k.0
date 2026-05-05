Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1EFFF8855
	for <ath11k@archiver.kernel.org>; Tue,  5 May 2026 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAeT39nlll9G6UuOdWosAUxItvDL2V/3OUKPO+ixxAU=; b=klzaJ0cbLvzBsvMi5QiH4JYg+C
	cXKW8qgJXvcBP979FLT3/UnF9eeV78ateCz65CjIwvFJVyB+nDb7XVoaA3Mg4W8jytSrst09fxSr3
	IxZt3OmmZbIYGWDphbtb9ehzzAOYnfzgR5Du3ZEpPg5wz1moUZprox07g1bGU1XBwjFy9+hcRSd2C
	nrC1S1wBBVm8Sh+E8g201plbjCbTvfwUphUVrAans68nYPaxqji7JlVGyQTq7WVNLhQb/yTt0IuCr
	i6Fr/LNmiteVgDnx0o3mzN6tN/XrZzoWv2Tk2l/m61DnOInaiWAryyqw2w0/qnSZ1moqbFbXlRHy0
	rmoIFkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKImv-0000000Gv3S-1I8Z;
	Tue, 05 May 2026 16:38:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIms-0000000Gv2x-3rld
	for ath11k@lists.infradead.org;
	Tue, 05 May 2026 16:38:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CDsXM2187320
	for <ath11k@lists.infradead.org>; Tue, 5 May 2026 16:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAeT39nlll9G6UuOdWosAUxItvDL2V/3OUKPO+ixxAU=; b=XZP0J8AjqYtxnrR8
	0YXDJGRUWc6XjSKObbgEFZ8y4PDXwlS/m0uvD5UC4FgTkp9FCHQZScQ0AQNOXRtG
	g1rauu4nM1V4wxIoURI0ZQMkhEOvm0ZaO1+ooKDoPsovDcQr6Ui0fD4rDihQyiot
	lmzaKMhAgRuZ4EDZd5wC977nCnur046GchwXa3ZwTwIdVLemQluZy3zWSLq78IfR
	QzbYHKSsMFvONo349qwpL9MM0xTjHEM7N9YClp2En7Qrd1xk4ABUbsBLdkzyDX/s
	HStSICU6MR8GyIRFDZfweFmEblP5yRjMJFmZucdOsuldiSpAsJPocjvP8jwflO3c
	TSNiNQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce13ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 May 2026 16:38:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so86288435ad.2
        for <ath11k@lists.infradead.org>; Tue, 05 May 2026 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999101; x=1778603901; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAeT39nlll9G6UuOdWosAUxItvDL2V/3OUKPO+ixxAU=;
        b=c4CBdOjVGebBRWEO2eGVNXNt3s+U51rDrce6xJpt3o71Molj8SafIthkVYDdm6IQar
         n0he4joKJbmYxfBK61JeR0Q75T6hCRsGCsQ5u46i6QMPLb2Fzat2HFPzOtBaqaJcoFxo
         a2zzVNBX94RG9D7yZrOKAVPM674Wr92yM1Sa47j5nmJIE7vzQNLPk4QO5sp6gZKylftv
         0jOZyJRi+n51VJ82ebW3bcdTIEMYv0ZkfECe+nVobOk6YmFCU3/cR0NrWupJioWdjumg
         49dfRL9MzDyzxjFsxG2ib9aZz33weu+AY2mFEd1qLUFKmIh4KJ4Bpu5uUPtjhth9QmmD
         JpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999101; x=1778603901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAeT39nlll9G6UuOdWosAUxItvDL2V/3OUKPO+ixxAU=;
        b=NRP0Q2/y3UVwQTHuApXDsXIc7Q4qoauDexzTynAj3cPsQb1hTK3ATOdw8pVnmWlZ2J
         IIqVIcNrFSnwWIAXyZhlKXnKedhsAHjPhfixM3Th3/NbMDzaSm/0vDxYY8a8KABv48HA
         auMHvv83u1jfQ2D6OqJDhD7edR3NjE5mums2tJq3n+HsZjP17UU4rkG1pMeB8IsJRkmq
         77gO6RtJuE/2eTnHvGRin6F++XDSz1qJGWh6cna2Djj5Jo23lAzBM/YuMT0qi444wcD8
         99x2WVtkg9sQlhAiuh/9KesKhCTegWVrgS5y+GmYp69tSmkNs6G0MrcP+dje9KTe7duw
         L5FA==
X-Forwarded-Encrypted: i=1; AFNElJ85ydxDOpOok3bomLDNAmgN44W5wuzKQ/ke9C/zjqXEk5Z8dqsPQ703S61bgmKR1B4EYqFNKNs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzY6g8+oNVCURxqK99FKq7wEP+bkh1OXqxlw4GMXuNZkUFRfEW5
	IEownK24XquHfKa3EyBOaa4wEvXur97IyFaR53fK9Yg1yf7ln0N7WR/PazKbrz26rocl5dP0mxK
	zDc9hdJkVPGf+c354fiE2IF9ShDGjqRSePJBqxtB3I46642gkUOhCTgm4WwpGXB/3
X-Gm-Gg: AeBDies11l7y1VylmeuyCYLpXV2wAk/NYcpHMJmb6Ab7yTOkT8ybkNJ1z50Tqm+SEP1
	GNqApizXm7lM74v/RFEsIbFRjKAAWoOq+xCDpYB2nmEyvpLaTryXwEkbwQ97Ofc2sYiA0Wn21pN
	ew8Q4hcIntpuQjded2J4+fbei+bS2KBicrErrz209QGPSRiIsR5Zntu2UX01zBrUXfmBHfrkSvQ
	4aUhRXEPdW0w9hD19CT8bo2dwQ7Ktm1rgrghuS/VqiuUenupp+9HsWDlElzuxBZIikolReI3SI8
	btUWNkTjTpy00rI+7WirCsYBPGATcTdLZF1FhePHi4vYVAaWytTemHg3cemXhdJsmBx2yEovSC4
	dLPbbjGycQsKwl6rDAgYxQu3VZWy3GVArevwunUFr5lV7WAHu/74RiUT9dHEjxFfwLkEBV2fSQP
	EV
X-Received: by 2002:a17:903:390d:b0:2ba:7181:7059 with SMTP id d9443c01a7336-2ba7181767dmr8784345ad.27.1777999101297;
        Tue, 05 May 2026 09:38:21 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2ba:7181:7059 with SMTP id d9443c01a7336-2ba7181767dmr8783985ad.27.1777999100611;
        Tue, 05 May 2026 09:38:20 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caab231dsm145884835ad.26.2026.05.05.09.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:38:20 -0700 (PDT)
Message-ID: <7a7d32f8-78e9-48a2-8914-0a7864345d25@oss.qualcomm.com>
Date: Tue, 5 May 2026 22:08:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix use after free in
 ath11k_dp_rx_msdu_coalesce.
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Willmar Knikker <willmar@met-dubbel-l.nl>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260505143025.234292-1-willmar@met-dubbel-l.nl>
 <7d3c5eae-233a-4c31-b64e-70f0afe74da6@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <7d3c5eae-233a-4c31-b64e-70f0afe74da6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfXxp0UdqpuwHpl
 QERyB/Cq20nL11L+czKgyogKKT/NyN5/uypPfzCZAVnIcIiIq2FDwlKl+im2dM+tPVheEFMF6XU
 QU5dZs6WdzWUf/hdt5sl61iCoGA9ttJb4KdNuXwBbx5g+AXJUR9dZS/mQu0LZfUnJs7xcUo4pDe
 mrkgSQr3YdUw0qdzICVVZ7CwtwzPY0Ir1N4L+IQHpnL8n/jIE4lEFWnFCHX6yGY3gj9ATYzEdkF
 MGde8BcER1AsUpYkURSuhu61NQdRpI965pNi/HN1dnr1UFpu8H9eWXIs2j5ytLSnwoz6AzpmiXG
 /HGH52le6/Z6qhUSb0ALgKgMNd/FHIupoMNfz+sgYD+HZD5buz+1NNthx/TXv9jYjM5ze773csy
 rLKif2jCXygH79taczSoxxDEJuGBfIH/oShFMdguM434XPNQ8fy2g3zr96+c6CHg5UIVHyac6OQ
 bmeg/bhSDfCm0uZG4lQ==
X-Proofpoint-GUID: leE9nEXiXDHsPwRPw5uckv_BhF9VeNr6
X-Proofpoint-ORIG-GUID: leE9nEXiXDHsPwRPw5uckv_BhF9VeNr6
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69fa1cfe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=9B1uR9gGAAAA:8 a=jibNTVOUyd4WZLb5gSQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=8R3p93Tjo66ouot214C2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093823_041306_FBCFB8CB 
X-CRM114-Status: GOOD (  20.45  )
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

On 5/5/2026 8:38 PM, Jeff Johnson wrote:
> On 5/5/2026 7:30 AM, Willmar Knikker wrote:
>> In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
>> the dev_kfree_skb_any. This can cause a use after free kfence.
>>
>> Move the use after the dev_kfree_skb_any after use of ->is_continuation
>> inline with the while in the while loop above this one.
>>
>> Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>
>> ---
>>   drivers/net/wireless/ath/ath11k/dp_rx.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> index fe79109adc70..02bd9787d6b4 100644
>> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
>> @@ -1825,11 +1825,12 @@ static int ath11k_dp_rx_msdu_coalesce(struct ath11k *ar,
>>   		skb_pull(skb, hal_rx_desc_sz);
>>   		skb_copy_from_linear_data(skb, skb_put(first, buf_len),
>>   					  buf_len);
>> -		dev_kfree_skb_any(skb);
>> -
>>   		rem_len -= buf_len;
>> -		if (!rxcb->is_continuation)
>> +		if (!rxcb->is_continuation) {
>> +			dev_kfree_skb_any(skb);
>>   			break;
>> +		}
>> +		dev_kfree_skb_any(skb);
> 
> rather than repeating code imo it would be "better" to cache the flag before
> freeing and then test the cached flag.
> 
> however as you note this proposed logic matches the logic already present in
> the "Free up all buffers of the MSDU" portion of the function, so from that
> perspective the proposal is consistent with that logic.
> 
> let's see if anyone else has an opinion...


IMO a cached flag is a little easier to read and harder to regress.

Also please add a Fixes tag. This appears to go back to the initial 
ath11k commit.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")


--
Ramesh

