Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E8FCFD315
	for <ath11k@archiver.kernel.org>; Tue, 25 Nov 2025 07:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkIjKxwbsVJk6t/Dmt3+QSVkHkWAqBjVCeXDIT0n3BE=; b=uWmauO2gtkf2OFxRJWNL6UbwtB
	0daDTcPNgZgZX1i1TGBg42+9oM+mRebzALDZnrgVm+bT6yJcYOGnu/sRVSUfXVF6IkR+TF+g9d445
	1LvlPFtyJujVONnfuc7OH1F61ApJL4cr9DAN+KWal8DmEST+VsC641M1VLEqr/6eaUvooqIlCdVuP
	fe+gJW8AIbCMqhgnzTDHm1PZCdyWrvsvezKiBUiJ2vtDxIxCJ5xy6463Qwt+Ku/sGjvsPre5zraEI
	OHBo2RvEq40L49evn3mRH2NTqkJbE2HJQQDLJjJWORH3VmIK62rQp8MaQ0zireOOfV+YUh4HY1bAC
	i0ZCz1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnQS-0000000CtHf-0Yfa;
	Tue, 25 Nov 2025 07:25:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnQO-0000000CtHF-3Vmp
	for ath11k@lists.infradead.org;
	Tue, 25 Nov 2025 07:25:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2guaA2149383
	for <ath11k@lists.infradead.org>; Tue, 25 Nov 2025 07:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkIjKxwbsVJk6t/Dmt3+QSVkHkWAqBjVCeXDIT0n3BE=; b=BnnV+Nvt41vYDB4i
	bIQVSVYpkcJWV8F20JVi80MW/68sr5z2iCM/PE8M8s+pmlLaHnecXjODusJhIv8K
	qGmhVZyT8rRTyrd/aqAZpEHKqwR2CcE8UUvHD+zb/sNKVVMdewyGm15XLwNMmabh
	0fAmsLeo6Vl6r7QJ08vE3l7aoMSlIKHJ2wQLGJTvantpo0qC/fe/tJKvlHBv1c7H
	2yXlRrqDGi8aN0DNdlAGH+sX7MSnf7mljKJ+2T5lSwxJ+3kW5xnIFsvqV9y0jDIp
	pZ2LyGnTT+0KQQnWn6yExCmnlRe7ylxmJBYtk9r4caTWOOahg297gehlsdL03+ZZ
	PvdBXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8sas4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 25 Nov 2025 07:25:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297fbfb4e53so80932555ad.1
        for <ath11k@lists.infradead.org>; Mon, 24 Nov 2025 23:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764055518; x=1764660318; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EkIjKxwbsVJk6t/Dmt3+QSVkHkWAqBjVCeXDIT0n3BE=;
        b=YueTLPhhHGDwlGue9tNBXnK8ZHmxDc7WxMnc4S/ceeG/QOyQIjW+KZrJo/NecPQpfi
         Bo6Az7XP0NFDXlkyAoB9AOJEmVNMYX/Ixk/3WlppwziaazU2c4qnoo/DGIYJFgAAICAq
         CO6cDMBj6WxsG4a1vfxGUAb8b29mWZ/8Q9egZZ3y8rEp+zROilEFCdo7j8ZPKGcJIrb5
         86Xg9UAzMnqnMQwcyR7i3b3l5Ka5MWvuYG0fcXaoZrevnlKfj8UGoxsjBfIEHpeQRDhe
         t4rb85E4l/SYRX1Nt+0lkD9Hr/7y6MDS9cpa9ab/xW5p1+++dRqqQK4gONnuxK6aFIHn
         xc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764055518; x=1764660318;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkIjKxwbsVJk6t/Dmt3+QSVkHkWAqBjVCeXDIT0n3BE=;
        b=rNhNPkLYjJea+Q9RA87qc9u8q1nYjLNXK0eEqwcTUGTHfs+RlQj3Lesr5QEXRNHmAK
         BhIB60TWEVKXsXTFRC0y7dYKWAp5jTFQ03NFP4/PiS2uzotbbfMhYrSQyKo4tHABzFmE
         r8NccBUgiD5uO/fPmOm4ey6+bVxsk0fptIskoJyS3NAEl4HkB3/QapZ3/o/IL1r/7B2a
         s84l9hsetG1OqwWM+DjE6kE/zps6I8wZh9X/YmDBtHgChF5ExlEuCJuf4llRRPPynF3E
         Y40Qsc1i/t+oHtdwAetj/YacBTlyfQFmmlP9KSfp1eSg7nfcDcjOmG/kBtzxuEy5XJye
         qfyw==
X-Forwarded-Encrypted: i=1; AJvYcCXZhsoTmDdcWeJloQBv9s5Yhk1lHy90smCQ4QggSxSj2T74nL4xkKWf1bQKbwID3MegMk05Eig=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxUJTXDDgbZ9+VJSBzHWoyqcPejGJsBW+G0tLtgZrozYOzRt6P
	hFgzlmeM/zJ9S/WCaFbt0Uc0OlpRv7IAMeJ88EInPiwPBL8C9WCv3HTep3T8Hj1sIpaduqJ4IxW
	atMipe5mKxuUD5SpfD8bS9NWa3XO+GgwwF3k4yEzQTIw3U7KRzo9QsAt1X0OmjPRCIZ3KVIhC
X-Gm-Gg: ASbGnctxXeSG/NlnZaqfgHoJ/Qy81l9VAeZROtsCBI3F5C+ZQKNLcc1St51CEeHI2MX
	Keip/Y5Rr6Zjq/IXPpCOR3TM3Ep2HIivRz2/U+PqPXWKAazJdacfP+l6kh9MOvGCW+Z9y4qvxr7
	zh4xqq2hQ66TUOBRM57JrpCsACBIPT9W1LwliJ2N7hhXkrMDUS4k4j6n+ZJCeCsKUAqwCdF2MIx
	Ddf/KWAiXSVSV3mTVmU61PJWlHNYHXu+Nh1DPsWrz93ptUyuvZQQkW5i1cPGaH0H1Is7Eo1nePc
	FxkAVVi2BGVYwX7/L+yTwxR5rLAQhPAaS2TtdqTTWcIIs+NrcucpOhLTECoQC5hanDc+vRG69MD
	KseiUDGzhRnJn2WzxstaXbRL6cXgKeYpQ+8aixRgYyrYEp3o7lx+07DuSL7V+pcqjZlnF0JlRS9
	o1WzYWqIs=
X-Received: by 2002:a17:903:3845:b0:295:6a69:4ad5 with SMTP id d9443c01a7336-29bab1dc6camr21453725ad.56.1764055518273;
        Mon, 24 Nov 2025 23:25:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYKBdW0BRo1oZmJRQAGHiDy9+aQcDP1TIzmEFOLv755ABGBGKcFzUGz7W6kZdsHG9paxyp/w==
X-Received: by 2002:a17:903:3845:b0:295:6a69:4ad5 with SMTP id d9443c01a7336-29bab1dc6camr21453365ad.56.1764055517825;
        Mon, 24 Nov 2025 23:25:17 -0800 (PST)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25df75sm158788545ad.65.2025.11.24.23.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 23:25:17 -0800 (PST)
Message-ID: <277cfe97-3024-4e65-8766-7b96646c5120@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 15:25:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
To: Takashi Iwai <tiwai@suse.de>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20251124134713.5819-1-tiwai@suse.de>
 <2faa8f4e-cb30-4e91-87d2-853c90458b01@oss.qualcomm.com>
 <87ecpmppkt.wl-tiwai@suse.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87ecpmppkt.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pmWKUeFU0yZfa82YsA_0REPlCRzfJMRy
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=692559df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8
 a=hraEoygzTrBnBSVDgbQA:9 a=QEXdDO2ut3YA:10 a=QxBQvo9kKf0A:10
 a=324X-CrmTo6CU4MGRt3R:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2MCBTYWx0ZWRfX481Hzqg0in4Y
 Hiokc2OQhKB7hs04ILpwFdSQ829Qd4TVAyA9FRvD7QrdenD2hLdXDfwcf9bHPXOUybW05tI64+3
 ixWG4Dc+Mr5iqMShmKDuxHOjEJQXfIYuWvypI/QZEcFMYI3Oancu/kAg2kKne4x7DT4yWn5dmTi
 8m70iu99UUR5X0uoZdVBCfCKVwbf1x9fceSc6lBOlhzV0F0FSWsDhMtBH6g57vFNqEyxGSW54Hg
 ZYgO52VnqWxpt39sxmLf6F5tu78dDyNPw0Xww6wWl6ffAJL+MEvjJJFn7GaDqVy/18PxiVJk6vb
 js8os4FDmIaU20QJqIJmBXAw6xtRMWpn53mJBvU9UcYCCC0wXVGy+H+smn6GIwaxpZImBQVD15I
 /FTXXVwMQWRygHal8TA4S6c5pinCtA==
X-Proofpoint-GUID: pmWKUeFU0yZfa82YsA_0REPlCRzfJMRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_232521_027689_30B12EBF 
X-CRM114-Status: GOOD (  29.38  )
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



On 11/25/2025 2:57 PM, Takashi Iwai wrote:
> On Tue, 25 Nov 2025 03:28:22 +0100,
> Baochen Qiang wrote:
>>
>>
>>
>> On 11/24/2025 9:47 PM, Takashi Iwai wrote:
>>> The recent kernels showed a regression wrt suspend/resume on Lenovo
>>> Thinkpad T14s Gen 3 AMD model; it fails to reconnect on resume after a
>>> long time sleep.  The only workaround was to unload/reload the driver
>>
>> how long? and with a short suspend you don't see the issue?
> 
> I can't say exactly, but usually after some hours.  I see it happening
> when the machine is resumed in the morning after an overnight sleep.
> Short suspends can resume mostly, as far as I tested.
> 
>>> (or reboot).
>>>
>>> It seems that this model also requires the similar quirk with
>>> ATH11K_PM_WOW which has been done for other Thinkpad models.
>>
>> the quirk is to workaround the unexpected wakeup issue, which seems not the same with
>> yours. Hence not sure if this is the right fix.
> 
> Yes, I wonder that, too.  The whole suspend/resume procedure look
> fairly different with PM WoW quirk, so some of them might matter.
> 
>>> Link: https://bugzilla.suse.com/show_bug.cgi?id=1254181
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>> ---
>>>
>>> I'm not sure whether this model has another DMI entry, so put Mark to
>>> Cc.
>>>
>>> Also, I wonder which Thinkpad models are rather the ones that should
>>> *not* take the quirk.  Since mine is Gen 3 and I already see Gen 2
>>> entries, which else remaining...?
>>>
>>>
>>>  drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>> index 812686173ac8..3aa78a39394b 100644
>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>> @@ -924,6 +924,13 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>>>  			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
>>>  		},
>>>  	},
>>> +	{
>>> +		.driver_data = (void *)ATH11K_PM_WOW,
>>> +		.matches = { /* T14s G3 AMD */
>>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "21CR"),
>>> +		},
>>> +	},
>>
>> so with the change, the issue is not seen after a __long__ suspend?
> 
> Right, the connection gets resumed properly.
> 
>>>  	{
>>>  		.driver_data = (void *)ATH11K_PM_WOW,
>>>  		.matches = { /* T14 G4 AMD #1 */
>>
>> Hmm, I am feeling that we need to dig more to root cause this issue. Can you please help
>> to collect verbose wpa_supplicant/iwd log and kernel log?
>>
>> wpa_supplicant:
>> 	cd /lib/systemd/system
>> 	diff --git a/wpa_supplicant.service b/wpa_supplicant.service
>> 	index d5c7ef8..69693d0 100644
>> 	--- a/wpa_supplicant.service
>> 	+++ b/wpa_supplicant.service
>> 	@@ -5,7 +5,8 @@ Before=network.target
>> 	 [Service]
>> 	 Type=dbus
>> 	 BusName=fi.epitest.hostap.WPASupplicant
>> 	-ExecStart=/sbin/wpa_supplicant -u -s -O /run/wpa_supplicant
>> 	+ExecStart=/sbin/wpa_supplicant -u -s -t -f/var/log/wpa_supplicant.log -dd -O
>> /run/wpa_supplicant
>>
>>
>> IWD:
>> simply add '-d' option when starting it. You may directly add it to the systemd service
>> entry if you like. See
>>
>> https://archive.kernel.org/oldwiki/iwd.wiki.kernel.org/debugging.html
> 
> OK, I'll try to get the log (in tomorrow morning :)
> 
> Meanwhile, the PM WoW quirk looks fine for this Thinkpad model, I see
> no other regression with the quirk.  As a stop gap, would it be
> acceptable?  If yes, I'll resubmit with the entry of another Gen 3
> model Mark suggested.

I would suggest you waiting before we root cause, or at least before logs are collected
and investigated. Then let's see what we do next.

> 
> 
> thanks,
> 
> Takashi

