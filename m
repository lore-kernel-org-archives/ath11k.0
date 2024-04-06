Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9875C67861
	for <ath11k@archiver.kernel.org>; Sat,  6 Apr 2024 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fofRSYfEkpuWKxHS85vk5x3j/+Rl0Y9Qjs8v5qhLDmQ=; b=14GNauW55lKrsnbpRyVG4790cp
	Xd0vvb8aVJVja8teTSRe/qb5s8uSyxiei6L2j14rrYuk12y5zkd+nDovMXjf4mSz9dO8RfPn+XHGG
	fNWjeQQpRAIeNJ1nkrb+7C4JmYduNk80YIRm5XgkT/pmIICodoI+EQizWL/iCveD0SbSw3NGT77I3
	qqIOOzq+Fc6UTS804ML60rldEHMClb73w1M/T57xtMLVhr7jEiCuxJtD+1u9nTlBUGNfduqqoJ8tf
	xong9cqoV++CCYKuJIvoqbTPMhSFwK1GZw+U1O6V+RV63mmlYSLXaLzhvhOfpn2kienvCmwxQUjet
	AefP2UFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtCdw-0000000AyLf-0ygj;
	Sat, 06 Apr 2024 20:28:04 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtCdt-0000000AyKp-1knC
	for ath11k@lists.infradead.org;
	Sat, 06 Apr 2024 20:28:03 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-22ecd83f1f2so1110263fac.1
        for <ath11k@lists.infradead.org>; Sat, 06 Apr 2024 13:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712435278; x=1713040078; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fofRSYfEkpuWKxHS85vk5x3j/+Rl0Y9Qjs8v5qhLDmQ=;
        b=LmmaXgfaLBwoicGDYQfEWYSFXzqBwJgEWVORo2nNuXJTI1TgxhAA9zkma3xHyYqssa
         ZdDsUYhVXTNpGBZQoDnvBM7x6x4yQem4nx6vjw233CVQnm5GkUGSfE0w6/NVV1J0OfFI
         6hxva/jSMN1f9rsKsLjiMBXqI1Hg/rOwg2c+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712435278; x=1713040078;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fofRSYfEkpuWKxHS85vk5x3j/+Rl0Y9Qjs8v5qhLDmQ=;
        b=VjoBUUaiOK80RnuqHzfLVghvQOTzcjbcweQbQXfywuW0KjHqiVnTNyrlZmb5jzS5D5
         cpuuRHINzpt/iCdt3HR747oFv5talBAZWXX4vIep5Q8D0mid76xKwnMMlw44q2zT97qc
         p9bvuoneFZ8j4PZSmWIEWjYI8zgT6qHpEifeudSB6RLCjjbMGa02hVxixWp8FGbQq4lr
         nd6A8Q4de+2hl58aESw7+8O6SjPEfveQuEZFzQg9TZSpkMyaI2cwX8//c6PalzcWR8bA
         ukDcjdwd6MkURM8LRc2NM8ceyBljr6kLIpoveOfDvFtBgqFiMBoE6ULiTVGrJJpUIpGC
         kinA==
X-Gm-Message-State: AOJu0YzuEMnfwRTZdGFS51xTUvCeyP2Jwf0wwZS/zekJAF/N3atrgghd
	iXW3+tzS+xhR4MIaESHx7qGIQ92O5/HaqfpAyBv/fEjQXzpvaOSs1TGVDN5hoiRgwk1wvT5A8+Z
	eeQ==
X-Google-Smtp-Source: AGHT+IE+ZpfrLGGq1lZrvg/bM9CvpZVevgAEBO+DKbm7S4oWk3xZ6c3yT9l1OvzlRJ5//g4ym+No8Q==
X-Received: by 2002:a05:6870:c10d:b0:22e:d7be:54cf with SMTP id f13-20020a056870c10d00b0022ed7be54cfmr5613264oad.37.1712435277901;
        Sat, 06 Apr 2024 13:27:57 -0700 (PDT)
Received: from [172.16.102.235] (c-98-45-34-39.hsd1.ca.comcast.net. [98.45.34.39])
        by smtp.gmail.com with ESMTPSA id fa12-20020a056a002d0c00b006e694719fa0sm1684541pfb.147.2024.04.06.13.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 13:27:57 -0700 (PDT)
Message-ID: <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
Date: Sat, 6 Apr 2024 13:27:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
To: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
In-Reply-To: <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_132801_620266_66252023 
X-CRM114-Status: GOOD (  31.16  )
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

+Kalle Valo since you have the same laptop

On 4/6/24 1:16 PM, Wren Turkal wrote:
> Sorry for the double send on the original message. I am still hoping to 
> get some help. I have added additional info below.
> 
> On 4/4/24 12:14 PM, Wren Turkal wrote:
>> Hey there ath11k/bluetooth folks,
>>
>> I am having a pretty major problem with QCA6930 for some time (maybe a 
>> year or two). I have this bluetooth device:
>>
>> 72:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc QCA6390 
>> Wireless Network Adapter
>>
>> This device appears to be driven by the ath11k module and others. I 
>> hope I am pinging the right lists.
>>
>> I am using Fedora Rawhide. Fully updated yesterday. My uname reports 
>> this:
>>
>> Linux braindead.localdomain 
>> 6.9.0-0.rc2.20240402git026e680b0a08.24.fc41.x86_64 #1 SMP 
>> PREEMPT_DYNAMIC Tue Apr  2 17:51:18 UTC 2024 x86_64 GNU/Linux
> 
> Updated today. Here's the new uname:
> 
> Linux braindead.localdomain 
> 6.9.0-0.rc2.20240405git8cb4a9a82b21.27.fc41.x86_64 #1 SMP 
> PREEMPT_DYNAMIC Fri Apr  5 16:48:07 UTC 2024 x86_64 GNU/Linux
> 
> I also noticed a new version of bluez. Here is the RPM package version: 
> bluez-5.73-3.fc41.x86_64
> 
>> My main bluetooth device is  a Logitech MX 3 Mac mouse that uses 
>> bluetooth. When bluetooth fails, so does the mouse. I have power cycle 
>> my laptop when that happens. I'd love to help find a fix for this.
>>
>> The problem is that I cannot disable and re-enable the bluetooth on my 
>> system. Bluetooth also doesn't work after a warm boot. I have to power 
>> cycle my laptop to recover bluetooth funcitonality. I have tried the 
>> following:
>>
>> * logging into KDE Plasma (bluetooth stops working)
>> * logging into GNOME (works on cold boot, fails on warm boot)
> 
> I did notice that the mouse seems to work in Plasma until a few sec 
> after I see the background image appears. I suspect that Plasma is 
> disabling and reenabling the bluetooth where Gnome does not do that.
> 
>> After logging into GNOME during a cold boot, I have also done 
>> "systemctl restart bluetooth.service". I get these journal logs during 
>> the stop;
>>
>> ➜  bt_kernel_bug cat journal-stop-bluetooth-service.log
>> Apr 04 10:14:41 braindead.localdomain NetworkManager[1120]: <info> 
>> [1712250881.7060] device (F0:5C:77:F2:60:FC): state change: 
>> disconnected -> unmanaged (reason 'removed', sys-iface-state: 'removed')
>> Apr 04 10:14:41 braindead.localdomain systemd[1]: Starting 
>> systemd-rfkill.service - Load/Save RF Kill Switch Status...
>> Apr 04 10:14:41 braindead.localdomain systemd[1]: Started 
>> systemd-rfkill.service - Load/Save RF Kill Switch Status.
>> Apr 04 10:14:41 braindead.localdomain audit[1]: SERVICE_START pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
>> hostname=? addr=? terminal=? res=success'
>> Apr 04 10:14:46 braindead.localdomain systemd[1]: 
>> systemd-rfkill.service: Deactivated successfully.
>> Apr 04 10:14:46 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
>> hostname=? addr=? terminal=? res=success'
>>
>> I get these journal logs during start:
>>
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: setting 
>> up ROME/QCA6390
>> Apr 04 10:15:05 braindead.localdomain systemd[1]: Starting 
>> systemd-rfkill.service - Load/Save RF Kill Switch Status...
>> Apr 04 10:15:05 braindead.localdomain systemd[1]: Started 
>> systemd-rfkill.service - Load/Save RF Kill Switch Status.
>> Apr 04 10:15:05 braindead.localdomain audit[1]: SERVICE_START pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
>> hostname=? addr=? terminal=? res=success'
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Product ID   :0x00000010
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA SOC 
>> Version  :0x400a0200
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA ROM 
>> Version  :0x00000200
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Patch Version:0x00003ac0
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> controller version 0x02000200
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Downloading qca/htbtfw20.tlv
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Failed to send TLV segment (-110)
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Failed to download patch (-110)
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>> BT power ON:0
>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: command 
>> 0xfc00 tx timeout
>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: Reading 
>> QCA version information failed (-110)
>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>> BT power ON:1
>> Apr 04 10:15:10 braindead.localdomain systemd[1]: 
>> systemd-rfkill.service: Deactivated successfully.
>> Apr 04 10:15:10 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
>> hostname=? addr=? terminal=? res=success'
>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: command 
>> 0xfc00 tx timeout
>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: Reading 
>> QCA version information failed (-110)
>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>> BT power ON:2
>> Apr 04 10:15:13 braindead.localdomain bluetoothd[986]: Failed to set 
>> mode: Authentication Failed (0x05)
>> Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0: command 
>> 0xfc00 tx timeout
>> Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0: Reading 
>> QCA version information failed (-110)
>> Apr 04 10:15:15 braindead.localdomain chronyd[1065]: Selected source 
>> 204.17.205.8 (2.fedora.pool.ntp.org)
>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Created slice 
>> background.slice - User Background Tasks Slice.
>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Starting 
>> systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files and 
>> Directories...
>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Finished 
>> systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files and 
>> Directories.
>> Apr 04 10:15:38 braindead.localdomain audit: BPF prog-id=86 op=LOAD
>> Apr 04 10:15:38 braindead.localdomain systemd[1]: Starting 
>> plocate-updatedb.service - Update the plocate database...
>> Apr 04 10:15:41 braindead.localdomain systemd[1687]: Started 
>> vte-spawn-21527424-cb2d-479f-af17-22251e2b37a0.scope - VTE child 
>> process 5144 launched by gnome-terminal-server process 4668.
>> Apr 04 10:15:53 braindead.localdomain systemd[1]: 
>> plocate-updatedb.service: Deactivated successfully.
>> Apr 04 10:15:53 braindead.localdomain systemd[1]: Finished 
>> plocate-updatedb.service - Update the plocate database.
>> Apr 04 10:15:53 braindead.localdomain systemd[1]: 
>> plocate-updatedb.service: Consumed 6.802s CPU time.
>> Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_START pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=plocate-updatedb comm="systemd" 
>> exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
>> Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=plocate-updatedb comm="systemd" 
>> exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
>> Apr 04 10:15:54 braindead.localdomain audit: BPF prog-id=86 op=UNLOAD
>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>> kf.idletime: Could not find any system poller plugin
>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>> qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller, 
>> KIdleTime): invalid nullptr parameter
>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>> qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller, 
>> KIdleTime): invalid nullptr parameter
>>
>> There's a bunch of errors in those logs starting with these two 
>> seemingly important lines:
>>
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Failed to send TLV segment (-110)
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Failed to download patch (-110)
> 
> Logs are mostly unchanges when restarting the bluetooth service after a 
> cold boot with the bluetooth originally working.
> 
>> FWIW, I get similar logs after logging into KDE Plasma. I also get 
>> similar logs after a warm boot.
>>
>> This appears to be some kind of bug in the initialization of the 
>> hardware. Is there any additional information I can provide to help 
>> troubleshoot this problem.
> 
> I will also say that the bluetooth appears to work throught a 
> suspend/resume cycle as long as I don't restart the bluetooth service.
> 
> Oh, and my laptop is a Dell 9310 if that helps.

Kalle, I noticed that you reported having a Dell 9310 in 2021 in a 
message on this very mailing list. Do you happen to still have that 
laptop? If so, so you still test on that laptop at all? I am curious if 
it is having the same issue I am experiencing?

> Is there any other info I could collect that might be useful?
> 
> I'm pretty new to troubleshooting a problem like this and would be happy 
> to have any advice anyone might want to share.
> 
> Thanks,
> wt
> 

-- 
You're more amazing than you think!

