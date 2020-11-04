Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaQhD-0003xD-OJ
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 21:52:02 +0000
Received: by mail-pl1-x644.google.com with SMTP id b19so10941668pld.0
 for <ath11k@lists.infradead.org>; Wed, 04 Nov 2020 13:51:58 -0800 (PST)
MIME-Version: 1.0
References: <87r1r4nukq.fsf@codeaurora.org> <87mtzxqdyf.fsf@codeaurora.org>
In-Reply-To: <87mtzxqdyf.fsf@codeaurora.org>
From: Kenny Johansson <wirehell@gmail.com>
Date: Wed, 4 Nov 2020 22:50:41 +0100
Message-ID: <CAKuwtP0bSrL93LR+6_4ysc3ve0LSScCTZCCHODQxj2eG1OMGtQ@mail.gmail.com>
Subject: Re: ath11k: QCA6390 support on Linux
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
Cc: ath11k@lists.infradead.org

Hi

I've tried it out and this time it did not work for me. (Previous
instructions with ath11k-qca6390-bringup-202008181507 did bring it
up.)

My laptop is a Dell XPS 15" with Killer Wi-fi 6 AX500-DBS (2x2) (QCA6390)

Output from dmesg:

sudo dmesg | grep ath11k
[    7.450993] ath11k_pci 0000:6c:00.0: WARNING: ath11k PCI support is
experimental!
[    7.451067] ath11k_pci 0000:6c:00.0: BAR 0: assigned [mem
0xb4200000-0xb42fffff 64bit]
[    7.451082] ath11k_pci 0000:6c:00.0: enabling device (0000 -> 0002)
[    7.955819] ath11k_pci 0000:6c:00.0: Respond mem req failed,
result: 1, err: 0
[    7.955821] ath11k_pci 0000:6c:00.0: qmi failed to respond fw mem req:-22
[    8.004127] ath11k_pci 0000:6c:00.0: chip_id 0x0 chip_family 0xb
board_id 0xff soc_id 0xffffffff
[    8.004128] ath11k_pci 0000:6c:00.0: fw_version 0x101c06cc
fw_build_timestamp 2020-06-24 19:50 fw_build_id
[   10.081910] ath11k_pci 0000:6c:00.0 wlp108s0: renamed from wlan0
[   13.346532] ath11k_pci 0000:6c:00.0: wmi command 20488 timeout
[   13.346533] ath11k_pci 0000:6c:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[   13.346534] ath11k_pci 0000:6c:00.0: failed to set vdev 0 tx encap mode: -11
[   16.418519] ath11k_pci 0000:6c:00.0: wmi command 20488 timeout
[   16.418520] ath11k_pci 0000:6c:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[   16.418521] ath11k_pci 0000:6c:00.0: failed to set vdev 0 chainmask
0x3, nss 2 :-11
[   19.490526] ath11k_pci 0000:6c:00.0: wmi command 20482 timeout
[   19.490527] ath11k_pci 0000:6c:00.0: failed to submit WMI_VDEV_DELETE_CMDID
[   22.818765] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[   22.818767] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[   22.818769] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[   25.890491] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[   25.890493] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[   25.890494] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[   38.178527] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[   38.178529] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[   38.178531] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[   41.250526] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout

Please let me know if I can provide anything more.

On Wed, Nov 4, 2020 at 5:33 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Kalle Valo <kvalo@codeaurora.org> writes:
>
> > some of the Dell XPS 15 9500 models have QCA6390 Wi-Fi 6 device. ath11k
> > will be the driver to support QCA6390 and the plan is that Linux v5.10
> > (most likely released end of December) will be the first release to
> > support it.
> >
> > But as everything is not ready yet I recommend people to test
> > ath11k-qca6390-bringup branch, and specifically tag
> > ath11k-qca6390-bringup-202008181507. Below are instructions how to
> > install kernel and firmware.
> >
> > Do note that this is still experimental, there will be bugs but at least
> > it should be possible to connect to an AP and have connectivity.
> >
> > Please send all questions, comments and bug reports to
> > ath11k@lists.infradead.org list. I do not have time to reply to private
> > email. I have Bcced people who have contacted me privately.
>
> Some updates:
>
> * QCA6390 support is now in v5.10-rc2
>
> * pull request to linux-firmware sent, not yet pulled
>
> * board-2.bin should be now used instead of board.bin
>
> * there was some reorganisation in ath11k-firmware
>
> Here are updated instructions on how to test ath11k:
>
> # clone kernel
> git clone -b v5.10-rc2 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>
> # clone firmware
> git clone https://github.com/kvalo/ath11k-firmware.git
>
> # Ensure below options are selected in the kernel
> cd linux
> make menuconfig
> --> Select Device drivers
>         --> Network device support
>                 --> Wireless LAN
>                         --> Enable as below
>                                 <M> Qualcomm Technologies 11ax chipset support
>                                 <M>       Atheros ath11k PCI support
>                                 [*]       QCA ath11k debugging
>                                 [*]       QCA ath11k debugfs support
>                                 [*]       ath11k tracing support
>                                 [*]     QCA ath11k spectral scan support
>
> # Build and install the kernel and kernel modules
>
> # Install firmware
> cd ../ath11k-firmware
> sudo mkdir -p /lib/firmware/ath11k/QCA6390/hw2.0/
> sudo cp QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/*.bin /lib/firmware/ath11k/QCA6390/hw2.0/
> sudo cp QCA6390/hw2.0/board-2.bin /lib/firmware/ath11k/QCA6390/hw2.0/
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
