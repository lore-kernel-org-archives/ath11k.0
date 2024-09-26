Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC04C369CD
	for <ath11k@archiver.kernel.org>; Thu, 26 Sep 2024 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVVKUnJeefhn3FGdHzSXUGbhKax+mPAJgyRkXPtqOFo=; b=rbpT25rEJ4+eaq8d3Rgey6O8VB
	2BSfQTv5vVxCfWm3AvYdx6nq4TW69P7QbLnpdacbsHg/vp/+CXIas9IZdhsXKeGAloJY9Ecwu76/8
	0K0FYQ3xVjP9CbCOqOU2WVtUYTDs/cChnloAmWakDuxjIs7BoBXnAadLE6n6Oe4nisM5yWMpzBCeQ
	CiMPi90sksmzlztMp48l6EPWIFQkXGVAa0fMC1MuKwyM86vQ6I232dHurqwYZj1/MleQv/r4GwtEj
	/qjAt8wrixZDLwq4wIZRiOxfBUF2AqNszhntvxhs1Y+hcdvxGd/CNsxt6xUIQwQrYlT9TFljfajCL
	XGB1jTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stneS-00000008Li7-3a2q;
	Thu, 26 Sep 2024 12:31:20 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stneQ-00000008LhW-1cVx
	for ath11k@lists.infradead.org;
	Thu, 26 Sep 2024 12:31:19 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-82fa0ccb0cdso39111139f.3
        for <ath11k@lists.infradead.org>; Thu, 26 Sep 2024 05:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727353876; x=1727958676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gVVKUnJeefhn3FGdHzSXUGbhKax+mPAJgyRkXPtqOFo=;
        b=XTd1cUZGK9Qx/zUfJeQG5o+EOZ2jvthVwda24ihPgYOvGm9OAXI5Bgir9xDh9I6oQP
         ZFo9sUn2xHN+UYn4nrRMbJtkvaRka1/k/l3emFMOL6+f8tKIAuEsBo1WMVRuGfXW4UDv
         YfDruwejy9iV8aut9deey/T8VMr+CzOJPjmR5WxonzCuGe+jqCeDWuPcW7rOuFFAB6nb
         ufQBBPVLd6l8XiLI2iim7yhzVvj4UWG0e65aeWv4VuQPBeauaxUZ+tJwTiH0xWhwcer9
         iImsKeZUYuqfP4aTdA8VGHY4BmpzcdHdyY49JF4SyjQq386Dohm8mvtMMSOnBGosdtFm
         i3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727353876; x=1727958676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVVKUnJeefhn3FGdHzSXUGbhKax+mPAJgyRkXPtqOFo=;
        b=J6hwmY5GZQazSCn/ULztx/ctduwGPlivuRwKf3nJ64gOoPMPFeobeiCC37VJjt7szC
         Bx3h0N5SbteRoG1X1MjuFnVAKdhyT7S5wf/UNV6HsfgVYISA1mnkeFi0JwsUsnv9FObM
         wRqXfBm6jH13IqrhcW6w+S+XrxkNUWFQf6UNtxp1HXlcLeQh7D3DaiwSZ5qbxhkh8iSK
         xfh0Pvv4RlX1gyikeJppgavT4U9klPOypKAOmf2CTcAm0zB8uXslyWMFk1nfIKOM5DRx
         dCYKZ+DSe4TLVQF6pSYaUXqNi/g9nRvoMj58Hwh5dyOicK59auvZqnG4bgRAkXTOw5Ok
         UTtA==
X-Gm-Message-State: AOJu0YxNuzhlZ+AMZJ1vb82QpNGpUFRgoQExB9KMlEnelnbhiYJFwAaj
	HVho+yWdetQ7cCqA4LCp8JkFuv7hYwBs3EHKnq/uXdlp9HqXu8zy
X-Google-Smtp-Source: AGHT+IFaQy/8F/cd19b+3+0CPcydcAWuxUdDYOjWOcMnSQ5frKBvR1ug8Z76vUGPZ4D2P/Ij9Kd5jw==
X-Received: by 2002:a05:6602:160d:b0:82a:4490:692a with SMTP id ca18e2360f4ac-83247d2bd4cmr588881839f.7.1727353875710;
        Thu, 26 Sep 2024 05:31:15 -0700 (PDT)
Received: from [10.117.37.22] ([64.125.133.168])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d40f0e93b4sm1676309173.28.2024.09.26.05.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 05:31:14 -0700 (PDT)
Message-ID: <15c909da-f01e-43ee-b486-f9b6d5bcc29c@gmail.com>
Date: Thu, 26 Sep 2024 05:31:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k/WCN6855 neighbor report request made immediately after
 connection gets no response (with MFP)
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
 <fd90d471-503b-4f58-ae11-bae2afab08c7@quicinc.com>
 <0d1dab88-66a0-48c1-bdbe-777d07c3132e@gmail.com>
 <70567137-dfb9-4896-9e6c-6c02a97228cb@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <70567137-dfb9-4896-9e6c-6c02a97228cb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_053118_465787_6032B6F5 
X-CRM114-Status: GOOD (  29.03  )
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

Hi,

On 9/25/24 8:16 PM, Baochen Qiang wrote:
>
> On 9/25/2024 7:33 PM, James Prestwood wrote:
>> Hi Baochen,
>>
>> On 9/25/24 3:07 AM, Baochen Qiang wrote:
>>> On 9/19/2024 8:21 PM, James Prestwood wrote:
>>>> Hi,
>>>>
>>>> I noticed an issue when we started putting ath11k clients on a WPA3 network which seems to be related to the fact that management frame protection is enabled (works fine on WPA2 no MFP). Immediately after an initial association a neighbor report request goes out and we get no response from the AP. After getting a PCAP in one case we noticed the neighbor report request went out unencrypted, though still had the CCMP IV parameter. The content of the request was the unencrypted request, and something like 15 bytes of 0x00 padding. I will say, this initial PCAP was made through the AP vendor so perhaps it automatically added the right keys to decrypt the frame, this could be a red herring. I tried on my home network and it was hit or miss, sometimes I would get a response but sometimes I wouldn't, but I did see the frame was always encrypted in my home network case though when adding the PMK directly in wireshark I couldn't decrypt it, where on other hardware like iwlwifi I
>>>> could.
>>> is your home network also WPA3?
> any comment on this query?
Yes, my home network is WPA3.
>
>>> and how did you get the PMK? is it generated by IWD and printed as debug message?
>> I actually had to modify IWD to print out the PMK after it derived it. WPA3 makes this a huge pain since the PMK differs between SAE exchanges.
>>
>> I've attached an IWD diff that prints out the PMK, which can be added to wireshark if that helps.
> Thanks, I found another way to do the decryption.
Out of curiosity how did you do this? I couldn't find any other way to 
decrypt WPA3 connections in wireshark except adding the PMK directly, 
even when capturing the 4-way handshake.
>
>>>> Some time after the connection neighbor reports work fine. I'm not sure of a time frame or delay required that gets them working, but it makes me suspect that ath11k doesn't have the keys fully added in the firmware before userspace gets signaled as "connected". Running the same scenario on ath10k or iwlwifi has no issues. This neighbor report request immediately after connecting is IWD's default behavior, so its relatively easy to test by just restarting IWD.
>>> I captured a WPA3 SAE PCAP too, but only can find some unencrypted ADDBA req/resp frames. for those encrypted action frames I am still struggling to decrypt them
> I checked all the action frames after decrypt the PCAP, but still not able to find a 'neighbor report' frame. next will study IWD code to understand how such a frame is triggered.
>
> and again, if not possible to share the complete PCAP, can you share the individual 'neighbor report request' frame ? you can simply copy it in wireshark.

Immediately after connecting you should see one of two possibilities.

1. If IWD did not receive a response you would see:

iwd[694]: src/station.c:station_early_neighbor_report_cb() ifindex: 6, 
error: -110(Connection timed out)

2. If a neighbor report was sent back by the AP you would see:

src/station.c:station_early_neighbor_report_cb() ifindex: 13, error: 0()
src/station.c:parse_neighbor_report() Neighbor report received for 
xx:xx:xx:xx:xx:xx ch 44 (oper class 22), MD not set

I just re-ran the test and now, for some reason, I am entirely unable to 
see the actual request go out. In the case of both ath11k and ath10k I 
see no request and but I do sometimes see a response. For iwlwifi I was 
able to capture a request/response but for the most part I don't see any 
request either, but always a response. Maybe the request is going out at 
some other data rate that my monitor card is unable to capture reliably? 
Not sure on that one.

So as far as seeing a request from ath11k, I'm unable to get one at 
least on my home network. Getting a capture on the corporate network may 
take me some more time.

Thanks,

James

>
>>>> Since the neighbor reports work fine after some time its not really a critical issue but I wanted to bring it up just in case.
>>>>
>>>> Thanks,
>>>>
>>>> James
>>>>

