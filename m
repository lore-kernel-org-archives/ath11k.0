Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A77C7115D
	for <ath11k@archiver.kernel.org>; Mon, 23 Jun 2025 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=; b=MV5jnKh5cQHLnbGUDjgjTTlGYP
	buWuma6AeiAyoSxIMBEvVGyXPJmAOBAAwyzgeUBBFdSD+dNXVNMIZb0x/PXxjDcd8D3H1kRiS8zYB
	bZz42Vrb/wlxlxBTMP3hSlsxg3wh0JccZ57qZaMzu9YiDZN8fxN2W54qXeZBC+kvdbNocTKnYOcK7
	xsWSHpjOCOVUoG9wwVn3Ppo4qdkbq9rJaPDMCErhgeSHmgZniCUTytj0d+m0ru34Vqusg8r5jYNM5
	bdclw3DDHA0x6QrX+yFmy3fQnSJBW/vl9NlMWRBssqpgbStuk/fJ09lvmwZ9pRzoCFRmiKvIyvODS
	enScvviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZdq-00000001c5G-2cB0;
	Mon, 23 Jun 2025 05:22:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZdn-00000001c46-3SDA
	for ath11k@lists.infradead.org;
	Mon, 23 Jun 2025 05:22:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNa2dt011023
	for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 05:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=; b=YxtkILJ22j77Lvbt
	1AWZYgTxsA0nxvlFD65y0HkRFD4ThGDotDJVoAy22T7Z40KaYzNpqzVZ696K8SUq
	UYfogTeIyUmh/LRTP7QtaU1+oa5X1TFKBdLOHPbsVSDuJxaSfNHSbnQR8KLqajef
	3q3MrwocUgpRr/X7k1yp+YADnvhoBgRe1504WUcDPQve9nncTqMKwJdB7x/i7sJK
	ES6EE7ennAouWY0hRYWyrSarQj/5p3aW1EpKLm8jDgHi0YLtEa1Jlb+ZTlYAAyCy
	1SheVsZI8jd6PdsAnEAZM1pXrGg4Y15t0dJO0yZUw2kd1/TWt7vMHTRI//FmGa3E
	ogfi8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud08j94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 05:22:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fa1a84568so2586916a12.1
        for <ath11k@lists.infradead.org>; Sun, 22 Jun 2025 22:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656166; x=1751260966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=;
        b=s4riVzdhUUyf8NVKgv5+961+kpqhvD31hMH83FX6fNVGwByirj4SotOOdZVOfmXvDd
         2kg9/lRSUX8ZUrafPuyIfuj9FPlpmheDtvhfN4b9dwul3USnI1g1WPb40fdS/Qll4nyV
         +X01iEMarVV5D0/jjffzmhiGvGTIvtdi8B9fgdi55kR3SkWxm2K2CzgrA6we/BGkc79c
         vOX99MVvlhibFtriFd/x/jpGxYHFSLi/WWd1kUyYoeVHr4DHpAvHCGOr05osiZ3/bZgE
         7RxKkvQW6gU9sPRCT7dfvLnl5MqCTEUdQY/fQbZh1krRnJE/fhD/1sOT8+KTULmQadcX
         3R9w==
X-Forwarded-Encrypted: i=1; AJvYcCW2caMhILNv0FP110vgWSPPAOFyAY2GticKYUTYtx/66TP0rNi1yp8ppRW2Ze4XoPmHj7a6z3Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ja8Sp0ICsX9DhUqpiGgkwQH+fZ3o/T7seFeFTnRAJHa04nPV
	rqted0CqDGgznG7AReIUTGyd/t9BR2ACBMrIR7dtlBZre25n4vcfFn92VHiU+gPBfCmIPouadrx
	wGXU8Gtuz3m9xrNDopNDDsadCyqchi4PwNA9ix13RTqC7QYps0lGWBxFbG0C7HSQw
X-Gm-Gg: ASbGncuBHW8AnT9ROmYTnVonW3W8JOusoJLoTWXeu7U2rlhZ4aoMYlI+B+fxFo3gITO
	nevOFCnWcAQohavOPpBQVedrrR3yVDqEEIzhI2qW7oLjc74N8IJEQfy8/PGf1UXjg+TI0pRPU90
	Jynvwrx0oKTCCeeFqi8fucT3Lbzgi66jV4Hu/T9GP7BSUrlCZ8PoNLy99bj9/hXKMZLtz+aF/Rv
	eYtkT6cgitpxbcP/UMBMRS6T0X9iM+HRsMrvZcQMPtsIe3elM5tevNSPnsLOtSFmh/kIJq1mcFu
	wqcQj3OKteyoRCk5F7oSENch7xCTd7yaTUy88ThzJN36MbJ/MkwyazRxCZZYP4/a
X-Received: by 2002:a17:902:ea04:b0:22e:457d:3989 with SMTP id d9443c01a7336-237dad62e05mr157842725ad.0.1750656166361;
        Sun, 22 Jun 2025 22:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPbiH4zXPXU8XN3CMiJXdjzBJctNi2A9Anl0Doa38MkcwwcT6EaraSrDq/JY2/ygobpeCE6g==
X-Received: by 2002:a17:902:ea04:b0:22e:457d:3989 with SMTP id d9443c01a7336-237dad62e05mr157842595ad.0.1750656165996;
        Sun, 22 Jun 2025 22:22:45 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83940f0sm74662795ad.18.2025.06.22.22.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:22:45 -0700 (PDT)
Message-ID: <b2415006-6176-8645-9ac1-47b8598dec17@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:52:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 5/5] wifi: ath12k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xp8XYJlV4s72MlL_QIVTJLiTH913Q9jW
X-Proofpoint-ORIG-GUID: Xp8XYJlV4s72MlL_QIVTJLiTH913Q9jW
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=6858e4a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rPD8waAe7N7EK57NJTkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX7nKg09FrALm/
 m43qefB9JYdtpAtwgPEmbiB4BvzP7xZtAXdVcLo3ymCVPNTpkShUzbrDi4OPXkiKuOG6Q3YPWAX
 vxmHw1ftcCX80/2BWIMMeawQA2JGn7iJAIKXYyuogt63BQL4qfJM8OGl0gIKgnhu5ZnCKaZfRUh
 DdAEvhGtuO6dKe3As7JWkZsKr+pk1067f5/HwpdyEKiVxhW6wldOhW1T6l+crW3a05e8+2eYO1g
 ym8x2OYURuyzk3/WthOeC2KSLQgNWgL/A6HHYpye5ls+st5fxUCzlUCCeWAcw3fpL18fA4cRnjF
 Ercd79gKYYi+09oI0VFvojevyw0MaBJhs1lj3ZFomR6q/SxiUV/oZUCraFyIKDgaThHhShsiPz9
 /GhSfRhAcyDw7eJQTqt+bLNJCj2VX7NvUPWwuuQ3T06S9KlIrs2AT69gYzHC3AbMlZdAuOw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=995
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222247_871325_1F383E75 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warning:
> 
> drivers/net/wireless/ath/ath12k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

