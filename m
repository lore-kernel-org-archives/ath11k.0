Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3F4CA100F
	for <ath11k@archiver.kernel.org>; Mon, 22 Sep 2025 21:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LDmHGPzBvAlIgIdJc1sMUYY1nDOFFKwgh16pYuyb2I=; b=CtZFErT+MCcs63AwIVr2EtfSxM
	j8aM0tV+rb9z7xlj+1xVQkmQFIZ5c5b0HpEtHfVptM5Xu4faWupEFSU2IJuwIhPvPGdVrhqO6iO8w
	A3hs2u7LjDpYpUJLf0maJgN5tDzvwBL4PLzZLzYYZpQlbWtv79cYi0UsYiWz//0eVzP1izPxph44e
	wsy8IXFz/zHxG2ppigG7ItyXZBKl3W3zB/Th3rSd/tqbyjwa1j3F6ZTY3PpXIks6+aiQ/4SDcJsKj
	k6LkUjZY0d9/iVW55p1Ft2JcC1yqNryowFK6KvaN0+nDCgUidryb307ogMukRjw/+ZW9vOm14wO6S
	Ofn8s5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0oZ6-0000000BbKt-30iF;
	Mon, 22 Sep 2025 21:59:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0oZ3-0000000BbKG-1r9R
	for ath11k@lists.infradead.org;
	Mon, 22 Sep 2025 21:59:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MI0aPS015745
	for <ath11k@lists.infradead.org>; Mon, 22 Sep 2025 21:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LDmHGPzBvAlIgIdJc1sMUYY1nDOFFKwgh16pYuyb2I=; b=AkT9iD5yDkz2ePE9
	hYrle13HGQ84SwGViegVrJ6NjaVVf9fJ3FyaBJbfL1X2x4RT/lgN52Ml6+WHRQyt
	5YeTnbs3lnpqBjHSuHMcEBOCdK0mJFmXPHOs++OGR2rrJUeSAdNcPNlYQ0t/NqCs
	eu469/Us5gX6j/GKWdY2LCTXlsio0Kdeorghcz8EFiqvI48bT8Z0OprjBhROMVKu
	PzkXjw3Qqr/fyYTH4MMmuhHXAgkBXFl4A8WVyyhLa8B7CRRgrYU4UQLT00RuplP+
	rVulvB0RwxUFSr0/FpwByc2FLc17qGncFQ2AjO1R6V4lOpZja55LzhuXaKs5DbuF
	wr9qQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98eaqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 22 Sep 2025 21:59:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2697410e7f9so91926045ad.2
        for <ath11k@lists.infradead.org>; Mon, 22 Sep 2025 14:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758578354; x=1759183154;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LDmHGPzBvAlIgIdJc1sMUYY1nDOFFKwgh16pYuyb2I=;
        b=PwGS0gPnGwXdXGAcxkiNIf4vHPo/ywaL4pSVOfj4dTu1+kRz/gCs7IL8dugg9BmMoy
         GQNoXquYSN4UDYMOeJtFixv3z21RII+Qt9h6/WvouQcjgDTyz59FQhGoSeQm2kekS5tp
         aK/7s1OM5sSJrFycW3ooSfCxi/TvIwSKTJ87vfBcomaqx6EoahzgWO/giljSR3iVZWdS
         CQx1qoLxTscrPfThc/UXH4SzzdQYp6XaXvK5amSLENepcmYyK84FMQabIFe81Oe8X3hR
         DQqRg+U0EDpS/6avObiZDr4eYFopFQRVFygNoNDyXIw0obAbKeDwhKI3xMbEMROC4ogi
         LIEA==
X-Forwarded-Encrypted: i=1; AJvYcCUfg5MUXrfmLwzwgo6SSpfnm/lBiYiAMLSkqONBXfvyHK6twNT6FLo2A1b3Y6PJX6SuoXLhI+8=@lists.infradead.org
X-Gm-Message-State: AOJu0YypSb4hbZGU/wCUcytox/YVZ+OYuNQiGBYdT95sWlLUog035dXr
	90h1+R8mXjNitYXF/5ta+xY/d2+BrOa35hxuua+DAYj/2XgWV2nNMCXrX8BU8JNuo3Uy/D8DeC+
	WOe5xZKohXKigPzqruuErR9XZvhqVnGGB8IIopkFMIrAW06tS+rfafT1jWEGfc+pD+kTDjCG2
X-Gm-Gg: ASbGncs7rHH2auTvXulJu86BJqfdN6bc7tSmAqbbzafHXhSWRKxLiYQKXJWDwaMzsbP
	Z/pScyEX2Atx9t0RCgW0qaiWIe1lHwuV3a1U5jZ+gJHObyw2ZrYiozDqiiYIqD880zn95+cssnW
	TabKNAc2RUvwc6w35fmCcOqINto9tGY9p2rhI27ssWkZW8EqN0XgWo5DWCbT7XUueYPhwM/fUGH
	873/N1um6T4A88BnW/RbBFWQkp7dqqI/8RHHUY3NARHSukUT1R6OBTbnkzyuT9zZsFxhSW7z91v
	yIaBjGxdOCYElZ0nqZVuRQEAzMWBjjnp9RYIdpD0LnusEfbYcD4+Gu9RjWSH66Z3pKr8RC+X/ST
	fofzNpGaiIPmok6nXkyWcBd4MPNOqLWDNgUKq
X-Received: by 2002:a17:903:1547:b0:248:79d4:93be with SMTP id d9443c01a7336-27cc5624f64mr3801135ad.30.1758578353863;
        Mon, 22 Sep 2025 14:59:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGG6T7ySc8crxPcb7K8edEeVJNt96b5JVAn3AQ/h6MKUU8Y56um/AFywBRAM+AxXS7ufrcJg==
X-Received: by 2002:a17:903:1547:b0:248:79d4:93be with SMTP id d9443c01a7336-27cc5624f64mr3800745ad.30.1758578353279;
        Mon, 22 Sep 2025 14:59:13 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c08dsm141506235ad.51.2025.09.22.14.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 14:59:12 -0700 (PDT)
Message-ID: <b2885d4b-dd11-44ef-816a-9eed99f7a219@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 14:59:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: HAL SRNG: don't deinitialize and
 re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com, stable@vger.kernel.org,
        Muna Sinada <quic_msinada@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        Sven Eckelmann <sven@narfation.org>
References: <20250722053121.1145001-1-usama.anjum@collabora.com>
 <1598d25d-e254-410e-ac5c-66d5450fd686@oss.qualcomm.com>
 <ae7a08cb-af73-4a27-aad4-c852be5f77aa@collabora.com>
 <ab5af5b9-d5a7-434c-938d-3f9aac388542@oss.qualcomm.com>
 <86c465a3-f9a1-4a63-9e21-7529a5634301@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <86c465a3-f9a1-4a63-9e21-7529a5634301@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _8MFKRIBpodEMyyisqusDZsd17IK2map
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX4pXlRsMMP5li
 ZIEaAkk9DzPQhcFhCsA8jW1vdesT4Q4CsEHTZwcPfydS1rwJth+wMftvgGSXo85xgH6jTU8mm5H
 +P8tq9C/Pjdla7bVOor1k+yVeTa5k0J8wGUo5D3M+VgUmPwlmP5OAu0tumJR0tCbuMFfGLCFkR4
 jJ/PeDcNqNxyTBcrcirGLyGBvIbfWV0wKJErmdOtEHnd0pAmql8MjN8M2hNviMTqj+OZWQC3PV6
 nIjAQP0ZmEO/y60Xp058yH5YxLfAvNzt4wUVQGzNOSUVc/BvDqrsErGFQ9RpE5KSc5PY4Y/BXCF
 yQXOrp7KKAdL1rB9RbUt6IP/uw7DVDvRBUvvZNOZ1M4hKoS2pWj3x8lsY3nNOUOkAmXkPR1CS8s
 MtiukUrb
X-Proofpoint-ORIG-GUID: _8MFKRIBpodEMyyisqusDZsd17IK2map
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d1c6b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=RL02kzwgQxJZJf316toA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_145917_624781_BCB7D2EF 
X-CRM114-Status: GOOD (  22.15  )
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

On 7/22/2025 8:05 AM, Muhammad Usama Anjum wrote:
> On 7/22/25 7:07 PM, Jeff Johnson wrote:
>> On 7/22/2025 4:23 AM, Muhammad Usama Anjum wrote:
>>> Hi Kalle,
>>
>> Kalle is no longer a maintainer -- I am currently the only ath11k maintainer.
> Sorry, I missed it.
> 
>>
>>>
>>> On 7/22/25 2:47 PM, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 7/22/2025 1:31 PM, Muhammad Usama Anjum wrote:
>>>>> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
>>>>> deallocated and there is high possibility that we'll not be able to get
>>>>> the same memory allocated from dma when there is high memory pressure.
>>>>>
>>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>>>>
>>>>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>>>>> Cc: stable@vger.kernel.org
>>>>> Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>>>> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>>>> ---
>>>>> Changes since v1:
>>>>> - Cc stable and fix tested on tag
>>>>> - Clear essential fields as they may have stale data
>>>>>
>>>>> Changes since v2:
>>>>> - Add comment and reviewed by tag
>>>>> ---
>>>>>  drivers/net/wireless/ath/ath11k/core.c |  6 +-----
>>>>>  drivers/net/wireless/ath/ath11k/hal.c  | 16 ++++++++++++++++
>>>>>  drivers/net/wireless/ath/ath11k/hal.h  |  1 +
>>>>>  3 files changed, 18 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>>>> index 4488e4cdc5e9e..34b27711ed00f 100644
>>>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>>>> @@ -2213,14 +2213,10 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>>>  	mutex_unlock(&ab->core_lock);
>>>>>  
>>>>>  	ath11k_dp_free(ab);
>>>>> -	ath11k_hal_srng_deinit(ab);
>>>>> +	ath11k_hal_srng_clear(ab);
>>>>>  
>>>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>>>  
>>>>> -	ret = ath11k_hal_srng_init(ab);
>>>>> -	if (ret)
>>>>> -		return ret;
>>>>> -
>>>>>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>>>>>  
>>>>>  	ret = ath11k_core_qmi_firmware_ready(ab);
>>>>> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
>>>>> index b32de563d453a..e8ebf963f195c 100644
>>>>> --- a/drivers/net/wireless/ath/ath11k/hal.c
>>>>> +++ b/drivers/net/wireless/ath/ath11k/hal.c
>>>>> @@ -1359,6 +1359,22 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>>>>>  }
>>>>>  EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>>>>>  
>>>>> +void ath11k_hal_srng_clear(struct ath11k_base *ab)
>>>>> +{
>>>>> +	/* No need to memset rdp and wrp memory since each individual
>>>>> +	 * segment would get cleared ath11k_hal_srng_src_hw_init() and
>>>>
>>>> nit: s/cleared /cleared in/
>>> Please can you make this change while applying the patch?
>>
>> I can make this change when I pull the patch into the pending branch.
>> I'd like to see a public Reviewed-by before doing so.
>>
>> Also note that, except for anything critical, I'm not taking any patches into
>> ath-next until the upcoming v6.17 merge window closes and all changes made to
>> Linus' tree have been backmerged via net-next => wireless-next => ath-next.
> Thank you for mentioning. I didn't know the workflow.
> 
> No problem. There is no hurry.

I've modified this comment in my 'pending' branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=9de41dd4c35fca6ebfe300b3799507dcafb9005e

I'll promote to ath-next before my pull request to wireless for the v6.18
merge window.

/jeff

