Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavAX-0005ni-FJ
 for ath11k@lists.infradead.org; Fri, 06 Nov 2020 06:24:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: QCA6390 support on Linux
References: <87r1r4nukq.fsf@codeaurora.org> <87mtzxqdyf.fsf@codeaurora.org>
 <CAKuwtP0bSrL93LR+6_4ysc3ve0LSScCTZCCHODQxj2eG1OMGtQ@mail.gmail.com>
 <87y2jgm6rm.fsf@codeaurora.org>
 <CAKuwtP2MsNfTt5oJPrK3PdP2p9bkFhSiGQcdjZtKaXdpGU-Rjw@mail.gmail.com>
Date: Fri, 06 Nov 2020 08:24:11 +0200
In-Reply-To: <CAKuwtP2MsNfTt5oJPrK3PdP2p9bkFhSiGQcdjZtKaXdpGU-Rjw@mail.gmail.com>
 (Kenny Johansson's message of "Thu, 5 Nov 2020 22:47:16 +0100")
Message-ID: <87ft5nm29g.fsf@codeaurora.org>
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

> Short story:
> * Firmware matches
> * Reverting 7fef431be9c9 does not work
> * fd5ad4d1e980 works
> * 3650b228f83a does not work

An excellent summary, makes it a lot easier to understand what's
happening :)

> Details:
>
> Firmware matches:
> ~/qca$ md5sum /lib/firmware/ath11k/QCA6390/hw2.0/*
> a101dc90f8e876f39383b60c9da64ec4  /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
> 4c0781f659d2b7d6bef10a2e3d457728  /lib/firmware/ath11k/QCA6390/hw2.0/board-2.bin
> d4c912a3501a3694a3f460d13de06d28  /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin

Good, we can rule out firmware corruption then.

> The commit 3650b228f83a worked
>
> [    7.452884] ath11k_pci 0000:6c:00.0: WARNING: ath11k PCI support is
> experimental!
> [    7.452926] ath11k_pci 0000:6c:00.0: BAR 0: assigned [mem
> 0xb4200000-0xb42fffff 64bit]
> [    7.452939] ath11k_pci 0000:6c:00.0: enabling device (0000 -> 0002)
> [    7.941932] ath11k_pci 0000:6c:00.0: Respond mem req failed,
> result: 1, err: 0
> [    7.941933] ath11k_pci 0000:6c:00.0: qmi failed to respond fw mem req:-22
> [    7.952897] ath11k_pci 0000:6c:00.0: chip_id 0x0 chip_family 0xb
> board_id 0xff soc_id 0xffffffff
> [    7.952897] ath11k_pci 0000:6c:00.0: fw_version 0x101c06cc
> fw_build_timestamp 2020-06-24 19:50 fw_build_id
> [    8.156172] ath11k_pci 0000:6c:00.0 wlp108s0: renamed from wlan0

I think you have a typo here and you mean that commit fd5ad4d1e980
worked, right? The one which is based on v5.9-rc6:

fd5ad4d1e980 wcn36xx: Advertise beacon filtering support in bmps

> I will try to use fd5ad4d1e980 a bit more to make sure it is not
> something intermittent, though I suspect not as the bringup-branch
> seemed to work consistently, while the latest seems consistently
> broken for me.

Yes, it's a good idea to rule out all intermittent issues. This is a
weird problem and any randomness might confuse the testing results.

Even if your symptoms are different I suspect this is related to Pavel's
problem, where the number one suspect is high physical addresses are
causing problems:

http://lists.infradead.org/pipermail/ath11k/2020-November/000556.html

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
