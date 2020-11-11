Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcvpN-0007mt-R6
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 19:30:46 +0000
Received: by mail-ed1-x536.google.com with SMTP id cq7so3540770edb.4
 for <ath11k@lists.infradead.org>; Wed, 11 Nov 2020 11:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de>
 <87wnz0hr9k.fsf@codeaurora.org> <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
 <87v9ec9rk3.fsf@codeaurora.org> <87imab4slq.fsf@codeaurora.org>
 <CAHUdJJVfrBGHcT1Sjmqn=HK4=ptk3xKmAOLrF8Rd=fONUne-0A@mail.gmail.com>
In-Reply-To: <CAHUdJJVfrBGHcT1Sjmqn=HK4=ptk3xKmAOLrF8Rd=fONUne-0A@mail.gmail.com>
From: wi nk <wink@technolu.st>
Date: Wed, 11 Nov 2020 20:30:33 +0100
Message-ID: <CAHUdJJVVj3y-mHxAyUx=P51hG=NspuHe=cOWWRxEjYF0nVquyw@mail.gmail.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Thomas Krause <thomaskrause@posteo.de>, Bjorn Helgaas <helgaas@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>

Ok with 7fef431be9c9 reverted, it doesn't seem to change the initialization any:

[    7.961867] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
experimental!
[    7.961913] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
0x8e300000-0x8e3fffff 64bit]
[    7.961930] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
[    7.962009] ath11k_pci 0000:55:00.0: MSI vectors: 1
[    8.461553] ath11k_pci 0000:55:00.0: Respond mem req failed,
result: 1, err: 48
[    8.461556] ath11k_pci 0000:55:00.0: qmi failed to respond fw mem req:-22

and just for thoroughness, here are my firmware file checksums (sha256):

9cc48d1dce819ead4112c6a8051c51e4d75e2b11f99ba9d8738cf8108967b70e  amss.bin
5081930c3b207f8ed82ff250f9b90fb77e87b2a92c3cf80ad020a58dea0bc5b7  board.bin
596482f780d21645f72a48acd9aed6c6fc8cf2d039ac31552a19800674d253cc  m3.bin


Thanks!


On Wed, Nov 11, 2020 at 8:24 PM wi nk <wink@technolu.st> wrote:
>
> Kalle,
>
>   Thanks so much for your and your teams efforts.  I've applied the
> patch, and I'm receiving some errors similar to what you thought might
> occur:
>
> [    7.802756] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
> experimental!
> [    7.802797] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
> 0x8e300000-0x8e3fffff 64bit]
> [    7.802815] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
> [    7.803291] ath11k_pci 0000:55:00.0: MSI vectors: 1
> [    8.172623] ath11k_pci 0000:55:00.0: Respond mem req failed,
> result: 1, err: 48
> [    8.172624] ath11k_pci 0000:55:00.0: qmi failed to respond fw mem req:-22
>
> I've reverted the commit you mentioned and am rebuilding now.  I'll
> test in a few minutes.
>
> Thanks!
>
> On Wed, Nov 11, 2020 at 8:10 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> >
> > Kalle Valo <kvalo@codeaurora.org> writes:
> >
> > > Thomas Krause <thomaskrause@posteo.de> writes:
> > >
> > >> Am 10.11.20 um 09:33 schrieb Kalle Valo:
> > >>>
> > >>>> I was told that on Dell XPS 15 (with a working QCA6390 setup) there's a
> > >>>> separate "Virtualisation" setting in BIOS. See if you have that and try
> > >>>> enabling it.
> > >>> I was informed about another setting to test: try disabling "Enable
> > >>> Secure Boot" in the BIOS. I don't know yet why it would help, but that's
> > >>> what few people have recommended.
> > >>>
> > >>> Please let me know how it goes.
> > >>>
> > >> I have two options under "Virtualization" in the BIOS: "Enable Intel
> > >> Virtualization Technology (VT)" and "VT for Direct I/O". Both were
> > >> enabled. Secure boot was also turned off. BIOS version is also at the
> > >> most current version 1.1.1.
> > >
> > > This is good to know, thanks for testing. Now we have explored all
> > > possible BIOS options as I know of.
> > >
> > >> Because of the dmesg errors Thomas Gleixner mentioned, I assume it
> > >> would be best to contact Dell directly (even if I'm not sure if and
> > >> how fast they will respond).
> > >
> > > I have asked our people to report this to Dell, but no response yet.
> > >
> > >> If the driver would manage to work with only 1 vector, I assume this
> > >> would also make it work on my configuration, even with possible
> > >> performance hits.
> > >
> > > This is the workaround we are working on at the moment. There's now a
> > > proof of concept patch but I'm not certain if it will work. I'll post it
> > > as soon as I can and will provide the link in this thread.
> >
> > The proof of concept patch for v5.10-rc2 is here:
> >
> > https://patchwork.kernel.org/project/linux-wireless/patch/1605121102-14352-1-git-send-email-kvalo@codeaurora.org/
> >
> > Hopefully it makes it possible to boot the firmware now. But this is a
> > quick hack and most likely buggy, so keep your expectations low :)
> >
> > In case there are these warnings during firmware initialisation:
> >
> > ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
> > ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
> >
> > Try reverting this commit:
> >
> > 7fef431be9c9 mm/page_alloc: place pages to tail in __free_pages_core()
> >
> > That's another issue which is debugged here:
> >
> > http://lists.infradead.org/pipermail/ath11k/2020-November/000550.html
> >
> > --
> > https://patchwork.kernel.org/project/linux-wireless/list/
> >
> > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
