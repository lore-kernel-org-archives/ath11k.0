Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964EBC3ABC3
	for <ath11k@archiver.kernel.org>; Wed,  7 May 2025 14:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGluIw6NWJNNfPUxDeMzbPFoQEkugMbs6IrEIEEdFwI=; b=08q3ZuzGa4rAuHfrXe1xNOY0ul
	mO6HVt3jC/4dS4UYRT037g4BB31XEj0aWPpGXV8FXo24NSujG/R/tKg4kju1Cg5CLDmPQcS6l3zaD
	UsKfyjfWVEIYL1jJpkiJN33l/sAxrazdAFnuLH3JY51JcV3PcLLiLXlDaC1VPUStgthnTW5eBcYrP
	yZdY1NSVK9uwyxN3sZP8dckmH04w/Pj/NcruhQqFUeuUsSBgmZbO+2BWlTswUi8srmgwE/CiwSu5X
	j/NvmBUL+256S+CtbwySajOsgCRGcxFXCuPvNTAw8lbnRUZ5RUQyqianYHzHjIXv4pk2z6EOgcO2I
	IuhUxFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCg5A-0000000Fqsc-1IPA;
	Wed, 07 May 2025 14:49:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfXJ-0000000Finm-3ORb
	for ath11k@lists.infradead.org;
	Wed, 07 May 2025 14:14:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547BP9w8020191
	for <ath11k@lists.infradead.org>; Wed, 7 May 2025 14:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGluIw6NWJNNfPUxDeMzbPFoQEkugMbs6IrEIEEdFwI=; b=PxLuGw4id89E1aml
	6gV5ozGPCswlL9yuIGLr2dBSTp8mzQLJuaK670bAK7VHXfylNPmHlz/kmJkNEW8d
	VoXugREKv37J+sWjuir7/XdG7+eICBODoQfkBXVjC6Q3Rq2OFr8htq9nSaFJRq/L
	DL4WHqEb4ZqE5DqRG6PbXAue7XNJuHwOngGQ8jTd6PiXqvBgfebIWRXYJR7G9uFJ
	Oy+XvCGeY5DO2zLFBQqbwpAWh/TJh6A1Dow5MtaM2RcuBRznoUqwrYNiO/dq1KTg
	LeMoLAATRbcp5S7ynDqzPQ56aL9fZ/OBAY3iif2IAsfj+MUlUNouBhxODjnJ1RZD
	L5pEig==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9epbg4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 07 May 2025 14:14:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3085f5855c4so6319286a91.1
        for <ath11k@lists.infradead.org>; Wed, 07 May 2025 07:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627250; x=1747232050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGluIw6NWJNNfPUxDeMzbPFoQEkugMbs6IrEIEEdFwI=;
        b=EqlHNd5xxL2LrBOKYChf2zu0rWd5W+xEQtLSHEFLgKUxNIiCl2PYmZjveocywM4orx
         4orJQteyTKdPAY3yGhmsrLRmkO8iiWupkcicFxd3I2woz6JR5pfebw2A6pxSvodwmvbg
         F/N1K/QGUe48Ief5eJOz9mUvErGMIaktUrdItEdlVu86IpTg7Lonp9x04YyI6lZmMleD
         ZYCLoi/SePazUF8nuNu8PLKUnImT+MfTq/scUTx+26Ht1hgk0VTtbJvbYVCwjkFUfOzb
         eeTUTS5l50MNyvteRwxXEXeRSlsTcDvvBS/e6ifP28LUqGDwqMBAjVAbI6Fn0HbMe3ZG
         aVmg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+Edlm4nn627VtsTnDQDBJl3SPsSS8JydAGH1qyFVIT3E6m9+aBkVHA0yUZil8OIxH0ld5as=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKUCnR5g2TSmBoiWVNJ4HHkw2GlYvHz9P8z99NFTILhsgMAPAZ
	ylR29+w/JxmUSSrStY9yy9jzW7zYsl7w5i3TkByqSvsnxiyNQMi5zY26e/5tRLhv++f/8wB3kJj
	hLGJKRooc4knPoC3g2sMyi+a4ujxapzAiEX6qOvtgZIgFQtWZMyzX3WsKvWZP
X-Gm-Gg: ASbGncs34GIkBa4ww3AASN2hDddhWM34/cMsaAGjqnD+qWNeBK6yGnk/wfEHWDp2LSp
	i0XQtItMpjbUGNuV98GpzKmPzXuMenipysedC1JJzWM3rNeu70yQSLKxeKmBNZ5MMJF3M130Kin
	6OxD42PLtpZRXkrunAdGaTIYcIjWUQvxrACkIZROUkXxtWzcWE6nEjudsjM19zvXUxlLfxKRIbM
	Ji/9gzisPPCoSqJ3NDIHG3aQoB3RL8xSuEYdcLsesIR9Lz4oMIdXCMHVOjulP7/Pbqgd4/+fVJJ
	NznDbV17Ftk6czGlRZXPahPF1xtYXqJV8z1KEdawf2fBVsVxUWcWhdq41IxyUU/u5BY=
X-Received: by 2002:a17:90b:3848:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30aac1857c5mr5519674a91.4.1746627249730;
        Wed, 07 May 2025 07:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1V1DpH2j5TQAnKSXjEhB0Z9ZTZtIJQ3RIw8lPQXZTbkyLn3CbGTR63lRfuDo8fl3HrCpE0A==
X-Received: by 2002:a17:90b:3848:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30aac1857c5mr5519620a91.4.1746627249268;
        Wed, 07 May 2025 07:14:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe2248sm156879a91.35.2025.05.07.07.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:14:08 -0700 (PDT)
Message-ID: <608a5b08-a5c7-46a4-adf0-7106e4d82250@oss.qualcomm.com>
Date: Wed, 7 May 2025 07:14:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681b6ab3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=4n9vdfglUG3wgorB42cA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: txiCqIvHqO2r_eidWeA4EqZwmiOsbG-Q
X-Proofpoint-GUID: txiCqIvHqO2r_eidWeA4EqZwmiOsbG-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDEzNCBTYWx0ZWRfX//LO2Ye2vKjL
 hr438/8GlcKBsv0gCFI+TM5v7vj3VdxDo0W8QjaqZiBqYZLKs2convM7K8eU+/+W3Kb0lSMPN6a
 wA/p4ow+ESigaD+PqU3C90xKU46VHOfessNUdISpo5cNRLPN2c0X6uw4/PB6zdPxKfPidazxipq
 UKv5+wp96m7OfFiSA8Mm4z8NuPhWOLf153dVggERFUQoLeeHpBhSiUiwPFT0nQK+QedLyL3OPOR
 Q2D1aD68v4x4Y+pVxHEkuGEcRDR7QDIyc5HTnTRV8WOWYeLUSSegorGh7RedgVxz9zTDQELEw+U
 CvnMKRu2AOs+9rynxdK41kI6SsAHoX/Dt8fe7oPSUCe67ZaDUO5ZB9O1iIpBOWlU6kjrD2pkrVD
 fGiNHvv0/Nko5oo/+q4fGAG33yu3z9TW0j680tTyw0048jTrL6TdRpuLX7pZTWYcma1HAaiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_04,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_071413_973721_7B48B092 
X-CRM114-Status: GOOD (  14.68  )
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

On 5/6/2025 7:49 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Mani, if this looks ok to you I assume you'll take this through your MHI tree.

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


