Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C237AC44525
	for <ath11k@archiver.kernel.org>; Mon, 20 Jul 2026 02:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwYCea8We6mdjWm+dC6kPkTmaclY2KKsawC/nEua+YM=; b=HppXEdpN+tcbUbcMFCWduECKvc
	2AZRISm2XfrfCQWP9IB5xwUOXanE5K0U9XiXh0r8OFyabfjrLB3Ce+dX5VXlRuy/GKYBS/muRD0lr
	9vEWhJa+79xGh5KettdwR03A+QNeuo3priCj4U1C04JUhgg3zgLx3MEELVEErhQkgqbmR+OyvZ3l7
	vJ04p0fyQDSzmcqAawL6a/iHK4uDXfwR5WaeHg0GpTY7mdTuqdBKZIe6BJtpMgfF3QbK50iwTd+6P
	quPg3f4s6Z/HAnMZIK7oFy7wArqfKS6TeDl5EgynhLX8P3LtczV4Qfem1O7873nM0S5MUnEfvi2uX
	K3T7IrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wldc5-00000005gAb-1TKM;
	Mon, 20 Jul 2026 02:20:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wldc2-00000005g84-1oIf
	for ath11k@lists.infradead.org;
	Mon, 20 Jul 2026 02:20:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsbQ7657712
	for <ath11k@lists.infradead.org>; Mon, 20 Jul 2026 02:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwYCea8We6mdjWm+dC6kPkTmaclY2KKsawC/nEua+YM=; b=MoWD+ea/sFbiCg2X
	7GR8vHVuokwWB4yy/3OH9zhziJEkOK9Ft1l32QWhYabo1c0vcPJqAIqOl9kxJKqp
	uKZGHf29Q3l6vFg2sIf7lmcda7shqXnZ9/QQ2gFehvLLho06wKywqZkC3RPhMPIN
	ZZHRoUOT/QzzqR91rmBkcSX7j6PsF2lQZ1mFcvUtaAWMu+sb6vrJ3hybPGgwSHbZ
	xzPjtdHxWS6X/gjGw6MuEEzsk/BWC2m6V2LM5Akg64anM5RBAALwJ7717+yIO8ZW
	Y5697mrbNV7uWxgeCuq54js4Xk6tKIel8jm7WzhwTqNuWOAqJnbocBqUkWVPVx0t
	vNh8dw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chkxnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 20 Jul 2026 02:20:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so92162445ad.0
        for <ath11k@lists.infradead.org>; Sun, 19 Jul 2026 19:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784514008; x=1785118808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwYCea8We6mdjWm+dC6kPkTmaclY2KKsawC/nEua+YM=;
        b=a2Aeezgbx5w5aK/LLjUtFP3OXTV0hDAlv/pFSKkBPfS9jS1zqhg7n1LdYQBxF4ar0R
         q6FZomehL4G+JSOgXpslo2R3gFQ/Y0n4IRErx3LKDxcH66McbIdpZc1NK5z2fhV1ory1
         p1ElkKlJgOS+BLjEVGWh9uaEG92UKAT3kqqlRGClO53T+TrZi3r39EKfm0ZZSLth01fi
         ZxWpFkRZBSC4U/U8PLJToKSvAcfxJCiLa45Ol03LhXouXM3f3sRsY1AnO2ir/pXpuZ1v
         SiYCaGOymDg69z5zGZFO2847/HtrUJcPC4j2zXYKVRTLVmgjuLN91qK1PwYQ/NuC0Obb
         /uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784514008; x=1785118808;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WwYCea8We6mdjWm+dC6kPkTmaclY2KKsawC/nEua+YM=;
        b=rVwf8m/TEt/CYpYoMrfMusvDuz4SllZ7ExUuXJL6KO+yLiE0Yt0M9VwdZrALRoEVl/
         3/r+II7QifvxzG3v/XE0b1q5JGJm89+0HS4eUMWKlFxs3kL4qXSAuzfDvwol9Zx/L3Os
         h+iUiKPDWRQ2LVXxOXtLEIitsQefJEkwNHX4Mt+QUtBuhy3YHvKfOl/7nXCL+EMciIUj
         6h/p3aKAe1AuXux5EuWefW5hi4F3kbJe1lWx1uHqRJWssUPi7ZTfu8t1vG2JSkLeFe1C
         DRXUJgZFeh731NVeEuxfknb0sh/OGn84EseZwklcMWh5vYme9eDRPMMioshLqYKFwI5E
         2N3w==
X-Forwarded-Encrypted: i=1; AHgh+Robuidl4O4y0frQvoDgPn2bSyKMo4Gro/0QNoo7NOFJns2ECx69QZ2ffuKc6jyYqSfTT9xwkOw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUdw86MEAh3vUlJam7o08zELxfYP2zX1swBXvxb0RsTcV/fJ+W
	PDsGOlWuGUFpgFVNoJ3kerUgnPZL8tkAU4sINH8taLYVsRlnzc94zsPee37qpFCIMfwMkUBK5a2
	D0xNev8uzX9jXYxHF2dMWj5lmaaLOxg3td3Dsy7pZ1bRShEHkxNUlxugokQJ17Ftb
X-Gm-Gg: AfdE7cmSUKIKaFaGxryTzSQ6UvmK7PjYDymKZ5WJMIFZnCoGVHOkQ1Mpg1TVpjdvb++
	HnE3oF2R6aZqiw/qdSczOeQbQ/mrVlYN1OMw2u2I1P0rFijz34cIy2IWCg0tND8ll4fIUdlKnBl
	yyykd0XBi7Rh0PT78uyijTM/83QRzvpEbX+xn/JgS+OuDHNN2qQI8gZZGRd+xLoFDwz322LxrHP
	GojoNlrxbjV2pZBmu8hfUTa4efn2Ml4YtWK4OitIZQxLuEilByvuzHZJnJcWolJi+5NerG7EC8a
	kdMrp2F1PYN453t3YcAfctQ4g7Nct1L8Wx9C6MhqNG1hnCzUss98j9ecxKwJIG8JQfiaZ93l0K2
	I5X6pzyo5K7nUcSqypXBVMFo6abC29JsD4d3ac8xm+ct93cT6og/z9L17/UYzz7karpesSUUj
X-Received: by 2002:a17:903:3b85:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cf3488b0d2mr126545055ad.13.1784514008107;
        Sun, 19 Jul 2026 19:20:08 -0700 (PDT)
X-Received: by 2002:a17:903:3b85:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cf3488b0d2mr126544685ad.13.1784514007385;
        Sun, 19 Jul 2026 19:20:07 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1348sm48167765ad.18.2026.07.19.19.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 19:20:06 -0700 (PDT)
Message-ID: <7d76cc32-5022-48c1-b33d-f16521ab5b7a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:20:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] wifi: ath11k/ath12k: release QMI handles on late
 init failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        Ganesh Sesetti <gseset@codeaurora.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260718074026.3085688-1-lgs201920130244@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260718074026.3085688-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAyMiBTYWx0ZWRfX3zzALd0F8pRO
 7wUmUIS7qPu3FMMwJ+0rQfx5MYeRJxJPZ9HJI9NHoIWN2tFoRZp2efgPCbnQt+DoVv5/dDmSh6u
 INoe0ZLNyTVWbYZoCU+9JqnaQYKBlc8=
X-Proofpoint-GUID: v41BDHnW7BtmlD_C0yOLuWV5OqpS5uMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAyMiBTYWx0ZWRfX/xYT/FKaPYZI
 hFybj7eBAZXvHibLG8FRgzT/hHb3CDC6NvbhTM8dZFNSN1wRwJR8DJDFqFbcmvVWvj+3ATjQW4y
 eBFspV0UaaHT9cah5pswORZSfmvFifbACbPw5ppSpTi7KMwVZ/xn/nx01F83jDUzLsWJPoCKul6
 JXr8tZxganwltEJUDt1j04/n8ttSGC4x2KE4piZAnDlPdzcyd3a6IBKMExkLhj6KPNqRgx3SGUQ
 PYML++tY+kG2SAi0KweIDSaOgMBJb63E/WSuR0PKlQgpu1Zy6Ekb+x8uIoxwHTU6jCfm9ZDOnT8
 BdNY4FKD81u75RIyGRLPJSvFEuaa7Ft3LOWP4BlNFcP1OmqJToRoTpzSY7alhvG5yr3KGsu54XV
 VEQaoYqubYfqWj8LDD//mLhvEy+7Ts0XNX2DXEqqjq8u0a0ns2BlG3EwhGz7Vlsp1sw7lzcqqc5
 /fpXHWJbICJLzkV8vTw==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5d85d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9O-bytELmrVEQ99AJk0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: v41BDHnW7BtmlD_C0yOLuWV5OqpS5uMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_192010_606239_A4EEA285 
X-CRM114-Status: GOOD (  12.63  )
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



On 7/18/2026 3:40 PM, Guangshuo Li wrote:
> This series fixes QMI handle leaks in the late initialization failure
> paths of ath11k and ath12k.
> 
> Both drivers initialize the QMI handle before allocating the QMI event
> workqueue and registering the service lookup. If either of these later
> steps fails, the initialized QMI handle is not released.
> 
> Patch 1 fixes the leak in ath11k.
> 
> Patch 2 fixes the leak in ath12k and sets ab->qmi.ab only after QMI
> service initialization completes successfully.
> 
> v3:
>   - Split the ath11k and ath12k changes into separate patches, as
>     requested by Jeff Johnson.
> 
> v2:
>   - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
>     as suggested by Baochen Qiang.
>   - Fix the same late initialization QMI handle leak in ath11k, as
>     suggested by Vasanthakumar Thiagarajan.
>   - Drop the Reviewed-by tag due to the code changes.
> 
> Guangshuo Li (2):
>   wifi: ath11k: release QMI handle on late init failures
>   wifi: ath12k: release QMI handle on late init failures
> 
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
>  drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
>  2 files changed, 18 insertions(+), 5 deletions(-)
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


