Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6922EF531F3
	for <ath11k@archiver.kernel.org>; Tue, 14 Apr 2026 06:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooS24x9VLICMx3FC4zHZJS9uTNKsD8j0SzaYRsjwM84=; b=1VhDbE15WkUhuxUvZ6ArzeLxbr
	33bQOtLMtfXo9B2rnyRngmOvmlD2kmQ0rqB0zfxXfehclILScLTAt7yQQTbRquSJxIvld1+Td+A68
	jJT6YL3PPYC0rp8EbLOElaZhzL4dYo7Uat1MdyoIhDrgyr2S9izMi7ASNVbVt1EmbBM4o+Rcv075h
	FSYkN0XJxrcTn8oIsc8jAL10f3Fsm8q4bPgIcDlTxUBxBpQcu77ZklhWy/8bDP/XXZiICyLXY1F3n
	0uAyttWUZ4ilGkLAOWF4Y4kgGW6dBPQF86roFhMJ9M8Nv0A+Hv4vJwRlD0wpK15l/RD9m+opdwHrt
	S7BeLS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXUZ-0000000GrBk-3f7W;
	Tue, 14 Apr 2026 06:43:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXUX-0000000GrBO-12mw
	for ath11k@lists.infradead.org;
	Tue, 14 Apr 2026 06:43:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6U9FW395277
	for <ath11k@lists.infradead.org>; Tue, 14 Apr 2026 06:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooS24x9VLICMx3FC4zHZJS9uTNKsD8j0SzaYRsjwM84=; b=mpVvfKuhiMoV1xr+
	gyS2yoqIG5S8QlXYoSHSQPuKMSieUydQ3HMx6rZe3j86+4wxHNKjK7MYGkr2VuKg
	JImjLBEVO2vdJP3WlvOhp+QLQcJmegAyBasWFUsCnoupY/xSBr6YSGnRKba9QwSM
	AMra+lGsYunteNB3/SeN+g9PseX2u79cV1ZcXq79zLfTbBrQL3it6rKqbTwUzPUD
	nC71v7qzg1rBg9B+ZxOK9vqFRTQ1m+VDQXHXt/T2NMq3mzLkkDLkWAxTkEEg97wG
	eHi41YrOcBZBj6ZDXX52fwwFUhfihnO7XHl7gcRrl7kUuW6B6Vj3qTBqLOHI51wG
	ULqnSg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870sdrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 14 Apr 2026 06:43:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so2631498a12.0
        for <ath11k@lists.infradead.org>; Mon, 13 Apr 2026 23:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148998; x=1776753798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ooS24x9VLICMx3FC4zHZJS9uTNKsD8j0SzaYRsjwM84=;
        b=GGN6YVuS9P8CNHG1ypSxCL1rgwMoebBPBEfPGFWlshDfVzAyMPyV6s7gs378jPQutR
         /MJGD3/7gVjCpqEnYFAYvsxkq0MKqJqOKYvnOAhgzrq+apjzDGEBoIhOaz2mLnQVxUOD
         Rtq4wCPr3BmYPIwNS4ib84p6cgcFWhuoiv9zkbAYNyYhxuEjXPhbtu3O0oRNUpXrYUrg
         QouT4IRaN/JzsRHvH+HFq79I4wMaPYTxmeROclkIFGqGNz9qaAIDOd58wLhfgiEqsirn
         cZevA2Ys/JiIOVQVZmrMH+WA0jhY4acxm5uQiBncows4WHVDt2MQTz4T7pjEohwxZP9c
         S2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148998; x=1776753798;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooS24x9VLICMx3FC4zHZJS9uTNKsD8j0SzaYRsjwM84=;
        b=JAcmv6FruFChXgVEIaok7QNepEGCBa4bSZiqXhGx4rwDCsF6e5exmu1EfAWmh6XCwo
         NWv1ryM8hYY1z9KBPgNa4uXiGJUc9NZOk1H3OF9Cf2zbeFMCmZT7Z4JRKJBkuMUBdzHj
         f6BBuHoAQErO+33AEhJnUbbAmaDOORVI4p1QExj1FLjvURautYJP1K311kc2HEg8s5g/
         f+80XajA6JdpYY71TTx1rX4IKohPNUs3TITyghBGjEggk9LzPyp5RMJ1bt7NyLfR7LXd
         Ra4zGDyRuxBjqYYgeEaK36c3jjK3NB7QbxFu8btLlX9XycZHwCST960HV7pFghxkaviP
         eJrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nBgBlfMncx2moXNQqPC8b59Akf33BaNhhBC4rzsf9ICV/m0qEb4FIwl87BOaafWi+5gRx2ac=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJ1MJFQ1h/p3nuEL8a25Qjs0EPyip2saVi5QYqQuEApZsinOx
	1w14IxT4ODVnXZ+KSJV3fFiP7tdCbXHM+hu0DXpFhU5McWM5nkX4c8oHZDnRtjHLTfc1y3DsFOn
	nCRvRko/a/I7ZlI9zPR7YwGOhxjLIIMRvc4UyNHk17knxBvBvdiR7LCDFXrmnvOsY
X-Gm-Gg: AeBDietregLm43WLL4TFY/BqOTQ+MmlxHmjFvpdteWC66vZv73idcD7lRPv9LbP7yCk
	01OGiX4DLD1TCennFq8ElCuuWn48/dduPvUUnrtYgmp6zTpggC/Vr4uLhojBCufbMWJ9CCY/oLP
	Ny/TW1rr2K/tNEuPzh131vUJMw0HN75Xpgpg6TGLVlhIEIDDWgq7xEOfA1/wsAH6jJbEMXsmIpo
	OdoV455wTo5bbHcQK//dlvIcMIEsXcf+abfgWUe7YqOif/w6WQQkAn0Fc93hpQCZwduQPHrgnTi
	jrM3MEImbGW6foX6cgrI8Me67EvlCSbV2lr4+R88zlPLw5nEDlOODSR48zloaw8my1/7D8oByhv
	8hOWhzqwW//oL/iD0Khr8E2eKv8OMD563LqjrRjItfeFRBlmUs6JK2UeOidWjDb/I4TlWox85we
	FmG7s/E1X8VNejdxCAjEW/73A6UqvycA==
X-Received: by 2002:a05:6a21:328e:b0:39b:897c:6f84 with SMTP id adf61e73a8af0-39fe440ebb3mr15043048637.2.1776148998325;
        Mon, 13 Apr 2026 23:43:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:328e:b0:39b:897c:6f84 with SMTP id adf61e73a8af0-39fe440ebb3mr15043028637.2.1776148997793;
        Mon, 13 Apr 2026 23:43:17 -0700 (PDT)
Received: from [10.133.33.118] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a1d0d2sm10359483a12.27.2026.04.13.23.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 23:43:17 -0700 (PDT)
Message-ID: <ba4d194b-6d31-4d8a-a6a6-da116f9f56ac@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 14:43:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: apply existing PM quirk to ThinkPad P14s
 Gen 5 AMD
To: Kyle Farnung <kfarnung@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com>
 <082b3d13-6fb1-4041-a187-fddec3b013e4@oss.qualcomm.com>
 <CAOPSVF0VHR4BQsmfWFeFnANsQYBw-x7fHxH2JFNO=oWjgeS66Q@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAOPSVF0VHR4BQsmfWFeFnANsQYBw-x7fHxH2JFNO=oWjgeS66Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pCNIjBB4JKCJuEXA0tXxcnBYO7Bc5YGM
X-Proofpoint-GUID: pCNIjBB4JKCJuEXA0tXxcnBYO7Bc5YGM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MSBTYWx0ZWRfX60chYGBXeXUU
 VlLdJxvoOSnJFX4xkoY28VJ0YW+LEWtNR/LGPMZqfa8eHCrXO0nnBuMhAmikTVCrSWm2Npc+Ps7
 hjb2yQcoyGhe4WIwuvAoAH5l4ayg9+vX3i6q7+5UsLb77KvPlVxQonuNrASRyrWga/ZeLSdFmYp
 TRtPvEuE3PZVTbZNaea2h8KwTYhyxBDFwON1aWRuMsG9hR+Y+VS9wPpfBsAoZ04eDqcNiQii3Es
 uXq6qF3D0xZ82cmSkDwrF7K/0qIq42ExozeGXU5vmvUUFI9TzBg2kQlR0u7I1lKQIcvIdYkf3pk
 OYod6AI/wguko+wCHZhhQxP52rHTCyEuq2mABy6EUbiq1EiGEYBcgZi/lksVaIqTs9XzJ+fX4GF
 extrx2JpPPyt9x0smrnuzZe/GrHMUnmFRQS2h1iJl9T3GrJB9kQlTLOZ9mXKaB5Qat3Qo5VYSz7
 X0IhcGsG5Y0lSTY0aYg==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69dde207 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=8k6WQxmsAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=4Wa1Ze30II_mXCYJOSIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_234321_444852_A913CA06 
X-CRM114-Status: GOOD (  27.03  )
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



On 4/1/2026 11:48 AM, Kyle Farnung wrote:
> On Tue, Mar 31, 2026 at 7:08 PM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 3/31/2026 2:32 PM, Kyle Farnung via B4 Relay wrote:
>>> From: Kyle Farnung <kfarnung@gmail.com>
>>>
>>> Some ThinkPad P14s Gen 5 AMD systems experience suspend/resume
>>> reliability issues similar to those reported in [1]. These platforms
>>
>> how similar it is? can you describe the issue in details?
> 
> The issue is that intermittently after suspend my WiFi adapter connects
> successfully for a few minutes and then drops. It will then keep trying to
> reconnect in a loop but never succeed. A reboot will fix it, but eventually
> I found that reloading the module also resolves the issue
> (modprobe -r ath11k_pci && modprobe ath11k_pci). Based on some searching, I
> did try adding "ath11k_pci.disable_idle_ps=1" to my kernel arguments. At
> first it looked like maybe it worked, but then I hit the same problem
> again. At that point I decided to try building a custom module with the
> ATH11K_PM_WOW override and so far I'm two days and 10 suspends in without
> issue.
> 
> Looking through kernel logs, the issue appears to have started with kernel
> version 6.17.4. It looks like my Fedora install jumped from 6.16.10 to
> 6.17.4 on October 22, 2025 and I started seeing the issue two days later.
> 
> Here are the logs from the most recent occurrence (filtered for brevity):
> 
> Mar 29 15:26:24 kjfp14sg5 kernel: PM: suspend exit
> Mar 29 15:26:24 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: chip_id
> 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> Mar 29 15:26:24 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: fw_version
> 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-REGDOM-CHANGE init=DRIVER type=COUNTRY alpha2=US
> Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-REGDOM-CHANGE init=DRIVER type=COUNTRY alpha2=US
> Mar 29 15:26:30 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-REGDOM-CHANGE init=DRIVER type=COUNTRY alpha2=US
> Mar 29 15:26:35 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-CONNECTED - Connection to 68:d7:9a:2a:94:f8 completed [id=0
> id_str=]
> Mar 29 15:26:49 kjfp14sg5 wpa_supplicant[2373]: wlp2s0: CTRL-EVENT-BEACON-LOSS

this is the reason to your disconnection

> Mar 29 15:26:55 kjfp14sg5 kernel: ath11k_pci 0000:02:00.0: failed to
> flush transmit queue, data pkts pending 9
> Mar 29 15:26:55 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-DISCONNECTED bssid=68:d7:9a:2a:94:f8 reason=4
> locally_generated=1
> Mar 29 15:27:00 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-DISCONNECTED bssid=80:2a:a8:98:26:3e reason=6
> Mar 29 15:27:05 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-DISCONNECTED bssid=74:ac:b9:df:54:36 reason=6
> Mar 29 15:27:09 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-DISCONNECTED bssid=68:d7:9a:2a:94:f8 reason=2
> Mar 29 15:27:09 kjfp14sg5 wpa_supplicant[2373]: wlp2s0:
> CTRL-EVENT-SSID-TEMP-DISABLED id=0 ssid="Batman" auth_failures=1
> duration=10 reason=CONN_FAILED

and the bssid is disabled so association to this AP won't happen in a period.

Anyway, although it works, using the PM quirk seems not the right fix. As you mentioned it
seems like a regression starting to show in 6.17.4, can you do regression test to locate
the issue commit?

> 
>>
>>> were not previously included in the ath11k PM quirk table.
>>>
>>> Add DMI matches for product IDs 21ME and 21MF to apply the existing
>>> ATH11K_PM_WOW override, improving suspend/resume behavior on these
>>> systems.
>>>
>>> Tested on a ThinkPad P14s Gen 5 AMD (21ME) running 6.19.9.
>>>
>>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
>>> [2] https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-p-series-laptops/thinkpad-p14s-gen-5-type-21me-21mf/
>>>
>>> Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Kyle Farnung <kfarnung@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Fix missing mailing list recipients (linux-wireless, ath11k, linux-kernel)
>>> - Link to v1: https://lore.kernel.org/r/20260330-p14s-pm-quirk-v1-1-cf2fa39cc2d5@gmail.com
>>> ---
>>>  drivers/net/wireless/ath/ath11k/core.c | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>> index 3f6f4db5b7ee1aba79fd7526e5d59d068e0f4a2e..21d366224e75904feeae6cb9c93d9ef692d127fe 100644
>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>> @@ -1041,6 +1041,20 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>>>                       DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
>>>               },
>>>       },
>>> +     {
>>> +             .driver_data = (void *)ATH11K_PM_WOW,
>>> +             .matches = { /* P14s G5 AMD #1 */
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
>>> +             },
>>> +     },
>>> +     {
>>> +             .driver_data = (void *)ATH11K_PM_WOW,
>>> +             .matches = { /* P14s G5 AMD #2 */
>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
>>> +             },
>>> +     },
>>>       {}
>>>  };
>>>
>>>
>>> ---
>>> base-commit: dbd94b9831bc52a1efb7ff3de841ffc3457428ce
>>> change-id: 20260330-p14s-pm-quirk-0a51ba19235f
>>>
>>> Best regards,
>>


