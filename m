Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C4CC88E53
	for <ath11k@archiver.kernel.org>; Sat, 12 Sep 2026 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=; b=Fbkn7RZkM8WmNNuykkTFOltc+w
	wIBn5+D/5hqXmLD84PCJy9RhaE+rqhr0h5GEXVee64s+GDV/atIarQWwBvKX7KXIZOWD7AHD3pTUz
	Oh/rghvA7V2EwTXLZ3s100WznKpsoic0e/xrOo/jSSsfrdQsOh62JgMIbIDuRH8yZZPVUVzkNEPZv
	laNH6aW8tUJ1+C6my4uubVmxGgph1PPAhwmIlgyfLjwJEUZT6ZKaSFWJ2F0vtoLj+J2sn33ba7wYK
	0FLIfjgwX4RpVo0OSmYtdRAAQnbJiD754vGdySSB4Nz26D3HXfbnpUtCjqDzPaW27e/3TjLMIFuGy
	30XENsJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Mub-00000000rb3-01Fe;
	Sat, 12 Sep 2026 12:32:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5MuX-00000000raL-2JZ8
	for ath11k@lists.infradead.org;
	Sat, 12 Sep 2026 12:32:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdUDg2238645
	for <ath11k@lists.infradead.org>; Sat, 12 Sep 2026 12:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RcgdAk8cNLto2WtclY2UGYFI
	DFDob1kxiwZg+puCrSc=; b=F+PC6EgrUXIvrub8LFoqBiF5YzmN1QXuT7rQP3tk
	ZA0uwmesH0s/X/ZsQi9P84xajxiBBklR4qDf9QDwjMQJAt4uMqFzzOnrfDhy1iwq
	81eXGIbmjIzHJh80sYY0mRAlRfjL4jS9k0WwQpgM5opYI9pfhuN3L3tMK5VfL985
	iA3K0bUFMGeslRGe/F3VC2k74v3IHobU5rrtYl6Ml8LzbQTiCbFcmAp2LyA8ciKc
	0aaqxvm/wnq7gf9JcBI2xMM276H3dS5mxmsids9ukF9qKwUm9ijABp+Yo576GrM6
	I7Ddq/gi+1ztTLFPvlhDTqIEubdEbIK8ykPJ9bUpWfKfgQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8wg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 12 Sep 2026 12:32:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79285c98038so1440443137.1
        for <ath11k@lists.infradead.org>; Sat, 12 Sep 2026 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789216366; x=1789821166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
        b=bAlnz5FUTxY5ST+Mp8GVFdgNgLZZfQJeTHQpAqAYEGkcFgix80OYUhuI1L9FwyZp4H
         5v85a1tVA0u2XnZMkBF/oT96AfDS6Wqtq9FhKjtAMmO2q/a/UrFLD95N03NAyXfwdVdS
         obAcV5PhMNiN8OpoHgtXOIyVpcgmllZS/3hONP5WZTpOXnPa7cfV5LZAyZiiQKHdK6V5
         fzjrBSvXq5wpAnX5LiA/eNLzEruD+drGdgcCZCdjWDlyLXpVVbNRHR9lOqlsn59IidvS
         aj2v99KDmIaaQ3p+5rd8D6261UqfoNh6lfWtIi0dTejk1nth3izAt0Slxf+1C6Lte650
         3Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216366; x=1789821166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
        b=XemNHqVk/htNVONFcbZuG1HizUPRn6fFctwKEGRSgED9DlLk2hXRNJNfwVbUgxYCC8
         No67Aigcaz5ui8PHMJTjDmonHmPv0lH/2F2BllYcHy6vrGbHfw5oDiy3i6Tbq6llUGh+
         UTl5hYpQF0wGSQ+obriJiRhaVO5QhjVttMTaZjsNM1CwzpDz27iFgAs66zKgstvoDxEa
         MSGTFNBTPRk9MLn69Eucnge0RUZbNXja6pWKJnvogTgSqVwb+0MkLBJfiwexwRyBRnJ0
         xTiwJhQNJ70T1tixoV5nAXi7GThhJTZZHvTYoEvVfT7Y0jW7iJVrcSstlw0FOQIInPZc
         gyqg==
X-Forwarded-Encrypted: i=1; AKwUvBzwzUAldNdCgrDVHYQd1SNm7+xDuurHuEnpMdk0axHQS9B5zKXRFJO+l5TDXO4a+1D82DFL+Wg=@lists.infradead.org
X-Gm-Message-State: AFuF++maukq6LneD69NYsa5GOAQCYHYePHIRemXgPcQP8EXlu8owQg6m
	hcmh1jihdF9EZO3LwQXfzZx4bSrWWi1s6BYcXFF9xcfRL6LK5MsgWdwCZoRXrmR/XkkAWKZ21dJ
	1vr3YN7tLy4qwPyz3+l2ulpAy+xMK01FfZhbGel/afEk7fMjsr8Tdpn6m4uaqyTfE
X-Gm-Gg: AYBFou2VhaE60m5ftzi+BBH3+MvaRwuGQzYy6jwAMipyaZC3qvhr1gUcYL7e4oAPeSX
	HrakDya8d8FQJDxF/tPmhnrpBQ00Lz625WabZ7XBXWxSqPIB6zdlE0wCoI/yogChOVoP87v5X7A
	GX9ku+k/4SH0XwA3zQ9mdzfuJh53T5soDZQffmoJb9b6iTdiVLFPQAy1u0XFR6bZYO09jItXlp0
	0uRHgEp5b5j6dnFCnBntmwVORVsbqNgoslWpIgSo6rD8YxbXBcKTxoIUvKwbqvAslYuPUmO1iez
	CzqRFY7XNoTLhdniy3rTlipEeK2V196aLbEOg9xq7ez7t5ExT5SdtzWcGGXAE7hf6FGatBtbuUT
	zaziLfuN+wtg7GsY3bChGfWXCfHEJrAOmUl4zE/WAIdgwkJ1FpI2bwB2eLXcqeV7fCoHTdJqqTQ
	LIh/4wFQHaUzVQ
X-Received: by 2002:a05:6102:2ad1:b0:784:b882:9567 with SMTP id ada2fe7eead31-795a7e2d4d4mr1504280137.6.1789216366549;
        Sat, 12 Sep 2026 05:32:46 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad1:b0:784:b882:9567 with SMTP id ada2fe7eead31-795a7e2d4d4mr1504270137.6.1789216366126;
        Sat, 12 Sep 2026 05:32:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047a643sm1202626e87.70.2026.09.12.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:32:43 -0700 (PDT)
Date: Sat, 12 Sep 2026 15:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260909
Message-ID: <n2imuih2huckb2r6weqfydj3pygw235egmmsm2ug7gqc7ud7on@jwh66v3csydn>
References: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
X-Proofpoint-GUID: DvDN3rsdyuQXe0NWxzRF4orfr1PTWNMW
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa5466f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=Cll3ooqCA_IsHNaTrZ8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4MCBTYWx0ZWRfX5aHl0pkN7DcP
 kJY05ZBNBIbdGvTxiGkNosVE9nyO5oEO65xyxZ+WBROxQSZZcz/mNJHw/76UKqyqih1UoEQsF50
 Pfokqqc8Edao1kh7+1NT7zva23O2a+Q=
X-Proofpoint-ORIG-GUID: DvDN3rsdyuQXe0NWxzRF4orfr1PTWNMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4MCBTYWx0ZWRfX/4gLhsUF7NTi
 e9Sf+doKl/KMiKVuv7bpjdrktBGVfKdN1bTEDNeMl7lSyqidFaA23392m9KOVesSf/y8BfvyyIO
 rQsmq2hPsIBVZQgJD22E35KvAn/wg4irYH/hem8hdxbCeMlWWWu4qcWdDF1Ry7Ti/5lAIXDOWD+
 O226iEizN5TqXnpcRTFqAYTSXrwrFr5qJnfHkw6rBEAFWQOVXKbDtOaf+FbyetWQIaVzBCl3gib
 JvaumtZUJkRfESmdJBkJjQsFAyl+NPqRb6vLIulw9hI8Yqoo0Yt1zVgPFMCTQWnIGzf/j3Z/NME
 H3m0vQUdHP/yJwSB4+bBT2cGXVxGTYqe0sSIKmbAd9wVJRMWYoYwwtLVtKNrXEW7nCUex3zOZt4
 GkqW9zxZXC7lLY3JVKKOsavMh7s3RDCZ7WNNvntP7Rp5stve0AjoRxTGMv7CW28wYb7khZZ4QB9
 EHACi5IBWimNfum5ByQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_053249_731565_64460247 
X-CRM114-Status: GOOD (  12.50  )
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

On Fri, Sep 11, 2026 at 03:13:14PM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> For ath10k add firmware files for the shikra platform using WCN3990.
> 
> Please let me know if there are any problems.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1238


-- 
With best wishes
Dmitry

