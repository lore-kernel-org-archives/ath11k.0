Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B36FF8867
	for <ath11k@archiver.kernel.org>; Wed, 29 Apr 2026 04:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjP24Ug9r/GHXosW899GMKTKymLMpRxhQMylkjBjEOI=; b=XmEyPJtnxVMMO2Fvz7wsD3YIyC
	OTgXkdgGbFY6K3AVesFPoI9UKaaIA/asL/QT0f9kHaIvSVNuwBxqbh5jiYxKC5kXtCUt6IfUdKy0i
	FM1wt1u61m1w3WV0PdTvd8ikRCVaQj5Cexs3Hdi8G5alzu2TlF+3/81zZC2ETHJVt1iD2Qt5VR/oR
	wYGx8M+7EfY/VchRkE5OKZCDYvKucUj7eQq6LWu+YNdFKOlzsb5TnjbEAs7etbtR8Rm5vgkGF1p1p
	eKzqqybedpiT6ZhyLzcGgZkY8ELqupr0/tOcZluksAJ03g9K/Qda5jNMYYludCHLbeg6lCDGDMGcV
	ii8o2AwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwwL-00000002wu6-28qA;
	Wed, 29 Apr 2026 04:54:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwwI-00000002wtg-10JY
	for ath11k@lists.infradead.org;
	Wed, 29 Apr 2026 04:54:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T116163634510
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 04:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjP24Ug9r/GHXosW899GMKTKymLMpRxhQMylkjBjEOI=; b=QDEK4rrUwdfX1y9J
	Bmw2sVvfzEHUr+0OaXaIebd5IqhvoJz6Mz98vRsclO8ovGdJNykHszblE0l7zFZC
	VQy53keg9J685pbzUKxmXQz2PBZtKYBpl5WhYBi1f0wdVhNdVaB/JKzQPonnVcd/
	kU+Wp3BIxR2fxkdFRoUwCO4dx6zyROKr0bHYrNQaa9r5HixEAQVi+1KpmmGRd4DO
	1lRTg14A+iQjw77N1zgxuslhZo0OEx6CIh6h9r+m9y/3bTrD1o3FN9I3zhUhSu+S
	795KYs6uLzwix4bFeaWgyuM6cKV7Ff5dXfKpqjlNIBn7XFysydgXvRbM2Vaxg6OA
	CU66uQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dty87tk2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 04:54:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so236526a12.1
        for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777438458; x=1778043258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjP24Ug9r/GHXosW899GMKTKymLMpRxhQMylkjBjEOI=;
        b=clIMaibumE6WPIw73xe84BdlmrIefkhAt+shKZ6UMRO1QmLX8TsY+Qc/5p93gUDwEY
         b8k9BFE5fNrHFRJJSqh91+r5dwGa8FOKvHMaZrOfhfXKdLTY/qYv+X0ynYHfZ7sGjaiv
         qr8HYSLfuHPZvNiep9Sq7nOcHbDyWpzDWriDPgurL//xanlxgjm7lvIXzYwybbHfD35T
         Y4YicbEd6aYMQIHpK8rUQKvzmnkEEFbzZ5IDI7wqD5QoWn6lqYCAyAhNxLDHhPzyCLgC
         pmtHbv9u/pmq0zvhkq/go5z9kpQw8wHZIXbx3gpoVFCUmOK8dYs+7cLm/O+vB/HJFdn/
         h+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777438458; x=1778043258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjP24Ug9r/GHXosW899GMKTKymLMpRxhQMylkjBjEOI=;
        b=kWjq+Nt4tJa/gczmD2t8QBUTMJYYO3wNB3rxfL6DtohplhRh/02ZURiwVpQTVsK/mJ
         niTuPPN5ULcbEn9kD3ycBj2B0fYkrY22aNt67MKFBgC5uRLSze2kPBsiX/3BeK96WURL
         ZPAH6ZORhPEQmRB/HdMhDILbJmuC9Y2MVZcFiQ7znZBFWlvXJdvyTehdqgX0DEdfHOWt
         tBa22wz1zG8lJiF8qhYKmWFgNjUgoT3HufemaEWuZp0TYWhJEnU3vlNTF3QOamN2c2jH
         lmjwXZ4LuHdYQm5z9PSUkqdncMAMgWnMA6i3sF7SiY7vKw9mPaWVARObe6D3XXQ4u1Kg
         U21g==
X-Forwarded-Encrypted: i=1; AFNElJ+H95cNsasdzqGo/Bj8iS33u+vx1x9Fl6MLAsCIvj+qSaP46g1RUJ1gydZpqOW1/7xQpGqu5F8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Zc+9o09+gqM52oORUx37/zFO/6qjdRuMScx8bZx19rEdR9zc
	f72yXOBQmR1UO/QUavWRKhCVQBY2CPSOkdVN6okmCjVzG5BRChCN6LYSKl5HfLytnYkBakkwEeP
	7Xq1Lv2PFe3R5IoyvEwQneFp8msm6J/PKKJYGLjGC+6KEM36WfwxwQ/C53dXCZVMT
X-Gm-Gg: AeBDiesjheyW3HISKQJWplgzBVtchFETiJ9SABtfcn/VyvbkbnpBC84nupXEJ8ASqgD
	sxDNjmii30z2TYfXbAB6ZgogAsJDiBnJAjsL5F94bbssZit09PKrIdeSBxfGsph0q5cWcq1Y59I
	XbT90UrmjjMljR1s207tXwxDXm7QzAr9JY0i2Z/3jlr8ToDkL9+UgNKhA4U03Jn4VvHfA3TRUyQ
	Wpf42cL61shsq2GbPR5T4o58JbJvhGdUBxeDqLQTdyggalmBItzKp692geU/qtYI3oD6xlB0LVS
	f8fQgR2JcCaYWXNA/p/MAQUpFY1eCtVncyRGsa5hoHhtYGjiMaQxMdN3BZcyVCX8ubjCzqngcI7
	8j/GgPvW7Ab3OpqDV5YtzWJb+mmq4NR3RXjE2up2A/PdqAy/r28xYL4LrIGiYP59d0U8fKDCK
X-Received: by 2002:a05:6a21:e081:b0:3a2:e8f1:b862 with SMTP id adf61e73a8af0-3a3b393ee12mr1255822637.23.1777438458229;
        Tue, 28 Apr 2026 21:54:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:e081:b0:3a2:e8f1:b862 with SMTP id adf61e73a8af0-3a3b393ee12mr1255801637.23.1777438457725;
        Tue, 28 Apr 2026 21:54:17 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd606662bsm679084a12.8.2026.04.28.21.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 21:54:17 -0700 (PDT)
Message-ID: <535dddaf-0275-4f16-b221-a593ff6f7611@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:24:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 ath-next] wifi: ath11k: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260428205017.26288-1-rosenp@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260428205017.26288-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=abJRWxot c=1 sm=1 tr=0 ts=69f18efb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rJ_IYOnZYG8bJ-BjWygA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 5RlgTOGtDVSiY1K7yq-1D2qSCKpZynvM
X-Proofpoint-ORIG-GUID: 5RlgTOGtDVSiY1K7yq-1D2qSCKpZynvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA0MyBTYWx0ZWRfXz+go6jfayDcS
 35NuGEW3BG+10qlGrS0Vb0CsgJpNXs2IDM4hAzlWfW9ho1aS8fOJn/d6nZMLr5HdhlqwFe9OCkJ
 e02u95P36chemCVsUM22tZIB9J3aJ2dR2XxOwY4nEmyVIiMMrxzoWUI4TaHZaYrVxrBUYeFa60R
 Hk19CSScvVBnK8LyFS4Sx2kG+Qlemcf+z9JTwiy4SZ286JEK69vwNi/quwNIILCUDBOPzbOszxw
 m7dXT6jCORYMfU3ZmLj+CEKnz5Lq88iPV5EDSIquFGm39GovMwDXBnJ7C+HOMXMdM6D+7KUvRnc
 f59EmwS/WhbPd8hAJTJVQoxN04fzhylPynNvBd1vhK0ktZjNsT3Pm3JuZUC+OJhtG99TqPaWCmi
 7Vm6iL64uOY36P65zAxt82nxiRSUWJY895fRqIMdBZo6Ynkh5n6qPeAuMl27bukSlntX8bn+OZ9
 gH8xgwPvi+6BN980hZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_215422_412754_CD788FF2 
X-CRM114-Status: UNSURE (   8.19  )
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

On 4/29/2026 2:20 AM, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation before any potential accesses.
> kzalloc_flex does this anyway for GCC >= 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

