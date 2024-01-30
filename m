Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68F8C46CD2
	for <ath11k@archiver.kernel.org>; Tue, 30 Jan 2024 12:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh58aEZnPawRcyoxyEguPHXoy0YC/i0Ha+qWlZElNoo=; b=XrIrwO8SYaY6AYUZJiOjqwRlWy
	QI5XTOEgUde7KAqGbFWwfO23gvfUoSu3jhdhU3ApRS2ikjl4sEiR3mfe9sRx0/K4PBvoqU+Kx+cm/
	WoN9IfjTOO1Yb4OhCcmZ1YLh3BREJi0OieXysWerj88/0mf+46W+yinDSRatYWTAu3fniZeS+ZTew
	jkOz+AWlzJbGVVTy/7ZcvlI/NjMbEcPkzWYxwAvp6wE0kin2qkxF4LWq5zsctKC3TZnoBv2R2G3uA
	KAzPfBPaCJvFkzYsSWYTIkSu9vNRFDb59LHqn3DjyrWMoLZtJDxlv6tTGQmcbu0prDl7QPf+uUFpZ
	iCqLC7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnct-0000000GklK-1OnX;
	Tue, 30 Jan 2024 12:54:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUncp-0000000Gkiu-0LSe
	for ath11k@lists.infradead.org;
	Tue, 30 Jan 2024 12:54:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ddc1b30458so3417078b3a.1
        for <ath11k@lists.infradead.org>; Tue, 30 Jan 2024 04:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706619241; x=1707224041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yh58aEZnPawRcyoxyEguPHXoy0YC/i0Ha+qWlZElNoo=;
        b=OZl8NgHZtQU3VajW5sxw3c6wVN5E0OpRYES4P0BT5t5So6UO4XGFYo8wzVSydFdxf7
         FmmATdHw1UA6LgvJXosJdv664BBXK1X9E+iQdiPHWAPBJbH0joD70GVm/CAOxpfO7L5K
         B4Htp7nOws7QqaAWST9L4rXadHCJXcvOjJLdvt5eNpunDlhWlXd+H0jqP+HWvN8dSntK
         2x7iLtyoCisjkPhxjfDtF5TSvfEDO5VSDPXuAgHsioDeHjzaejMTgQ/77lBsOZD2qUn0
         2EPRvywSj3b2zOz/Y2lhX7K4jxfHHsUaMzYExRavZfNvDUH1JswBInuKUhn1X+jmgUhT
         xvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706619241; x=1707224041;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh58aEZnPawRcyoxyEguPHXoy0YC/i0Ha+qWlZElNoo=;
        b=F1norhCKF06Aj7UwLmCSpCf0WyXNykOA3JB4ejliJ1wfBZKMEOqBmOC7RlGYahKrP4
         AklBVvb6JosoSlk5mfh8L/dUpiEOItJy/ZDBskxe/9UnNEGUeXfJNBQ/68hh4kZxSBHp
         /14o0HnVpYQMwdgEZPymv43sL6KllpbzbfmuQ38B2uO3m7ZhkLWh3Tour7S56E2+dtdD
         vwJ9p0OoywPEbhvalqMz4wpYNxdhgF8UgbCm0vAqJB6RSj/Y4epDxD3mN8PRt4hK6Lue
         /XHijwSdsMZXFSfSEtYG/itU4o4eAYgteFBA4wSo9e2OR7aJYTBHHi7S+KhnoNvs1z7b
         884A==
X-Gm-Message-State: AOJu0YzUcHGnIqE5xxS7nF6qhqVxpamQrMKt/JkFXs+71Se3DWQ85yKf
	cSoJoFzuGBSM2XpQcvm0EpukEoVS8vkDYoso8W5HeH6jEj4uFMf4
X-Google-Smtp-Source: AGHT+IEFSj5u1r11az+V40GDMyfeJ0AEUzOlxOvLSkE25B5G/x9DQhlbQkodRnRzeWSxj9zh91PG7Q==
X-Received: by 2002:a05:6a21:196:b0:19c:6ce1:d62b with SMTP id le22-20020a056a21019600b0019c6ce1d62bmr8362842pzb.9.1706619241410;
        Tue, 30 Jan 2024 04:54:01 -0800 (PST)
Received: from [192.168.254.83] ([50.39.172.77])
        by smtp.gmail.com with ESMTPSA id e12-20020aa78c4c000000b006dde0df3a7esm7717067pfd.101.2024.01.30.04.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 04:54:00 -0800 (PST)
Message-ID: <0a2ab448-3205-4ee0-8fdd-428eb2f2ed56@gmail.com>
Date: Tue, 30 Jan 2024 04:54:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k multicast action frame RX
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org
References: <dcdbd757-ad6e-4fe0-a0c1-fe328431b73b@locusrobotics.com>
 <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
 <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
 <1dafe0e5-292b-4764-86c7-cc1757aeb3b6@gmail.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <1dafe0e5-292b-4764-86c7-cc1757aeb3b6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_045403_208802_B39F07E3 
X-CRM114-Status: GOOD (  28.25  )
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


On 1/30/24 4:47 AM, James Prestwood wrote:
> Hi Baochen,
>
> On 1/29/24 11:00 PM, Baochen Qiang wrote:
>>
>>
>> On 1/27/2024 3:18 AM, James Prestwood wrote:
>>> On 1/24/24 5:06 AM, James Prestwood wrote:
>>>
>>>> Hi,
>>>>
>>>> I recently added support to ath10k, for the QCA6174, to receive 
>>>> multicast action frames in order to support DPP. I'm trying to do 
>>>> this for the ath11k QCNFA765/WCN6855. I took the same approach as 
>>>> ath10k which was actually quite simple but I'm unable to see any 
>>>> multicast frames coming over even when I enable RX/DATA debugging.
>>>>
>>>> What I've done so far is:
>>>>
>>>>  - Add FIF_MCAST_ACTION to the supported filters list
>>>>
>>>>  - Created/started a monitor vdev from within 
>>>> ath11k_mac_op_configure_filter()
>>>>
>>>>     ath11k_mac_monitor_vdev_create(ar);
>>>>
>>>>     ath11k_mac_monitor_start(ar);
>>>>
>>>> - Also tried adding
>>>>
>>>>     ath11k_mac_config_mon_status_default(ar, true);
>>>>
>>>> I can successfully create/start the monitor vdev. I see now as I'm 
>>>> writing this email that my specific hardware does not support 
>>>> monitor mode outright... Is this a dead end or is there hope with 
>>>> purely driver changes? or is it some filtering at the firmware 
>>>> level preventing this?
>>>
>>> I was able to finally see my broadcast frame after some additional 
>>> testing. It seems the driver/firmware/something gets a bit hung up 
>>> when I attempt to put it in monitor mode. It will start printing 
>>> these messages for about a minute:
>>>
>>> [   51.093034] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id 
>>> a1a2 != status ppdu_id a1a1 dest_mon_not_reaped = 650 dest_mon_stuck 
>>> = 12
>>> [   51.094461] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id 
>>> a1a3 != status ppdu_id a1a2 dest_mon_not_reaped = 651 dest_mon_stuck 
>>> = 12
>>> [   51.096281] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id 
>>> a1a5 != status ppdu_id a1a3 dest_mon_not_reaped = 652 dest_mon_stuck 
>>> = 12
>>>
>>> In most cases these ppdu ID's are a one-off from the expected ID 
>>> which seemed weird to me. But if I let it sit long enough I all of a 
>>> sudden get a ton of "data rx" messages, which is what I would expect 
>>> if I enabled a monitor vdev. Once this flurry starts I see the 
>>> action frame from my other client, sometimes at least. The firmware 
>>> generally crashes after a while so I've still got a ways to go but 
>>> it seems within the realm of possibility that this device could 
>>> receive broadcast action frames?
>>>
>>> Hoping for some breadcrumbs to follow here...
>>>
>> Hi James, as you already mentioned, ath11k/WCN6855 doesn't support 
>> monitor mode yet. I don't know why you are testing multicast action 
>> frame with monitor mode. So if monitor mode is not a must, could you 
>> test this with STATION mode? We would look into this if any issue found.
>
> As you may have guessed I don't _really_ know what I'm doing. When I 
> got this working with ath10k I saw monitor device was being used in 
> order to receive probes, and did the same for multicast action frames 
> and it "just worked". The frames themselves were still being received 
> on the station device. I attempted to mimic the changes with ath11k.
>
> The end goal here is just that, be able to receive multicast action 
> frames on the station device which currently does not work. I'm only 
> seeing unicast frames when i enable RX debugging. The driver support 
> for multicast action RX in the kernel for this is basically zero. An 
> extended feature flag was added by Jouni when he added support to 
> ath9k, I added limited ath10k support for a variant I tested, and I'd 
> like to do the same for ath11k as we are transitioning to the WCN6855.
>
> And help is much appreciated, and I'm happy to put in the work its 
> just a steep learning curve coupled with the fact that any FW level 
> communication is proprietary. I really just need a nudge in the right 
> direction.

Meant to mention, I swapped out my email to prestwoj@gmail.com, with 
multiple emails accounts sometimes my corporate account sneaks in. Sorry 
for the confusion.

>
> Thanks,
>
> James
>
>>
>>> Thanks,
>>>
>>> James
>>>
>>>>
>>>> Thanks,
>>>>
>>>> James
>>>>
>>>>
>>

