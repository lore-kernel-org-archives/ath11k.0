Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAD6D3B7EA
	for <ath11k@archiver.kernel.org>; Tue,  9 Dec 2025 05:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jc4jv2RNuyXGveHXHTVYyuwtb9MnQoiXlS8KJa9ej4A=; b=HNbUD/UeG7Jfh2XLZOUyR5SruQ
	Bp6k4icatya1zm8et0bfIIHUlwWN/AoKcQiay5Ck7NBJ0ch8KzUiCgSvbNh9qqh+WtoCTcmSUlD8G
	zEORF3lZ6lF2he8XaE53kyrnpIDaUH1yPtnPBhWTIRrS6QKc8zJTcf62phwtm53IfSKYN7+KOx36O
	OJMf/nnH09oWz5rTLOGAI1jY3zZ76cAqnbECp6XF7gzQFvLYKfKI84G3EXSB6XrEwQMGVL1NFrBh5
	27pfhG8PRh3KTQl/VRkmTCQ4RRjG87C/IR9DTlQzwHZXFBl7M7MVrn1xRN1PQPgZ6/kd85z3UBbFh
	UvRrrBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSprc-0000000DpDb-2kE6;
	Tue, 09 Dec 2025 05:02:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSpra-0000000DpDB-10xU
	for ath11k@lists.infradead.org;
	Tue, 09 Dec 2025 05:02:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXC8o1737377
	for <ath11k@lists.infradead.org>; Tue, 9 Dec 2025 05:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jc4jv2RNuyXGveHXHTVYyuwtb9MnQoiXlS8KJa9ej4A=; b=N5klPZ/1AvOgjugL
	nkdxD1LwFil6nKqnTeMQK/1A8D/sf8Hhswkpynx+heqYl/67/jJyDSl7DKEWIcct
	l2dPBB7fuLjHgQxC5p01wQY+Qv3laQMCtpkH/MhgZUtXIF2Xla+QS1BzleyhrcqA
	JN8MsaGlrjV9vYDa8WOntoDR3Poa7cTJYCuYylyhjs9YpVom4RKp460YIAZ2T7zv
	OehClvfmc5LF1BjsiXF1uscI6vmSVsHeLLfrl1TO581cXreaNCGflsbbutIuP2Ix
	NT9oQSXiTRB59ZVaeY0eyuzDASnYEQng0AJRzAaYYuCNyzeFZH4ZF+jy+0PscQ4U
	tkwVmw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awvke2yyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 09 Dec 2025 05:02:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso5247239b3a.2
        for <ath11k@lists.infradead.org>; Mon, 08 Dec 2025 21:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765256532; x=1765861332; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jc4jv2RNuyXGveHXHTVYyuwtb9MnQoiXlS8KJa9ej4A=;
        b=EzWdbVomAY6aOv1+8Kc7Xw0CTrj6/drPBrcuIuzHiJ55RUzSPaDrIKgxZibcGUYeQu
         ngJc6VEclgfiVKiqF1MnmSv+DfinE0x1EGP3Lq+NHpro8Z7qUTOPuOAIio88KpQQN20z
         JOS29dKteHa9/yf4nCmr1eew/TF77aL6GXimOzZpRvIRXULuQd3P4+CjOPYKVstnavc/
         wlYJVAcBE4vPvhaEcazNLahxosUkhd7qzrYoADwMmMppa4JtpBA+XYMxAp0UuI1f0U6r
         eFMsFtZthLRg0PRz1PSYGKJl0bsnEgr7P6PXU/I0X8xTQ5l0nlp3xv05naeWj841i0dH
         RxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765256532; x=1765861332;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jc4jv2RNuyXGveHXHTVYyuwtb9MnQoiXlS8KJa9ej4A=;
        b=VG7SuhA+Oltdb8+gLJnPYB3sKiIZqTtFyhipsyyBE+qM89BfEtHLieLO0JEsAu9MTm
         PHNuvVo69peWJN4lknnQ/EzsglvGebsGtx1XQx2NEXLshvcJvphWtMgyZ+qEpNtubAtv
         a648hsZI1VbEcJAMPLSh1kWZlpIRz/+h8biQ9LBYK84jD0TFPYNG/mIVC67CO+TMrnex
         wExt2sevqE1rWV4kmy0y5Icd+if0U7rqu7USvH9OKUiMSsWRboSbL5NNMKXsShDqGMt3
         BFHhSL+t5ZiW7KV7zk5FPSvHBeaXuEZp5kBTP4ux4NQG6pRpUR/KryQTIofaLDOQHxAZ
         GsNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWktsDWcoFeLbDjHVKliilgw9FB1BEav8miyLLaUt5ZhV82Mmi+DKk50/daNV7ZyroO+LYzYcc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi8qf8AW/R3qjD7AyoZqkahuVYjxunMqtKNoE8hey7XlLOXoMX
	PpSsc477jnzLw6gFZzzKLBAwhA5M4Qjnk8HMsGHeii6+9TRufPRbDwODV8h0Oh9+dYW2r4goHc7
	Xxn0qyRNAzjb/q0FRThkFZVwn8q8T82tbNIarJFWhaAu7+2MvcODgzQdwphLTUpv3
X-Gm-Gg: ASbGncu+0sulkVlEJVQWwL8rjpWZGGNLxBq6srGaEkzzpij2OGU8cP5zoRi5xCgoK6a
	EuSp6kFZ5jehsHW1rIJYFvol9+G5SYESDCy/5GXBHpeTw5TOvunT02TJ7N3sTJPOsmrR8ct2lkg
	bNld5Ah4wRadBXRSxxkfFYDPluHQEYEOJv83lkCPvGGYgwmwny58cqN7dAbbav0CWlECMEXeq1a
	Cv+lIoFi15wQGBpKYyzyD0MHFBchyhUP3b9Jdwy7avUtWCLpTLFdU5/Xm7429Vta57Hn1qxm1xB
	S5/Chb+SlVLIBzg3966GRteHxZL2M0qaka9RrRQRhEhKLfySyFRMbz4mpzLmPvoBuAKpdAMwjTO
	2TyfiQ/mP2xa/KvOzkQYE8p+W+ohf0Zn8HBPHGhKNz3E8TbtfGH3B6vs=
X-Received: by 2002:a05:6a00:3981:b0:7e8:4587:e8ae with SMTP id d2e1a72fcca58-7e8c3912445mr8517335b3a.33.1765256531725;
        Mon, 08 Dec 2025 21:02:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYLdzTPb0B57/9aI4fS+XKXuKcTD/o71EuRLCeGYL7FTGUtSJh8ceVafXGdQFf2b8l3oLSuA==
X-Received: by 2002:a05:6a00:3981:b0:7e8:4587:e8ae with SMTP id d2e1a72fcca58-7e8c3912445mr8517312b3a.33.1765256531194;
        Mon, 08 Dec 2025 21:02:11 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2aef9f649sm14743547b3a.55.2025.12.08.21.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 21:02:10 -0800 (PST)
Message-ID: <4b793236-2008-e57f-3257-48a65dae5d8b@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 10:32:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] wifi: ath11k: fix qmi memory allocation logic for CALDB
 region
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, jjohnson@kernel.org,
        ath11k@lists.infradead.org, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20251206175829.2573256-1-mr.nuke.me@gmail.com>
 <01a05a49-ae5f-a3ec-7685-02a5f7cb9652@oss.qualcomm.com>
 <cbf3e828-77c9-8291-1328-7e876a8843d1@oss.qualcomm.com>
In-Reply-To: <cbf3e828-77c9-8291-1328-7e876a8843d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WffMdGrtJdtiZklwQMcGvSMOgFBP39VU
X-Proofpoint-ORIG-GUID: WffMdGrtJdtiZklwQMcGvSMOgFBP39VU
X-Authority-Analysis: v=2.4 cv=UvBu9uwB c=1 sm=1 tr=0 ts=6937ad54 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=EWcMrb2KQbkG0C4WZugA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAzNiBTYWx0ZWRfX2gK4gHiSIjyw
 hlL7rgKOh2lqFh2GPQuuvPnYeuzgH1eyQljf2U4ec7DC8p795iTFm/H9zGPGnDQ3eCntFybM+dc
 uC0W3Np/Anf8E7247YSEM8EbOeYF6r7JRBoyvWibik+zxM6pJ3TyiUAUWlZom+Bwj1SKqF6ceYr
 UG32VZE0rUMa1sUQ+uGxKbixzgkyo8NZPgH865SlBjJl48o3WHagVlO+cZWw87XdF5TUwHWisXK
 5rbxTiecCYb0FSEnOTjV2LN2FYnHyJzXXzqtMQXZLf1JUYNzMZdPtu843xPGtPKEAfTIzUL3xj0
 iXVIbnS4VAiy5xAFLcUYTGR1+t/W/1/aHkpjCyHOFvSejqA4e+PJAm1nt58L7VhtUAJT54viqWI
 Ixth8hyYvD6x/6YiG7xuPUJ6rocGcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_210214_412257_77FF7D43 
X-CRM114-Status: GOOD (  18.17  )
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



On 12/8/2025 3:55 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 12/8/2025 3:38 PM, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 12/6/2025 11:28 PM, Alexandru Gagniuc wrote:
>>> Memory region assignment in ath11k_qmi_assign_target_mem_chunk()
>>> assumes that:
>>>    1. firmware will make a HOST_DDR_REGION_TYPE request, and
>>>    2. this request is processed before CALDB_MEM_REGION_TYPE
>>>
>>> In this case CALDB_MEM_REGION_TYPE, can safely be assigned immediately
>>> after the host region.
>>>
>>> However, if the HOST_DDR_REGION_TYPE request is not made, or the
>>
>> AFAICT, this is highly unlikely as HOST_DDR_REGION_TYPE will always be before
>> CALDB_MEM_REGION_TYPE. >
>>> reserved-memory node is not present, then res.start and res.end are 0,
>>> and host_ddr_sz remains uninitialized. The physical address should
>>> fall back to ATH11K_QMI_CALDB_ADDRESS. That doesn't happen:
>>>
>>> resource_size(&res) returns 1 for an empty resource, and thus the if
>>> clause never takes the fallback path. ab->qmi.target_mem[idx].paddr
>>> is assigned the uninitialized value of host_ddr_sz + 0 (res.start).
>>>
>>> Use "if (res.end > res.start)" for the predicate, which correctly
>>> falls back to ATH11K_QMI_CALDB_ADDRESS.
>>>
>>> Fixes: 900730dc4705 ("wifi: ath: Use of_reserved_mem_region_to_resource() for 
>>> "memory-region"")
>>>
>>> Cc: stable@vger.kernel.org # v6.18
>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>> ---
>>>   drivers/net/wireless/ath/ath11k/qmi.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>>> index aea56c38bf8f3..6cc26d1c1e2a4 100644
>>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>>> @@ -2054,7 +2054,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base 
>>> *ab)
>>>                   return ret;
>>>               }
>>> -            if (res.end - res.start + 1 < ab->qmi.target_mem[i].size) {
>>> +            if (resource_size(&res) < ab->qmi.target_mem[i].size) {
>>>                   ath11k_dbg(ab, ATH11K_DBG_QMI,
>>>                          "fail to assign memory of sz\n");
>>>                   return -EINVAL;
>>> @@ -2086,7 +2086,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base 
>>> *ab)
>>>               }
>>>               if (ath11k_core_coldboot_cal_support(ab)) {
>>> -                if (resource_size(&res)) {
>>> +                if (res.end > res.start) {
>>>                       ab->qmi.target_mem[idx].paddr =
>>>                               res.start + host_ddr_sz;
>>>                       ab->qmi.target_mem[idx].iaddr =
>>
>> The rest looks good.
>>
>> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
>>
> 
> Well, since CALDB_MEM_REGION_TYPE will always come only after HOST_DDR_REGION_TYPE we'll 
> not be running into this issue in real deployment with ath11k firmware binaries available 
> in public.
> 

Nevertheless, I agree this is a critical issue to be fixed. There is another patch[1]
fixing the same issue a bit differently.


Vasanth

[1]: https://lore.kernel.org/linux-wireless/20251208200437.14199-1-ansuelsmth@gmail.com/


