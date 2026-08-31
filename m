Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331CC61DE4
	for <ath11k@archiver.kernel.org>; Mon, 31 Aug 2026 01:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNdgbq+Ke14WYouyaldBldt5vSdQp4sGRK5KqDVJ/0Q=; b=IA0au4m4HyM8neobyLxAplwfe7
	4b4EwbmSHHB6pdeZb6iI4ZFOSOe6poMC1TszOzwNrp1HCzCQlLYEa7yILcEDU95uHvnoG5hxKHOKa
	whMuZ8O4QMhOKzNUfU9ig2dYy8MOfkqpYodQinu3010LSNgh5Z5YAhE18CJCgDZIezLSzvdwbfDM/
	uS96ataXsv7vYxu6s2SeYebpZMSv+4Y/DOnqFJyGCBbTUG1OxfSqz3WadWDhwhJ4rEu3rFbbKkBcU
	nTK+sTYunAxY+j1shtD3qML6PyHKzk0pkJCH/Vm9nHYuX4OEMbU5EtQf1UnkHsy6Y04BrR7HD3UfZ
	23r5qibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rJJ-00000008Kfx-2Oun;
	Mon, 31 Aug 2026 01:59:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rJH-00000008KfO-1JPs
	for ath11k@lists.infradead.org;
	Mon, 31 Aug 2026 01:59:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bgXb2322444
	for <ath11k@lists.infradead.org>; Mon, 31 Aug 2026 01:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNdgbq+Ke14WYouyaldBldt5vSdQp4sGRK5KqDVJ/0Q=; b=fceX2KwPMT5eQj3v
	XGbRTnLa6XwlTcfQq0ZcEtQnOi8i5LzcZq+co4ehgKYnqSG+MlkIj4G7HHP4/0JV
	/f715sxJ7Wx9ZRPDghQqUoi/cjtpFq4sV2I7E+Ln860Vl81AhGAOrJDU2LmslrSQ
	6RBZjrNFNQXqUU89KArCpPCGxdAeAKKFxrprXEk08R90Wn+YPz9PLMXKyYd8pot5
	O/OQF6ejWukY9KAyisNdV+GDJvuHG9Bofq7eqY66uGcDrfZXvcBbn0EPeWD50D3A
	9VzjxZuAfgUaOxS5L10GyUprR+EtZt9eO4Bu3BKMtvvYmE2W9ZjDbET7FSxdkWUd
	Vtwvog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgym5rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 31 Aug 2026 01:59:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso35385135ad.3
        for <ath11k@lists.infradead.org>; Sun, 30 Aug 2026 18:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788141581; x=1788746381; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fNdgbq+Ke14WYouyaldBldt5vSdQp4sGRK5KqDVJ/0Q=;
        b=VKHBuhJpnW1NRjSIZSXWEEs29zamzdb9cJa2U1m5hKYTqz3hDs2ercomSf+egIoeB6
         Xuf2sDjtgmhx6sE8pKOkpWgblBW0AVLC5jz407FWA+aIRpTJ9YOp33r/kdwrKDdNNLKK
         5h8Bla8Ar6Jag5l3I8J6TqJGpYCE2STMm00YhtwwUEWks+pLuIGx8DRRlREmONRT3B5v
         HyKyKAWeZbvqa+jCuuquuJQmzKPKsWWWIL/Ftxo0BwvCyPUouIHbe7GYVlxAFIiUpwyo
         JUMUncUVTUjQ06BiopNNZmAArt1fc8PR2pIOdCEddt4BFx08jFk0yRZrFMMxtuwTv+Mv
         2U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141581; x=1788746381;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNdgbq+Ke14WYouyaldBldt5vSdQp4sGRK5KqDVJ/0Q=;
        b=OCFTfo89jAlTjLVW9zASSi4hgf6WbVRdTM4weniJBijdari2MOGjRJDJ5Qc19unLeV
         hSOKr3YLEzUW/0QHgl3/rSX7mWMXTf0jRfF+oFGG/STHXiin0v7mpuRvIIGlQJwPaTS/
         EB/Ix/OYHTV2W3fCGpdDzGfQIj93vcjBpve1bs+68ESSH2jJ6BBccbzwLHJ01bBOG5Uk
         4Fub09xWFYKQc/JkrEqvJjCnW+Etm/hOLpo4z42DNVSKt21AaPSw7GNc8qwwDPeUKs5b
         iJADg1XrHMZT0w9siGo9QK8lUbWT8J53TGFlSvOQL5/JMO/NC6pRg3pIl8GN85Cvg6yZ
         ufsA==
X-Gm-Message-State: AFuF++mGndFu+asuWQT3OuLmQlfq+x2TvbFUpIxwelUxbSU//pblb2gw
	pWwF97kqQqRIwPgI0rpXzDbOtfdyDccgDecKgLXnQJzwAvKX4+kPruTfFBwXiBgvY50PUAm2clq
	LR0VUTNd+Trj9vW5sY2Iy2hphmuxoBXyGL4r16478PnteZYc1nJhnfXVawKmVz2wD
X-Gm-Gg: AYBFou3givxbs+PUVPB+8H5htntUk+A7S8+OWkZSafANdLtcGoKz5St/g23GdZ4owWm
	k7IRxtCUZtijLGEFfny9Hvyc69Q6x6qwxvFje+BhdpiwvTwbDAK+Kt6+hYoe1g9RAp6Ipjn7GBW
	KyIhVjtVM8yd3OsUf9HSi9UevylJQ5gyFKA6H6vta46fQ+J7cDWI9vDrV/XJTYZMdyYdd5u4lp8
	kHHx0d23TJu4kP2bPTMeimqlJ2m7RLU6gFUXSuABM8hITD82QaODhocrKAMD78/LdYZ6YSW/HT3
	YfvRkOs7Q2hh26RES8uDDB+Lid9G/QpiIweNtB24l26/r2fn+ADcLyHf4t7IuZsLhwdnEQWr6Cg
	atSaphwV/emErc3XIwGR+vWa8iaGVoN8=
X-Received: by 2002:a17:902:f70a:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d93f924498mr2677135ad.5.1788141580949;
        Sun, 30 Aug 2026 18:59:40 -0700 (PDT)
X-Received: by 2002:a17:902:f70a:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d93f924498mr2676625ad.5.1788141580511;
        Sun, 30 Aug 2026 18:59:40 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598c155fsm27355795ad.80.2026.08.30.18.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 18:59:40 -0700 (PDT)
Message-ID: <4f39d1ba-c41b-4add-9c7a-80d4eab42b73@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:59:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2 0/3] wifi: ath11k: fix QRTR readiness
 related WLAN initialization failures
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAxNSBTYWx0ZWRfX+2G2YNy9FUlO
 DPxM4aphUILi5jobnO00t6N42rFEjzrsVFmAdVmsMFo06IrJZPeYPHuWhrHQujm+GH4VcMF2aPA
 dvKtJlLQBcqZOhHNb5bpw0Qc9bPSRWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAxNSBTYWx0ZWRfX86rYZNM4rka5
 cpY+A3JFPqFWa1du/toUtxBEjjZv3ZhNnWZDh1+ZQlLWOQ+BsYLikAyzA1Uxsj+oh6H1CADrKKi
 YIiRMPUAeZ9hQ6jffpyPjv17CeyeGS5u8R6xGTJ2xAhqIib+nZehUFTQgl0rXUKmu7jkCFzJO0z
 7Xw0mAr7CVus87epXmTjNHkd8XunXnJXiMskPloNNHh63RmzQ72/4wxB6rEO4xKwA8qAhDEZbdt
 LB5WyZ2CHT8EuJf2f4X+5Y+Hxd9pYF9ORjr5mSOiUgh8t5qROkgF+/DOuieEsc3UtCasjQ1pv+q
 RmDldfIIV46N7X5kSizaCW2AEWc70DAknck5xXyeYvM+Eig/vBo8kmL7Xm132lNr7aysoa7Y/2W
 JR8d2zqbeFSE46wGhG+tn5MxLMGsv6/PrRm1Atz6u6N34KMhGVB7k6rsdhJ/i1pmc0XZaekI+aA
 HVDkClSaFXhvsnr0ZfA==
X-Proofpoint-ORIG-GUID: WW6mGKlkpnRgkaJUr5knW35kgr2HM17F
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a94e00d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yeVnTpnW9Av9R37Qzj0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: WW6mGKlkpnRgkaJUr5knW35kgr2HM17F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_185943_490278_AE568FF0 
X-CRM114-Status: GOOD (  10.67  )
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



On 8/6/2026 6:13 PM, Miaoqing Pan wrote:
> On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
> during boot. If QMI messages never arrive, WLAN initialization can stall,
> leaving firmware running but no wireless interface created.
> 
> It also hardens the cleanup path to avoid crashes when deinitializing
> partially initialized devices after QMI setup failures.
> 
> ---
> v2: Replace the ATH11K_FLAG_QMI_FAIL guard with !ATH11K_FLAG_REGISTERED.
> ---
> Miaoqing Pan (3):
>   wifi: ath11k: fix sporadic WLAN initialization failures
>   wifi: ath11k: fix NULL dereference in ahb remove when QMI init
>     incomplete
>   wifi: ath11k: unregister PM notifier on QMI init failure path
> 
>  drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
>  drivers/net/wireless/ath/ath11k/ahb.c   | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 0ece44d394570806e97c8471a50dc9f584516ef6

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

