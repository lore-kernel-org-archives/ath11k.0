Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F96C54F51
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vSAh5arwVCztMjmOZ4jFlqD2gwpQfFeJ4x21KNMh8w=; b=JNKJWUnE0MPIYTratsy/A2rKTs
	yX2HYd0RfanYD4M4lMTBuZiCaq4TSf1tXiP3o8k/dGQy6cRr39PkJgaaa1qJ3RGs2fJlf9P5QvQnf
	CvtH3Tfg0/qJehfNcxwVDzl4NK0/gMJHp/2Vjqq6PnjM0PbmTCgCpOw8Q5e+ML2XfPIvxnHkJb7us
	kKQcJmUk8ziGIsspOthqqoMFz5hzItw8a2NIsoHnwXp1SePrv7PVQr4u7XWvKX1MRU9HZwxula2G+
	0yDjByKBzdtCC6GG0yzjLWwEMs69hIAibH6rN5pbFPBky63SZIj+9UHX9CCe9pwlPO/mD7KTziMK8
	Bn/oGjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp09i-00000007Icp-3rVy;
	Wed, 29 Jul 2026 09:00:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp09f-00000007Ibs-0m11
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 09:00:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ew2j1167753
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 09:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vSAh5arwVCztMjmOZ4jFlqD2gwpQfFeJ4x21KNMh8w=; b=S8BLB5eHWpCpjSHw
	msH19dFDJkF8Dnh89uTXaEG3KvdH1UuxoXEUUo176VEVa/llXIBenUjCdHR3OikA
	4tNGGt7G/8Ee9oSY2QRdH4kQ0JRrj1niwpC2ovb3Sf1Az3/g7XzGd9M4MrWPL/sA
	0RESOKMPP9fXaxCAUtkoj2358G1xgaS96PiiKVgTYdyURUpm1wR6rx7jtWAnrez4
	VQuOxi10Ibun4Z3GP2ql+oenKuphriVbOAkN3/iVwaI0I02uh0SDijKju3kQYD74
	1uijUmgmRH5QQLHesBeaVPGu77+7of7BaVeIk9Y8BhIbAbNqkuh8rMCG/clTeHdG
	bGButg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbhj8sjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 09:00:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so10837515ad.1
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785315645; x=1785920445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vSAh5arwVCztMjmOZ4jFlqD2gwpQfFeJ4x21KNMh8w=;
        b=O9pFf1SsZq2BQyUSwFJ8FDhccpJtxpMPD8+thoBDCExMNf5QIPKNtlwMNY5UBRZt6C
         kaM2iPeuZU6NW2CFzNr/H7ij3lFB192P6Hr1hJ3R+PQCFyDIOObnJYltjZJxscyXuyly
         OW1ZcT0Xw+wX5UY2s+IZFTS8tt32GhLucw+QpNBekooBe2oRSUJhOjFCOtNBEmz62ihx
         uuYA37vziyl0HBoPYKTX/Ef0bLJ0WUZzt5q7o6+WL/jjEh8H6us9aPIBRkp9VQM8aA+Y
         aNZoxGWv35SzzomLZTkScflfiikY73Rq81hmeFYxmMdWkcZVdi9ome1/tTeTSYp0ruvZ
         jVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315645; x=1785920445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vSAh5arwVCztMjmOZ4jFlqD2gwpQfFeJ4x21KNMh8w=;
        b=W05q14HMwshwR9QZ5wV9vX/hvanrUECZULAqheI3aCSIy/S0llT0qKfGH8EaQvxnW1
         /8MW1UAVvqsHcl/09s1vQHDWtA38cDDGfqVkmKZBo6plulAwiMD9jw8KY0FfgNL2Yv8A
         w/k2fv0etLkKSzoJk2L5eoMFoWdeMwsoBpMWzB0s/9y3zN9CwDrREgmByw3ZwQKYP/sw
         cYMSiVyR1nCFhO/yZajp/JZwBwL3oUjIP9HMcdBqKBcC4FhUiuB/WwVsKYUUnFPp5aD0
         qKYVY0/IfvPNh3oYgTym9xU9PQIbhepqtwY+sBcY0whw15U4ivnhwmzubCCM7gZHHXHk
         SFFw==
X-Gm-Message-State: AOJu0Yy8S+FA8E/RU5aKYnKwzLeoCifWseaaMmLPs9zlSwMGErNUCgpi
	k15923AKQp0qTaQdLJK0VYeAEtM/jyyv6RbuOwkT5211Bm42a4IyL70rQ6t8uHxrRqSfO8xCvhs
	bLYr0xOKOGEXJl5bhYZKPhXbOuxgMlafLWJekg7u1CPI2QMfBXxEy7KNnaffIrVv4
X-Gm-Gg: AR+sD12mBbKtub94r7GpPcMvo0c5Xqbt4iGyJorU7YxCLuRZDxAwOxPLs5EbS7zkiZF
	8t3Axq6I2GUzs81k7Cv70N/8qEcbBhzpngFkQixC/zxr5W/+d2Q6Wlo8biB1qopWRV8xfMWKw9m
	vfYDlyE2iI6/sc4oAZ+SkjrWXsdzopAG5fmgzeHownyyaVkf8+fhMH3Mw5Jwdrwgt7Gt0R2+LwH
	jx+0PxuQR5QliXaqEEl65k0sN36tznmrqZXcZ9Xy13lJQl1+OyFms1YHNQLh2LkXoC/Os6aEDaU
	8zAjiW5/KShPSXjjKkf/lhDZ7lZqhvpa83HjMY1SMfuB+k3xTRW3xNNc9Z9cYwHnKQh3xKwAPih
	tsSN54gAiOsLjmoFcsa3CAYno9n4xhqfTzC8KO8EnHRgVH+YMQFr0lKtczdxipVMLesE2Du5g6g
	==
X-Received: by 2002:a17:903:37c5:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d015b0021bmr63919735ad.5.1785315644916;
        Wed, 29 Jul 2026 02:00:44 -0700 (PDT)
X-Received: by 2002:a17:903:37c5:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d015b0021bmr63909705ad.5.1785315629857;
        Wed, 29 Jul 2026 02:00:29 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc8400sm8046265ad.47.2026.07.29.02.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:00:29 -0700 (PDT)
Message-ID: <b9e32b0e-ceea-4089-b7da-b53525cd9ce6@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 17:00:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3MyBTYWx0ZWRfX3qs38OO8+acV
 anf3nCGc/9e8Xj7765ie97vSslKd/mB6VrjglNXKU+wr0HmA8U8oI6eaTaijy1gkZ0GFMuXLCpo
 IlhufvZiVAymKLoGWjSpzuBQdHYRPiiqPqi4v5NFL+GmH9Asi2zme27p/1Scah7jYYvm+L/aNmd
 CggSQpH2mgIYJGLtP4SwWTta3ijvIwBBf8jT7jwc+mKR0mxqKKoSFtcoa8CkEijaUNt1DQMmqt3
 pYSmVZNoPV7OSKRBLSOU2445x5L40yo/EG0wxH6ru6YbxT5Qi9546Fd27FrUI5ahYN12D/6eyr0
 9rI9/pf6JBNAzLGSARH6WnW9VqJDPBW/q/xhVxjXW41cu2SKtLl0UCEDwnWhfmxK61+/c5mtxB4
 7f/DVbmF8/6J/oTA3u6Totwp2S5bIAP/Ne9AB9t1OLB56wl9lReoqtjXM6eb5Yqu00DRmEbpiPl
 +Y0Was9gQz93CxrpZqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3MyBTYWx0ZWRfX08Q9TNoxgMZi
 jIyA67In8wA5kWHHd16gAEHhSFpfotXrlfzuBbnBoFF2BtWddEMMNaTGQOI+amIgUWR7dtCsi+g
 D6MMfrWgV1EMX1nh5JsQY3wdMfrADzc=
X-Proofpoint-ORIG-GUID: CNFVBE4w_bTr3xPKhTCvZY36QHlphF8V
X-Proofpoint-GUID: CNFVBE4w_bTr3xPKhTCvZY36QHlphF8V
X-Authority-Analysis: v=2.4 cv=dsvrzVg4 c=1 sm=1 tr=0 ts=6a69c13e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iviOFIqGMEcFCaixUmcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_020047_374290_53DBD00E 
X-CRM114-Status: UNSURE (   9.95  )
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



On 7/29/2026 9:05 AM, Jeff Johnson wrote:
> Both ath11k and ath12k have the same issue.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
>       wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
> ---
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
> change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> 


