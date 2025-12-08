Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805A7D3B7DE
	for <ath11k@archiver.kernel.org>; Mon,  8 Dec 2025 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9jHdYoc3oT9NHwSrNbma2xbBTUVUF9I4q9RnVy+smo=; b=ptV94Y7x/u58LR0gnTb+/q7TDA
	oZL4FxsMZk/xe3AqzpILpe9zoyZns/Wfk0kA9LGoRaPbOGEhWzlcADdgLzUQLjCc3nVcH/He6k/PT
	CJkcSuCCKSVr532hOdHnYFO48ekqYRjRsYJOU3LCaEV6EgQeyWPuZbZExfoJLraYDcQ6TrGCQJ9K5
	N88EC8YbFhiiLA/0zvxBI1y/yU8jo0JKGLCvWjyLwZ0aeSTVPnR13yXrAWv+fDuwOPfcMfVYNDRCX
	lKjwerzXL7DZn4GxcCfPx6F9XNdjDU1f9ryLoh05Ve4YV/wouoOKkQu8ZfI4EV7ECUgZoy+DiVcaQ
	PUFon6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYAb-0000000Cvpn-3iQc;
	Mon, 08 Dec 2025 10:08:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYAZ-0000000Cvp6-27TY
	for ath11k@lists.infradead.org;
	Mon, 08 Dec 2025 10:08:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88aGB2095647
	for <ath11k@lists.infradead.org>; Mon, 8 Dec 2025 10:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9jHdYoc3oT9NHwSrNbma2xbBTUVUF9I4q9RnVy+smo=; b=KYZMjRSFuXDkYsGF
	mupgbAPftYjwMnWo60n7ArrV8tGqyTGjzxlOqd3ofwFu9DN1MFJGZm41PMhZ6ddM
	bP4n0hU1sxBlu87sjSkDFKOYpyk4J4iNlb6PLSkukPERoNuK0UKIsA/AkziTZq6E
	VwtQZOXckqVY93LexDtTtADnGEj8hpNMvZ4A/RDkBtFN8fUIASdmmuPOA2cQGSFe
	9G8Z/yqh8r3X6ZQfyE44IR3G0xjX1YYSpg8Ac8lIJ387UIHDBzaDE9ZFrv5DqSm3
	EYb2lnEYLchxQtC43l5X2X6ujdsVnWmxR/mA76kutaXQ6r1jnhc3VbIgjVgS51+W
	eZnMuQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuafr9g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Dec 2025 10:08:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982b47ce35so57552925ad.2
        for <ath11k@lists.infradead.org>; Mon, 08 Dec 2025 02:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765188517; x=1765793317; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9jHdYoc3oT9NHwSrNbma2xbBTUVUF9I4q9RnVy+smo=;
        b=U3sXGSi1y6Ky/YYmyYOWIB93d7YGJFms4svIzoud/IJUhb8daT/m8ubHpWb3UAIr4G
         kObbnKL0WVIUKOeQRRvf4kkDm5WKrtjAXxbKjlZI6UapsNCYf/AoalVcxTT7zcIjg+Qc
         /WnkplrP6avGhAR2lzuHBXM1ebvQ95LSrmU86JjVpa8A0dyf2N/AbupHOk89o/Vlq0S5
         zJ4PlPNEukp8AmOeqfHCbNuuTj+ynQKWxW94H1yyDokdD9EqVEkcyjvZ5g1S82zogOwz
         +hJ3RG5iZPT9ld1Z2DkTpaBzW/Lc/vFjDmOqQAfkbEWzcFXe6dWJ1grvzNXlBPWxqCO9
         PaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188517; x=1765793317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9jHdYoc3oT9NHwSrNbma2xbBTUVUF9I4q9RnVy+smo=;
        b=YcyqDKtc5v6HYbPgL84/AoBAQ0dIf33EYEgAjzexJz56ovTcLzUvXltG/0AB0chokZ
         t09RJE2vHBHJxkcATFK2pU84xKxrYN/eknDW+2TbGj0jxZcGCvCBtiyNrToFp+8GAyA0
         M7Yc3CnAW8qYPWirIWZ1VAJeCBZRdfy2498CnK+BLFHFHNXnTFkEkwByo4qy42zxKWFU
         mZfVbHcc8llFrYndNinXYivXjgvy3ulhPw/ADjYlqHoXNeFDMGXfnr5ZUwDbycdn30l+
         dPN5gmRkWuLAprzfetRJkrW+6qSmg0EEz0Ryn58dVMgOFIxOvLwcZb08TpUYWfKXxfjS
         IlHw==
X-Forwarded-Encrypted: i=1; AJvYcCUR1ttFW8UOBikyhWaAan8oBwME1L2MhVHQOYZIve5oKgAdhMVZ0pcWUVx0G6nhmxl0p9+hToA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbckUvbHjML3I0N3tFOQ1DDthIb0NytJ1vH1ghS2IQHzCi+sYy
	rvb5t/IJ5FykDiK3BbejH4Vmyas72lxe8+7uQIhe5N37wCynzKD1NwF3Jo5OMpNX1OUX8wEzQ3J
	w1FkVrvKk6pPUT3SQ/QFc4fuYWI1DwnuIQ0MnKk9YxI3UE90912I5QX+VEge05YXE
X-Gm-Gg: ASbGnct7moyQof+4rdbLDx9dZTfBwbgyI9xUbzY6vLJ3qb5N2i869oy7QvUyYzY4Adb
	gre02nsfbsDKiK8JIGWbvQ3CZhj4k1t9K4FMcgsjA1+Ysse5wY0Xwb/iTEeh4/Sg05In/hC8H43
	lh8mHbwemWMwfy9My4Iqq25ZHbDYr4x0/DigZw87CMof9FWP9vfg14N/Pu/4e9D1V9naD/rN94s
	QEAiYoPrt6GiBuP6wQzcxfWb6/7Y58g3HUc0g0ESKujFAIHs7+O/GPZ6zMydii/pp8VaOn2peiR
	+ZiC7TG1h6ZplheIcmYhoTJBtwiaSeyMDyk7oCm5PfNAfzTySdvRQH9I0v5gseMoFkeAbySvLXC
	fejvRtXsxSpLMAD/dlkRVvmI8VtZ1aeTuBzeWiUcv6ZhslnzzdN0Oc2c=
X-Received: by 2002:a17:902:cecb:b0:290:c0d7:237e with SMTP id d9443c01a7336-29df5ca8b3emr75729415ad.39.1765188516991;
        Mon, 08 Dec 2025 02:08:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUA8/9IdhCw4HBguQRklGSxNYLRNSBocndWUNTCInJrc5onf69jXc87HhRJlEXhIIgDWsBDA==
X-Received: by 2002:a17:902:cecb:b0:290:c0d7:237e with SMTP id d9443c01a7336-29df5ca8b3emr75729125ad.39.1765188516473;
        Mon, 08 Dec 2025 02:08:36 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6d75sm122467355ad.98.2025.12.08.02.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:08:36 -0800 (PST)
Message-ID: <01a05a49-ae5f-a3ec-7685-02a5f7cb9652@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 15:38:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] wifi: ath11k: fix qmi memory allocation logic for CALDB
 region
Content-Language: en-US
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, jjohnson@kernel.org,
        ath11k@lists.infradead.org, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20251206175829.2573256-1-mr.nuke.me@gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251206175829.2573256-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ep7SD4pX c=1 sm=1 tr=0 ts=6936a3a5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3EvvSBrUXICK9wu0dFAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: G0ezWVnjTGD2DkmjIlpvudrngbzkviIG
X-Proofpoint-GUID: G0ezWVnjTGD2DkmjIlpvudrngbzkviIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA4NSBTYWx0ZWRfX02s4+xd/7fV/
 zRZHJtg1RIjiC0a36Zd09dsVbaelrGuiz7/DXELtpOK4EAwRXFDoUMhMm0KYly+iYAwvFadRSSc
 ho6gGd3QPjSmGZJpzXztXNCdlEh80WDT0XNYTceSR25LPPwjxX7uteVNSvljEQ8OuGmJt4SfuZF
 EyYPtlICQIfSoOIZAoTbWmV2nyhUtxgR6HXddZiwpB9MoWRt+KrQRJWVmcmMxxdbbKUcekODOq0
 rheiqjdWEsge3werFUiXvw+nKoYajynArCLVHwLsXcUbG3GPEdY7PAURZOgzdC6pMfEYj5447pt
 LV/va94qQJMatMlYDD6Y+E/jL5LnPEOwx8hcQ0+MqPMG5CnuAZFCRt0MNsI6GoawB85sNazOHIm
 EOG9puB2wP8KqC/K58LWfGk4WWdAKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_020839_588001_AC8A82E7 
X-CRM114-Status: GOOD (  22.00  )
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



On 12/6/2025 11:28 PM, Alexandru Gagniuc wrote:
> Memory region assignment in ath11k_qmi_assign_target_mem_chunk()
> assumes that:
>    1. firmware will make a HOST_DDR_REGION_TYPE request, and
>    2. this request is processed before CALDB_MEM_REGION_TYPE
> 
> In this case CALDB_MEM_REGION_TYPE, can safely be assigned immediately
> after the host region.
> 
> However, if the HOST_DDR_REGION_TYPE request is not made, or the

AFAICT, this is highly unlikely as HOST_DDR_REGION_TYPE will always be before
CALDB_MEM_REGION_TYPE.

> reserved-memory node is not present, then res.start and res.end are 0,
> and host_ddr_sz remains uninitialized. The physical address should
> fall back to ATH11K_QMI_CALDB_ADDRESS. That doesn't happen:
> 
> resource_size(&res) returns 1 for an empty resource, and thus the if
> clause never takes the fallback path. ab->qmi.target_mem[idx].paddr
> is assigned the uninitialized value of host_ddr_sz + 0 (res.start).
> 
> Use "if (res.end > res.start)" for the predicate, which correctly
> falls back to ATH11K_QMI_CALDB_ADDRESS.
> 
> Fixes: 900730dc4705 ("wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"")
> 
> Cc: stable@vger.kernel.org # v6.18
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/qmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index aea56c38bf8f3..6cc26d1c1e2a4 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2054,7 +2054,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>   				return ret;
>   			}
>   
> -			if (res.end - res.start + 1 < ab->qmi.target_mem[i].size) {
> +			if (resource_size(&res) < ab->qmi.target_mem[i].size) {
>   				ath11k_dbg(ab, ATH11K_DBG_QMI,
>   					   "fail to assign memory of sz\n");
>   				return -EINVAL;
> @@ -2086,7 +2086,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>   			}
>   
>   			if (ath11k_core_coldboot_cal_support(ab)) {
> -				if (resource_size(&res)) {
> +				if (res.end > res.start) {
>   					ab->qmi.target_mem[idx].paddr =
>   							res.start + host_ddr_sz;
>   					ab->qmi.target_mem[idx].iaddr =

The rest looks good.

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

