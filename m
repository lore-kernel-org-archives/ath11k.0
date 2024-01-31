Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B84C47DB3
	for <ath11k@archiver.kernel.org>; Wed, 31 Jan 2024 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6fPFLRogoez4lUvnD9zuYyX17OKr+lSjtZ0hdtK4gQ=; b=zjC8Gq/+hm93KjON2v0Ebkze1d
	lOB1mqJ0hvKz7/r94zsuJkUt/lJU+eoFopfiGj2T/mEF750PQw1/r/gqaI2KIVz7LppC3xW7nu5mG
	hqLjKF7HFoawum4Ji2hBIbtG7DJX4fb/1JWQCjgbzFPgBfYLP9AolyeUZhFBZptI1keWKyKdIsfNb
	nhklVRCXfjdxB/6Rcwva9AcN+LtJDcaz0koZ9Wn90ssJGxbqxJ/LCJP76xu9ItgyFn8rvhClE5Vwi
	Uh0CKoo0ruEABL1ccuzljJJbJNJ9vlsz0RP//SptsD2G3ix4Ub9RrB7wCCWiWqRsyTyCBT+LhpG4f
	zYqM+sQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9hr-00000003LW7-3YJS;
	Wed, 31 Jan 2024 12:28:43 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9ho-00000003LUq-2II0
	for ath11k@lists.infradead.org;
	Wed, 31 Jan 2024 12:28:42 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dbed0710c74so5023630276.1
        for <ath11k@lists.infradead.org>; Wed, 31 Jan 2024 04:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706704118; x=1707308918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6fPFLRogoez4lUvnD9zuYyX17OKr+lSjtZ0hdtK4gQ=;
        b=Mbo12JrB7y12o13qTwK/U9VjMVYgLSob1zMGcz+cIJwC9OqXeldnEuIJnWoenaHdAL
         XFn+LhxCtel6HV2/V9PgoBBzFfRHGcCu9du3dQ7iAe2Oj64pVD8Jw41A3XnvlwNd686p
         gb//fFHhRcBCxFhLCGT0jDYjDlZ5fJmkjif84ZXAGmNBN1csF9sSEborpQ+CPzM8s6H/
         SSMOEX9R4721OuWMM+t8eKr9p20gfe+t0lbNqdroZ7hdxw6brgmcbqOHq6obh46hDUTH
         Ci637ljwBn1VNjPikT0ldMtZ8ZMdDLwU9Bpe6Lrlz8nSWGB5wwyiFvctiHOmuKUxWmT3
         hGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704118; x=1707308918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6fPFLRogoez4lUvnD9zuYyX17OKr+lSjtZ0hdtK4gQ=;
        b=TEEQaOiloQFRAhksHaDhhTBdseDJkxFr79chV5RndSR/iHJhp0VczHdTRRGDAmBHoo
         09GHQtYTwCRdJbkZmT+KsNfJftTKE9SdPOdWB5JDh8C7oBgkLfrgAb+ASQMXmKYcYJtS
         PsX5Q6WjrMdcwEQRRoTzcjSfq7gp0uCeQa9KQeYfgh/jmjNcesL4Mo+10+NW1/dw8IAc
         /fKkBw5x+5CwzxoK3Y7pT8XDtD5EbH+SeKcNhM2yaQNGPKGwr9CPe7PesHtk3dQDx/qC
         qvYfL4x8afExcIE6bVXZTjq4WQYG6o0rh07ca9UCGvilYG62WWE6YZkwmDNIiOPENcHJ
         nqvw==
X-Gm-Message-State: AOJu0YzAv9G1gJFC00AidJY3r9udoiJJBSE3zX9Ofkl3cIdzpvucVai7
	Zu0G2ha2EopfA2DaWOFVEBbcrd4UgXHiU9bvm8jUhqu5PNYS2NZG
X-Google-Smtp-Source: AGHT+IG7C0vBUbXvYLfEOWifYXv1EhJbV02s1Ag/e3h63zpdMxv7FSpFj3fUmVbcLnDtjJYV8b1i5g==
X-Received: by 2002:a25:9c48:0:b0:dc6:9b89:3f75 with SMTP id x8-20020a259c48000000b00dc69b893f75mr1370030ybo.40.1706704118086;
        Wed, 31 Jan 2024 04:28:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXqgUX7oFOcIwd8hNTNZTtRcGQz7UBLezi+WmUKI+vVCa/geaxtOLyaUe1GIvhIoNn+xG0MPpudz0yq1trvE67Sb5KrO7SRgWC2NOn7nsWbatmIvUmzVGzO0PSxm6KNTxyt85jjpNSKV5tr
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id i18-20020a0cfcd2000000b0068c471ad935sm3662820qvq.70.2024.01.31.04.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 04:28:37 -0800 (PST)
Message-ID: <7a62031b-ad1f-4da2-8217-19a5d7fdc0f4@gmail.com>
Date: Wed, 31 Jan 2024 04:28:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k multicast action frame RX
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org
References: <dcdbd757-ad6e-4fe0-a0c1-fe328431b73b@locusrobotics.com>
 <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
 <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
 <1dafe0e5-292b-4764-86c7-cc1757aeb3b6@gmail.com>
 <ed8eeb92-e1eb-445e-989d-2340c26faf44@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <ed8eeb92-e1eb-445e-989d-2340c26faf44@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_042840_611675_D9EAA39B 
X-CRM114-Status: GOOD (  19.50  )
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

Hi Baochen,

>> As you may have guessed I don't _really_ know what I'm doing. When I 
>> got this working with ath10k I saw monitor device was being used in 
>> order to receive probes, and did the same for multicast action frames 
>> and it "just worked". The frames themselves were still being received 
>> on the station device. I attempted to mimic the changes with ath11k.
>>
>> The end goal here is just that, be able to receive multicast action 
>> frames on the station device which currently does not work. I'm only 
>> seeing unicast frames when i enable RX debugging. The driver support 
>> for multicast action RX in the kernel for this is basically zero. An 
>> extended feature flag was added by Jouni when he added support to 
>> ath9k, I added limited ath10k support for a variant I tested, and I'd 
>> like to do the same for ath11k as we are transitioning to the WCN6855.
> OK, so you are testing this with latest ath.git, without any private 
> changes, and it doesn't work, right? Could you share your test steps? 
> Basically how are you sending multicast action frames from AP/peer, 
> and how to check if that frame received or not (I am assuming by 
> checking RX logs)?

Yep I'm on the latest ath.git, and with no changes apart from that MSI 
vector hack to get it working with vfio-pci.

The way I'm testing this is using IWD with DPP PKEX. Building IWD should 
be relatively straight forward, very few dependencies. This will also 
include iwctl which is IWD's command line utility:

https://git.kernel.org/pub/scm/network/wireless/iwd.git/

I have two devices, the configurator device (device A, ath11k) is what 
should be able to receive the multicast action frames. The enrollee 
device (device B) can use probably any hardware as sending multicast 
action frames should be supported. IWD will not start a DPP PKEX 
configurator without EXT_FEATURE_MULTICAST_REGISTRATIONS set but if you 
enable RX logging that should be good enough to see if the frame is 
making it to the ath11k driver itself. Once multicast RX is supported we 
would need to add that extended feature to ath11k, or at least the 
tested variant. If you want, you can hack in that feature bit and start 
a configurator but if your able to get the muticast RX working I can 
probably take it from there:

1. Enable RX logging on device A

2. Start IWD on device A

     iwd -d

3. Connect to a network on device A

     iwctl station <wlan> connect <ssid>

     <enter passphrase>

# Optional: start a configurator. This won't work without the ext 
feature set

    iwctl pkex <wlan> configure secret123

4. Start IWD on device B, do not connect.

     iwd -d

5. Start DPP PKEX as an enrollee on device B:

     iwctl pkex <wlan> enroll secret123

On device B you should see IWD first scan to establish nearby 
APs/frequencies, then begin iterating those frequencies and sending a 
multicast action frame.

Thanks,

James

>
>>
>> And help is much appreciated, and I'm happy to put in the work its 
>> just a steep learning curve coupled with the fact that any FW level 
>> communication is proprietary. I really just need a nudge in the right 
>> direction.
>>
>> Thanks,
>>
>> James
>>
>>>
>>>> Thanks,
>>>>
>>>> James
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> James
>>>>>
>>>>>
>>>

