Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5461D3B7E2
	for <ath11k@archiver.kernel.org>; Mon,  8 Dec 2025 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulpUzcOI0DOsr/m9KEAJ8744zQ8VdOfiauSWUgs8hgE=; b=p2/sRyMF/6j0flUbbVnkJg9Dm3
	WqDn1q2rOxpl+ErOXpDymFV37KTWD26IHI4TTgoRBQXYahwo2/6ZMLjvyS1ogn0nglGTW3zWHorZg
	03uxq3Wo9nV4c8h/ePbADN/0bg7BOe1Xw3U9T0VyTREGSOkTTu6iQ0P3UgCuGvAihyjijBe8qEcwA
	H8LgxwkM5Tb/Jvevgekuv7LW0PQrVP2ZRr/fYdMU89ZX7vtapRbE5ldhhN3rMB8XL0EjuRUboKxuJ
	vI2ysZC2nayXxK902EgpZeDbmZ+v2/QkJR3vYUe2vvpWFHP/YQ43atOVjV3M3StJ/G2tcylees20I
	LcbHrXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYRL-0000000Cwmf-1cIz;
	Mon, 08 Dec 2025 10:25:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYRI-0000000CwmG-300U
	for ath11k@lists.infradead.org;
	Mon, 08 Dec 2025 10:25:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88aKY0095771
	for <ath11k@lists.infradead.org>; Mon, 8 Dec 2025 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulpUzcOI0DOsr/m9KEAJ8744zQ8VdOfiauSWUgs8hgE=; b=Rp1DHBk7C2eRzrSv
	NORUK12i3AKIdww5kyw6l+rY4yA/6xy2fKPt/vXsTvikhjBXM7GqjwH6R9IYgjMd
	zmnb6pREVZgkC9D1e3P7Cr4vJSMjdHZzcscKmPkcw/DIV0G3fbBafiOlr1qAnBc1
	q96YrCyfvhc54EuYMeCMfme1BBAk28/kXRXsc4+5h05g7BRRGDWZrn8B91YBfWw7
	LWy3nlLFNUUqWO1ksXEYS+itZ7x54IHC6NpcX/QA50YmAR1xghCSdbroQ6uv00bZ
	j7tBp27r/27FHOhZEbRJZSPNHwvUkjidQJqtgl+21mGYPE9ZAAJnTKgSZAmg1Z4b
	ZfHk0Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuafravt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Dec 2025 10:25:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c1df71b076so8217233b3a.0
        for <ath11k@lists.infradead.org>; Mon, 08 Dec 2025 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765189555; x=1765794355; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulpUzcOI0DOsr/m9KEAJ8744zQ8VdOfiauSWUgs8hgE=;
        b=DQNhLpOCaeX7icaJ66OLPuH0YSs5Cf/ZTmdweaoMjqJ0BHeR3u4fw3E5jrT3qzJXbv
         5rC7eTS5Ff12+u/M2XA0o/dW7P5z9M+N8tVnnnthSPILk48lRMVrA+Ar13VFL+1kc0m1
         WwRMPBtdiItktZcN72Rx4NH7uw4yZeCRSw1k08Gbe6DrEQlt+v1EvbrkU+wuDIYVSvM5
         J6TEjOH1ROl3YF+qR1nsM3avD9i/9meLt9+maBMz2+q679Etg98i+yYr9lMAV4sYgfci
         G83q5wwfq5uqF9klJsKt3dFvM2icaO0zEPvunE4e+rhkP5+sOvYckUJrKqb93JTb3QZx
         9fCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765189555; x=1765794355;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulpUzcOI0DOsr/m9KEAJ8744zQ8VdOfiauSWUgs8hgE=;
        b=hElxZyejmMThgdVMec8U78Elg6SYxUDxhsk542I+0wzznUW+SiParJzSAMXDzwfDQ4
         /yL+5URAEcaplto8XMfa6IAXQk3guAfG1534h1/9XJ9qvzQ6hEQMeDRtEuC6L2NliIPB
         9aoLRoT2QnRP6A6VhFu53j6KJw2s28ee+MWngAPbtMcd7O7q9Xug/+Dv8bmqzNojhIaa
         qPdj9yf9HTbP7+EXDSWh5X2ffmX0sAWBJzz1yBxiqR/7jz6MPK3F27WC72p+ryArMryV
         DA2MXNgukdtd39FHwaL2lfuWzErNcJzjhpTyVLfWvwp+naNb6okty3HsxzqpGRlxd1Nv
         jPuA==
X-Forwarded-Encrypted: i=1; AJvYcCXm/1c0ilBfpq91vI+KcFB+yMdYRf4F7X+o39ufQc3c2G6rA8qRcEAQFArsGJhRD9+WbJuMems=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/wWOmgKg8OkOvwIPlXk+kSJzhxkZj+4Cxr6+/LSMDCLDxsX/q
	oJNJM2zM2qsJeNtQa6IxKkoRmj6DeJWoryR1POJN1rfJaC711to8NJ8Gwb/lfocKey119sjSgEI
	yzNU+wRv8FELj98iL2VsXj2oVtq6Bor1FfndYJI74UsKcuyO6bm24Qr7EeiOEvZUe
X-Gm-Gg: ASbGnctVh8f1/F+BRiW8iAKfdR0DWRyFYj8wpYbK/gv+MZ2bOFZOQmyS0Ujk08veoKt
	vE/3qg02uMZmfyjBkSm1rYplsF666BCGTLv1MtcHhZYfoZZKqWYhJt4xSAl+/IWCqFFFKXykIvT
	3VMZIID4b1gp6GdvKbc9tQynfst6qxw6tL5Ip0kJycXydQeF+rF3BhF7t++rmbbeW1vKDnsgMHv
	r+2QbS1NpF2CX/OsT25lBkvYnreqQ8W0cNx8nDju0vtPdqGYLvz877tqlc5717mn+XASb1kvMMl
	KH7Dk4Ked8Jxxvew3vQ/bgn48RJRZ6RHv3VwJpYIrHe3K+Py+XPjSXnC74qzb8DtFZIDORF/BSZ
	wW+4estfY3cvDRkLtgZcBumirBVMh8EThJ3w5sWCN6qCo/Wqpzg/VKb8=
X-Received: by 2002:a05:6a21:85:b0:366:19e9:f43 with SMTP id adf61e73a8af0-36619e91026mr4486320637.6.1765189555521;
        Mon, 08 Dec 2025 02:25:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHi4NgRf4xCP5w/2kWJWdtK5tmc7qqJ+20GvzzvL4l1ADN7TyD9p63Q+t6ddAUDt4M0XxPXQ==
X-Received: by 2002:a05:6a21:85:b0:366:19e9:f43 with SMTP id adf61e73a8af0-36619e91026mr4486301637.6.1765189555057;
        Mon, 08 Dec 2025 02:25:55 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6817395ccsm11711435a12.5.2025.12.08.02.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:25:54 -0800 (PST)
Message-ID: <cbf3e828-77c9-8291-1328-7e876a8843d1@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 15:55:51 +0530
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
In-Reply-To: <01a05a49-ae5f-a3ec-7685-02a5f7cb9652@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ep7SD4pX c=1 sm=1 tr=0 ts=6936a7b4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=cJq7uKxvQhbKIWGweLgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: b7pvVVrDP7XKJ7h5Cp9ElyWUJs_PpWAD
X-Proofpoint-GUID: b7pvVVrDP7XKJ7h5Cp9ElyWUJs_PpWAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA4NyBTYWx0ZWRfXxDREkt2MxNS7
 EARola4dk8wFeHyQgNEjWFwJ3ZqNDOrDXGmNTYnc/5c/F9gV8kbK9VhG2Blk/6JrZ1rTRkuEUP+
 QOrsrFo5VcrtWNU1N6sJrM5rO8xN62aKWTzX2Jg09B14/nA7oKOus23vBOjA32wV7f6orZV1Cj7
 Cwc7V7AWjAK3hkF45YauILWpTAFx2kYHAmfmIEtmfsbWErehVOttSfnMPbqAJZsGly59NTX0M+w
 Ho6G6661b2r8Ztr0w83U0HEQ+Pz6MUWy3Kh9ML0vG3h6ZpaLU5zPe9cKYffZXGvV1K3tcKc2A0i
 sC051Z+HYrP7quqsnos5/Qln5J69wCpktXs4C7oBBfFyUjYfEdLyGNneYtYcuMjrO0OJCcs3tes
 yusu/TcuhqFraZH0Um/rPsm7pSXRKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_022556_783022_63C4371D 
X-CRM114-Status: GOOD (  19.93  )
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



On 12/8/2025 3:38 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 12/6/2025 11:28 PM, Alexandru Gagniuc wrote:
>> Memory region assignment in ath11k_qmi_assign_target_mem_chunk()
>> assumes that:
>>    1. firmware will make a HOST_DDR_REGION_TYPE request, and
>>    2. this request is processed before CALDB_MEM_REGION_TYPE
>>
>> In this case CALDB_MEM_REGION_TYPE, can safely be assigned immediately
>> after the host region.
>>
>> However, if the HOST_DDR_REGION_TYPE request is not made, or the
> 
> AFAICT, this is highly unlikely as HOST_DDR_REGION_TYPE will always be before
> CALDB_MEM_REGION_TYPE. >
>> reserved-memory node is not present, then res.start and res.end are 0,
>> and host_ddr_sz remains uninitialized. The physical address should
>> fall back to ATH11K_QMI_CALDB_ADDRESS. That doesn't happen:
>>
>> resource_size(&res) returns 1 for an empty resource, and thus the if
>> clause never takes the fallback path. ab->qmi.target_mem[idx].paddr
>> is assigned the uninitialized value of host_ddr_sz + 0 (res.start).
>>
>> Use "if (res.end > res.start)" for the predicate, which correctly
>> falls back to ATH11K_QMI_CALDB_ADDRESS.
>>
>> Fixes: 900730dc4705 ("wifi: ath: Use of_reserved_mem_region_to_resource() for 
>> "memory-region"")
>>
>> Cc: stable@vger.kernel.org # v6.18
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/qmi.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>> index aea56c38bf8f3..6cc26d1c1e2a4 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>> @@ -2054,7 +2054,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>>                   return ret;
>>               }
>> -            if (res.end - res.start + 1 < ab->qmi.target_mem[i].size) {
>> +            if (resource_size(&res) < ab->qmi.target_mem[i].size) {
>>                   ath11k_dbg(ab, ATH11K_DBG_QMI,
>>                          "fail to assign memory of sz\n");
>>                   return -EINVAL;
>> @@ -2086,7 +2086,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>>               }
>>               if (ath11k_core_coldboot_cal_support(ab)) {
>> -                if (resource_size(&res)) {
>> +                if (res.end > res.start) {
>>                       ab->qmi.target_mem[idx].paddr =
>>                               res.start + host_ddr_sz;
>>                       ab->qmi.target_mem[idx].iaddr =
> 
> The rest looks good.
> 
> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> 

Well, since CALDB_MEM_REGION_TYPE will always come only after HOST_DDR_REGION_TYPE we'll 
not be running into this issue in real deployment with ath11k firmware binaries available 
in public.


