Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd7EO-0006CS-T0
 for ath11k@lists.infradead.org; Thu, 12 Nov 2020 07:41:22 +0000
Received: by mail-ej1-x642.google.com with SMTP id dk16so6275778ejb.12
 for <ath11k@lists.infradead.org>; Wed, 11 Nov 2020 23:41:20 -0800 (PST)
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
 <CAHUdJJXRDKs9NRugUAFgNr51DJ=OcssuiV8ST5CaV1CKiNTFfA@mail.gmail.com>
 <0b58872b4f27dbf5aad2a39f5ec4a066e080d806.camel@seibold.net>
 <875z6b3v22.fsf@codeaurora.org>
In-Reply-To: <875z6b3v22.fsf@codeaurora.org>
From: wi nk <wink@technolu.st>
Date: Thu, 12 Nov 2020 08:41:08 +0100
Message-ID: <CAHUdJJVK1vH2_9YkCQ99n5mak3oGN09422gG0APkWwcy=ZDQ-Q@mail.gmail.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, Christoph Hellwig <hch@lst.de>, Thomas Krause <thomaskrause@posteo.de>, Bjorn Helgaas <helgaas@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, ath11k@lists.infradead.org, David Woodhouse <dwmw@amazon.co.uk>

On Thu, Nov 12, 2020 at 8:15 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Stefani Seibold <stefani@seibold.net> writes:
>
> > Am Donnerstag, den 12.11.2020, 02:10 +0100 schrieb wi nk:
> >> I've yet to see any instability after 45 minutes of exercising it, I
> >> do see a couple of messages that came out of the driver:
> >>
> >> [    8.963389] ath11k_pci 0000:55:00.0: Unknown eventid: 0x16005
> >> [   11.342317] ath11k_pci 0000:55:00.0: Unknown eventid: 0x1d00a
> >>
> >> then when it associates:
> >>
> >> [   16.718895] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
> >> [   16.722636] wlp85s0: authenticated
> >> [   16.724150] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
> >> [   16.726486] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
> >> (capab=0x411 status=0 aid=8)
> >> [   16.738443] wlp85s0: associated
> >> [   16.764966] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes
> >> ready
> >>
> >> The adapter is achieving around 500 mbps on my gigabit connection, my
> >> 2018 mbp sees around 650, so it's doing pretty well so far.
> >>
> >> Stefani - when you applied the patch that Kalle shared, which branch
> >> did you apply it to?  I applied it to ath11k-qca6390-bringup and when
> >> I revert 7fef431be9c9 there is a small merge conflict I needed to
> >> resolve.  I wonder if either the starting branch, or your chosen
> >> resolution are related to the instability you see (or I'm just lucky
> >> so far! :)).
> >>
> >
> > I used the vanilla kernel tree
> > https://git.kernel.org/torvalds/t/linux-5.10-rc2.tar.gz. On top of this
> > i applied the
> >
> > RFT-ath11k-pci-support-platforms-with-one-MSI-vector.patch
> >
> > and reverted the patch 7fef431be9c9
>
> I did also my testing on v5.10-rc2 and I recommend to use that as the
> baseline when debuggin these ath11k problems. It helps to compare the
> results if everyone have the same baseline.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Absolutely, I'll rebuild to 5.10 later today and apply the same series
of patches and report back.  I'll also test out the patch on both
versions from Carl to fix resuming.  It stands to reason that we may
be seeing another regression between Stefani (5.10) and myself (5.9
bringup branch) as I don't see any disconnections or instability once
the interface is online.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
