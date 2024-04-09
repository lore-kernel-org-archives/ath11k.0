Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B60CD128A
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 20:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAi4vqCndy4KKmVsCpNgQQo3w5kyXr4uFKoGte8OzuY=; b=IVut26qR+KVoAo/FnmAXdBEIlB
	jvWLOJ6YY8gzv3EwkQzBaClrcd5eml6L5qzkqt6ZSHkrBPN65CWvdqxePW2VGbs1FlLrZN7f3v3tt
	Oam27GEYnZtRrupGVJCw/YIPbo76u+yBbE54ZBX1g+6rX3Um6XD0CW7PWuGjv6q1/a32IJTbz3W2I
	34tvUTZlFvFV3VbuHvm//eRwo1e6te1J1ZFMvACVKeAuLb9jQ/5kUGMJ7oknH8GEVwE49NHweBNKF
	viUol6Psap9a8mj3oBLlx1lthHRyuaBSsj/ch+IgdMTvpVImvTRsi+X4uidncFAJVz6BvdUTQzGGz
	OU6IuqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruHn2-00000003emz-03Tb;
	Tue, 09 Apr 2024 20:09:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruHmy-00000003el1-3JxT
	for ath11k@lists.infradead.org;
	Tue, 09 Apr 2024 20:09:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1dff837d674so51358485ad.3
        for <ath11k@lists.infradead.org>; Tue, 09 Apr 2024 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712693391; x=1713298191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TAi4vqCndy4KKmVsCpNgQQo3w5kyXr4uFKoGte8OzuY=;
        b=Bs+yAUF1O4WAmoUp9cDlvAQW/kG/4SddTmZTFkmWCMCq9PlPlnaVV0XSgKMQyszrUY
         QmYDPmVyzBok5cTiWoM2BiTEvEQM5J3oyDzkndQCogRv7ykcAfnqL968nGrzU+GSDfT2
         LsveNJH/335RwUukXTJVXlDPvZ7dQZ2jE5qMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712693391; x=1713298191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TAi4vqCndy4KKmVsCpNgQQo3w5kyXr4uFKoGte8OzuY=;
        b=tyzl5l1so31M5fMDf8jQ6E80UED5Yi+GOSCMXIS7lJveSR/lNhw+RZ+hziRNejaZFY
         9ht6W70GHyKp58IOnWqJq2ZbvI31TnSXqfa+z/rouKNXn+5WdnidT62ohxpj0IZOoHAd
         AJyGwV3V4fUc5TeC93DMjn4Jg4ic6BOCVxuxWWfJiTprVyLMLOU6fLsHjHyNOV4GpbF2
         osHYJBgCfIhimXkFG30ZgnP06OfvlnsV9Egti7xtd9LTSvvqLDqIORHTHjgekbLyWQTQ
         0Uv1u4RidE4PeWfHXBduLXDhu+KyKdZKunVrV5le1BzAUZFRfRhTGyVaixo2jxWPi0fl
         /F1g==
X-Gm-Message-State: AOJu0YxYfi6e3RPKHNoYi8W8Nom6ROLTLUJ2/2U8BpLpozTw/VEWqida
	bCGJkJieZMiLUZbDxrFpVtOPF4atWws/V0EQkI4VWgw7qEqKED1dMGDxlFFIGw==
X-Google-Smtp-Source: AGHT+IGO5ksoi8Xb/iLYvDGcWL3VhZA6IkRfc000cnjvltUFsVqVzc3ksfBlxkeyCZ4IPg8/5Jeh6g==
X-Received: by 2002:a17:902:f611:b0:1e2:a7bf:5172 with SMTP id n17-20020a170902f61100b001e2a7bf5172mr1054279plg.52.1712693390810;
        Tue, 09 Apr 2024 13:09:50 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id c6-20020a170903234600b001e4478e9b21sm3859461plh.244.2024.04.09.13.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 13:09:50 -0700 (PDT)
Message-ID: <2d523b9b-1adb-4d32-9505-30775d3551e1@penguintechs.org>
Date: Tue, 9 Apr 2024 13:09:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
Content-Language: en-US
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Marcel Holtmann <marcel@holtmann.org>
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
 <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
 <b592d037-41ed-42e8-8c3c-286eb1a68ceb@penguintechs.org>
 <68a31d6a-8eb8-4d78-819b-fb67367cc41d@penguintechs.org>
 <CABBYNZJQUy37fxWuCXV1OgM+DNnOr7V0h_rkgcSdw-5hF7iauQ@mail.gmail.com>
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <CABBYNZJQUy37fxWuCXV1OgM+DNnOr7V0h_rkgcSdw-5hF7iauQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_130952_987624_A407129A 
X-CRM114-Status: GOOD (  32.61  )
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

On 4/9/24 1:03 PM, Luiz Augusto von Dentz wrote:
> Hi Wren,
> 
> On Tue, Apr 9, 2024 at 3:53 PM Wren Turkal <wt@penguintechs.org> wrote:
>>
>> On 4/8/24 12:49 PM, Wren Turkal wrote:
>>> +Marcel Holtmann <marcel@holtmann.org>
>>> +Luiz Augusto von Dentz <luiz.dentz@gmail.com>
>>>
>>> Added maintainers identified from the get_maintainer.pl script in the
>>> kernel repo. Hoping to get some ideas for next steps.
>>>
>>> More contextual info below:
>>>
>>> On 4/6/24 1:27 PM, Wren Turkal wrote:
>>>> +Kalle Valo since you have the same laptop
>>>>
>>>> On 4/6/24 1:16 PM, Wren Turkal wrote:
>>>>> Sorry for the double send on the original message. I am still hoping
>>>>> to get some help. I have added additional info below.
>>>>>
>>>>> On 4/4/24 12:14 PM, Wren Turkal wrote:
>>>>>> Hey there ath11k/bluetooth folks,
>>>>>>
>>>>>> I am having a pretty major problem with QCA6930 for some time (maybe
>>>>>> a year or two). I have this bluetooth device:
>>>>>>
>>>>>> 72:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc QCA6390
>>>>>> Wireless Network Adapter
>>>>>>
>>>>>> This device appears to be driven by the ath11k module and others. I
>>>>>> hope I am pinging the right lists.
>>>>>>
>>>>>> I am using Fedora Rawhide. Fully updated yesterday. My uname reports
>>>>>> this:
>>>>>>
>>>>>> Linux braindead.localdomain
>>>>>> 6.9.0-0.rc2.20240402git026e680b0a08.24.fc41.x86_64 #1 SMP
>>>>>> PREEMPT_DYNAMIC Tue Apr  2 17:51:18 UTC 2024 x86_64 GNU/Linux
>>>>>
>>>>> Updated today. Here's the new uname:
>>>>>
>>>>> Linux braindead.localdomain
>>>>> 6.9.0-0.rc2.20240405git8cb4a9a82b21.27.fc41.x86_64 #1 SMP
>>>>> PREEMPT_DYNAMIC Fri Apr  5 16:48:07 UTC 2024 x86_64 GNU/Linux
>>>
>>> I looked at the current mainline kernel code. I found the following.
>>>
>>> I found that there was a patch authored by Zijun Hu that was supposed to
>>> address a warm reboot issue on QCA6390 here:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bluetooth/hci_qca.c?h=v6.9-rc3&id=7e7bbddd029b644f00f0ffbfbc485ed71977d0d5
>>>
>>> The same code path from the above patch is now slightly different
>>> because another patch authored by Krzysztof Kozlowski, namely:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bluetooth/hci_qca.c?h=v6.9-rc3&id=272970be3dabd24cbe50e393ffee8f04aec3b9a8
>>>
>>> I also see a few fixed over time in the btqca.c file. I wonder if any of
>>> these are related.
>>>
>>> Unfortunately, none of these changes were made recently.
>>>
>>> Does anyone have an suggestions for next steps?
>>
>> I am trying to build kernels as old as 5.19 to start a bisect. I have
>> been unsuccessful due to compiler warnings (presumably from newer
>> version of gcc than were used at the time those kernels were released.
>> Is there any secret sauce to getting these older kernels to build with
>> newer gccs?
> 
> 5.19 seems a little too old, imo, or has it been broken for that long,
> did you at least tried with bluetooth-next? Try contacting the people
> who actually wrote the driver.

I tried adding the folks on the To: line who were involved in writing 
the driver. Having had much luck yet.

This is the actual message I am getting to while trying to build the 
kernel. I turned off the CONFIG_DEBUG_INFO_BTF option to try to get a 
build. That seems to have worked.

Is there some secret method of getting more debug messages from the kernel.

Also, is there some way to get access to the qualcomm docs for this 
hardware? I am not some official kernel dev. Do you know anyone that 
could help with that?
FAILED: load BTF from vmlinux: Invalid argument
> 
>>>>>
>>>>> I also noticed a new version of bluez. Here is the RPM package
>>>>> version: bluez-5.73-3.fc41.x86_64
>>>>>
>>>>>> My main bluetooth device is  a Logitech MX 3 Mac mouse that uses
>>>>>> bluetooth. When bluetooth fails, so does the mouse. I have power
>>>>>> cycle my laptop when that happens. I'd love to help find a fix for
>>>>>> this.
>>>>>>
>>>>>> The problem is that I cannot disable and re-enable the bluetooth on
>>>>>> my system. Bluetooth also doesn't work after a warm boot. I have to
>>>>>> power cycle my laptop to recover bluetooth funcitonality. I have
>>>>>> tried the following:
>>>>>>
>>>>>> * logging into KDE Plasma (bluetooth stops working)
>>>>>> * logging into GNOME (works on cold boot, fails on warm boot)
>>>>>
>>>>> I did notice that the mouse seems to work in Plasma until a few sec
>>>>> after I see the background image appears. I suspect that Plasma is
>>>>> disabling and reenabling the bluetooth where Gnome does not do that.
>>>>>
>>>>>> After logging into GNOME during a cold boot, I have also done
>>>>>> "systemctl restart bluetooth.service". I get these journal logs
>>>>>> during the stop;
>>>>>>
>>>>>> ➜  bt_kernel_bug cat journal-stop-bluetooth-service.log
>>>>>> Apr 04 10:14:41 braindead.localdomain NetworkManager[1120]: <info>
>>>>>> [1712250881.7060] device (F0:5C:77:F2:60:FC): state change:
>>>>>> disconnected -> unmanaged (reason 'removed', sys-iface-state:
>>>>>> 'removed')
>>>>>> Apr 04 10:14:41 braindead.localdomain systemd[1]: Starting
>>>>>> systemd-rfkill.service - Load/Save RF Kill Switch Status...
>>>>>> Apr 04 10:14:41 braindead.localdomain systemd[1]: Started
>>>>>> systemd-rfkill.service - Load/Save RF Kill Switch Status.
>>>>>> Apr 04 10:14:41 braindead.localdomain audit[1]: SERVICE_START pid=1
>>>>>> uid=0 auid=4294967295 ses=4294967295
>>>>>> subj=system_u:system_r:init_t:s0 msg='unit=systemd-rfkill
>>>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>>>>>> terminal=? res=success'
>>>>>> Apr 04 10:14:46 braindead.localdomain systemd[1]:
>>>>>> systemd-rfkill.service: Deactivated successfully.
>>>>>> Apr 04 10:14:46 braindead.localdomain audit[1]: SERVICE_STOP pid=1
>>>>>> uid=0 auid=4294967295 ses=4294967295
>>>>>> subj=system_u:system_r:init_t:s0 msg='unit=systemd-rfkill
>>>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>>>>>> terminal=? res=success'
>>>>>>
>>>>>> I get these journal logs during start:
>>>>>>
>>>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0:
>>>>>> setting up ROME/QCA6390
>>>>>> Apr 04 10:15:05 braindead.localdomain systemd[1]: Starting
>>>>>> systemd-rfkill.service - Load/Save RF Kill Switch Status...
>>>>>> Apr 04 10:15:05 braindead.localdomain systemd[1]: Started
>>>>>> systemd-rfkill.service - Load/Save RF Kill Switch Status.
>>>>>> Apr 04 10:15:05 braindead.localdomain audit[1]: SERVICE_START pid=1
>>>>>> uid=0 auid=4294967295 ses=4294967295
>>>>>> subj=system_u:system_r:init_t:s0 msg='unit=systemd-rfkill
>>>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>>>>>> terminal=? res=success'
>>>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> Product ID   :0x00000010
>>>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> SOC Version  :0x400a0200
>>>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> ROM Version  :0x00000200
>>>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> Patch Version:0x00003ac0
>>>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> controller version 0x02000200
>>>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> Downloading qca/htbtfw20.tlv
>>>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> Failed to send TLV segment (-110)
>>>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> Failed to download patch (-110)
>>>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: Retry
>>>>>> BT power ON:0
>>>>>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0:
>>>>>> command 0xfc00 tx timeout
>>>>>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0:
>>>>>> Reading QCA version information failed (-110)
>>>>>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: Retry
>>>>>> BT power ON:1
>>>>>> Apr 04 10:15:10 braindead.localdomain systemd[1]:
>>>>>> systemd-rfkill.service: Deactivated successfully.
>>>>>> Apr 04 10:15:10 braindead.localdomain audit[1]: SERVICE_STOP pid=1
>>>>>> uid=0 auid=4294967295 ses=4294967295
>>>>>> subj=system_u:system_r:init_t:s0 msg='unit=systemd-rfkill
>>>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>>>>>> terminal=? res=success'
>>>>>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0:
>>>>>> command 0xfc00 tx timeout
>>>>>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0:
>>>>>> Reading QCA version information failed (-110)
>>>>>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: Retry
>>>>>> BT power ON:2
>>>>>> Apr 04 10:15:13 braindead.localdomain bluetoothd[986]: Failed to set
>>>>>> mode: Authentication Failed (0x05)
>>>>>> Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0:
>>>>>> command 0xfc00 tx timeout
>>>>>> Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0:
>>>>>> Reading QCA version information failed (-110)
>>>>>> Apr 04 10:15:15 braindead.localdomain chronyd[1065]: Selected source
>>>>>> 204.17.205.8 (2.fedora.pool.ntp.org)
>>>>>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Created slice
>>>>>> background.slice - User Background Tasks Slice.
>>>>>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Starting
>>>>>> systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files
>>>>>> and Directories...
>>>>>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Finished
>>>>>> systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files
>>>>>> and Directories.
>>>>>> Apr 04 10:15:38 braindead.localdomain audit: BPF prog-id=86 op=LOAD
>>>>>> Apr 04 10:15:38 braindead.localdomain systemd[1]: Starting
>>>>>> plocate-updatedb.service - Update the plocate database...
>>>>>> Apr 04 10:15:41 braindead.localdomain systemd[1687]: Started
>>>>>> vte-spawn-21527424-cb2d-479f-af17-22251e2b37a0.scope - VTE child
>>>>>> process 5144 launched by gnome-terminal-server process 4668.
>>>>>> Apr 04 10:15:53 braindead.localdomain systemd[1]:
>>>>>> plocate-updatedb.service: Deactivated successfully.
>>>>>> Apr 04 10:15:53 braindead.localdomain systemd[1]: Finished
>>>>>> plocate-updatedb.service - Update the plocate database.
>>>>>> Apr 04 10:15:53 braindead.localdomain systemd[1]:
>>>>>> plocate-updatedb.service: Consumed 6.802s CPU time.
>>>>>> Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_START pid=1
>>>>>> uid=0 auid=4294967295 ses=4294967295
>>>>>> subj=system_u:system_r:init_t:s0 msg='unit=plocate-updatedb
>>>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>>>>>> terminal=? res=success'
>>>>>> Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_STOP pid=1
>>>>>> uid=0 auid=4294967295 ses=4294967295
>>>>>> subj=system_u:system_r:init_t:s0 msg='unit=plocate-updatedb
>>>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
>>>>>> terminal=? res=success'
>>>>>> Apr 04 10:15:54 braindead.localdomain audit: BPF prog-id=86 op=UNLOAD
>>>>>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]:
>>>>>> kf.idletime: Could not find any system poller plugin
>>>>>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]:
>>>>>> qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller,
>>>>>> KIdleTime): invalid nullptr parameter
>>>>>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]:
>>>>>> qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller,
>>>>>> KIdleTime): invalid nullptr parameter
>>>>>>
>>>>>> There's a bunch of errors in those logs starting with these two
>>>>>> seemingly important lines:
>>>>>>
>>>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> Failed to send TLV segment (-110)
>>>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA
>>>>>> Failed to download patch (-110)
>>>>>
>>>>> Logs are mostly unchanges when restarting the bluetooth service after
>>>>> a cold boot with the bluetooth originally working.
>>>>>
>>>>>> FWIW, I get similar logs after logging into KDE Plasma. I also get
>>>>>> similar logs after a warm boot.
>>>>>>
>>>>>> This appears to be some kind of bug in the initialization of the
>>>>>> hardware. Is there any additional information I can provide to help
>>>>>> troubleshoot this problem.
>>>>>
>>>>> I will also say that the bluetooth appears to work throught a
>>>>> suspend/resume cycle as long as I don't restart the bluetooth service.
>>>>>
>>>>> Oh, and my laptop is a Dell 9310 if that helps.
>>>>
>>>> Kalle, I noticed that you reported having a Dell 9310 in 2021 in a
>>>> message on this very mailing list. Do you happen to still have that
>>>> laptop? If so, so you still test on that laptop at all? I am curious
>>>> if it is having the same issue I am experiencing?
>>>>
>>>>> Is there any other info I could collect that might be useful?
>>>>>
>>>>> I'm pretty new to troubleshooting a problem like this and would be
>>>>> happy to have any advice anyone might want to share.
>>>>>
>>>>> Thanks,
>>>>> wt
>>>>>
>>>>
>>>
>>
>> --
>> You're more amazing than you think!
> 
> 
> 

-- 
You're more amazing than you think!

