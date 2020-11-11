Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcwU1-0003J5-Jf
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 20:12:46 +0000
Received: by mail-ej1-x643.google.com with SMTP id dk16so4449658ejb.12
 for <ath11k@lists.infradead.org>; Wed, 11 Nov 2020 12:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de>
 <87wnz0hr9k.fsf@codeaurora.org> <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
 <87v9ec9rk3.fsf@codeaurora.org> <87imab4slq.fsf@codeaurora.org>
 <CAHUdJJVfrBGHcT1Sjmqn=HK4=ptk3xKmAOLrF8Rd=fONUne-0A@mail.gmail.com>
 <CAHUdJJVVj3y-mHxAyUx=P51hG=NspuHe=cOWWRxEjYF0nVquyw@mail.gmail.com>
 <87a6vn4r02.fsf@codeaurora.org>
In-Reply-To: <87a6vn4r02.fsf@codeaurora.org>
From: wi nk <wink@technolu.st>
Date: Wed, 11 Nov 2020 21:12:33 +0100
Message-ID: <CAHUdJJUh2UtB07xp6fKMHaim1G+nZOLqMvpLyO=U7BMhVCD-Gw@mail.gmail.com>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, Christoph Hellwig <hch@lst.de>, Thomas Krause <thomaskrause@posteo.de>, Bjorn Helgaas <helgaas@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, ath11k@lists.infradead.org

On Wed, Nov 11, 2020 at 8:45 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> (please don't top post, makes it harder to read emails)
>
> wi nk <wink@technolu.st> writes:
>
> > Ok with 7fef431be9c9 reverted, it doesn't seem to change the initialization any:
> >
> > [    7.961867] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
> > experimental!
> > [    7.961913] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
> > 0x8e300000-0x8e3fffff 64bit]
> > [    7.961930] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
> > [    7.962009] ath11k_pci 0000:55:00.0: MSI vectors: 1
> > [    8.461553] ath11k_pci 0000:55:00.0: Respond mem req failed,
> > result: 1, err: 48
> > [    8.461556] ath11k_pci 0000:55:00.0: qmi failed to respond fw mem req:-22
>
> I also see this -22 error (see my logs in [1]), even when the firmware
> reboots normally. Do you see anything after these messages?
>
> The problem which reverting 7fef431be9c9 helps has these errors:
>
> ath11k_pci 0000:06:00.0: qmi failed memory request, err = -110
> ath11k_pci 0000:06:00.0: qmi failed to respond fw mem req:-110
>
> [1] http://lists.infradead.org/pipermail/ath11k/2020-November/000641.html
>
> > and just for thoroughness, here are my firmware file checksums (sha256):
> >
> > 9cc48d1dce819ead4112c6a8051c51e4d75e2b11f99ba9d8738cf8108967b70e  amss.bin
> > 5081930c3b207f8ed82ff250f9b90fb77e87b2a92c3cf80ad020a58dea0bc5b7  board.bin
> > 596482f780d21645f72a48acd9aed6c6fc8cf2d039ac31552a19800674d253cc  m3.bin
>
> But these do not look same. I have:
>
> a101dc90f8e876f39383b60c9da64ec4  /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
> 4c0781f659d2b7d6bef10a2e3d457728  /lib/firmware/ath11k/QCA6390/hw2.0/board-2.bin
> d4c912a3501a3694a3f460d13de06d28  /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin
>
> Download them like this:
>
> wget https://github.com/kvalo/ath11k-firmware/raw/master/QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/amss.bin
>
> wget https://github.com/kvalo/ath11k-firmware/raw/master/QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/m3.bin
>
> wget https://github.com/kvalo/ath11k-firmware/raw/master/QCA6390/hw2.0/board-2.bin
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Sorry for the top posting, web email has ruined my mailing list
etiquette.  It seems having the correct firmware in place has caused
some forward movement.  I now see this:

[    8.513210] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
experimental!
[    8.513251] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
0x8e300000-0x8e3fffff 64bit]
[    8.513269] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
[    8.513348] ath11k_pci 0000:55:00.0: MSI vectors: 1
[    8.789499] ath11k_pci 0000:55:00.0: Respond mem req failed,
result: 1, err: 0
[    8.789500] ath11k_pci 0000:55:00.0: qmi failed to respond fw mem req:-22
[    8.794236] ath11k_pci 0000:55:00.0: req mem_seg[0] 0x28100000 524288 1
[    8.794237] ath11k_pci 0000:55:00.0: req mem_seg[1] 0x28180000 524288 1
[    8.794238] ath11k_pci 0000:55:00.0: req mem_seg[2] 0x28200000 524288 1
[    8.794238] ath11k_pci 0000:55:00.0: req mem_seg[3] 0x28280000 294912 1
[    8.794239] ath11k_pci 0000:55:00.0: req mem_seg[4] 0x28300000 524288 1
[    8.794239] ath11k_pci 0000:55:00.0: req mem_seg[5] 0x28380000 524288 1
[    8.794240] ath11k_pci 0000:55:00.0: req mem_seg[6] 0x27c00000 458752 1
[    8.794240] ath11k_pci 0000:55:00.0: req mem_seg[7] 0x27c80000 131072 1
[    8.794240] ath11k_pci 0000:55:00.0: req mem_seg[8] 0x27d00000 524288 4
[    8.794241] ath11k_pci 0000:55:00.0: req mem_seg[9] 0x27d80000 360448 4
[    8.794241] ath11k_pci 0000:55:00.0: req mem_seg[10] 0x28578000 16384 1
[    8.807053] ath11k_pci 0000:55:00.0: chip_id 0x0 chip_family 0xb
board_id 0xff soc_id 0xffffffff
[    8.807054] ath11k_pci 0000:55:00.0: fw_version 0x101c06cc
fw_build_timestamp 2020-06-24 19:50 fw_build_id
[    8.910984] ath11k_pci 0000:55:00.0: Unknown eventid: 0x16005
[    9.446566] ath11k_pci 0000:55:00.0 wlp85s0: renamed from wlan0
[   11.296620] ath11k_pci 0000:55:00.0: Unknown eventid: 0x1d00a
[   22.088028] ath11k_pci 0000:55:00.0: wmi command 12290 timeout
[   22.088030] ath11k_pci 0000:55:00.0: failed to send WMI_STOP_SCAN_CMDID
[   22.088031] ath11k_pci 0000:55:00.0: failed to stop wmi scan: -11
[   22.088032] ath11k_pci 0000:55:00.0: failed to stop scan: -11
[   22.088033] ath11k_pci 0000:55:00.0: failed to start hw scan: -110
[   28.232066] ath11k_pci 0000:55:00.0: wmi command 12289 timeout
[   28.232069] ath11k_pci 0000:55:00.0: failed to send WMI_START_SCAN_CMDID
[   28.232073] ath11k_pci 0000:55:00.0: failed to start hw scan: -11
[   38.216054] ath11k_pci 0000:55:00.0: wmi command 12289 timeout
[   38.216057] ath11k_pci 0000:55:00.0: failed to send WMI_START_SCAN_CMDID
[   38.216061] ath11k_pci 0000:55:00.0: failed to start hw scan: -11
[   51.783961] ath11k_pci 0000:55:00.0: wmi command 12289 timeout
[   51.783965] ath11k_pci 0000:55:00.0: failed to send WMI_START_SCAN_CMDID
[   51.783970] ath11k_pci 0000:55:00.0: failed to start hw scan: -11
[   71.695627] ath11k_pci 0000:55:00.0: wmi command 12289 timeout
[   71.695629] ath11k_pci 0000:55:00.0: failed to send WMI_START_SCAN_CMDID
[   71.695630] ath11k_pci 0000:55:00.0: failed to start hw scan: -11
[  100.864905] ath11k_pci 0000:55:00.0: wmi command 12289 timeout
[  100.864909] ath11k_pci 0000:55:00.0: failed to send WMI_START_SCAN_CMDID
[  100.864913] ath11k_pci 0000:55:00.0: failed to start hw scan: -11
[  107.306896] mhi 0000:55:00.0: Device failed to exit MHI Reset state
[  143.868561] ath11k_pci 0000:55:00.0: wmi command 12289 timeout
[  143.868564] ath11k_pci 0000:55:00.0: failed to send WMI_START_SCAN_CMDID
[  143.868566] ath11k_pci 0000:55:00.0: failed to start hw scan: -11
[  199.464250] mhi 0000:55:00.0: Device failed to exit MHI Reset state
<snip>

Occasionally my kernel is panic'ing at random spots (this is probably
related to the other patch I guess), but I do have a bit of an adapter
now ,ifconfig shows it.  I don't seem to be able to find any networks
with it however.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
