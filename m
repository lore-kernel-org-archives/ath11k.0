Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kacbO-0002wn-9u
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 10:34:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: QCA6390 support on Linux
References: <87r1r4nukq.fsf@codeaurora.org> <87mtzxqdyf.fsf@codeaurora.org>
 <CAKuwtP0bSrL93LR+6_4ysc3ve0LSScCTZCCHODQxj2eG1OMGtQ@mail.gmail.com>
Date: Thu, 05 Nov 2020 12:34:37 +0200
In-Reply-To: <CAKuwtP0bSrL93LR+6_4ysc3ve0LSScCTZCCHODQxj2eG1OMGtQ@mail.gmail.com>
 (Kenny Johansson's message of "Wed, 4 Nov 2020 22:50:41 +0100")
Message-ID: <87y2jgm6rm.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Kenny Johansson <wirehell@gmail.com>
Cc: ath11k@lists.infradead.org

Kenny Johansson <wirehell@gmail.com> writes:

> I've tried it out and this time it did not work for me. (Previous
> instructions with ath11k-qca6390-bringup-202008181507 did bring it
> up.)
>
> My laptop is a Dell XPS 15" with Killer Wi-fi 6 AX500-DBS (2x2) (QCA6390)
>
> Output from dmesg:
>
> sudo dmesg | grep ath11k
> [    7.450993] ath11k_pci 0000:6c:00.0: WARNING: ath11k PCI support is
> experimental!
> [    7.451067] ath11k_pci 0000:6c:00.0: BAR 0: assigned [mem
> 0xb4200000-0xb42fffff 64bit]
> [    7.451082] ath11k_pci 0000:6c:00.0: enabling device (0000 -> 0002)
> [    7.955819] ath11k_pci 0000:6c:00.0: Respond mem req failed,
> result: 1, err: 0
> [    7.955821] ath11k_pci 0000:6c:00.0: qmi failed to respond fw mem req:-22
> [    8.004127] ath11k_pci 0000:6c:00.0: chip_id 0x0 chip_family 0xb
> board_id 0xff soc_id 0xffffffff
> [    8.004128] ath11k_pci 0000:6c:00.0: fw_version 0x101c06cc
> fw_build_timestamp 2020-06-24 19:50 fw_build_id
> [   10.081910] ath11k_pci 0000:6c:00.0 wlp108s0: renamed from wlan0
> [   13.346532] ath11k_pci 0000:6c:00.0: wmi command 20488 timeout
> [   13.346533] ath11k_pci 0000:6c:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
> [   13.346534] ath11k_pci 0000:6c:00.0: failed to set vdev 0 tx encap mode: -11
> [   16.418519] ath11k_pci 0000:6c:00.0: wmi command 20488 timeout
> [   16.418520] ath11k_pci 0000:6c:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
> [   16.418521] ath11k_pci 0000:6c:00.0: failed to set vdev 0 chainmask
> 0x3, nss 2 :-11
> [   19.490526] ath11k_pci 0000:6c:00.0: wmi command 20482 timeout
> [   19.490527] ath11k_pci 0000:6c:00.0: failed to submit WMI_VDEV_DELETE_CMDID
> [   22.818765] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
> [   22.818767] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> [   22.818769] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
> [   25.890491] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
> [   25.890493] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> [   25.890494] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
> [   38.178527] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
> [   38.178529] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> [   38.178531] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
> [   41.250526] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
>
> Please let me know if I can provide anything more.

Hmm, this is a new problem, never seen it before. Can you provide output
from 'md5sum /lib/firmware/ath11k/QCA6390/hw2.0/*'? I want to check
there's no corruption in firmware files. They should be:

a101dc90f8e876f39383b60c9da64ec4  /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
4c0781f659d2b7d6bef10a2e3d457728  /lib/firmware/ath11k/QCA6390/hw2.0/board-2.bin
d4c912a3501a3694a3f460d13de06d28  /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin

First you could try reverting commit 7fef431be9c9 ("mm/page_alloc: place
pages to tail in __free_pages_core()"), as it helped with Pavel's
problem. Though his symptoms were different so I'm not optimistic but
it's still a good idea to test it.

If that doesn't help, the next best thing would be try to pinpoint where
this got broken by testing these three commits:

fd5ad4d1e980 wcn36xx: Advertise beacon filtering support in bmps
3650b228f83a Linux 5.10-rc1
3cea11cd5e3b Linux 5.10-rc2

Commit fd5ad4d1e980 is based on v5.9-rc6 so try that first. 

In these three commits ath11k is practically identical, the only change
is a small bugfix in commit 8431350eee2e ("ath11k: Fix memory leak on
error path"). For me QCA6390 works on all these commits, I don't know
why it's failing for you.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
