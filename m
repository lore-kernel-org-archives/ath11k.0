Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFFAC4345F
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 20:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kant6ExXxMhn1K+TXO6ZqixqBe/nxHRJd4hsjbsMF8Q=; b=RfTar34OS0Ydooqav7wiZdyHk0
	H/XPbMA9dv++iDzof4yV8u7Pl+cfR+y9L/xKUzThh8sVqM1FP0AxoGyBo1rBmaUdLeluaEgcfsM8D
	1XNzJ7tmDYKp1rECC05e+zsCTJ8nBznOMMPW4FCDwwhG+8MaMze1pHjXuEV85y8SAGeCJL6D3Yfe6
	Xm+hxWYRXuVp7O8T6wYDszaDAaNjNDQcGmMX/xzdAfNR3IqnlXNFzwYh5KHW3JrPR7dn+7gRcisqy
	hl7/vUhRJvBuew8/f8M0xjbEJkjXXdyvvU8s4GmsmP9whOdtGyGX8USnvkxuiHQrBfU32WI6h/XiZ
	c9ZHNmxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv13p-0000000E2ot-0gtz;
	Thu, 11 Apr 2024 20:30:17 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv13l-0000000E2nl-1QIk
	for ath11k@lists.infradead.org;
	Thu, 11 Apr 2024 20:30:15 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ed2dc03df6so249720b3a.1
        for <ath11k@lists.infradead.org>; Thu, 11 Apr 2024 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712867407; x=1713472207; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kant6ExXxMhn1K+TXO6ZqixqBe/nxHRJd4hsjbsMF8Q=;
        b=blMBK1zc8R7z0aQkvRYGEXZT9RfpotOXYtLRtLmEzhlEYUL78GopmrDuflBOeGHWvu
         RyUJT53Azwh5V6DZzaafHOZ3hRzUpL2bEu5JJ6Pq3mhRqDlkxrJch0fPvQLD1pRNhk5v
         ssEgljZ6brp3co3rlfAd5vM4UKR2y6hetjkf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712867407; x=1713472207;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kant6ExXxMhn1K+TXO6ZqixqBe/nxHRJd4hsjbsMF8Q=;
        b=AmMjGbWAxhY82O2qZCnS8ebJVIPBAVlC0bRl9viSoxf1OlrDpUQiMX0DCYA4KO9tW3
         kV2lZwlpMVIhQJb+h8adJDfwCyx0l4YMYf9Pi3E9v91C9nag2vSEMDmiQJowZfkM5YfG
         +IbEaWZCoHgM9HLHF25Bw9iBC/iF5QDaO52wiAAHyrTyUingLCridUEUbpcN6T+rwLGU
         ZyBP7MHJzdyRbsF3qMfyFmL25YZk5yZNSxmdRIxocUBgRD7qI6PcMrzM5ISPgmuHr3s9
         7iBd9rsAEvdvFSsEktiDwQAUSTGPefeAgvo5d36hVlcmsPe7e9/H3H7FYTCvS1L9flS+
         iCHw==
X-Gm-Message-State: AOJu0YxTNbXGHCh29/4He7IVGmKE7Ae196kqm6hj9s+ZYcsex5ER+OBr
	ccsVCVv8QamJOpkUKp7G2rfiyklBkZeI3qC/i5biR+4pStMIkAPjsiDB9rfYew==
X-Google-Smtp-Source: AGHT+IH1rikuhNj0OquZ0S4r6mxoySZdUb7e8LauZUYkkEk1Nvrw/QkINkPPRL6SyC28CWMObjni5A==
X-Received: by 2002:a05:6a21:3993:b0:1a7:a1e6:70cb with SMTP id ad19-20020a056a21399300b001a7a1e670cbmr1324093pzc.8.1712867406535;
        Thu, 11 Apr 2024 13:30:06 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id l16-20020a170902f69000b001e29c4b7bd2sm1571747plg.240.2024.04.11.13.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 13:30:06 -0700 (PDT)
Message-ID: <f7a24b54-9a1f-41f4-8706-d7199a4a84e8@penguintechs.org>
Date: Thu, 11 Apr 2024 13:30:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Wren Turkal <wt@penguintechs.org>
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Cc: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
 <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
 <b592d037-41ed-42e8-8c3c-286eb1a68ceb@penguintechs.org>
 <68a31d6a-8eb8-4d78-819b-fb67367cc41d@penguintechs.org>
 <CABBYNZJQUy37fxWuCXV1OgM+DNnOr7V0h_rkgcSdw-5hF7iauQ@mail.gmail.com>
 <fca46585-c1ed-4a60-91b5-6da39a5bbdec@penguintechs.org>
 <02400664-2d23-42d3-b49b-0c59f606d298@penguintechs.org>
 <8162d6c7-d968-465e-bb8f-3c939eb8d783@penguintechs.org>
Content-Language: en-US
In-Reply-To: <8162d6c7-d968-465e-bb8f-3c939eb8d783@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_133013_688401_4DC45C6E 
X-CRM114-Status: GOOD (  24.07  )
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

On 4/10/24 3:40 PM, Wren Turkal wrote:
> On 4/10/24 3:00 PM, Wren Turkal wrote:
>> +Johan since he's a former BT drivers maintainer.
>>
>> On 4/9/24 1:11 PM, Wren Turkal wrote:
>>> On 4/9/24 1:03 PM, Luiz Augusto von Dentz wrote:
>>>> 5.19 seems a little too old, imo, or has it been broken for that long,
>>>> did you at least tried with bluetooth-next? Try contacting the people
>>>> who actually wrote the driver.
>>>
>>> Sorry, I didn't answer your question. Yes, I do think it's been 
>>> broken for longer than that, but I wanted to confirm.
>>
>> Okay, so I tried 6.9-rc3 and every main release 5.19-6.8.
>>
>> I have found the following:
>>
>> * older kernels (6.3 and before) seem to be far less likely to kill on 
>> a cycling the bluetooth service.
>> * 6.8/6.9-rcs consistently destroy bluetooth when stopping and 
>> restarting the service
>> * If I destroy the bluetooth service with a BT service restart in 
>> 6.9-rc3 and warm reboot into any release back to 5.19, bluetooth does 
>> not work
>> * cold boot works in all cases assuming I give the laptop about 5s 
>> between power off/on
> 
> I just did another experiment on 6.9-rc3. I blacklisted relevant 
> bluetooth modules and then warm booted without the blacklist. I did this 
> for both the "bluetooth" and "btqca" modules. In both cases, I cold 
> booted with and appropriate "module_blacklist" kernel arg. After the 
> boot, I verified the module was not loaded. I then warm booted without 
> the blacklist, and the bluetooth works, so bluetooth only seems to fail 
> when the linux module code for closing the device is run before a warm 
> boot.

And another experiment. I disabled the bluetooth.service and 
bluetooth.target with systemctl. I then shutdown and cold booted. After 
logging into GNOME, starting the service. Similar failures show up in 
the kernel logs as after the failure during a warm boot:

Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Bluetooth 
management interface 1.22 initialized
Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: 
src/adapter.c:reset_adv_monitors_complete() Failed to reset Adv 
Monitors: Failed (0x03)
Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Battery Provider 
Manager created
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: MGMT ver 1.22
Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: 
src/device.c:device_set_wake_support() Unable to set wake_support 
without RPA resolution
Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to clear 
UUIDs: Failed (0x03)
Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:17:54 braindead.localdomain wireplumber[2139]: 
org.bluez.GattManager1.RegisterApplication() failed: 
GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: Invalid method call
Apr 11 13:17:54 braindead.localdomain wireplumber[2139]: 
org.bluez.GattManager1.RegisterApplication() failed: 
GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: Invalid method call
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: setting 
up ROME/QCA6390
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM TTY 
layer initialized
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM socket 
layer initialized
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM ver 1.11

... skip some logs about registering modules in the bluetoothd ...

Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Product ID   :0x00000010
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA SOC 
Version  :0x400a0200
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA ROM 
Version  :0x00000200
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Patch 
Version:0x00003ac0
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA 
controller version 0x02000200
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Downloading qca/htbtfw20.tlv
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Failed to send TLV segment (-110)
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Failed to download patch (-110)
Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: Retry BT 
power ON:0
Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: command 
0xfc00 tx timeout
Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: Reading 
QCA version information failed (-110)
Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: Retry BT 
power ON:1
Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: command 
0xfc00 tx timeout
Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: Reading 
QCA version information failed (-110)
Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: Retry BT 
power ON:2
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to set 
mode: Authentication Failed (0x05)
Apr 11 13:18:01 braindead.localdomain kernel: Bluetooth: hci0: command 
0xfc00 tx timeout
Apr 11 13:18:01 braindead.localdomain kernel: Bluetooth: hci0: Reading 
QCA version information failed (-110)
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Too small Add 
Device complete event
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)
Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add 
UUID: Failed (0x03)

It looks like the firmware is failing to load. Is there some kind of 
time limit on loading the firmware after the module is loaded?

Why would this work if I allow the service to be started on boot, but 
not if I wait until after logging into GNOME?

>> So, I suspsect that the process of closing out the hardware may be 
>> leaving it in a state that the reset cannot handle (and probably never 
>> could handle).
>>
>> I also found that qualcomm has docs here: 
>> https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6800#Documentation
>>
>> However, I am not a member of a Qualcomm verified company (mentioned 
>> in the doc links). Luiz, Marcel, or Johan, do you have any contacts 
>> that might be able to help me in getting info about the technical docs 
>> for this hardware? I would love to see if I can find any issues in how 
>> the hardware is being reset.
>>
>> As an independent dev, I don't even know what it takes to get that 
>> kind of access. I would welcome any help here. Hey Qualcomm, are you 
>> hiring? :P
>>
>> wt
> 

-- 
You're more amazing than you think!

