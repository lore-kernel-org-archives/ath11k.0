Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE6BCA0EEB
	for <ath11k@archiver.kernel.org>; Thu, 21 Aug 2025 05:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vAQUJRzmvhCQC0jxSCWFX17btFNmXhfAUKzWHJ2kkU=; b=TviJ6W6JSo1nTuTgYWFinh2R3y
	CSn1rXBrte75RnXCTrLbcxj6SM9cpNqRWS7lr8uYKfNx+/4MDpfjBjhAY1/xtgyEUF7afmuYEcapv
	e3KDRXq8jA1We+0MbKupTmhngrthOX8ggwfDMMv4a0a+/1/VBX7NXnxfqHugxhf3VAkdA43ZWKiNr
	t3evv/iDJ1Gww1J7Az1Euh/8bqwOQGWLFBaZreq8mLgyAoRoSIpg1HEDJpOiVmFrAFFjuJXdy/V5+
	1R9pNLarPyxJzBhsEIDwvbnd27l5vjIaVmu8u3URl2LojzkDb37O3eNP91pQQlvXJ1pni4bwTRZ7K
	3d/96O/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyHB-0000000FuTe-0HCD;
	Thu, 21 Aug 2025 05:55:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyH8-0000000FuTF-1qp8
	for ath11k@lists.infradead.org;
	Thu, 21 Aug 2025 05:55:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KIxQCi025245
	for <ath11k@lists.infradead.org>; Thu, 21 Aug 2025 05:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vAQUJRzmvhCQC0jxSCWFX17btFNmXhfAUKzWHJ2kkU=; b=PYd2mfqV0VMmDHkk
	Ytuzn6AvvZQTy6B/O0sXilu63/vHWZ2nRHlC1iMN8uz1EvCcAsNeJHrCQFwm3leY
	gDry8eZRskRF3obqeuOylDoG9XGVfpj0xdWjMqPyS+ReHsyAdVJnyJysiXuF0XrT
	3Y2Utbd9vDU1GLv/c8uhzfLXcOL35ZXTbr5PEZsKGWEqSFWBlZLn8pF4zRqMNpCD
	8HyFYpb9kyLafuCSOgF3kIz9O87Whv8dXgjoLCJ5V5346AIAGvj4CQOL73st1/YE
	yII6LzTLPVj03Hwmbkqn6uUYC91vvFsUzZvv/ZQx3keX1rEgvhotXj9KvIoW7ect
	xQ0K5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52945mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 21 Aug 2025 05:55:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806dc88so16752595ad.1
        for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 22:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755755749; x=1756360549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vAQUJRzmvhCQC0jxSCWFX17btFNmXhfAUKzWHJ2kkU=;
        b=e57ZsMRY7VTW+vqebsXMBSURgYhtwL71YdG8kRxZB445lpS9y2BVWQk0VBa5jVIH9M
         pLSsi1VytsiJHboBTXcoi7v4ksX06KGI5LTdqDbYGEVTdKsDAm2H4F+Q1+xmAnUbnNAQ
         DQXAhOX3jtGujZojWQrzOFR2o2SBTOij3/oPBfIC3Ra69mebkixRivsV/wGvDtNcSjPY
         9TmQIKvgrYy4F4xLwdkEhR1fwDzcHnz0BSQFhf2IQ+p1Zk+ohLDB2MdYy0wtxTNN2+H+
         gB8nPqviDPZKtz/LhyrpEt2qa65O04DHGFHC3tUemZZl7AbVH11rL3r1oHH6gVStg/Se
         IuoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC1ASausa1FYoV8zPdGDJXerwyUbA4dpcbD8lwIXgqZLQvXe7yK/P9VGZM4EzVKOpqpn7t2Es=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJQBld216Qw0M0+jI65enkocrJYv2BnZ7t7QVQTw75Pq2mjiR0
	X/M9BgUBLIG+ZYsA25nv1Ei/T89oocoKbYvEbABcUsvqYNfSDrzy6F8RM/6YufsUTZ6jXQKkGnN
	USXaglnZ58/6NSY/xG7BodZN5HPn5NO4+TuT7gAVKVquwcjt428nsQCWBSW4JDdbH
X-Gm-Gg: ASbGncv8UkEkg9amaJ19uX2d7F6SQN8pXiAvT3x86Gz/0z5Dof+mJL7a8evPPEZUhk3
	C7YjHSF8mcwqXrVE/ooI/pJxs6ZhOrYL0hwDNbsnrVZn4+oRrGyZlPP7MEd8NhrdgkXuFePI8u4
	93WRb1ASPK7PqR/Us672KRWbC/kh/rVdPfkLYWKV1S2q81svSL0sb6AvdRpC9Rd3J3FvMWj56bR
	yffzGpjSYZaZgvdV9sNYTq5mb9NrnPddQxTrHpiHKZ7+uQDuRFT7SO96tyxfpBc8AbJSMKy0gYk
	Kz2fUSEF8G+LB8lqHXsgRqjDMszs9XPt8AS6B8F0uD/jvh7v7DbRubztXUbMagVXLfKSZMdjwpA
	dyf7jMh5fgR0=
X-Received: by 2002:a17:903:1786:b0:242:e38c:89db with SMTP id d9443c01a7336-245fed7e64emr15945025ad.35.1755755748898;
        Wed, 20 Aug 2025 22:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdHZMqwJ6N5/TcADw+wqbTRuW4Egpz+Ak9mM6X1MOB+PLpuwRJZ9j1D324y0FeF/bKUoWuTQ==
X-Received: by 2002:a17:903:1786:b0:242:e38c:89db with SMTP id d9443c01a7336-245fed7e64emr15944835ad.35.1755755748478;
        Wed, 20 Aug 2025 22:55:48 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.248.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24608c9daafsm6158455ad.141.2025.08.20.22.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 22:55:48 -0700 (PDT)
Message-ID: <86ddae9a-4931-b160-51a2-f89d45d4038d@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:25:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath11k: switch to of_get_mac_address
Content-Language: en-US
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250821032755.636661-1-rosenp@gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250821032755.636661-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a6b4e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pagehsHO18wfKU6DcLw+7w==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=xJH9kgDew1csY8MGnM4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: TurwVCbVobyuMM0m0tNl9v7Xi8CxhN7l
X-Proofpoint-GUID: TurwVCbVobyuMM0m0tNl9v7Xi8CxhN7l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5nVWY69Q2FR5
 2Mez3NlgxcLCvT42qvtDDRbZna+R670GXczGYULWe4934XNeTnS116gaBz3LXMW0mXfS3EYI9CY
 qePp0GebaklVRo58JKOj51kaixNDixhqOM4+Rcj8zzDbAAnOPJduNe/u5ZFXLYEr8mY9DHJn33g
 ZjYLLEOj4fH8uDxuA8JVpzaj3v0Xwj/uXjJ+z95i3pShBr59GhFSemPCdWHDgmXWbIPBHkA261H
 KNqBoTBLftZNIZ7PoL2LOb2Jsl4Iz+zFm1Z0gahov+1V/yyMsWIKs2fq1FGRgmXzZKSn3tk15q8
 mMPjNkkZZfETc6DfP7u9rstDH1sfPZXT9SS7rR8bK5fUsboD6pQzLbQan0J7ec3f0xUBiMrK01z
 INUrRA8cnDSzAKrSIaV8JzidrMdb2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_225550_496569_E8452469 
X-CRM114-Status: GOOD (  21.89  )
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



On 8/21/2025 8:57 AM, Rosen Penev wrote:
> This is needed to support nvmem defined MAC addresses in DTS.
> 
> In addition, check if the probe should be deferred as nvmem can load
> after ath11k.
> 
> For brevity, ACPI is not a factor here. ath11k is too new for that.

This may not be accurate, pcie devices are widely used on x86 where
ACPI is not certainly new.

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1fadf5faafb8..801db15ca78b 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9,6 +9,7 @@
>   #include <linux/etherdevice.h>
>   #include <linux/bitfield.h>
>   #include <linux/inetdevice.h>
> +#include <linux/of_net.h>
>   #include <net/if_inet6.h>
>   #include <net/ipv6.h>
>   
> @@ -10434,7 +10435,9 @@ int ath11k_mac_register(struct ath11k_base *ab)
>   	if (ret)
>   		return ret;
>   
> -	device_get_mac_address(ab->dev, mac_addr);
> +	ret = of_get_mac_address(ab->dev->of_node, mac_addr);

I still think it is better to keep the generic API and add the the one specific
to nvmem when the generic one fails.

> +	if (ret == -EPROBE_DEFER)
> +		return ret;

Please note that this error does not impact the device probe as this is
being done in the event path after probe returns withis complete.
Also, this will result in device registration failure even when
the device is not really looking for mac_addr from nvmem (or it is not
there) as firmware can also provide the mac_addr from the hardware.

Vasanth

