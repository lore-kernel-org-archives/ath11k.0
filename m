Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZw6g-0003Nz-S1
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 13:12:15 +0000
Received: by mail-ej1-x643.google.com with SMTP id i19so13001225ejx.9
 for <ath11k@lists.infradead.org>; Tue, 03 Nov 2020 05:12:12 -0800 (PST)
Subject: Re: PROBLEM: unable to get QCA6390 to work
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
 <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
 <c9cc0ec6-4dda-2608-3575-0e6dfb6d0852@gmail.com>
 <87ft5rszcs.fsf@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <c25b5029-4f21-c621-1416-3646d90b6a7f@gmail.com>
Date: Tue, 3 Nov 2020 14:12:10 +0100
MIME-Version: 1.0
In-Reply-To: <87ft5rszcs.fsf@codeaurora.org>
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

I have another probably interesting finding. I was trying to create a QCA6390-enabled kernel with the latest stable 
version 5.9.3. But I only succeeded in making 5.9.1 work, in 5.9.2 loading the driver resulted in a quite weird behavior:

# journalctl -b-1 | grep -iP '05:00|ath11k|Linux version'
Nov 03 10:11:45 razor kernel: Linux version 5.9.2-gentoo-wt-ath (root@razor) (gcc (Gentoo 9.3.0-r1 p3) 9.3.0, GNU ld 
(Gentoo 2.34 p6) 2.34.0) #1 SMP Tue Nov 3 09:55:08 CET 2020
Nov 03 10:11:45 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
Nov 03 10:11:45 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
Nov 03 10:11:45 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Nov 03 10:11:45 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 
0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
Nov 03 10:11:45 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
Nov 03 10:12:35 razor dbus-daemon[694]: [system] Activating via systemd: service name='net.reactivated.Fprint' 
unit='fprintd.service' requested by ':1.73' (uid=0 pid=2258 comm="sudo modprobe ath11k_pci ")
Nov 03 10:12:39 razor sudo[2258]:      pro : TTY=pts/1 ; PWD=/home/pro ; USER=root ; COMMAND=/sbin/modprobe ath11k_pci
Nov 03 10:12:39 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
Nov 03 10:12:39 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
Nov 03 10:12:39 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
Nov 03 10:12:39 razor kernel: mhi 0000:05:00.0: Requested to power ON
Nov 03 10:12:39 razor kernel: mhi 0000:05:00.0: Power on setup success

That's it, it didn't go any further, no wifi device appeared. But the patch for 5.9.2 is quite big and there is a number 
of non-obvious conflicts so that might be just me resolving them incorrectly.

Also on 5.9.1 with the working driver I'm seeing those lines in the log:
* appears right after loading the kernel module:
Nov 03 09:32:57 razor kernel: ath11k_pci 0000:05:00.0: Unknown eventid: 0x16005

* seems to be related to the disconnection from the access point:
Nov 03 09:33:05 razor kernel: ath11k_pci 0000:05:00.0: Unknown eventid: 0x1d00a

* some boots I see a bunch of those in a row, some boots it's not there at all, seems to be happening after successful 
connect the the AP:
Nov 03 09:33:20 razor kernel: ath11k_pci 0000:05:00.0: Unknown eventid: 0x4005

There is not many of those, nothing to worry about, but just wanted to let you know.

Op 03.11.2020 om 07:56 schreef Kalle Valo:
> Interesting, and worrisome. I have not yet tested v5.10-rc releases,
> I'll do that ASAP and try to reproduce your issue. If I see the same
> problem then it should be possible to bisect the issue pretty easily.
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
