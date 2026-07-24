Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F955C531F9
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 06:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4lo6fyaz1U6++WuUAn8IYQA5d5uVJklp9nQ+t8eM4M=; b=oQd9SerDzSkf509Ann/+5HSZF2
	SSx2l4hiaOaoLgKgXBmQpnFw4EEmZNnXEt5sTuUaIrlywDY6iaa32qH9LX74Ou1ZXdu0mol6NUxKV
	NER+qOTCkC7zkXpPLs9i9EeLjwrigBqr6kRo3FkjlJBdSWZY80lfm9fKPNWuD+TlyC/xA3jS58PMM
	ApzzNdg0YbsCGVZMlUPTVcjlSdR03o6S4xes43qWAPMUd8msjxJy814WKMr5jwq+n/qLVeISVv6UI
	1sYDWP2VlW/t+ofIdkCLPoaQCU57pk/K5f1jqtv7IedA9VJuVUKN1V0f2tlKOLC/OlNeFJYPggNoT
	XLvq49BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9aO-0000000FcWR-30yC;
	Fri, 24 Jul 2026 06:40:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9aM-0000000FcVB-0lIG
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 06:40:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xNk71892290
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 06:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4lo6fyaz1U6++WuUAn8IYQA5d5uVJklp9nQ+t8eM4M=; b=HARW3d9DPm1jfzdc
	U9u6KsVpWbwJ0fpt3Z/uqiInWi7hrUE+CnvmLvz6D2Yty6CUhXwtIzM913G7fvfT
	I00rvc6ezVXTLRWQREv5X546GGPF2NSpEzq5e9M9on2/YAyHDgSCTqpzduch8Gsd
	Gi9dRI9Extm2iMV2wsqkCuXoV5gp7dL1BerOXWJZanTLHw9+GEPUdhVvmIydfM1J
	QZUvT6Cjxx+GoqTEPw3QM6p0Tc5Ybg4MOzqYregzFuF6EPk+o/ORVT7RLvQHK3yT
	msIMw/d6gT3Kiab/3JrvhWHqEv3yQyfojGc5MrvsWXL8GPbFq720XDdZ100z8wyC
	QQeKYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx859m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 06:40:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso145739a12.2
        for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 23:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784875241; x=1785480041; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4lo6fyaz1U6++WuUAn8IYQA5d5uVJklp9nQ+t8eM4M=;
        b=CBpxo+6qfucVWDXw7pNz+DPOzWSUuPs/8AKmw0d09lK4OCAodCmNP3o6yrYvvkwua8
         GyVESkAcPLE84Hu2dK85AMer1AJBK2IFCV6YUgXbEC0z7nKI5FzR0ElYfrGImAHvjSrx
         6zN75Nz/XLsQeKFIDx21Gs0vVKyf5X7F9W4JSebOFvBm5wojjdhLQAHaKoqIFAQMIKJq
         1Qs7n+Ukk4nOL7c1hI6uwctq45IlL6QSAtgTfQaw7mLiqfN/yRv+i1/jJ5YmzFM+7nJ5
         gJ8n0NK5cjaEwhg21LZiKz1RxiTeFY+HF9g7ozvQL0ANaX7VnsshhKiNbMQ6H9f5jtn0
         89IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784875241; x=1785480041;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4lo6fyaz1U6++WuUAn8IYQA5d5uVJklp9nQ+t8eM4M=;
        b=bacE/D0AEpvpDWnxtjsHy1Jws4QltNeewbkUiImnj13NikWTostDUJWug5yhuhUI7D
         YmtgappqRL2L0I1/4WuMreMfbBuzifADOCAz9g4z7EsIOkej3tdF3zBChiAthErgoLHV
         9In2WAELI3yLZF9wmOyjRQinckgV65vx3btmGgglhigBjl+YjoCTleKIJcwhmUXHdaWK
         xl5UuR9FQdAboTbR0/FTG8dPZmtU40IaUnUucUSN3t4DmVQfG3drpqmyVTrQ/mj63RHP
         7CTXh8GyvMN6IygNyeSeskb4GKpCXL+hivNCMX7rMeLUU7TRW+nSCuWA2/DNoUw3yKIU
         qWnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rogozec/1Azz1Z2xd9W3xbBkMi5rPKiTbQkXMroF+cjjRkMR6LUbjP2K85IU9SeJRvLY6X0LLw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTQa4DHC5MifUq6C4Ne4ypaxSfo77Gs11PnPK/NTufwLMtV02u
	DOpbcFYLUsy86o7dWD+cOXGkezWzIuOriTNDOqatJFlabd92IqNc3KhpDa7OYjJ1E2Y+2I1l0Wp
	GGUytmIpBFRCjvi5kK1oO15EF/YpK9uQyZrxcGLzEuF6+BrBtof3biraT5dXBQo2Q
X-Gm-Gg: AR+sD135KbkzvwP7YGCbGacHzXzoK0B6qOb0dkwSJrDCjiY7aU9ID6soayT+ewiPr4V
	4BECF1cZAkERzI7GRXn21yetn+l8t//xQ5WcNDujZEqEsgypJ71ufDgAyjLRi+dBpk2feUX/C6d
	kCApbvxqRhmXrMaK1YbIoRhmD5SF88Ne0HrgLs2XpPX1iZM0brwKzECFrRqttDGIbD1dmVEkBax
	MA2gQ6c1/t7OLTUS1xmJo49IiBMv4eQhMaX4HYItT5Aygfh0SdPTqPtLwxRMibEZJIgUBPvGpkU
	StEo6MZt8KICbSFR07Gi0h82gFOnAtvIGp3uWshbb0ZkwNi22OEkQbagJ6PqaFntn/CP2iX5V63
	y96fLt782ujW/MBXTfe2XLyyRq7hY0qvscgl2OjYK
X-Received: by 2002:a05:6a21:710f:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3c44afb2743mr7222445637.3.1784875240944;
        Thu, 23 Jul 2026 23:40:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:710f:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3c44afb2743mr7222428637.3.1784875240556;
        Thu, 23 Jul 2026 23:40:40 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm27015380eec.15.2026.07.23.23.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 23:40:40 -0700 (PDT)
Message-ID: <9261324d-7139-42b7-95d5-f9623773eeb6@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:10:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Fix buffer overreads in CSA
 switch count event processing
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
References: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lvRmzvnsp2GiBIRsO7Hh8VoYcDI3Sfkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA1OCBTYWx0ZWRfX/dysYBFG+6xP
 km/EZIuCV/ZTfRCL84lxeUTgNBPUHPE80uQTo73EY7z3kYOdJFy9uoKd5VszGtlN3RraYkBEeXb
 AoEtTYfLo7Gt0bF2/Scbj1Zzo74F7VRXTBAOt7TTQmT1qJ5ldMb2QyeJoPFqEdpUlSX14zVU4ud
 i1QY2sVWPP71eXFrr1lqcItqU90OQ0OqM1bzZJOl4NiUAPnfqhPN+fiVld6dQAd38f0V8VeuKLu
 ZG4tUu7Y8aa00cQAjh0R21Vguh+o6PwXT16INMCllxnOZj7te1UEQgpm2gU9pIVPoJNS39arYA7
 AOZfXKwzyjO6sx+Q00adnmkrLtlV5GcI/l/2KEVGt5+w0dmWUlrL2ysy++IFE+mJh7p26TspuWa
 VVBQNKpttLgeksn4/sJnygXLvES7cnW4VpaRP1JJIxPpV+GMrrWAHSy+m1cbhCH7kmUexpsTmt0
 /Hhn6MJVt0l/UOV/PnQ==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a6308e9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EEee_W5yMqs7HOlhk4gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: lvRmzvnsp2GiBIRsO7Hh8VoYcDI3Sfkp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA1OCBTYWx0ZWRfX6fFyKhjgwzQH
 p8GY4SBUtPbSAm5rGoQdCsUZ3k+9zSIOn79CkY9Z4ykPcjMTSBOHrtVl7ZSlz94qwaYXfMMUw7M
 /MdbErQO4DmF9FPuOgj3oCaVLJvny5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_234042_218607_A65E1AD8 
X-CRM114-Status: UNSURE (   9.72  )
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

On 7/24/2026 7:01 AM, Jeff Johnson wrote:
> Both ath11k and ath12k fail to properly sanitize the CSA switch count
> event.
> 
> ---
> Jeff Johnson (2):
>        wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
>        wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
> 
>   drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
>   drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
>   2 files changed, 35 insertions(+), 2 deletions(-)
> ---
> base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
> change-id: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

