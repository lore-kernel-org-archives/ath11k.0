Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcw4V-0001Cr-MW
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 19:46:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de>
 <87wnz0hr9k.fsf@codeaurora.org> <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
 <87v9ec9rk3.fsf@codeaurora.org> <87imab4slq.fsf@codeaurora.org>
 <CAHUdJJVfrBGHcT1Sjmqn=HK4=ptk3xKmAOLrF8Rd=fONUne-0A@mail.gmail.com>
 <CAHUdJJVVj3y-mHxAyUx=P51hG=NspuHe=cOWWRxEjYF0nVquyw@mail.gmail.com>
Date: Wed, 11 Nov 2020 21:45:17 +0200
In-Reply-To: <CAHUdJJVVj3y-mHxAyUx=P51hG=NspuHe=cOWWRxEjYF0nVquyw@mail.gmail.com>
 (wi nk's message of "Wed, 11 Nov 2020 20:30:33 +0100")
Message-ID: <87a6vn4r02.fsf@codeaurora.org>
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
To: wi nk <wink@technolu.st>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, Christoph Hellwig <hch@lst.de>, Thomas Krause <thomaskrause@posteo.de>, Bjorn Helgaas <helgaas@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, ath11k@lists.infradead.org

(please don't top post, makes it harder to read emails)

wi nk <wink@technolu.st> writes:

> Ok with 7fef431be9c9 reverted, it doesn't seem to change the initialization any:
>
> [    7.961867] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
> experimental!
> [    7.961913] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
> 0x8e300000-0x8e3fffff 64bit]
> [    7.961930] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
> [    7.962009] ath11k_pci 0000:55:00.0: MSI vectors: 1
> [    8.461553] ath11k_pci 0000:55:00.0: Respond mem req failed,
> result: 1, err: 48
> [    8.461556] ath11k_pci 0000:55:00.0: qmi failed to respond fw mem req:-22

I also see this -22 error (see my logs in [1]), even when the firmware
reboots normally. Do you see anything after these messages?

The problem which reverting 7fef431be9c9 helps has these errors:

ath11k_pci 0000:06:00.0: qmi failed memory request, err = -110
ath11k_pci 0000:06:00.0: qmi failed to respond fw mem req:-110

[1] http://lists.infradead.org/pipermail/ath11k/2020-November/000641.html

> and just for thoroughness, here are my firmware file checksums (sha256):
>
> 9cc48d1dce819ead4112c6a8051c51e4d75e2b11f99ba9d8738cf8108967b70e  amss.bin
> 5081930c3b207f8ed82ff250f9b90fb77e87b2a92c3cf80ad020a58dea0bc5b7  board.bin
> 596482f780d21645f72a48acd9aed6c6fc8cf2d039ac31552a19800674d253cc  m3.bin

But these do not look same. I have:

a101dc90f8e876f39383b60c9da64ec4  /lib/firmware/ath11k/QCA6390/hw2.0/amss.bin
4c0781f659d2b7d6bef10a2e3d457728  /lib/firmware/ath11k/QCA6390/hw2.0/board-2.bin
d4c912a3501a3694a3f460d13de06d28  /lib/firmware/ath11k/QCA6390/hw2.0/m3.bin

Download them like this:

wget https://github.com/kvalo/ath11k-firmware/raw/master/QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/amss.bin

wget https://github.com/kvalo/ath11k-firmware/raw/master/QCA6390/hw2.0/1.0.1/WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1/m3.bin

wget https://github.com/kvalo/ath11k-firmware/raw/master/QCA6390/hw2.0/board-2.bin

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
