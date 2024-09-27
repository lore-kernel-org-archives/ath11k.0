Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B63ECEBF9D
	for <ath11k@archiver.kernel.org>; Fri, 27 Sep 2024 11:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWJVUU70D/KDWBudNPb5zBWCBs0ORCb7v+FRCsH7Kig=; b=ilYE8XCOqyg9KeksoZyn9VxEd8
	XU28+hBcxnkQjFhFMFu+IRclMp/tX+Wbu7wnTMxav7S4H5CLY/wuwm08mi35GPjS7pmR81NaLEtJO
	bxdG0Z31YUt2u4E8ZUu/pgb1XOKVI6M7l8uzzmYSaCxQmBw8bODiBw1VDCSlOgi6MqOCz7upfsOyH
	wBMTDbQeCvOx2BtQHE88fsCSZD9Jj1hxOtI096HrJo8ueGPy4P5rXjFzBPWxc8oNnyrVLUmX8i8TL
	+pxXodO7t9+uBgW9gsD77tSE1JQ7wykUrkvBYr4aaDdBglfY6ThvBJUcKozRl2qx1t5OujzBEEtBy
	PQxgOTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su9Yf-0000000AzCH-2CIC;
	Fri, 27 Sep 2024 11:54:49 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su9Xi-0000000Az7W-386a
	for ath11k@lists.infradead.org;
	Fri, 27 Sep 2024 11:53:52 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7a9ac0092d9so198502085a.1
        for <ath11k@lists.infradead.org>; Fri, 27 Sep 2024 04:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727438029; x=1728042829; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWJVUU70D/KDWBudNPb5zBWCBs0ORCb7v+FRCsH7Kig=;
        b=OgqWj7YNk10PXIrINrPiEgfZEnNRggTd3EDWMNH3AeFW8RhavYK3T/KoKdV9A0LjMM
         6gR/CWVJtJKmSmUSWVZpNWgpw7woiGY/nxFGP2uY8s6Pdf63lQYBOs8ng1L9JQvc8/1U
         n8iZISlYYd56c5I9/2je5j1So6wKMW4Xntx38NC0i8L9iGfo8ilIAv+x2Erzsf3+fdUp
         m6JaSiNmSNs9Eg6H9agZ1JAg5DAoYdJmKkjhACdNe7RSAjg60XXMylKQQomcdv2O4+S8
         c8RjdRWt9FNx8PYehDmmBuei+Ceu9c6/AEUYt3/eN3qDc9PnEdvy9iqfbDDFBQtKxNzq
         whaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727438029; x=1728042829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWJVUU70D/KDWBudNPb5zBWCBs0ORCb7v+FRCsH7Kig=;
        b=FiHbsMhsKJ6NKUBcd00zpjcEtBnWQl7PUyeESejn+sv9cULe9++qI9jaC4w3V7O2wG
         Mn1Goee3gMv0yuZQG8HZGB8QpQ44JkzkidBDGR/bDoSKqiUZd2MjRtEfxB9LncauUHfJ
         HHCYx/32gNpBsNNr2nEvChivp8Urlw0K1McubBpHhBLxwJ2EoY8XqDJvT2lCxovSV58A
         cva4pwK3hU5NDLSQeWU4o4ikQfMaqnUSuetlT/vQQL4t8d8wj97xQHoaFx6KnVlUPc71
         vlAjnhY+ybUg9fRKxztX+2OY92xVs6bn2gDZyE5jUnrIeULBHYoJ1jYSCqk1FDJ7H2pS
         jZWw==
X-Gm-Message-State: AOJu0Yw1yf9QPSdcJluvx30zY2MgoqpBGcWUPuTYke6DxuOng7jjqRd0
	y0j4nu1ySj/+bXOd4VEvL1NMD+cNsnegPcerVJxZ3aZmo+LOS2T+
X-Google-Smtp-Source: AGHT+IEE7JLeSI3B2+BaNE5hnyXLCVl6rzR29xUe6+pyEEx0p0sATrUexiG3bAAs5Ic/8j1Ajmdhfg==
X-Received: by 2002:a05:620a:4309:b0:7ac:e257:3b44 with SMTP id af79cd13be357-7ae37824064mr562846885a.13.1727438028658;
        Fri, 27 Sep 2024 04:53:48 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377bd791sm77535085a.24.2024.09.27.04.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 04:53:48 -0700 (PDT)
Message-ID: <f65b609c-0813-414b-885d-24257e76e6d0@gmail.com>
Date: Fri, 27 Sep 2024 04:53:46 -0700
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
 <15c909da-f01e-43ee-b486-f9b6d5bcc29c@gmail.com>
 <26302980-4cd8-466a-8de1-4be10a42536a@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <26302980-4cd8-466a-8de1-4be10a42536a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_045350_825294_74947772 
X-CRM114-Status: GOOD (  35.35  )
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


On 9/26/24 10:59 PM, Baochen Qiang wrote:
>
> On 9/26/2024 8:31 PM, James Prestwood wrote:
>> Hi,
>>
>> On 9/25/24 8:16 PM, Baochen Qiang wrote:
>>> On 9/25/2024 7:33 PM, James Prestwood wrote:
>>>> Hi Baochen,
>>>>
>>>> On 9/25/24 3:07 AM, Baochen Qiang wrote:
>>>>> On 9/19/2024 8:21 PM, James Prestwood wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I noticed an issue when we started putting ath11k clients on a WPA3 network which seems to be related to the fact that management frame protection is enabled (works fine on WPA2 no MFP). Immediately after an initial association a neighbor report request goes out and we get no response from the AP. After getting a PCAP in one case we noticed the neighbor report request went out unencrypted, though still had the CCMP IV parameter. The content of the request was the unencrypted request, and something like 15 bytes of 0x00 padding. I will say, this initial PCAP was made through the AP vendor so perhaps it
> how do you tell if the 'neighbor report request' was unencrypted? did you check the 'protected' flag in sniffer?
>
> automatically added the right keys to decrypt the frame, this could be a red herring. I tried on my home network and it was hit or miss, sometimes I would get a response but sometimes I wouldn't, but I did see the frame was always encrypted in my home network case though when adding the PMK directly in wireshark I couldn't decrypt it, where on other hardware like iwlwifi I
> and how do you tell if it is always encrypted?

I think what I saw here was because the capture was done through the AP 
vendor was automatically decrypted or something. The frame was still 
marked as protected, but I never had to add the PMK to get wireshark to 
parse it correctly.

On my home network when I was referring to "always encrypted" it was 
because the frames always had the CCMP IV and the content of the frame 
itself was not visibly a neighbor report/request, just a string of hex 
values. Once I added the PMK and decrypted it wireshark could parse it.

>
>
>>>>>> could.
>>>>> is your home network also WPA3?
>>> any comment on this query?
>> Yes, my home network is WPA3.
>>>>> and how did you get the PMK? is it generated by IWD and printed as debug message?
>>>> I actually had to modify IWD to print out the PMK after it derived it. WPA3 makes this a huge pain since the PMK differs between SAE exchanges.
>>>>
>>>> I've attached an IWD diff that prints out the PMK, which can be added to wireshark if that helps.
>>> Thanks, I found another way to do the decryption.
>> Out of curiosity how did you do this? I couldn't find any other way to decrypt WPA3 connections in wireshark except adding the PMK directly, even when capturing the 4-way handshake.
> I dumped the TK:
>
> 	@@ -2055,6 +2062,8 @@ static void netdev_set_tk(struct handshake_state *hs, uint8_t key_index,
> 	        if (!netdev_copy_tk(tk_buf, tk, cipher, hs->authenticator))
> 	                goto invalid_key;
> 	
> 	+       l_util_hexdump(false, tk_buf, 16, do_debug, "tk: ");
> 	+
> 	        msg = nl80211_build_new_key_pairwise(netdev->index, cipher, addr,
> 	                                        tk_buf, crypto_cipher_key_len(cipher),
>                                          key_index);
>
>>>>>> Some time after the connection neighbor reports work fine. I'm not sure of a time frame or delay required that gets them working, but it makes me suspect that ath11k doesn't have the keys fully added in the firmware before userspace gets signaled as "connected". Running the same scenario on ath10k or iwlwifi has no issues. This neighbor report request immediately after connecting is IWD's default behavior, so its relatively easy to test by just restarting IWD.
>>>>> I captured a WPA3 SAE PCAP too, but only can find some unencrypted ADDBA req/resp frames. for those encrypted action frames I am still struggling to decrypt them
>>> I checked all the action frames after decrypt the PCAP, but still not able to find a 'neighbor report' frame. next will study IWD code to understand how such a frame is triggered.
>>>
>>> and again, if not possible to share the complete PCAP, can you share the individual 'neighbor report request' frame ? you can simply copy it in wireshark.
>> Immediately after connecting you should see one of two possibilities.
>>
>> 1. If IWD did not receive a response you would see:
>>
>> iwd[694]: src/station.c:station_early_neighbor_report_cb() ifindex: 6, error: -110(Connection timed out)
>>
>> 2. If a neighbor report was sent back by the AP you would see:
>>
>> src/station.c:station_early_neighbor_report_cb() ifindex: 13, error: 0()
>> src/station.c:parse_neighbor_report() Neighbor report received for xx:xx:xx:xx:xx:xx ch 44 (oper class 22), MD not set
>>
>> I just re-ran the test and now, for some reason, I am entirely unable to see the actual request go out. In the case of both ath11k and ath10k I see no request and but I do sometimes see a response. For iwlwifi I was able to capture a request/response but for the most part I don't see any request either, but always a response. Maybe the request is going out at some other data rate that my monitor card is unable to capture reliably? Not sure on that one.
>>
>> So as far as seeing a request from ath11k, I'm unable to get one at least on my home network. Getting a capture on the corporate network may take me some more time.
> here is the sequence I saw in sniffer:
> #1 AP send M3
> #2 station send 'neighbor report request' without encryption, though 'protected' flag is set
> #3 station send out M4
>
> is this the same with what you saw?
When I was able to capture the neighbor report request (rarely) it was 
after M4, not before. If you're seeing it prior to M4 that seems 
strange, unless the kernel/ath11k is doing some odd queuing?
>
>> Thanks,
>>
>> James
>>
>>>>>> Since the neighbor reports work fine after some time its not really a critical issue but I wanted to bring it up just in case.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> James
>>>>>>

