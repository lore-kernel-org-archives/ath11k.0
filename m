Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE55C71143
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 03:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUCmIkuG3LMH9a7Icoxvvg0hF5IF+P9HedQ3RXmEk+I=; b=TWjqjQjw12c3xDb7GQ9ZV+1Uiw
	VAzILaQddPfog1Ef+APVjwwVrtbYKJBzPJhWOWeht+M6y5d8uZZYhBcTlwUdQkCVmZw9lg8TZE/iK
	9FNoWO9ZhpF6/i7uh36nMQIJlkJHnFJGzbc7xdBGsE8oKtPHvduRuhrPghm8ti3TuVqBjkcpDhds0
	9FEvVt83NMruI5zwovRjxxeh22AuJVRJxoe6HOIMcDsksxAj19NfvZZQsE+iyd0alKsIhhgcC2ACC
	DypeswZnth9UysS8qHJaxUUXOOVw0M0XfgzkzWdBy0/liFCqh2hvrsIo0jQ6QMHSccWeOsqMJ4CCa
	eD5SucAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYem-0000000C4WO-0YE5;
	Thu, 12 Jun 2025 03:31:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYdq-0000000C4R5-2UOQ
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 03:30:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BKE0fR009047;
	Thu, 12 Jun 2025 03:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUCmIkuG3LMH9a7Icoxvvg0hF5IF+P9HedQ3RXmEk+I=; b=m1nuZ1JFEVSb0OjI
	Dv1fkcYzgmmuFlzCQAAWvGJT4I46NpLUXtNvy+pN3Kw7YGaGizjTRkI5p2hy/+oi
	mDfkUE8LL9N/r3BaGqVlo6OvVBHk979np+pWEEjmTkhrVk+OLQUIoS5KCiH0Ng7B
	B4a+hpVVFvl735RQiRUBB00uEqU/nUHEJ8UNNjiIyPdNs995jKuqbAfRQDAHc7pC
	eFO9ipVjKl/+Cpu807L+ddDbkveNouJbKOabiHOclHcTJ2rW/3+8hSSPbLZgprAx
	4bjJXw2cIBwwHvSWTfigSSpNMXNpp1nEHRCjtz4GsXmne15BVCO8+iwd6tPKwqww
	lRjX3Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753bu2ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 03:30:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C3U9jW020405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 03:30:09 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Jun
 2025 20:30:07 -0700
Message-ID: <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
Date: Thu, 12 Jun 2025 11:30:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250529035708.3136232-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAyNSBTYWx0ZWRfX3wyDGGnaofmx
 fCo3ClQLviBvchRWtsKcgrwJkJYr/9SZFTyvooh367ldIQBIWgxYd2rKax7BSVR6dvzffqEPKgU
 +GDa7xlulMdg2SwyM0SAeq6H9G29tTeQT1YlJJwW/VMS5zhoDJPliT8JXmEQNTf632Iqi8DSbcT
 Qwx5F3XMU4GdXfhDDb04MMactXsJp+tFlqjnkXQHg8tv182GUdcvy2BBwio5tfIgSEM055sSUkL
 0llFbPdyhNq9GFZt/v/t0VNafnfDc9rOpiKXBqqDaY4D6KRwyWOSBle2s9ZUfL7jgeqQuGFPmfi
 3TgauskYBs3yoSZvB7CK19lthXpa2Enob5y0RBIBo3Kxx5+aUoGMk/96D9gjouv4YR8Qmo98iyK
 dQdBwOcjWPLna39sAYoOQF+Ytd3khLVlsu+ZQmArQY22u2BcRpbJQnJT2QwRyIK5eKRFO0N+
X-Proofpoint-GUID: q-cGVvltXL7RH_HEyrWg0cT_9zScCsWN
X-Proofpoint-ORIG-GUID: q-cGVvltXL7RH_HEyrWg0cT_9zScCsWN
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=684a49c2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=cm27Pg_UAAAA:8
 a=jT8QrNtKxUptj30f8HwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_203014_761692_4B906630 
X-CRM114-Status: GOOD (  15.76  )
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



On 5/29/2025 11:56 AM, Sergey Senozhatsky wrote:
> ath11k_hal_srng_deinit() frees rdp and wrp which are used
> by srng lists.  Mark srng lists as not-initialized.  This
> makes sense, for instance, when device fails to resume
> and the driver calls ath11k_hal_srng_deinit() from
> ath11k_core_reconfigure_on_crash().

Did you see any issue without your change?

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
> 
> v2: fixed subject line and updated commit message
> 
>  drivers/net/wireless/ath/ath11k/hal.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 8cb1505a5a0c..cab11a35f911 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
>  void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>  {
>  	struct ath11k_hal *hal = &ab->hal;
> +	int i;
> +
> +	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
> +		ab->hal.srng_list[i].initialized = 0;

With this flag reset, srng stats would not be dumped in ath11k_hal_dump_srng_stats().

>  
>  	ath11k_hal_unregister_srng_key(ab);
>  	ath11k_hal_free_cont_rdp(ab);


