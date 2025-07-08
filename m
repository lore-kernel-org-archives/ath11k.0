Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B098C8303C
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 10:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBWTgG1nt7QgnG2L1PdtfNApAGuuPN/fOFc0QPePaMA=; b=bR8NprVb1yXvY1+EjP5bB3a9Ts
	DH4nAllQ+XKE5xekKszKf7nvNUB0G3F14vl1M71pAlrJVmKw/0ZdYbyocxyf6MDLN7bnor3BEGBnk
	PbWiS8m3mXYmbtfb2+tIERRwo23Z3He1S1KPnqv1vJGgfCuUkqpKnOHHlvQtDHsY3MOOS5GE1IJAo
	gId0H2+2OeGEXD7MDa84F1aG+ho/MmnUTNkBxNQKCEL8d6vWY7ttxMa414gnbCXK+Sj25uNhV8GC1
	UPg5vfQpAkN+M3CghmjtMM5Xhi6+HpZbb5LZjTMCd9IvOtzKbfYO2Tlbi8lfpwbXMcYHAFCNyNtmP
	BMXH0e1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5o4-000000056L7-0dSl;
	Tue, 08 Jul 2025 10:44:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5j8-000000055Nl-1IIL
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 10:39:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAO9Y001166
	for <ath11k@lists.infradead.org>; Tue, 8 Jul 2025 10:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBWTgG1nt7QgnG2L1PdtfNApAGuuPN/fOFc0QPePaMA=; b=Gbgvtn8UMww41wns
	B5/R2pshzbfIbdd3D4bOEe4XGEu0os7l3mMaoJjdWOzdBFsGtF/CMQZAqlv5OqSW
	m6gyEdjx3Z5t8UblYJImazagnYYGrZY9hWnwpyvHQ6aNDXZa4gmcn1cPIZa2faxX
	wDckYvzBUiFW0iEBI8L7+EWtY36HgsRe8LF10RAG38CqqwmlpTCCqPwUZcivdaYI
	NQ7a2LgV4d1uFbITP+rWDruwf/jFM8fEbiMFcLWApIOmX2stZNz5B5vWIZwxf9wY
	NnovWdEcBGEAzkLi2yKZNWwXzj/wdoTusg5QRyeTqY7jI5uH3N9Om7FLUmOVlQj9
	KfuVVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqw0yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 08 Jul 2025 10:39:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d66fa6so35666355ad.0
        for <ath11k@lists.infradead.org>; Tue, 08 Jul 2025 03:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971142; x=1752575942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBWTgG1nt7QgnG2L1PdtfNApAGuuPN/fOFc0QPePaMA=;
        b=dwWmmARmvWtzML3ZGGIeHHE/UOzSfGR8fXQE8cXMuBJ0K04AVE7MezWTzooUriYrLf
         GD3PmTBwCNkeVjlD39U0IK9n9s72/YdeWtt7Pe1tRGoMBH+NVCDD21ebkkeiQfk2LYTf
         t4c4nEeYwqc+0LQ6EN0ZkOgY3EjcXlrmHDvTw0G3eXAhj3H+rBErIgEsTnES6qoD16OS
         EwwBuXv0au73YYMj3PqBBc2kpHnCVlyP4non+xf4j2kPF1Js3eXYiMy8qrHCWEvbECuL
         N3ybgsTu6Z6PuU7UMi9x0yOepRgkNdf/gujKWCHD1E7/k+3lebRIUdte5TVGADTQeKW7
         nT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzFrkVzTQ/IQBxNMg0Q4kFBW8bgi/hpHAz1Xu0SsTiLskpDxAfq0I4Y5gZTDDAi4KSR/Lkifo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVuRSrWEgPB2m98SJHaiz3e+5I1Sjw1eKyb69n25FnMtbVstbW
	MIdfuIba/AvbdK65DBb6nE+EmHF0g4ZlBMo6v0jbzncxnFWiTFE+EaCXFX+6VQwyOb47+Wf6fVL
	r79dtisLu0Eu+jHOKKBXRbdGqOqVlrZ/51DIIt8VYLr5vFwaT2UUQdo1/iaawZ4U5
X-Gm-Gg: ASbGncsk6wv927lre6IKQsVWjbVoV3JLDnlXomQ3SpFYMZZWN8IOaqVZbEP+qUy4rA7
	3xwQk1Mupj8ZPORitTiNf3+SHJvwLWoE1zzLdgOjc/ygfp2bthyuyFPThHUKZY/hOamI4+rV/ZH
	6pOD4aEHsOQqrfe5hW0k4lQs6fa4q5Bsbo5sR5dIx21kCSLWmiVewyxiRsV6nLcX54h9pwZUrd4
	8vBOrlEQeVtt+J1bUysTSrlLTdblJkDPYvoFJ6z/vy6rz26CLWePsitiXsSjOE4FrDH7tVt0XpY
	RBNMFFW+kxcC/lemAsGqan18zo0C0ZFiBWclJu6RQLawYveLvRXluO+MQ9P/Jbeax0kB1Y91vzC
	SujYIkLeybc+sD7Q=
X-Received: by 2002:a17:902:e788:b0:234:1163:ff99 with SMTP id d9443c01a7336-23dd1d7ef95mr32972015ad.43.1751971142356;
        Tue, 08 Jul 2025 03:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/n1Wv16I6oi8TfKFbGm9RVJSuG7cMjQtpyIJkVs3+lkD6ynLF8cQTccR4h0hqlT00wE5zA==
X-Received: by 2002:a17:902:e788:b0:234:1163:ff99 with SMTP id d9443c01a7336-23dd1d7ef95mr32971795ad.43.1751971141853;
        Tue, 08 Jul 2025 03:39:01 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8435022dsm114182915ad.86.2025.07.08.03.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:39:01 -0700 (PDT)
Message-ID: <7aa0ac35-068f-4738-abbd-f1073294365b@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 18:38:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
 <5f2a900a-3c8e-4b16-bd91-500af7d0315e@oss.qualcomm.com>
 <29ba0afa-9a1b-40f9-a174-d03902ea5d3f@collabora.com>
 <8b9eb6f4-6f0c-458d-b1e6-a1893c35b81d@oss.qualcomm.com>
 <a92b3d96-0c19-49c2-ad8b-ad31dec973c3@collabora.com>
 <7b8ea9ba-02ef-4676-a4d3-d088920283c3@oss.qualcomm.com>
 <9eba0149-290d-4010-8791-d4d8d8be3786@collabora.com>
 <fdb9f1e7-bf8f-4018-b0ac-ac8a70d9b8ec@oss.qualcomm.com>
 <5c9843b5-d756-4a99-b93f-d32ed8f16e32@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <5c9843b5-d756-4a99-b93f-d32ed8f16e32@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686cf547 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=n4c7CGo1Dgpf3paWKKAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: -kgoUGSwvS_G0Cn0diMemYGrf_S5BzA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4NyBTYWx0ZWRfX0woAXp3r2uG8
 0VKWJbSO0IFPdeF5MtrDDeE8M+7Fq0vORRpXXmTfbK3fHWE+EGq2Vo4PUHb0YVnXAob5MAegC5B
 /t9aavkzaom1ZLWHHhN0KccUyNFi0+a9lsjieZ2r1e8jF0eynbDAcMysQoq/P/GZl0oQX8lE6bt
 EbZY6q7SwFlVzM8zQexAIZq3flS4ybY8XAadlcr5NO0FalXUg7DTvWiUFhqkrCmIOBpmw8yEr6S
 2ZCJ5J/nT2FdlGmMrRGbbgfbdwUUERjKzN03DpRms1HjLvrfg6/BYPEy+wgi1u4h1jOenkGqSY1
 sUKyOqUPPb5OKWic3uo5a2dRyrguxtSNF8V2tXs/S52wao0kmn27WjGMAIHZbXp4KBWDM777gN8
 z5fu1LH8QPdMRrie7lEAnkuCA0xTfD/hbF25uhB7hUpOTXZCPNq+N/UGAQJa5fH8u2H4RQ/q
X-Proofpoint-GUID: -kgoUGSwvS_G0Cn0diMemYGrf_S5BzA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_033906_472004_1967E877 
X-CRM114-Status: GOOD (  26.24  )
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



On 7/8/2025 5:12 PM, Muhammad Usama Anjum wrote:
> On 7/8/25 6:43 AM, Baochen Qiang wrote:
>>
>>
>> On 7/7/2025 9:11 PM, Muhammad Usama Anjum wrote:
>>>>>>>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>>>>>>>> index 4488e4cdc5e9e..bc4930fe6a367 100644
>>>>>>>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>>>>>>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>>>>>>>> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>>>>>>>>>  	mutex_unlock(&ab->core_lock);
>>>>>>>>>  
>>>>>>>>>  	ath11k_dp_free(ab);
>>>>>>>>> -	ath11k_hal_srng_deinit(ab);
>>>>>>>>>  
>>>>>>>>>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>>>>>>>>>  
>>>>>>>>> -	ret = ath11k_hal_srng_init(ab);
>>>>>>>>> -	if (ret)
>>>>>>>>> -		return ret;
>>>>>>>>> -
>>>>>>>> while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
>>>>>>>> _deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
>>>>>>> Why do is it being done in the resume handler? Shouldn't those parameters be cleaned up
>>>>>>> in resume handler? So when device wakes up, its state is already correct.
>>>>>>>
>>>>>> Hmm... not quite understand your question. Can you elaborate?
>>>>> I'm trying to understand the possibility of cleanup of hal in suspend handler. For example:
>>>>> * The driver has been loaded and has been working fine.
>>>>> * The user called suspend. So all devices would be suspended.
>>>>> * In suspend handler of the ath11k, we should do the necessary cleanups of the states
>>>>>   like hal.
>>>>> * When the device would resume after long time, the hal would have the correct state
>>>>>   already. So we'll not need to deinit and init again.
>>>> The hal cleanup is not only needed by suspend/resume, but also a step of reset/recover
>>>> process. So If we are moving the cleanup to suspend handler, similar stuff needs to be
>>>> done for reset/recover as well.
>>> It makes sense.
>>>
>>> So clearing the hal structure completely other than ab->hal.srn_config doesn't seem
>>> right. I've also tested it and it crashes the whole system.
>>>
>>> On contrary, with only the current patch applied, there is no abnormality.
>>>
>>> num_shadow_reg_configured and avail_blk_resource are non-zero. If I make them 0,
>>> driver still keeps on working.
>>>
>>> 	ab->hal.num_shadow_reg_configured = 0;
>>> 	ab->hal.avail_blk_resource = 0;
>>> 	ab->hal.current_blk_index = 0;
>>>
>>> As you have suggested setting these 3 to zero, is there any other variable in hal
>>> structure which should be set to zero?
>>
>> IMO srng_config, rdp, wrp and srng_key may keep unchanged through suspend/reset, all other
>> fields should be cleared/reinitialized.
> 
> memseting srng_list and shadow_reg_addr causes crashes. Please can you confirm why do you
> think those should be memset. Here is WIP patch:

We need to make sure they have a clean state while resume/recover.

> 
> 
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,10 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
> +	ath11k_hal_srng_clear(ab);
>  
>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>  
> -	ret = ath11k_hal_srng_init(ab);
> -	if (ret)
> -		return ret;
> -
>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index b32de563d453a..d4be040acf2c8 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1359,6 +1359,19 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>  }
>  EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>  
> +void ath11k_hal_srng_clear(struct ath11k_base *ab)
> +{
> +// --> both of these memset causes crashes
> +//	memset(ab->hal.srng_list, 0,
> +//	       sizeof(ab->hal.srng_list) * HAL_SRNG_RING_ID_MAX);

You are memset too much, just sizeof(ab->hal.srng_list) is OK.

> +//	memset(ab->hal.shadow_reg_addr, 0,
> +//	       sizeof(ab->hal.shadow_reg_addr) * HAL_SHADOW_NUM_REGS);

same here

> +	ab->hal.avail_blk_resource = 0;
> +	ab->hal.current_blk_index = 0;
> +	ab->hal.num_shadow_reg_configured = 0;
> +}
> +EXPORT_SYMBOL(ath11k_hal_srng_clear);
> +
>  void ath11k_hal_dump_srng_stats(struct ath11k_base *ab)
>  {
>  	struct hal_srng *srng;
> diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
> index 601542410c752..839095af9267e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.h
> +++ b/drivers/net/wireless/ath/ath11k/hal.h
> @@ -965,6 +965,7 @@ int ath11k_hal_srng_setup(struct ath11k_base *ab, enum hal_ring_type type,
>  			  struct hal_srng_params *params);
>  int ath11k_hal_srng_init(struct ath11k_base *ath11k);
>  void ath11k_hal_srng_deinit(struct ath11k_base *ath11k);
> +void ath11k_hal_srng_clear(struct ath11k_base *ab);
>  void ath11k_hal_dump_srng_stats(struct ath11k_base *ab);
>  void ath11k_hal_srng_get_shadow_config(struct ath11k_base *ab,
>  				       u32 **cfg, u32 *len);
> 
> 


