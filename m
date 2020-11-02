Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZeS9-0000gA-Da
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 18:21:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b9so5122657edu.10
 for <ath11k@lists.infradead.org>; Mon, 02 Nov 2020 10:21:12 -0800 (PST)
Subject: Re: PROBLEM: unable to get QCA6390 to work
References: <fa22cf0f-3bac-add6-8c71-6f6cad5206d8@gmail.com>
 <87lffjodu7.fsf@codeaurora.org>
From: Pavel Procopiuc <pavel.procopiuc@gmail.com>
Message-ID: <fa338986-8de4-fde1-6805-d46793c947e4@gmail.com>
Date: Mon, 2 Nov 2020 19:21:10 +0100
MIME-Version: 1.0
In-Reply-To: <87lffjodu7.fsf@codeaurora.org>
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

Ah, my bad, I've now renamed the board-2.bin file, the md5's match yours. But it doesn't seem to have a positive effect. 
After a reboot I'm still getting the same error messages:

# journalctl -b | grep -iP '05:00|ath11k'
Nov 02 18:52:58 razor kernel: pci 0000:05:00.0: [17cb:1101] type 00 class 0x028000
Nov 02 18:52:58 razor kernel: pci 0000:05:00.0: reg 0x10: [mem 0xd2100000-0xd21fffff 64bit]
Nov 02 18:52:58 razor kernel: pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
Nov 02 18:52:58 razor kernel: pci 0000:05:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 
0000:00:1c.1 (capable of 7.876 Gb/s with 8.0 GT/s PCIe x1 link)
Nov 02 18:52:58 razor kernel: pci 0000:05:00.0: Adding to iommu group 21
Nov 02 18:53:20 razor dbus-daemon[743]: [system] Activating via systemd: service name='net.reactivated.Fprint' 
unit='fprintd.service' requested by ':1.73' (uid=0 pid=2476 comm="sudo modprobe ath11k_pci ")
Nov 02 18:53:23 razor sudo[2476]:      pro : TTY=pts/1 ; PWD=/home/pro ; USER=root ; COMMAND=/sbin/modprobe ath11k_pci
Nov 02 18:53:23 razor kernel: ath11k_pci 0000:05:00.0: WARNING: ath11k PCI support is experimental!
Nov 02 18:53:23 razor kernel: ath11k_pci 0000:05:00.0: BAR 0: assigned [mem 0xd2100000-0xd21fffff 64bit]
Nov 02 18:53:23 razor kernel: ath11k_pci 0000:05:00.0: enabling device (0000 -> 0002)
Nov 02 18:53:23 razor kernel: mhi 0000:05:00.0: Requested to power ON
Nov 02 18:53:23 razor kernel: mhi 0000:05:00.0: Power on setup success
Nov 02 18:53:23 razor kernel: ath11k_pci 0000:05:00.0: Respond mem req failed, result: 1, err: 0
Nov 02 18:53:23 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-22
Nov 02 18:53:29 razor kernel: ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
Nov 02 18:53:29 razor kernel: ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
Nov 02 18:54:54 razor kernel: mhi 0000:05:00.0: Device failed to exit MHI Reset state

# md5sum /lib/firmware/ath11k/QCA6390/hw2.0/*
a101dc90f8e876f39383b60c9da64ec4  /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
4c0781f659d2b7d6bef10a2e3d457728  /lib/firmware/ath11k/QCA6390/hw2.0/board-2.bin
d4c912a3501a3694a3f460d13de06d28  /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin

Op 02.11.2020 om 18:42 schreef Kalle Valo:
> Pavel Procopiuc <pavel.procopiuc@gmail.com> writes:
> 
>> Hi,
>>
>> I'm unable to get QCA6390 to work on kernel 5.10-rc2.
>>
>> I have a Dell XPS 17 laptop with the QCA6390 device and I'm trying to
>> get it to work using 5.10-rc2 kernel. So far I'm getting firmware
>> errors in the log. For the kernel setup and firmware files I was
>> following the guide from
>> https://www.spinics.net/lists/linux-wireless/msg203111.html.
>>
>> * The current firmware repo structure is a bit different so I'm using:
>> QCA6390/hw2.0/board-2.bin -> /lib/firmware/ath11k/QCA6390/hw2.0/board.bin
>> QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/amss.bin
>> -> /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
>> QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/m3.bin
>> -> /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin
> 
> Can you do 'md5sum /lib/firmware/ath11k/QCA6390/hw2.0/*' and send the
> output? Currently ath11k does not check the firmware files in any way
> and I want to make sure they are not corrupted.
> 
> I have:
> 
> a101dc90f8e876f39383b60c9da64ec4  amss.bin
> d4c912a3501a3694a3f460d13de06d28  m3.bin
> 4c0781f659d2b7d6bef10a2e3d457728  board-2.bin
> 
> Ah, now I noticed that you renamed board-2.bin to board.bin. But you
> need to keep the file as board-2.bin, board-2.bin and board.bin are not
> compatible. I need to send new instructions with the new board-2.bin
> file.
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
