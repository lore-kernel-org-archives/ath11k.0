Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F695C43458
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 06:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChiOh6qfWaDIjMx1iTUYbdtHExFAEp/rtOjD+L5GuY4=; b=YNeNbZeuvxnHrbPdrwLs71OfNA
	pZxZCyrWnGlUVHImayredDMiukArUZ2eJIFWYk07N2NKGDyrNk26/zOvux1S/6ojpmx5wubmTYR20
	UxV5lzp5aFIFoJGgUxF7jXVCfqsh1ThrS2OPPqWK4q09f469iqooh9uBz6y8Z6ZLV0FfD2lcx9f/h
	elniHafCTqil9vS6wLZs15QElZ5FI0BsUTX/Go3ZcY1IvnJpHym8cmvb1a6CXH+t2bHji2Z7pzziK
	zE8DKgtsIvRqMwRYQ+AW0Y30YghpdbhcSY0/pmLeq/8z9ahPq8oSMLZ/MX1qsZXWVGzgDJRVX1GBF
	uKSEyQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAFL-00000008GJB-47Ul;
	Mon, 13 Jul 2026 06:34:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAFK-00000008GHG-128r
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 06:34:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NwWb472813
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 06:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ChiOh6qfWaDIjMx1iTUYbdtHExFAEp/rtOjD+L5GuY4=; b=AwrQ7qKGBX07KHVc
	/lW4g05RZEaXfLagvFtJEsel5h1zFndas64Y0b+pg55CNP1iAgha3cKgqV0Vzhuo
	h7v9Gr8KdhuUf9VM+wDVbrRBAyGD30r17nt9Hyybve7SAxq2aB62UVGqRi1qde2h
	TA8a8EVY7ki9uotYCLDWmXCoznsCMcfqZV9HedH811xZy4LJOCs37sqhqS7xppPF
	myage1tdO7iX6fUAb5qdW+ylx17i78blSUx7+1zyexwMiDgIJIryaMXFrN0cuHcN
	vkyBGDK1EmjG62/Pe+MjfoXbo7CEcz3njK+kCfAvTtv+uLoW2xy0MOrmL4RX5/Ph
	NCBdBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mr9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 06:34:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384419c6c74so3899016a91.1
        for <ath11k@lists.infradead.org>; Sun, 12 Jul 2026 23:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924407; x=1784529207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ChiOh6qfWaDIjMx1iTUYbdtHExFAEp/rtOjD+L5GuY4=;
        b=imDgSGzJg8ZcVN4NkNxOA8DBEg0VWwM6+MjjtE1UIq5eCkDi5/cdAzGqC60tZvuUtG
         Qy25RgjUZcYC1aSLfRnRL+/tLC6TQZCMPjnwZ4kGhBJCG7Jr1dopMhguKhC0HyYT3Pls
         8LZGJxbbh5rZFXDfiPgzmjCUZ1d6q3u0PT27c6d0YvuqMhtwXJgjSdsV/x345e2IBTUW
         Sf+FmkZrOfHHae9+XIHJigfcInLieo8uIymLf2MaCJTsZ8kNPjb3UilkfmIv5i2TAKkz
         nm0u2q/RC40QRtijRMN045cFpafCmjCmP3qtQpNaOMPzAUHouyga4wdh4WUP3+O1QGb2
         Od3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924407; x=1784529207;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChiOh6qfWaDIjMx1iTUYbdtHExFAEp/rtOjD+L5GuY4=;
        b=sX/73EAzDI/X/r4c9rAZPHhvRLr7ykiRrH+Tqt2+oGLyq9x6X5Mrxt/vpPkVjgwKw5
         wNT/GJ3qMWrSWVbMKxZLonN1i0RMf7N4/F6k5iDViOUS2XiymTmjCs8BhKcwm+B9AGNt
         6ES3JZnsoBo7abG9QDEusCiclMGvCGCsR/GZc6XeyAMrz0/J+1mN/UPvnpeGKBsjpYrC
         WHS2B5CkRXEURqU1nOIdKykdrv7XS3K07U8Lyot5QzpdJcZMlmLmOkBHqD21Bbu6eyvO
         Ql+H/zXHDFdqlUmxnibHVGqDc5nYReh3uiXF/49HrEf3k/v8GE9NbFUjSeBGkcKIfZUX
         yyDQ==
X-Gm-Message-State: AOJu0YwLqV+Hef66FJ8p1r5lUVSmhN3GEKqQ3gKdPvk4UhKXZsyISXru
	0uu1/8Ne8TJY1Wp1LWMGZvefcn2WlyW5xUOAiCvhNg9akzMmLMg8FLl032QQj6jmcXgzL/s80m3
	5DU3dSEyudHwZV4cfWaZVKI1JsAiiVI8yIITbt+YiKFwgZvr3QDvwsQZtLTNzk7s8
X-Gm-Gg: AfdE7cnpS4LJnWMPhaA1nmNf07EmxqEZYX+8oL2OsIjCHe+Kelb+bknKw0pIn+gCDyH
	5pSoNWz1BHnFn6uQNHvxMh/XN/yezfKY7NnE0Mdng8pg5nMnCw1b9OdsoipQhP+2L+624ZVIspQ
	afo51zjjBTdmdYcA5m0XEIbrMjDgvQp4vfxn5rcjQigFf3WMiEHEiQi/swKkoiXIYCKNxEWDYFF
	kqYbR0hiPIz/gLsPc6k/M8HgPO6uW5KDjRQdfb3DFKjVdr3hWXJrhjKQnh820fEVhQO6NJ0Cw5P
	zTR223D3kMbyLwyfzeew0w/FB6/iPeND1AssIc/9RQ0OlN5i+oxFtPUczUa1Bh/GCfEXFohe3FR
	+HnpE0csdJLJ61y7UO/7o1s12RtLsex9zJKOMHLUhZTTaDwFGy25zCqRWDgp70ltabFkWbEsSYg
	CvOU7tPx8=
X-Received: by 2002:a17:90b:4ac1:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38de0c4ca49mr4888184a91.15.1783924406807;
        Sun, 12 Jul 2026 23:33:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac1:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38de0c4ca49mr4888155a91.15.1783924406362;
        Sun, 12 Jul 2026 23:33:26 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38decd9a90esm1533042a91.4.2026.07.12.23.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 23:33:26 -0700 (PDT)
Message-ID: <83b4707f-a213-443e-9642-116d292293ee@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:33:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: add purwa-iot-evk and
 qcs6490-rb3gen2 to usecase firmware table
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713020359.3618193-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713020359.3618193-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX1pAnhMNrX7tu
 1fcKu5+mUlVA0IIpiowfZaXXDx1EkFBFC2p0kX2+b4AiJjP3f22IIP0pCx8LOPudIwNi7q3gk+i
 mfUYjger0Mt0JdiYelByYwVRds7mPmo=
X-Proofpoint-GUID: 90TDlHAns6XLQK8NeMxDYGWCpIyCsCqB
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a5486f4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DrgTWcDhasnuVJzv9R0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX3b5HnVYvj9zh
 1bPYHPfK3PjDfYriM14W3Z19RLpVqlwSTJ4vskRSudoj/R+FAjcDC5tKTp4wecp23lIN2Wonp5K
 Ex8CByDUWRW2FQYsMt8ft85hX3Dg41us2xNqugUqWP0S1TUccVVVYNQbfXT1lnWA2WGiUYV4Zwd
 lSR/HCPsF+GEyBp8ttnjvRnw+1sEomotxccY2VW97Bfi2ZiW3sDFgysCE2kKWDyKw+ARMgosgJE
 5IAefmkymp8ZDk37r2/fjiIvjYR7xZ7sFQQ0ho3TMwpKWDe4TB17p1eQ7wydjobNcw+vXK95Qa9
 8YX8cNGMzTZYX/vMhavRaAsfUnnisTfRoBMNghjPCKFZOMrFuQvigTALOOb5cISFe5Pf27lplZv
 L38/CMB0NmrS4h2kHKTIwEfWNN73DJZHx2/2tzeBflL+OAeBl1jIpjTRH1NG8EndI4xopaeDgaN
 oFV5mD1U47o1G77k28g==
X-Proofpoint-ORIG-GUID: 90TDlHAns6XLQK8NeMxDYGWCpIyCsCqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_233430_400915_57D6AB4C 
X-CRM114-Status: UNSURE (   9.13  )
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



On 7/13/2026 10:03 AM, Miaoqing Pan wrote:
> Add purwa-iot-evk and qcs6490-rb3gen2 platform support to the
> usecase firmware lookup table for WCN6855 hw2.1.
> 
> These platforms use the nfa765 firmware path for usecase-based
> firmware selection.
> 
> Also reorder the table entries by compatible string.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

