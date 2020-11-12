Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd0PT-0002OM-2J
 for ath11k@lists.infradead.org; Thu, 12 Nov 2020 00:24:23 +0000
Received: by mail-ed1-x544.google.com with SMTP id cq7so4248677edb.4
 for <ath11k@lists.infradead.org>; Wed, 11 Nov 2020 16:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de>
 <87wnz0hr9k.fsf@codeaurora.org> <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
 <87v9ec9rk3.fsf@codeaurora.org> <87imab4slq.fsf@codeaurora.org>
 <b2129a70db2b36c5015b4143a839f47dfc3153af.camel@seibold.net>
In-Reply-To: <b2129a70db2b36c5015b4143a839f47dfc3153af.camel@seibold.net>
From: wi nk <wink@technolu.st>
Date: Thu, 12 Nov 2020 01:24:05 +0100
Message-ID: <CAHUdJJVp5r55NtE+BNz5XGtnaks6mDKQBFodz63DdULBVhD0Lg@mail.gmail.com>
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

On Wed, Nov 11, 2020 at 11:02 PM Stefani Seibold <stefani@seibold.net> wrote:
>
> On Wed, 2020-11-11 at 21:10 +0200, Kalle Valo wrote:
> >
> > The proof of concept patch for v5.10-rc2 is here:
> >
> > https://patchwork.kernel.org/project/linux-wireless/patch/1605121102-14352-1-git-send-email-kvalo@codeaurora.org/
> >
> > Hopefully it makes it possible to boot the firmware now. But this is
> > a
> > quick hack and most likely buggy, so keep your expectations low :)
> >
> > In case there are these warnings during firmware initialisation:
> >
> > ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
> > ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
> >
> > Try reverting this commit:
> >
> > 7fef431be9c9 mm/page_alloc: place pages to tail in
> > __free_pages_core()
> >
> > That's another issue which is debugged here:
> >
> > http://lists.infradead.org/pipermail/ath11k/2020-November/000550.html
> >
>
> Applying the patch and revert patch 7fef431be9c9 worked on the first
> glance.
>
> After a couple of minutes the connection get broken. The kernel log
> shows the following error:
>
> ath11k_pci 0000:55:00.0: wmi command 16387 timeout
> ath11k_pci 0000:55:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> ath11k_pc
> i 0000:55:00.0: failed to enable PMF QOS: (-11
>
> It is also not possible to unload the ath11k_pci, rmmod will hang.
>
>

I can confirm the same behavior as Stefani so far.  After applying the
patch, and reverting commit 7fef431be9c9, I am able to connect to a
network.  It hasn't disconnected yet (I'm sending this email via that
connection).  I'll report what I find next.

Thanks again for the help!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
