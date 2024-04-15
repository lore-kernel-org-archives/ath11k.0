Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A965C4345F
	for <ath11k@archiver.kernel.org>; Mon, 15 Apr 2024 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q662DhtlNNUGHQ4ABKwSiAoQD9vdHB/ZA2JC/tXQviM=; b=yLR9NaMK/O90oHkMdBibMMRvB9
	xO7OC6rmCpBjnNIE85MMm7Ce06pWNbSugumCJ+jii15gNr+xc6WPzB1U/Yhib0l+ThVf3qpI6MnMp
	503jwqI2M2XknY6l8VbBErl8MD58qLtlVTd0cEkqZuwfr941ruD2CUP66UcmB4EVwwrinFdNXc+zM
	uXI253D9SI/Mx9HDKdqDPADrDszxEkih4G+W+ghQLVm8m44GBNiLGBaFP56KpdfcVmJU5uL1Pf0oD
	Q/bIEEb1Ivd+6md9RY6YSQMNpy8Ehve2SD68SKlOLNHg6MrlNrB6WkVHSZpyDCQRGUMfvkZ6VM6Ja
	ZjBEtOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwI4H-00000007cFw-2dLr;
	Mon, 15 Apr 2024 08:52:01 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwI4E-00000007cFG-1wmU
	for ath11k@lists.infradead.org;
	Mon, 15 Apr 2024 08:51:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso2317798b3a.2
        for <ath11k@lists.infradead.org>; Mon, 15 Apr 2024 01:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1713171116; x=1713775916; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q662DhtlNNUGHQ4ABKwSiAoQD9vdHB/ZA2JC/tXQviM=;
        b=BZGWPw94D/H3fjMSRzZ2pjeVZ2k/vmDD5F2dpgojyVWpdEFZJ4xZiVYzV0GbDx4q6B
         kq1pIqoj/O2VM8NDAT5WicQCnWcuov7/WIrB6RqleZC03cuETE1wdm3x7uAs7aP0TTlh
         gesIeFWlTtiURddCFSLnhG0Emz6Ug5dlBWa90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713171116; x=1713775916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q662DhtlNNUGHQ4ABKwSiAoQD9vdHB/ZA2JC/tXQviM=;
        b=DLsWHQt+7/IOj3NiHfJOsIT5GV2Tm0G/ZoQpuqDQeJUk/t7xw+Ui8crZLz0clFT2On
         xJXFd/N78qzP2T0TGSMJGX2lKI5WK/86CBW6Pmutd+RmLWdsU4vkbKlVpyzoKuyEm3MZ
         IcdrFPoQP+pWWVFe7mhn3UVN2hGP37WtaqlgAePQLcGncisBp8c5YQ5IReL/ZykO4SKL
         Z0MBkI9hRkFRfGlGMYbUv9oUWLYNkgsUiy7WmE38B8x3pH787jwUPRK/0NxzvMblkW2m
         /V0UOaQDF2yn1WTiK2tX2NtuBkYFruMY9LQX/UBo2eGas0upiKU60k44hEI9mxMgmiKB
         r24g==
X-Gm-Message-State: AOJu0YzavV6Trr4YhVvF1XCgUaI18h7vF+MVLlakcBOgVkSe+Y4AKxJl
	tTRKAcCuioR/PXW9SmBz3zFKQd3IfebFSHax9AGQ+1G0a/2GjoHpLrXVHZN/1w==
X-Google-Smtp-Source: AGHT+IEEmM2hDuGI0mStk4AhmXz7f1ODpYfoyxDQJ6huxqu73PfnSQNnrmWdl/MKdv4YWIDTrCNkKg==
X-Received: by 2002:a05:6a21:1789:b0:1a9:e2e0:1806 with SMTP id nx9-20020a056a21178900b001a9e2e01806mr3512527pzb.43.1713171116009;
        Mon, 15 Apr 2024 01:51:56 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709026e0900b001e4753f7715sm5960493plk.12.2024.04.15.01.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 01:51:55 -0700 (PDT)
Message-ID: <b1e3101b-075a-4630-bdee-758f6d9b4e29@penguintechs.org>
Date: Mon, 15 Apr 2024 01:51:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
To: quic_zijuhu <quic_zijuhu@quicinc.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
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
 <f7a24b54-9a1f-41f4-8706-d7199a4a84e8@penguintechs.org>
 <b999d783-4912-471e-a978-6c7f0cbcd1e6@penguintechs.org>
 <391980b0-8f44-4b87-83cd-66e46f041c8e@quicinc.com>
 <a7779e6f-36d5-45da-a453-db368f23b39c@penguintechs.org>
 <1de0e9b2-fd12-4483-ab3f-41b338a8e622@quicinc.com>
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <1de0e9b2-fd12-4483-ab3f-41b338a8e622@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_015158_577284_BE99E822 
X-CRM114-Status: GOOD (  23.99  )
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

On 4/15/24 1:07 AM, quic_zijuhu wrote:
> On 4/15/2024 3:52 PM, Wren Turkal wrote:
>> On 4/14/24 5:04 AM, quic_zijuhu wrote:
>>> On 4/13/2024 3:46 AM, Wren Turkal wrote:
>>>> On 4/11/24 1:30 PM, Wren Turkal wrote:
>>>>> On 4/10/24 3:40 PM, Wren Turkal wrote:
>>>>>> On 4/10/24 3:00 PM, Wren Turkal wrote:
>>>>>>> +Johan since he's a former BT drivers maintainer.
>>>>>>>
>>>>>>> On 4/9/24 1:11 PM, Wren Turkal wrote:
>>>>>>>> On 4/9/24 1:03 PM, Luiz Augusto von Dentz wrote:
>>>>>>>>> 5.19 seems a little too old, imo, or has it been broken for that long,
>>>>>>>>> did you at least tried with bluetooth-next? Try contacting the people
>>>>>>>>> who actually wrote the driver.
>>>>>>>>
>>>>>>>> Sorry, I didn't answer your question. Yes, I do think it's been broken for longer than that, but I wanted to confirm.
>>>>>>>
>>>>>>> Okay, so I tried 6.9-rc3 and every main release 5.19-6.8.
>>>>>>>
>>>>>>> I have found the following:
>>>>>>>
>>>>>>> * older kernels (6.3 and before) seem to be far less likely to kill on a cycling the bluetooth service.
>>>>>>> * 6.8/6.9-rcs consistently destroy bluetooth when stopping and restarting the service
>>>>>>> * If I destroy the bluetooth service with a BT service restart in 6.9-rc3 and warm reboot into any release back to 5.19, bluetooth does not work
>>>>>>> * cold boot works in all cases assuming I give the laptop about 5s between power off/on
>>>>>>
>>>>>> I just did another experiment on 6.9-rc3. I blacklisted relevant bluetooth modules and then warm booted without the blacklist. I did this for both the "bluetooth" and "btqca" modules. In both cases, I cold booted with and appropriate "module_blacklist" kernel arg. After the boot, I verified the module was not loaded. I then warm booted without the blacklist, and the bluetooth works, so bluetooth only seems to fail when the linux module code for closing the device is run before a warm boot.
>>>>>
>>>>> And another experiment. I disabled the bluetooth.service and bluetooth.target with systemctl. I then shutdown and cold booted. After logging into GNOME, starting the service. Similar failures show up in the kernel logs as after the failure during a warm boot:
>>>>>
>>>>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Bluetooth management interface 1.22 initialized
>>>>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: src/adapter.c:reset_adv_monitors_complete() Failed to reset Adv Monitors: Failed (0x03)
>>>>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Battery Provider Manager created
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: MGMT ver 1.22
>>>>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: src/device.c:device_set_wake_support() Unable to set wake_support without RPA resolution
>>>>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to clear UUIDs: Failed (0x03)
>>>>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:17:54 braindead.localdomain wireplumber[2139]: org.bluez.GattManager1.RegisterApplication() failed: GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: Invalid method call
>>>>> Apr 11 13:17:54 braindead.localdomain wireplumber[2139]: org.bluez.GattManager1.RegisterApplication() failed: GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: Invalid method call
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: setting up ROME/QCA6390
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM TTY layer initialized
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM socket layer initialized
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM ver 1.11
>>>>>
>>>>> ... skip some logs about registering modules in the bluetoothd ...
>>>>>
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Product ID   :0x00000010
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA SOC Version  :0x400a0200
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA ROM Version  :0x00000200
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Patch Version:0x00003ac0
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA controller version 0x02000200
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Downloading qca/htbtfw20.tlv
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Failed to send TLV segment (-110)
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Failed to download patch (-110)
>>>>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: Retry BT power ON:0
>>>>> Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: command 0xfc00 tx timeout
>>>>> Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: Reading QCA version information failed (-110)
>>>>> Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: Retry BT power ON:1
>>>>> Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: command 0xfc00 tx timeout
>>>>> Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: Reading QCA version information failed (-110)
>>>>> Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: Retry BT power ON:2
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to set mode: Authentication Failed (0x05)
>>>>> Apr 11 13:18:01 braindead.localdomain kernel: Bluetooth: hci0: command 0xfc00 tx timeout
>>>>> Apr 11 13:18:01 braindead.localdomain kernel: Bluetooth: hci0: Reading QCA version information failed (-110)
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Too small Add Device complete event
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>>>>
>>>> I have captured a full log of my system since boot including debug messages for the hci_hca.c file. Should I attach that log to a message here? In general, I am not totally certain of how I should track the troubleshooting for this problem. Do y'all want it on the mailing list?
>>>>
>>>>>
>>>>> It looks like the firmware is failing to load. Is there some kind of time limit on loading the firmware after the module is loaded?
>>>>>
>>>>> Why would this work if I allow the service to be started on boot, but not if I wait until after logging into GNOME?
>>>>>
>>>>>>> So, I suspsect that the process of closing out the hardware may be leaving it in a state that the reset cannot handle (and probably never could handle).
>>>>>>>
>>>>>>> I also found that qualcomm has docs here: https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6800#Documentation
>>>>>>>
>>>>>>> However, I am not a member of a Qualcomm verified company (mentioned in the doc links). Luiz, Marcel, or Johan, do you have any contacts that might be able to help me in getting info about the technical docs for this hardware? I would love to see if I can find any issues in how the hardware is being reset.
>>>>>>>
>>>>>>> As an independent dev, I don't even know what it takes to get that kind of access. I would welcome any help here. Hey Qualcomm, are you hiring? :P
>>>>>>>
>>>>>>> wt
>>>>>>
>>>>>
>>>>
>>> Hi Wren,
>>>
>>> 1) Apply below patch series
>>> https://patchwork.kernel.org/project/bluetooth/list/?series=844357
>>>
>>> 2) Disable BT
>>>
>>> 3) Power off
>>>
>>> 4) Power on
>>>
>>> 5) enable more logs
>>> echo "module hci_uart  +pft" > /sys/kernel/debug/dynamic_debug/control
>>> echo "module btqca  +pft" > /sys/kernel/debug/dynamic_debug/control
>>>
>>> 6) enable BT
>>>
>>> 7) then check this issue again. several disable/enable or reboot cycles.
>>
>> Working on it.
>>
>> What would you like me to capture from the logs, only kernel log or kernel+bluetooth service or something else?
>>
> only kernel log.
>> Also, how would you like me to share the logs? Do you want me to attach them to a reply mail or paste them into the body of a reply email or something else?
>>
> you maybe report this issue to bugzilla and track with bugzilla if you is easy for you. otherwise, paste them into the body of a reply email.

Done...https://bugzilla.kernel.org/show_bug.cgi?id=218726. See you in 
bugzilla.

-- 
You're more amazing than you think!

