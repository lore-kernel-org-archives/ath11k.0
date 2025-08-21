Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343CECA0EFA
	for <ath11k@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G0jmrcoufd+8ZCF18bJzb+Xt0es+kwirLRdoPQfQUk=; b=ZpVuvmz4ruHOnNoYhol47r7pV9
	x8msiXd6Qs7HCw7fRNt+gm5vlDbA/AF4QJ/LH7e/6FJrdvIB9nDCfVFJ5tMmZ86CEBMbOt2Q3eoYX
	8CERuOdBufjef1n7GGODMjb55XSl62RBjguATNE0bIL7tgbz4E7iNlP71+rp8DYBXXjYdFFwD6zgr
	MsI0ulL9GeNUW06fYoWtUoWFmUmBeCCtAfHEDMjtoMHhI5f7NsMYRt4iVcMuoyzVOkDTefK20h6PI
	kiNCGA05hUnZoloAdujdEe1gET14yWvbIymZZ5myvryxwlQN9HrNgno1r6P0AnMU3n2uDGlyZ1CJe
	SxLP23dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1mX-0000000GRTd-2Uot;
	Thu, 21 Aug 2025 09:40:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozyZ-0000000G901-002A
	for ath11k@lists.infradead.org;
	Thu, 21 Aug 2025 07:44:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L4InYp007320
	for <ath11k@lists.infradead.org>; Thu, 21 Aug 2025 07:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2G0jmrcoufd+8ZCF18bJzb+Xt0es+kwirLRdoPQfQUk=; b=i9tek8q5zP7VBerF
	OFJZaZU7TOs8DKlGS4fsHG7Ekm1g+/rqLfpQpRq8HWo+ReDcxCztYHPVZ21fkg3f
	r9rf0X/EpOHLUomn1DeyQZqunbcj5TSupViTh3DAsbYwXcQy746ag07UJ/PKsYzS
	YUKgWso3WMcIRTAjtCMPJFaJeIskwFoW0dyqlduAYI2O+sj3o4zWgxh2K1SI1++F
	cXg7nrVH1Au6n+Js7jWhf3Egb6wtPnZYs8ma+js9P7GTyt6sNqJKRNiwM7HCynPh
	m5BUW6LpG0Ejg0A06sqPTb+j6TDadfS4LjD4H6z9QivXsydAFGp/1f0N/aqTDOfI
	I4xAHw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8a8e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 21 Aug 2025 07:44:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4716fa1e59so614061a12.0
        for <ath11k@lists.infradead.org>; Thu, 21 Aug 2025 00:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755762284; x=1756367084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2G0jmrcoufd+8ZCF18bJzb+Xt0es+kwirLRdoPQfQUk=;
        b=ixLXq/4Zmv4NaAn8B0uhe2PzMmPES+tG5Uathj5NA+SMa/7MYGPNqdUKCoE8zfKRm3
         Y+bYLrA5chWGIV8ve9S7Idb23v5C16WMe6R7h/PCPdfDEGdVsuX4plSjdJJKhGg7CcfQ
         Iyf8CMa9tBfA7HIWWMRqM6yRuVj5c3h4FZIBJQJzSFqNkTBMTpSmRGpSLzPzdm2mF8tl
         TvS+qA1zcAiCKaeBiQXTO+WQ45ltdHYjoFCbETQd7BV2ET3H2NaxR/jr8JzojflhnsrT
         55cxLUpZwNPK5tDmLBVg+p6cE/GDAJo8tUKTvyTGYuhJz9we9HnoO21XXrudJQTFlnBW
         G7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUyaWmukHBAhwXlwF9TtV/ePn6biNWqeYxPvBa0d4QU1hAzVwhJLrHQt1GIbfe1dTze7Jj2irw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIo9NChVk+QqW9FRO2C2DHhSh+n1XkE6GNpbHBeFcbUyKQj20c
	S+DqQGWJHHAAsPkHB6okqff5rb4XQb1jxyuHmBm+qso6jLBu+N5UlNyIvH45xlEjQGpglpSY72q
	6YIDIpjkP//REk5UqCvO4EPzbU5D/i4KOTewEtHt2NI3ExxWLyTZAnVTf/2U/YM6T
X-Gm-Gg: ASbGncue9afjNx3cJgi96OT0mCw+HH8QoKme6eXU8T+gogVfYbeWKE6F1Bceu+35ZKu
	ThZWGZ6sgY2qreHW8YOyWUOnI0Bny7pG4a1LBM6Q7DWQN/H5j0LvTIgNLMvLWPX6UTpXzfyM6JT
	aDkOcXDpTgB+o16Xt3eQmow2se+mUOVMSepL36SLP6SaOX+hPiD8VQpttCDRGx97EexUgeiPxbS
	5bT/uaG2dku1Axv6TUZCA+F3P/mth/eRHLJ6q7fmmlM9i/CSF5daUoF2RCwnSckhyluojjA4yol
	Sg8OuRvYHthWB4QQ9lePsC1IQZHsIpukBg7dmrntNdtUFlqo6Q9wf0uN4k3Qr0MCAKFR5IQdyxl
	VG92jh3ToYew=
X-Received: by 2002:a05:6a20:158a:b0:240:1f14:f6c5 with SMTP id adf61e73a8af0-24330ac3fd6mr1959899637.32.1755762284555;
        Thu, 21 Aug 2025 00:44:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCYXhKxcZWmfeFwKM6Wq6qQQK5DHE77TncdGGZ0vJrDqJkBWEHm7E/yR2GbbuMTQR8tAX6DA==
X-Received: by 2002:a05:6a20:158a:b0:240:1f14:f6c5 with SMTP id adf61e73a8af0-24330ac3fd6mr1959866637.32.1755762284068;
        Thu, 21 Aug 2025 00:44:44 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.248.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d1a44sm7470773b3a.1.2025.08.21.00.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 00:44:43 -0700 (PDT)
Message-ID: <b711072b-11fa-ea33-3a47-d16ad5a9cc62@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 13:14:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath11k: switch to of_get_mac_address
Content-Language: en-US
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250821032755.636661-1-rosenp@gmail.com>
 <86ddae9a-4931-b160-51a2-f89d45d4038d@oss.qualcomm.com>
 <CAKxU2N-0Q2uxw=-v-XP8g=Y=yBb2ufv+T0yk7dmaszwUy8Z6tg@mail.gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <CAKxU2N-0Q2uxw=-v-XP8g=Y=yBb2ufv+T0yk7dmaszwUy8Z6tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX3n8lmujzquFU
 aEJWlDqWu1wE85BLgcSoyiOnHfYncjjO+0sw37YafGMvLUC1DfEYwWk74P4fcrM3DFwU638mU9T
 6i/PTQk2NXX2jJDeY2Taro95zMqjSB3xQLODzCdH0CSeBbAtzYZOqI5/HOGm1YOaOkCE4DsuXvB
 X1386f3pVOwYIvR1HJKBpNYT3uVrJbWIh2yu2iV1lBjJFCYLQiLw1EbA+SD1NdhUFUh3J51LN1U
 wWjfeCsj2T6+mEOUImizMUcjIlQXBcsNmuz1x+dD2yXF9K2eN1wC2xWNDoEmEleNAQ/1fP0pGy3
 N0/FCjp7MYm6sGBo1fS3Yj0b9s+syfYDo/cOQS9WiXZhObnEi1SVY5QRHGfB+yd0+CF1EOqwEVm
 ZQpj/bT/sUnOsK/gL83gRRO+OKv1gg==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a6ce6d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=pagehsHO18wfKU6DcLw+7w==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=CpWlhAl6zUZw53vu2Z0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: -MzHE_omOiIwVyQECCACUj-VpjRTSWsE
X-Proofpoint-ORIG-GUID: -MzHE_omOiIwVyQECCACUj-VpjRTSWsE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_004447_156207_430CEF3E 
X-CRM114-Status: GOOD (  23.67  )
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



On 8/21/2025 12:21 PM, Rosen Penev wrote:
> On Wed, Aug 20, 2025 at 10:55 PM Vasanthakumar Thiagarajan
> <vasanthakumar.thiagarajan@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 8/21/2025 8:57 AM, Rosen Penev wrote:
>>> This is needed to support nvmem defined MAC addresses in DTS.
>>>
>>> In addition, check if the probe should be deferred as nvmem can load
>>> after ath11k.
>>>
>>> For brevity, ACPI is not a factor here. ath11k is too new for that.
>>
>> This may not be accurate, pcie devices are widely used on x86 where
>> ACPI is not certainly new.
> No way ACPI is used to define MAC addresses.
>>
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>>    drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>>> index 1fadf5faafb8..801db15ca78b 100644
>>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>>> @@ -9,6 +9,7 @@
>>>    #include <linux/etherdevice.h>
>>>    #include <linux/bitfield.h>
>>>    #include <linux/inetdevice.h>
>>> +#include <linux/of_net.h>
>>>    #include <net/if_inet6.h>
>>>    #include <net/ipv6.h>
>>>
>>> @@ -10434,7 +10435,9 @@ int ath11k_mac_register(struct ath11k_base *ab)
>>>        if (ret)
>>>                return ret;
>>>
>>> -     device_get_mac_address(ab->dev, mac_addr);
>>> +     ret = of_get_mac_address(ab->dev->of_node, mac_addr);
>>
>> I still think it is better to keep the generic API and add the the one specific
>> to nvmem when the generic one fails.
> I don't. ath10k and ath11k are the only modern drivers using
> device_get_mac_address
>>
>>> +     if (ret == -EPROBE_DEFER)
>>> +             return ret;
>>
>> Please note that this error does not impact the device probe as this is
>> being done in the event path after probe returns withis complete.
>> Also, this will result in device registration failure even when
>> the device is not really looking for mac_addr from nvmem (or it is not
>> there) as firmware can also provide the mac_addr from the hardware.
> 
> Does probe not handle EPROBE_DEFER?

right

