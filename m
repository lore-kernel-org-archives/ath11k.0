Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85455C48BC3
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66a1SkriqYZwFi+KxueabQNi4cABZqW0pWRLSi43YVE=; b=a+qDuQf2r+lcmGHRdOJcbkMAFP
	ue6gZif26lUgMV/ih4BP6OKFK1iQbA/Y5fKOEhHqYsh3KZ0ipSHAvAU9qmJ86xWNfR/JAlTMvqsiF
	JyMgJmaocDMtnEVKYJmG31nXOLudEGFp1cyxvZcERNyWzWaRYyVMSu42thRzB9wL/hm02eaPpiJin
	Pz1oWg/Vfr1Us+2CcYgRJyYtwUJJArZLJg0oUsM13sfLBOmQz6aM7J7067blTXt+K85lu6WM4rC2j
	E/kutWU5f2Kj2ewveAvnPpWRHGXUDPvG3emR/I/25cFpwHDbEq/p8Ak0Uf5s5nr5c02xCsDsN3hVz
	H/OcrdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcleh-00000000pev-1WuN;
	Wed, 21 Feb 2024 12:24:55 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcled-00000000pda-39Mc
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 12:24:53 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso3747204a12.3
        for <ath11k@lists.infradead.org>; Wed, 21 Feb 2024 04:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708518290; x=1709123090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66a1SkriqYZwFi+KxueabQNi4cABZqW0pWRLSi43YVE=;
        b=F+LiDJ76dN5LtYPsGM5DRzwl9/C0vfynHStQnDGM7aJGCJbVBBacNspRZoqYPq4S6u
         vX+CUzzbmS7s21hOPnN4A4GtAjq+IosezbwmNwtrCK6RTGBPxDK6qVD5CSIK7ifo+zCt
         fdXD2YtBnfsdlIrlYsnMB03ZWGYP3GjYbITAA83nO37xWoXUmepCU4obghYt8CxVKSHw
         N0jwIMPNCIkVgfjAS5hIS/gOc94Ihwp6QGpSyDtIznnS0ORe+m3ZugnLNkFmkmPk3XIs
         DhkoOy7zZUDheKIlB054uOjQWhu4c00SkoMeUCoV23PYMG1U1/J5Opu+cw6jtk5IDRTU
         M6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708518290; x=1709123090;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66a1SkriqYZwFi+KxueabQNi4cABZqW0pWRLSi43YVE=;
        b=jy8EFs8gDpFmdp+PqbUCFhFfZI/goLK/KQmmWG000CLP8helXCO5dnadOG4OuGM/gi
         BbF0OAkRG+YPpO+s6LIYYT1bunfmZSLq+xplEqqDJIZ4TcusUdxRavkbUbZO77kvB3OK
         +oPRn2tSrppuBGm+WDjYy/w6qGBVRM/U9y5czP05NtiJBCXu1Jbc1YZnIf/BFT+HW//O
         U9FfOc5r6Yf7SGjWlQ5lGE/S+ngaUQdbVww9cnBEueqtsbb/bg0/PF9OnAbhXjADtDw9
         r6STPA5bvLlQ917a3ewcXxGT43dbOXi88uH9W7hl2coL7vw+HbAMuUz+llQ8OfO1twQe
         bgVA==
X-Forwarded-Encrypted: i=1; AJvYcCU8aPc+WLei7hOuI+z/mkECypuOU5hmn4W4+g7snYcMpgIPP9rlJ5n48RRL/hQA1KPzZ3MMa/pIG3NdT3nB91U7EqivwWmfB/auWg==
X-Gm-Message-State: AOJu0YxA60PCHLAgxYU5l2Gh1drIAUJl4CWG1/RL7JF7YljjQz6mzdA8
	7mf/emtMJ9HXu0vrnBrl614AK7cLhprZTHf5KCBuC67Bsb08ZspRVkcJTS7o
X-Google-Smtp-Source: AGHT+IHsgSyPRttNapmppYGXK+6DSIPGbvQQeZ1yGtvCffImSGXYgZvo/wz8HielDR5at32g8xM2+Q==
X-Received: by 2002:a17:90b:1c0b:b0:29a:36f0:7d7e with SMTP id oc11-20020a17090b1c0b00b0029a36f07d7emr27134pjb.38.1708518289806;
        Wed, 21 Feb 2024 04:24:49 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id ch19-20020a17090af41300b0029996fd70e2sm6749962pjb.45.2024.02.21.04.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 04:24:49 -0800 (PST)
Message-ID: <eaeb8e9b-3809-4f89-a5b2-7949aa01fbde@gmail.com>
Date: Wed, 21 Feb 2024 04:24:46 -0800
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
 <ed8eeb92-e1eb-445e-989d-2340c26faf44@quicinc.com>
 <7a62031b-ad1f-4da2-8217-19a5d7fdc0f4@gmail.com>
 <f363f179-b41f-4bea-882f-e4aacb8ad519@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <f363f179-b41f-4bea-882f-e4aacb8ad519@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_042451_846562_431BC564 
X-CRM114-Status: GOOD (  27.44  )
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


On 2/20/24 7:45 PM, Baochen Qiang wrote:
>
>
> On 1/31/2024 8:28 PM, James Prestwood wrote:
>> Hi Baochen,
>>
>>>> As you may have guessed I don't _really_ know what I'm doing. When 
>>>> I got this working with ath10k I saw monitor device was being used 
>>>> in order to receive probes, and did the same for multicast action 
>>>> frames and it "just worked". The frames themselves were still being 
>>>> received on the station device. I attempted to mimic the changes 
>>>> with ath11k.
>>>>
>>>> The end goal here is just that, be able to receive multicast action 
>>>> frames on the station device which currently does not work. I'm 
>>>> only seeing unicast frames when i enable RX debugging. The driver 
>>>> support for multicast action RX in the kernel for this is basically 
>>>> zero. An extended feature flag was added by Jouni when he added 
>>>> support to ath9k, I added limited ath10k support for a variant I 
>>>> tested, and I'd like to do the same for ath11k as we are 
>>>> transitioning to the WCN6855.
>>> OK, so you are testing this with latest ath.git, without any private 
>>> changes, and it doesn't work, right? Could you share your test 
>>> steps? Basically how are you sending multicast action frames from 
>>> AP/peer, and how to check if that frame received or not (I am 
>>> assuming by checking RX logs)?
>>
>> Yep I'm on the latest ath.git, and with no changes apart from that 
>> MSI vector hack to get it working with vfio-pci.
>>
>> The way I'm testing this is using IWD with DPP PKEX. Building IWD 
>> should be relatively straight forward, very few dependencies. This 
>> will also include iwctl which is IWD's command line utility:
>>
>> https://git.kernel.org/pub/scm/network/wireless/iwd.git/
>>
>> I have two devices, the configurator device (device A, ath11k) is 
>> what should be able to receive the multicast action frames. The 
>> enrollee device (device B) can use probably any hardware as sending 
>> multicast action frames should be supported. IWD will not start a DPP 
>> PKEX configurator without EXT_FEATURE_MULTICAST_REGISTRATIONS set but 
>> if you enable RX logging that should be good enough to see if the 
>> frame is making it to the ath11k driver itself. Once multicast RX is 
>> supported we would need to add that extended feature to ath11k, or at 
>> least the tested variant. If you want, you can hack in that feature 
>> bit and start a configurator but if your able to get the muticast RX 
>> working I can probably take it from there:
>>
>> 1. Enable RX logging on device A
>>
>> 2. Start IWD on device A
>>
>>      iwd -d
>>
>> 3. Connect to a network on device A
>>
>>      iwctl station <wlan> connect <ssid>
>>
>>      <enter passphrase>
>>
>> # Optional: start a configurator. This won't work without the ext 
>> feature set
>>
>>     iwctl pkex <wlan> configure secret123
>>
>> 4. Start IWD on device B, do not connect.
>>
>>      iwd -d
>>
>> 5. Start DPP PKEX as an enrollee on device B:
>>
>>      iwctl pkex <wlan> enroll secret123
>>
>> On device B you should see IWD first scan to establish nearby 
>> APs/frequencies, then begin iterating those frequencies and sending a 
>> multicast action frame.
> Hi James, I reproduced this issue following your guide. From the 
> advise of firmware team, a new flag is needed. With that flag, I did 
> see the multicast action frame in device A logging. Before I proceed, 
> want to clarify something: that frame is only seen after device A 
> triggers a scan (I triggered it manually using iw, not IWD itself 
> because IWD not working on device A due to unknown errors), if no scan 
> no frame seen. I am not sure if this behavior is expected so now 
> checking with internal team on it.
>
> So there comes a question: will IWD triggers scan on device A in order 
> to receive that frame?

That's great its possible! And thank you for looking into this.

That seems very odd that device A would need to scan in order to receive 
a multicast frame. In all reality neither device should have to scan at 
all, device B just does in order to know what frequencies to start 
sending the multicast frames on. Even this isn't entirely needed if the 
frequency was known ahead of time. I think something is not right if a 
scan must be issued in order to receive these frames. This wasn't 
required by ath10k when I added it, nor is it by mac80211_hwsim; you can 
just start listening and receive the frames.

Thanks,

James

>
>>
>> Thanks,
>>
>> James
>>
>>>
>>>>
>>>> And help is much appreciated, and I'm happy to put in the work its 
>>>> just a steep learning curve coupled with the fact that any FW level 
>>>> communication is proprietary. I really just need a nudge in the 
>>>> right direction.
>>>>
>>>> Thanks,
>>>>
>>>> James
>>>>
>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> James
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> James
>>>>>>>
>>>>>>>
>>>>>

