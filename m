Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB41C369CB
	for <ath11k@archiver.kernel.org>; Wed, 23 Apr 2025 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI8p1FKSjrsTzbJbzVg5SpTQ5yttOOHdObui3LUhhiw=; b=e6UqyaYOkBaYVI7Hh2Gh39TPgM
	ZN5OdiFBmwAh3Fttzt7aP4+Q2/iFZeTGr/0Fd1xmG2Ky7mQzAWLSiGwniY6VAmNZiAgUyPh/xn5Dw
	SeFA6023vZh0tWWFhG45PGN8wV130QbfZ0Un8pcYJ6/h6cMSLDUHPYvNZYFVBf9VoS2wtso1C6ieF
	g4Y5nM3kecisiN9g5c2Klv4+fpptFccpZxKHS6GNhpwcVXA33Ix3s7JcbF4fN7oz46RNCBIuZSJmI
	0pPcYuwReGba+RLJXoWxC0l8QFNm4iZRPP+ukRpLwaJWOgeTx6qvsEmGtRuqkz2d9v7E6kCNiy4pJ
	HkNTiCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5S-0000000BISl-2PSY;
	Wed, 23 Apr 2025 17:40:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7b5q-0000000ApXo-3e3V
	for ath11k@lists.infradead.org;
	Wed, 23 Apr 2025 14:28:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NANgAA022421
	for <ath11k@lists.infradead.org>; Wed, 23 Apr 2025 14:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RI8p1FKSjrsTzbJbzVg5SpTQ5yttOOHdObui3LUhhiw=; b=VC/dQ1KM9IG/hSFW
	JVTUndSPIoH/n85bst0pAkMR8wNSC1yQXRbdWtCpnImka1t/osZeHORUb2pzThuD
	ln3w0E/ZZh12vZ0NBXqrI1F6IqbcbL21mVv5bvcClPdfUcYHR76VJxJ26G65PBvG
	5brtROsprjWp/YwXB5gZD6rhiWHjN/LH0OB1+YH5nFqovdZVHIbqfhlFbY7wgsBr
	+CSajBrns1f8kD25Ev2r+BXi8U6jGOlrrc6jdncP4mjHDcBkaQVqR6g0vpI2+vgh
	/U12dos69D78rhJdGEtWDEUSAXBM63eAh6+HTC+8foBW0l7FTxCpZGvrAQJqWZxf
	dZYKxg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2adud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 23 Apr 2025 14:28:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a96112fso94399345ad.2
        for <ath11k@lists.infradead.org>; Wed, 23 Apr 2025 07:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418533; x=1746023333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RI8p1FKSjrsTzbJbzVg5SpTQ5yttOOHdObui3LUhhiw=;
        b=wQR/kaIeUUxZkDXCY+f314cpmcLADVOUZ5vX0R7l3S/vXjmnCK7NB60H55IyAP4yMU
         MCfdvXUkuJLrTtBibdw70kHF9yTSesKNwUVKW67zSsn211a8vbGUe1r1zOuStjPL87c7
         wpkY2bwbG0OnHndXJJCWLJ/AY7XGuP4LTEZNRY05y1D516cfbC7i3K+Mj+BZ8CluoK7U
         racS7UInD3mnh3mS3PECR7LsdkTd0oEGH6cUzTM8eODKo2a3Q4J0PC4E/BQa5el6+rxJ
         Xa3f4NPvHTMav9YzyCVgiBbS8xk3TzC4f3sJtbV2RSqnwvJHZPHzh4Ep0AmI/v0jWiXk
         YHDg==
X-Forwarded-Encrypted: i=1; AJvYcCUDzNtqUZner/q+OiFNCoPF74bWTy9R54p1/CLF8Dy+dV2QtaJM7jBsJpnhL1CZ6PyyNtSKp0E=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcnf+Pb9Y1y1sPXW0exgpJUPsMdufQyoePhreyoONHVqu/J0aJ
	QPX6m5+oY0A74lW6dZCjOVNvsyaZEpxKshatfCcPkNHLpjgablx/XAA3IgGjTrtUydn3bVkb+4/
	S5yVaUWiJ3zv/RU48Rg3R+Xa1Ay7X6hr7iNZ/rTSj8deYtC6TZz09v8lFQPxu
X-Gm-Gg: ASbGncvRotLIWrIp44Vf6hauCJnQ+lECRbxSjGdSryMkpPP/aN79rtj1fwonXLPKLGN
	aSSlqY0z/A2+FmGOPgF5iJq7tir4UhMiPZOi8+WAeFsRNst0KYKcNSj82fkskpE2sqaKCW7dsTa
	NmVZb5wGi2Azq/M0cRpbj42CBQyVMuUMmizY7nvzv6HtBaDYWR6b4vRaxXf+GUhdOzAcPyN3vok
	vKaMaV30aICUIlUR61lqn6I8lmcXf9wvcDv2U/6Rhk9zqxH+1HsFrYMURkwNBger8Oz9F8P8nTs
	ZIZZs/GCMJCYKQO7CkWO/0x92DJKheIUNyvxNN3fBOgTb0exg+SSrXo3y8lQMK2O0ZI=
X-Received: by 2002:a17:902:f14c:b0:220:e1e6:4472 with SMTP id d9443c01a7336-22c5357f2f4mr219639115ad.13.1745418532710;
        Wed, 23 Apr 2025 07:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCNu809EkQVsTIbQad9yh76IO7LGCSGm7PzVmwCgFbrK+zwOALKe/846lCKlRIrlk7DV74kA==
X-Received: by 2002:a17:902:f14c:b0:220:e1e6:4472 with SMTP id d9443c01a7336-22c5357f2f4mr219638815ad.13.1745418532265;
        Wed, 23 Apr 2025 07:28:52 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdb0e3sm105389555ad.21.2025.04.23.07.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:28:51 -0700 (PDT)
Message-ID: <228546c4-a4b5-4f21-950d-2623a48f60a6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 07:28:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Fix memory reuse logic
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Anilkumar Kolli <quic_akolli@quicinc.com>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250423065931.4017574-1-usama.anjum@collabora.com>
 <f98ed1af-e190-404f-a2d2-aa64a712e7c2@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f98ed1af-e190-404f-a2d2-aa64a712e7c2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: msTPTTbtMnWPU-afqqp9oTXuqgyO1K0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwMSBTYWx0ZWRfX9MrfyGcy4zs4 0oY1ItVye310axrheN6R2MA3FgwV05ao6hLpew93YQ2WWdgemGje3TpArL3QibNBgx480LHQH1r XQdAL/qe5JUBovKDvPv//+gPyElwqI1XQedOKicbP8F7yfJC7XB0k5CwkscbKBjM5bd7lRmvM6j
 QuQlT5Lqfmbxb1Tpuy1ZQlvxVwDqoQVlW99bUgsSnbokHGWE/MAOJGTR8JkbtNOkc0FijhTNc+7 wvRGvNNArtGRG5rRuHp5xDT/bldMcd9uQjSJo6jTvmBBlrsqNWgvlcY2dH9w3j745ns4ZYH2OAW B9wkfpVMqBKq/UfbTJJrRsegVzJ5tA6hky/whFeTWfmO7324xJVJhpaE+j9DexsMkGSHNwEI78U
 uw1+7/aSowbvn4ZJRmr5zCYfTCVHPv+BZK8l6UOxQ8iMUyaTPQONO/iqnXsvPXLNVueRfyHw
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808f925 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=I_dGSvPyyRiqSV0Bi5YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: msTPTTbtMnWPU-afqqp9oTXuqgyO1K0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_072854_919793_2704FDA0 
X-CRM114-Status: GOOD (  44.31  )
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

On 4/23/2025 1:15 AM, Baochen Qiang wrote:
> On 4/23/2025 2:59 PM, Muhammad Usama Anjum wrote:

For starters, can we make the subject a bit more specific, i.e.
Fix MHI target memory reuse logic

>> Firmware requests 2 segments at first. The first segment is of 6799360
>> whose allocation fails due to dma remapping not available. The success

the memory allocation succeeds but the remapping fails? that seems like some
specific information that actually isn't very useful. From the perspective of
the driver all we really care about is that dma_alloc_coherent() fails, not
why it fails.

>> is returned to firmware. Then firmware asks for 22 smaller segments
>> instead of 2 big ones. Those get allocated successfully. At suspend/
>> hibernation time, these segments aren't freed as they will be reused
>> by firmware after resuming.
>>
>> After resume the firmware asks for 2 segments again with first segment
>> of 6799360 and vaddr is not NULL. We compare the type and size with
> 
> suggest to rephrase as:
> 
> After resume the firmware asks for 2 segments again with first segment
> of 6799360. Since chunk->vaddr is not NULL, we compare the type and size with
> 
>> previous type and size to know if it can be reused or not.
>> Unfortunately, we detect that it cannot be reuses and this first smaller
> 
> s/reuses/reused/
> 
>> segment is freed. Then we continue to allocate 6799360 size memory from
>> dma which fails and we call ath11k_qmi_free_target_mem_chunk() which
> 
> it is odd with 'from dma' ...
> 
> I think just say 'allocate 6799360 size memory' is good enough.
> 
>> frees the second smaller segment as well. Later success is returned to
>> firmware which asks for 22 smaller segments again. But as we had freed 2
>> segments already, we'll allocate the first 2 new smaller segments again
>> and reuse the remaining 20. Hence we aren't reusing the all 22 small
>> segments, but only 20.
>>
>> This patch is correcting the skip logic when vaddr is set, but size/type

see
<https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes>

Specifically:
Describe your changes in imperative mood, e.g. “make xyzzy do frotz” instead
of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do frotz”, as
if you are giving orders to the codebase to change its behaviour.

>> don't match. In this case, we should use the same skip and success logic

who is "we"? the driver is performing the action. As part of changing the text
to be in imperative mood this should go away.

>> as used when dma_alloc_coherent fails without freeing the memory area.

add () to function references

>>
>> We had got reports that memory allocation in this function failed at
>> resume [1] which made us debug why the reuse logic is wrong. Those
> 
> The link is just v1 of this patch, it is not the report. If there is no public report,
> just don't mention it.
> 
>> failures weren't because of the bigger chunk allocation failure as they
>> are skipped. Rather these failures were because of smaller chunk
>> allocation failures. This issue is in the kernel side as because of
>> memory pressure or fragmentation, the dma memory allocation fails. This
>> patch fixes freeing and allocation of 2 smaller chunks.
> 
> I know you are describing why you start to debug this issue. But I don't think it is
> needed in the commit message. No matter kernel allocation fails or succeeds, the issue is
> there, and the description above is sufficient to make the issue clear.

Concur with this.

> 
>>
>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> blank line needed.
> 
>> [1] https://lore.kernel.org/all/b30bc7f6-845d-4f9d-967e-c04a2b5f13f5@collabora.com
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes since v1:
>> - Update description
>>
>> Fixes: 5962f370ce41 ("ath11k: Reuse the available memory after firmware reload")
>> I think we should keep fixes tag as ^ claimed that its adding reuse
>> support. But it left a bug in reuse which we are fixing.
>>
>> Feel free to add it or leave it as it is.
> 
> Jeff, what do you think?

I would drop the tag. As I understand it, the issue described is due to memory
fragmentation/starvation, and not due to the fact that ath11k does not
actually reuse the first two segments.

> 
>> ---
>>  drivers/net/wireless/ath/ath11k/qmi.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>> index 47b9d4126d3a9..3c26f4dcf5d29 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>> @@ -1990,8 +1990,16 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
>>  		 */
>>  		if (chunk->vaddr) {
>>  			if (chunk->prev_type == chunk->type &&
>> -			    chunk->prev_size == chunk->size)
>> +			    chunk->prev_size == chunk->size) {

please don't change this...

>>  				continue;
>> +			} else if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {

...instead just use if here. we normally don't use else after a statement that
changes the code flow (return, goto, continue, etc.)


>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "size/type mismatch (current %d %u) (prev %d %u), try later with small size\n",
>> +					    chunk->size, chunk->type,
>> +					    chunk->prev_size, chunk->prev_type);
>> +				ab->qmi.target_mem_delayed = true;
>> +				return 0;
>> +			}
>>  
>>  			/* cannot reuse the existing chunk */
>>  			dma_free_coherent(ab->dev, chunk->prev_size,
> 
> 


