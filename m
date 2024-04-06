Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9D3C67861
	for <ath11k@archiver.kernel.org>; Sat,  6 Apr 2024 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwcLv+IoUPZ+WLmS6saJqvPRqplpWnxkGgPT2zfuETA=; b=TJt+5A5mzE+gWLhLdluYyVsFXK
	zMD8qQL2KgBSGD11GqU1fi+x0VptK676NI00NsXBxLc3xmVm5mYMjhjEcaYvjmZPhtawnK37fBKue
	0zBoxjtzMuYFkIw7p3ZBA2GIrm8vsHkq4WrOjNCeZ3I9wn0scRjFGP1QoueocBUdFPUDQHwWC27TQ
	K5zEfYtOG9ZymDlT+HSbcX6qiqGZOYp4ZkVJ1GRPTabXNe65iMKqA9FaxVoOh7X56v9qOP6n+BGTT
	Vg02wN5DywEa0h5kM+GA0aBY3KHe7iIwp+ASVTID+8SwQXb0eXzDTdDGltkMfg0PT4Tvw1DL9yIxH
	UJ63882A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtD0E-0000000B0S2-2MiY;
	Sat, 06 Apr 2024 20:51:06 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtD09-0000000B0RR-0oWC
	for ath11k@lists.infradead.org;
	Sat, 06 Apr 2024 20:51:04 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2a49bce83baso599412a91.1
        for <ath11k@lists.infradead.org>; Sat, 06 Apr 2024 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712436657; x=1713041457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwcLv+IoUPZ+WLmS6saJqvPRqplpWnxkGgPT2zfuETA=;
        b=EUi+tLKRz85f4e2YL8yfx26KYg42ZahX7JeIwD3nLfl3mO/XLKZj+/c9Q189xNXYSO
         A/j+EIrsI0rpdKfgqFmB6pzJv81yED/BxCxtgOLxcU57hmlYiJbU1pcv+GfF4hj3T0qs
         R9A5Z7yjo6cHzEjO2mEI4aNgxtdFQ8NGkWJV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712436657; x=1713041457;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwcLv+IoUPZ+WLmS6saJqvPRqplpWnxkGgPT2zfuETA=;
        b=cNDCbTYLkX4ua2IPLDpY+35LLuQEwfxt+y2jZoAsmH964wnh3KZDVkd8WeRuGKcmBa
         iL/Q8aJTWPa6we1vL8Iu7fao37ylW30UEwlHyAYWJ7+WURdBmdUPlTdd7RzRDOtX4W0X
         1cBGUyiJYWwBrl375PyBwSwPfcaHr2WoIMSsVRKbBsC25Il8R5xmUGuL/DVrXpS3+pf3
         3XrB82OLWSOGU/2kJEWxG0/oDUSyBvq+Yj990lWWK6OQQtWIx3lUk+CnzFfs+Q98iywB
         cxfJXAheO/bFZ0Irix+TAFfpk7hr4ZEvYvQ4uZbH6EhHPmPd/2lPXDYn09Jj6Xvakov4
         GISA==
X-Gm-Message-State: AOJu0YxvHsXdTWudjCBAu5+RbQ3jwdqFYX5z9mdebzS3dwYwSByQ2eZN
	7qAri2v3HXUIlAb5lv5nplL4yDVT8r2J1+i2CgFH+QZYRHYajYEkEJM6e71wWKgiR+pIw5Lvo3b
	+Mg==
X-Google-Smtp-Source: AGHT+IHAjqnm/E14vScRpdXFO0XJsAynw8VjOBnh8YAJUwN7kAz3sko1Pz8YcauDgoD8sGaZOAf8uA==
X-Received: by 2002:a17:902:bd43:b0:1e2:61c9:85de with SMTP id b3-20020a170902bd4300b001e261c985demr4795927plx.4.1712436657411;
        Sat, 06 Apr 2024 13:50:57 -0700 (PDT)
Received: from [172.16.102.235] (c-98-45-34-39.hsd1.ca.comcast.net. [98.45.34.39])
        by smtp.gmail.com with ESMTPSA id d6-20020a17090ae28600b002a0187d84f0sm3593602pjz.20.2024.04.06.13.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 13:50:56 -0700 (PDT)
Message-ID: <64cfac06-d9d8-4a69-9bd7-3a38fe03b5d8@penguintechs.org>
Date: Sat, 6 Apr 2024 13:50:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
To: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Ben Young Tae Kim <ytkim@qca.qualcomm.com>
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
 <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
 <43820685-4960-4801-bd5d-f1b5e41ec033@penguintechs.org>
In-Reply-To: <43820685-4960-4801-bd5d-f1b5e41ec033@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_135101_277055_0890DF13 
X-CRM114-Status: GOOD (  18.15  )
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

On 4/6/24 1:29 PM, Wren Turkal wrote:
> +Ben Young Tae Kim, current maintainer of btqca
> 
> On 4/6/24 1:27 PM, Wren Turkal wrote:
>> +Kalle Valo since you have the same laptop
>>
>> On 4/6/24 1:16 PM, Wren Turkal wrote:
>>> Sorry for the double send on the original message. I am still hoping 
>>> to get some help. I have added additional info below.
>>>
>>> On 4/4/24 12:14 PM, Wren Turkal wrote:
>>>> Hey there ath11k/bluetooth folks,
>>>>
>>>> I am having a pretty major problem with QCA6930 for some time (maybe 
>>>> a year or two). I have this bluetooth device:
>>>>
>>>> 72:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc QCA6390 
>>>> Wireless Network Adapter
>>>>
>>>> This device appears to be driven by the ath11k module and others. I 
>>>> hope I am pinging the right lists.
>>>>
>>>> I am using Fedora Rawhide. Fully updated yesterday. My uname reports 
>>>> this:
>>>>
>>>> Linux braindead.localdomain 
>>>> 6.9.0-0.rc2.20240402git026e680b0a08.24.fc41.x86_64 #1 SMP 
>>>> PREEMPT_DYNAMIC Tue Apr  2 17:51:18 UTC 2024 x86_64 GNU/Linux
>>>
>>> Updated today. Here's the new uname:
>>>
>>> Linux braindead.localdomain 
>>> 6.9.0-0.rc2.20240405git8cb4a9a82b21.27.fc41.x86_64 #1 SMP 
>>> PREEMPT_DYNAMIC Fri Apr  5 16:48:07 UTC 2024 x86_64 GNU/Linux
>>>
>>> I also noticed a new version of bluez. Here is the RPM package 
>>> version: bluez-5.73-3.fc41.x86_64
>>>
>>>> My main bluetooth device is  a Logitech MX 3 Mac mouse that uses 
>>>> bluetooth. When bluetooth fails, so does the mouse. I have power 
>>>> cycle my laptop when that happens. I'd love to help find a fix for 
>>>> this.
>>>>
>>>> The problem is that I cannot disable and re-enable the bluetooth on 
>>>> my system. Bluetooth also doesn't work after a warm boot. I have to 
>>>> power cycle my laptop to recover bluetooth funcitonality. I have 
>>>> tried the following:
>>>>
>>>> * logging into KDE Plasma (bluetooth stops working)
>>>> * logging into GNOME (works on cold boot, fails on warm boot)
>>>
>>> I did notice that the mouse seems to work in Plasma until a few sec 
>>> after I see the background image appears. I suspect that Plasma is 
>>> disabling and reenabling the bluetooth where Gnome does not do that.
>>>
>>>> After logging into GNOME during a cold boot, I have also done 
>>>> "systemctl restart bluetooth.service". I get these journal logs 
>>>> during the stop;
>>>>
>>>> ➜  bt_kernel_bug cat journal-stop-bluetooth-service.log
>>>> Apr 04 10:14:41 braindead.localdomain NetworkManager[1120]: <info> 
>>>> [1712250881.7060] device (F0:5C:77:F2:60:FC): state change: 
>>>> disconnected -> unmanaged (reason 'removed', sys-iface-state: 
>>>> 'removed')
>>>> Apr 04 10:14:41 braindead.localdomain systemd[1]: Starting 
>>>> systemd-rfkill.service - Load/Save RF Kill Switch Status...
>>>> Apr 04 10:14:41 braindead.localdomain systemd[1]: Started 
>>>> systemd-rfkill.service - Load/Save RF Kill Switch Status.
>>>> Apr 04 10:14:41 braindead.localdomain audit[1]: SERVICE_START pid=1 
>>>> uid=0 auid=4294967295 ses=4294967295 
>>>> subj=system_u:system_r:init_t:s0 msg='unit=systemd-rfkill 
>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? 
>>>> terminal=? res=success'
>>>> Apr 04 10:14:46 braindead.localdomain systemd[1]: 
>>>> systemd-rfkill.service: Deactivated successfully.
>>>> Apr 04 10:14:46 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>>>> uid=0 auid=4294967295 ses=4294967295 
>>>> subj=system_u:system_r:init_t:s0 msg='unit=systemd-rfkill 
>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? 
>>>> terminal=? res=success'
>>>>
>>>> I get these journal logs during start:
>>>>
>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: 
>>>> setting up ROME/QCA6390
>>>> Apr 04 10:15:05 braindead.localdomain systemd[1]: Starting 
>>>> systemd-rfkill.service - Load/Save RF Kill Switch Status...
>>>> Apr 04 10:15:05 braindead.localdomain systemd[1]: Started 
>>>> systemd-rfkill.service - Load/Save RF Kill Switch Status.
>>>> Apr 04 10:15:05 braindead.localdomain audit[1]: SERVICE_START pid=1 
>>>> uid=0 auid=4294967295 ses=4294967295 
>>>> subj=system_u:system_r:init_t:s0 msg='unit=systemd-rfkill 
>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? 
>>>> terminal=? res=success'
>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> Product ID   :0x00000010
>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> SOC Version  :0x400a0200
>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> ROM Version  :0x00000200
>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> Patch Version:0x00003ac0
>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> controller version 0x02000200
>>>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> Downloading qca/htbtfw20.tlv
>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> Failed to send TLV segment (-110)
>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> Failed to download patch (-110)
>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>>>> BT power ON:0
>>>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: 
>>>> command 0xfc00 tx timeout
>>>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: 
>>>> Reading QCA version information failed (-110)
>>>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>>>> BT power ON:1
>>>> Apr 04 10:15:10 braindead.localdomain systemd[1]: 
>>>> systemd-rfkill.service: Deactivated successfully.
>>>> Apr 04 10:15:10 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>>>> uid=0 auid=4294967295 ses=4294967295 
>>>> subj=system_u:system_r:init_t:s0 msg='unit=systemd-rfkill 
>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? 
>>>> terminal=? res=success'
>>>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: 
>>>> command 0xfc00 tx timeout
>>>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: 
>>>> Reading QCA version information failed (-110)
>>>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>>>> BT power ON:2
>>>> Apr 04 10:15:13 braindead.localdomain bluetoothd[986]: Failed to set 
>>>> mode: Authentication Failed (0x05)
>>>> Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0: 
>>>> command 0xfc00 tx timeout
>>>> Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0: 
>>>> Reading QCA version information failed (-110)
>>>> Apr 04 10:15:15 braindead.localdomain chronyd[1065]: Selected source 
>>>> 204.17.205.8 (2.fedora.pool.ntp.org)
>>>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Created slice 
>>>> background.slice - User Background Tasks Slice.
>>>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Starting 
>>>> systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files 
>>>> and Directories...
>>>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Finished 
>>>> systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files 
>>>> and Directories.
>>>> Apr 04 10:15:38 braindead.localdomain audit: BPF prog-id=86 op=LOAD
>>>> Apr 04 10:15:38 braindead.localdomain systemd[1]: Starting 
>>>> plocate-updatedb.service - Update the plocate database...
>>>> Apr 04 10:15:41 braindead.localdomain systemd[1687]: Started 
>>>> vte-spawn-21527424-cb2d-479f-af17-22251e2b37a0.scope - VTE child 
>>>> process 5144 launched by gnome-terminal-server process 4668.
>>>> Apr 04 10:15:53 braindead.localdomain systemd[1]: 
>>>> plocate-updatedb.service: Deactivated successfully.
>>>> Apr 04 10:15:53 braindead.localdomain systemd[1]: Finished 
>>>> plocate-updatedb.service - Update the plocate database.
>>>> Apr 04 10:15:53 braindead.localdomain systemd[1]: 
>>>> plocate-updatedb.service: Consumed 6.802s CPU time.
>>>> Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_START pid=1 
>>>> uid=0 auid=4294967295 ses=4294967295 
>>>> subj=system_u:system_r:init_t:s0 msg='unit=plocate-updatedb 
>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? 
>>>> terminal=? res=success'
>>>> Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>>>> uid=0 auid=4294967295 ses=4294967295 
>>>> subj=system_u:system_r:init_t:s0 msg='unit=plocate-updatedb 
>>>> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? 
>>>> terminal=? res=success'
>>>> Apr 04 10:15:54 braindead.localdomain audit: BPF prog-id=86 op=UNLOAD
>>>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>>>> kf.idletime: Could not find any system poller plugin
>>>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>>>> qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller, 
>>>> KIdleTime): invalid nullptr parameter
>>>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>>>> qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller, 
>>>> KIdleTime): invalid nullptr parameter
>>>>
>>>> There's a bunch of errors in those logs starting with these two 
>>>> seemingly important lines:
>>>>
>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> Failed to send TLV segment (-110)
>>>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>>>> Failed to download patch (-110)

I narrowed down how to cause the bad logs a bit, if I do the following:

1. stop the bluetooth service
2. unload the hci_uart and btqca modules
3. restart the bluetooth service
4. reload those modules

I get these log messages:

Apr 06 13:42:43 braindead.localdomain sudo[11047]:       wt : TTY=pts/0 
; PWD=/home/wt ; USER=root ; COMMAND=/usr/sbin/modprobe hci_uart
Apr 06 13:42:43 braindead.localdomain audit[11047]: USER_CMD pid=11047 
uid=1000 auid=1000 ses=3 
subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 
msg='cwd="/home/wt" cmd=6D>
Apr 06 13:42:43 braindead.localdomain audit[11047]: CRED_REFR pid=11047 
uid=1000 auid=1000 ses=3 
subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 
msg='op=PAM:setcred grant>
Apr 06 13:42:43 braindead.localdomain sudo[11047]: 
pam_unix(sudo:session): session opened for user root(uid=0) by wt(uid=1000)
Apr 06 13:42:43 braindead.localdomain audit[11047]: USER_START pid=11047 
uid=1000 auid=1000 ses=3 
subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 
msg='op=PAM:session_open>
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART driver 
ver 2.3
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol H4 registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol BCSP registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol LL registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol ATH3K registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol Three-wire (H5) registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol Intel registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol Broadcom registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol QCA registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol AG6XX registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: HCI UART 
protocol Marvell registered
Apr 06 13:42:43 braindead.localdomain kernel: Bluetooth: hci0: setting 
up ROME/QCA6390
Apr 06 13:42:43 braindead.localdomain sudo[11047]: 
pam_unix(sudo:session): session closed for user root
Apr 06 13:42:43 braindead.localdomain audit[11047]: USER_END pid=11047 
uid=1000 auid=1000 ses=3 
subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 
msg='op=PAM:session_close >
Apr 06 13:42:43 braindead.localdomain audit[11047]: CRED_DISP pid=11047 
uid=1000 auid=1000 ses=3 
subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 
msg='op=PAM:setcred grant>
Apr 06 13:42:43 braindead.localdomain systemd[1666]: Reached target 
bluetooth.target - Bluetooth.
Apr 06 13:42:43 braindead.localdomain systemd[1]: Starting 
systemd-rfkill.service - Load/Save RF Kill Switch Status...
Apr 06 13:42:43 braindead.localdomain systemd[1]: Reached target 
bluetooth.target - Bluetooth Support.
Apr 06 13:42:43 braindead.localdomain systemd[1]: Started 
systemd-rfkill.service - Load/Save RF Kill Switch Status.
Apr 06 13:42:43 braindead.localdomain audit[1]: SERVICE_START pid=1 
uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
msg='unit=systemd-rfkill comm="systemd" exe>
Apr 06 13:42:45 braindead.localdomain kernel: Bluetooth: hci0: command 
0xfc00 tx timeout
Apr 06 13:42:45 braindead.localdomain kernel: Bluetooth: hci0: Reading 
QCA version information failed (-110)
Apr 06 13:42:45 braindead.localdomain kernel: Bluetooth: hci0: Retry BT 
power ON:0
Apr 06 13:42:48 braindead.localdomain kernel: Bluetooth: hci0: command 
0xfc00 tx timeout
Apr 06 13:42:48 braindead.localdomain kernel: Bluetooth: hci0: Reading 
QCA version information failed (-110)
Apr 06 13:42:48 braindead.localdomain kernel: Bluetooth: hci0: Retry BT 
power ON:1
Apr 06 13:42:48 braindead.localdomain systemd[1]: 
systemd-rfkill.service: Deactivated successfully.
Apr 06 13:42:48 braindead.localdomain audit[1]: SERVICE_STOP pid=1 uid=0 
auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
msg='unit=systemd-rfkill comm="systemd" exe=>

Do any of y'all see anything that helps?

>>>
>>> Logs are mostly unchanges when restarting the bluetooth service after 
>>> a cold boot with the bluetooth originally working.
>>>
>>>> FWIW, I get similar logs after logging into KDE Plasma. I also get 
>>>> similar logs after a warm boot.
>>>>
>>>> This appears to be some kind of bug in the initialization of the 
>>>> hardware. Is there any additional information I can provide to help 
>>>> troubleshoot this problem.
>>>
>>> I will also say that the bluetooth appears to work throught a 
>>> suspend/resume cycle as long as I don't restart the bluetooth service.
>>>
>>> Oh, and my laptop is a Dell 9310 if that helps.
>>
>> Kalle, I noticed that you reported having a Dell 9310 in 2021 in a 
>> message on this very mailing list. Do you happen to still have that 
>> laptop? If so, so you still test on that laptop at all? I am curious 
>> if it is having the same issue I am experiencing?
>>
>>> Is there any other info I could collect that might be useful?
>>>
>>> I'm pretty new to troubleshooting a problem like this and would be 
>>> happy to have any advice anyone might want to share.
>>>
>>> Thanks,
>>> wt
>>>
>>
> 

-- 
You're more amazing than you think!

