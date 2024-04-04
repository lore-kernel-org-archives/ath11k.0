Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464B9CD1284
	for <ath11k@archiver.kernel.org>; Thu,  4 Apr 2024 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MbF66O3k0UzwHeaOhaqXqequZ9uqXlexXgMorz4+oEA=; b=rf5dvqQo8c9H4GKc9fJNUwKADg
	mTdq+rpVODtv9jjPzcgGSY1xlZKMiuAbh8iFeNPi6Re+qOjCnaKGkbGBA3rxEQtrYQg3MaofwZQVg
	kk+wr5OejipPjFQ4tCx3IrD791pPNTb39+9PtiArSew/TKqEW53LI8tT79/g5KriIx8zP1iNLTTwO
	H0Nj1mFSoma78RHPSGggp6dY2yab3QTqG1sLbim+c08u+B7azfI7bvTCPD++2JYWkvb9/LkrRZSYL
	HFvkw3LDv5cYy3udCo+0Oqoee6NhWT5zFQ1nzfQvuYwwlZQDYyLzAnwh1DQHprkpxnYMvm/R1IPyz
	iZMAKkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSYF-00000003zjH-2nsF;
	Thu, 04 Apr 2024 19:15:07 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSY1-00000003zck-1tlJ
	for ath11k@lists.infradead.org;
	Thu, 04 Apr 2024 19:15:05 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so387045b3a.1
        for <ath11k@lists.infradead.org>; Thu, 04 Apr 2024 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712258087; x=1712862887; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbF66O3k0UzwHeaOhaqXqequZ9uqXlexXgMorz4+oEA=;
        b=Rq2YrmqEsvrltCab4GYG5gncPqueKW3e1lxn8tdGidljCBH7lhCezD9htzFhBlWTYM
         yocG9yn8eZ5Fd7Zuiv2wGqU7izjxLbUtGIGZZVswvuij0CG/M3gNAcDgkJDxW93VemPj
         mkWI3SDr6mv2irGpIo7SiVmlYZhhpffSvUTIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712258087; x=1712862887;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbF66O3k0UzwHeaOhaqXqequZ9uqXlexXgMorz4+oEA=;
        b=QKSWT+YmamH330p25uXzt892RNdYy5ZUTyYRkOEmoTNS0RlU7i0tbvQJwbUDe/gTXZ
         jyCF+nQ+qX89f3UbWadyzhGiF7xb9J5bnGaa1iB9bmdRxiEzvfZanhorEqC7qRJrPlTg
         wjuL1UJbORHhZBQXiUAU7okdAwL1dB2PVdjx4F+bVZd/xhACL0iDINlRV3Rtc10KSB3K
         Em+lTQXuD5u1WXvYtLh1NwCaaAxFoeG9nHtaWEOr4JehR6oU6/LZRcD4YgP1NeLTwx6x
         WGwzY+uWgU+sgOG6kH2fE0406JekVc137Z7S5VH6a7B6heXcRoaOuughN/Mac5ZAraDL
         xVrA==
X-Gm-Message-State: AOJu0YxeCx8XKHmwa9ujaFjdI8PivG1YlcxW7c4mH9rNFxYhUzbz/rbI
	KlGrFy7JI7a0bzj5xKaSx3MBX3hfDJqsM7dxQl0FylyJDpOIVnX/zS6Z+HgMJevLarS/Fx/t6Q/
	aZw==
X-Google-Smtp-Source: AGHT+IFi2InwVa+XHVz4khnYhN6vTZ6qQQwqC3hjG+kfowtmt1zKweI+IMp70LOgUj7+iTGvDnxvGg==
X-Received: by 2002:a05:6a00:4614:b0:6ea:2501:d607 with SMTP id ko20-20020a056a00461400b006ea2501d607mr638178pfb.0.1712258087343;
        Thu, 04 Apr 2024 12:14:47 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id n16-20020aa79850000000b006e64ddfa71asm14385974pfq.170.2024.04.04.12.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 12:14:46 -0700 (PDT)
Message-ID: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
Date: Thu, 4 Apr 2024 12:14:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Wren Turkal <wt@penguintechs.org>
Subject: QCA6390 bluetooth doesn't work after warm boot or disable/reenable
To: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_121453_681191_828B9414 
X-CRM114-Status: GOOD (  10.39  )
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

Hey there ath11k/bluetooth folks,

I am having a pretty major problem with QCA6930 for some time (maybe a 
year or two). I have this bluetooth device:

72:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc QCA6390 
Wireless Network Adapter

This device appears to be driven by the ath11k module and others. I hope 
I am pinging the right lists.

I am using Fedora Rawhide. Fully updated yesterday. My uname reports this:

Linux braindead.localdomain 
6.9.0-0.rc2.20240402git026e680b0a08.24.fc41.x86_64 #1 SMP 
PREEMPT_DYNAMIC Tue Apr  2 17:51:18 UTC 2024 x86_64 GNU/Linux

My main bluetooth device is  a Logitech MX 3 Mac mouse that uses 
bluetooth. When bluetooth fails, so does the mouse. I have power cycle 
my laptop when that happens. I'd love to help find a fix for this.

The problem is that I cannot disable and re-enable the bluetooth on my 
system. Bluetooth also doesn't work after a warm boot. I have to power 
cycle my laptop to recover bluetooth funcitonality. I have tried the 
following:

* logging into KDE Plasma (bluetooth stops working)
* logging into GNOME (works on cold boot, fails on warm boot)

After logging into GNOME during a cold boot, I have also done "systemctl 
restart bluetooth.service". I get these journal logs during the stop;

➜  bt_kernel_bug cat journal-stop-bluetooth-service.log
Apr 04 10:14:41 braindead.localdomain NetworkManager[1120]: <info> 
[1712250881.7060] device (F0:5C:77:F2:60:FC): state change: disconnected 
-> unmanaged (reason 'removed', sys-iface-state: 'removed')
Apr 04 10:14:41 braindead.localdomain systemd[1]: Starting 
systemd-rfkill.service - Load/Save RF Kill Switch Status...
Apr 04 10:14:41 braindead.localdomain systemd[1]: Started 
systemd-rfkill.service - Load/Save RF Kill Switch Status.
Apr 04 10:14:41 braindead.localdomain audit[1]: SERVICE_START pid=1 
uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
hostname=? addr=? terminal=? res=success'
Apr 04 10:14:46 braindead.localdomain systemd[1]: 
systemd-rfkill.service: Deactivated successfully.
Apr 04 10:14:46 braindead.localdomain audit[1]: SERVICE_STOP pid=1 uid=0 
auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
hostname=? addr=? terminal=? res=success'

I get these journal logs during start:

Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: setting 
up ROME/QCA6390
Apr 04 10:15:05 braindead.localdomain systemd[1]: Starting 
systemd-rfkill.service - Load/Save RF Kill Switch Status...
Apr 04 10:15:05 braindead.localdomain systemd[1]: Started 
systemd-rfkill.service - Load/Save RF Kill Switch Status.
Apr 04 10:15:05 braindead.localdomain audit[1]: SERVICE_START pid=1 
uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
hostname=? addr=? terminal=? res=success'
Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Product ID   :0x00000010
Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA SOC 
Version  :0x400a0200
Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA ROM 
Version  :0x00000200
Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA Patch 
Version:0x00003ac0
Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
controller version 0x02000200
Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Downloading qca/htbtfw20.tlv
Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Failed to send TLV segment (-110)
Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Failed to download patch (-110)
Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: Retry BT 
power ON:0
Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: command 
0xfc00 tx timeout
Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: Reading 
QCA version information failed (-110)
Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: Retry BT 
power ON:1
Apr 04 10:15:10 braindead.localdomain systemd[1]: 
systemd-rfkill.service: Deactivated successfully.
Apr 04 10:15:10 braindead.localdomain audit[1]: SERVICE_STOP pid=1 uid=0 
auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
hostname=? addr=? terminal=? res=success'
Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: command 
0xfc00 tx timeout
Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: Reading 
QCA version information failed (-110)
Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: Retry BT 
power ON:2
Apr 04 10:15:13 braindead.localdomain bluetoothd[986]: Failed to set 
mode: Authentication Failed (0x05)
Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0: command 
0xfc00 tx timeout
Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0: Reading 
QCA version information failed (-110)
Apr 04 10:15:15 braindead.localdomain chronyd[1065]: Selected source 
204.17.205.8 (2.fedora.pool.ntp.org)
Apr 04 10:15:22 braindead.localdomain systemd[1687]: Created slice 
background.slice - User Background Tasks Slice.
Apr 04 10:15:22 braindead.localdomain systemd[1687]: Starting 
systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files and 
Directories...
Apr 04 10:15:22 braindead.localdomain systemd[1687]: Finished 
systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files and 
Directories.
Apr 04 10:15:38 braindead.localdomain audit: BPF prog-id=86 op=LOAD
Apr 04 10:15:38 braindead.localdomain systemd[1]: Starting 
plocate-updatedb.service - Update the plocate database...
Apr 04 10:15:41 braindead.localdomain systemd[1687]: Started 
vte-spawn-21527424-cb2d-479f-af17-22251e2b37a0.scope - VTE child process 
5144 launched by gnome-terminal-server process 4668.
Apr 04 10:15:53 braindead.localdomain systemd[1]: 
plocate-updatedb.service: Deactivated successfully.
Apr 04 10:15:53 braindead.localdomain systemd[1]: Finished 
plocate-updatedb.service - Update the plocate database.
Apr 04 10:15:53 braindead.localdomain systemd[1]: 
plocate-updatedb.service: Consumed 6.802s CPU time.
Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_START pid=1 
uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
msg='unit=plocate-updatedb comm="systemd" exe="/usr/lib/systemd/systemd" 
hostname=? addr=? terminal=? res=success'
Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_STOP pid=1 uid=0 
auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
msg='unit=plocate-updatedb comm="systemd" exe="/usr/lib/systemd/systemd" 
hostname=? addr=? terminal=? res=success'
Apr 04 10:15:54 braindead.localdomain audit: BPF prog-id=86 op=UNLOAD
Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
kf.idletime: Could not find any system poller plugin
Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller, 
KIdleTime): invalid nullptr parameter
Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller, 
KIdleTime): invalid nullptr parameter

There's a bunch of errors in those logs starting with these two 
seemingly important lines:

Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Failed to send TLV segment (-110)
Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
Failed to download patch (-110)

FWIW, I get similar logs after logging into KDE Plasma. I also get 
similar logs after a warm boot.

This appears to be some kind of bug in the initialization of the 
hardware. Is there any additional information I can provide to help 
troubleshoot this problem.

wt
-- 
You're more amazing than you think!

