Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd18B-0006Q4-8n
 for ath11k@lists.infradead.org; Thu, 12 Nov 2020 01:10:32 +0000
Received: by mail-ed1-x541.google.com with SMTP id p93so4316407edd.7
 for <ath11k@lists.infradead.org>; Wed, 11 Nov 2020 17:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de>
 <87wnz0hr9k.fsf@codeaurora.org> <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
 <87v9ec9rk3.fsf@codeaurora.org> <87imab4slq.fsf@codeaurora.org>
 <b2129a70db2b36c5015b4143a839f47dfc3153af.camel@seibold.net>
 <CAHUdJJVp5r55NtE+BNz5XGtnaks6mDKQBFodz63DdULBVhD0Lg@mail.gmail.com>
In-Reply-To: <CAHUdJJVp5r55NtE+BNz5XGtnaks6mDKQBFodz63DdULBVhD0Lg@mail.gmail.com>
From: wi nk <wink@technolu.st>
Date: Thu, 12 Nov 2020 02:10:18 +0100
Message-ID: <CAHUdJJXRDKs9NRugUAFgNr51DJ=OcssuiV8ST5CaV1CKiNTFfA@mail.gmail.com>
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
To: Stefani Seibold <stefani@seibold.net>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Thomas Krause <thomaskrause@posteo.de>, Bjorn Helgaas <helgaas@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>, Kalle Valo <kvalo@codeaurora.org>

I've yet to see any instability after 45 minutes of exercising it, I
do see a couple of messages that came out of the driver:

[    8.963389] ath11k_pci 0000:55:00.0: Unknown eventid: 0x16005
[   11.342317] ath11k_pci 0000:55:00.0: Unknown eventid: 0x1d00a

then when it associates:

[   16.718895] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
[   16.722636] wlp85s0: authenticated
[   16.724150] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
[   16.726486] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
(capab=0x411 status=0 aid=8)
[   16.738443] wlp85s0: associated
[   16.764966] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready

The adapter is achieving around 500 mbps on my gigabit connection, my
2018 mbp sees around 650, so it's doing pretty well so far.

Stefani - when you applied the patch that Kalle shared, which branch
did you apply it to?  I applied it to ath11k-qca6390-bringup and when
I revert 7fef431be9c9 there is a small merge conflict I needed to
resolve.  I wonder if either the starting branch, or your chosen
resolution are related to the instability you see (or I'm just lucky
so far! :)).

On Thu, Nov 12, 2020 at 1:24 AM wi nk <wink@technolu.st> wrote:
>
> On Wed, Nov 11, 2020 at 11:02 PM Stefani Seibold <stefani@seibold.net> wrote:
> >
> > On Wed, 2020-11-11 at 21:10 +0200, Kalle Valo wrote:
> > >
> > > The proof of concept patch for v5.10-rc2 is here:
> > >
> > > https://patchwork.kernel.org/project/linux-wireless/patch/1605121102-14352-1-git-send-email-kvalo@codeaurora.org/
> > >
> > > Hopefully it makes it possible to boot the firmware now. But this is
> > > a
> > > quick hack and most likely buggy, so keep your expectations low :)
> > >
> > > In case there are these warnings during firmware initialisation:
> > >
> > > ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
> > > ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
> > >
> > > Try reverting this commit:
> > >
> > > 7fef431be9c9 mm/page_alloc: place pages to tail in
> > > __free_pages_core()
> > >
> > > That's another issue which is debugged here:
> > >
> > > http://lists.infradead.org/pipermail/ath11k/2020-November/000550.html
> > >
> >
> > Applying the patch and revert patch 7fef431be9c9 worked on the first
> > glance.
> >
> > After a couple of minutes the connection get broken. The kernel log
> > shows the following error:
> >
> > ath11k_pci 0000:55:00.0: wmi command 16387 timeout
> > ath11k_pci 0000:55:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> > ath11k_pc
> > i 0000:55:00.0: failed to enable PMF QOS: (-11
> >
> > It is also not possible to unload the ath11k_pci, rmmod will hang.
> >
> >
>
> I can confirm the same behavior as Stefani so far.  After applying the
> patch, and reverting commit 7fef431be9c9, I am able to connect to a
> network.  It hasn't disconnected yet (I'm sending this email via that
> connection).  I'll report what I find next.
>
> Thanks again for the help!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
