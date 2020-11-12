Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www84.your-server.de ([213.133.104.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd6g2-0003p5-Ry
 for ath11k@lists.infradead.org; Thu, 12 Nov 2020 07:05:51 +0000
Message-ID: <0b58872b4f27dbf5aad2a39f5ec4a066e080d806.camel@seibold.net>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
From: Stefani Seibold <stefani@seibold.net>
Date: Thu, 12 Nov 2020 08:05:40 +0100
In-Reply-To: <CAHUdJJXRDKs9NRugUAFgNr51DJ=OcssuiV8ST5CaV1CKiNTFfA@mail.gmail.com>
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de> <87wnz0hr9k.fsf@codeaurora.org>
 <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
 <87v9ec9rk3.fsf@codeaurora.org> <87imab4slq.fsf@codeaurora.org>
 <b2129a70db2b36c5015b4143a839f47dfc3153af.camel@seibold.net>
 <CAHUdJJVp5r55NtE+BNz5XGtnaks6mDKQBFodz63DdULBVhD0Lg@mail.gmail.com>
 <CAHUdJJXRDKs9NRugUAFgNr51DJ=OcssuiV8ST5CaV1CKiNTFfA@mail.gmail.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Thomas Krause <thomaskrause@posteo.de>, Bjorn Helgaas <helgaas@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>, Kalle Valo <kvalo@codeaurora.org>

Am Donnerstag, den 12.11.2020, 02:10 +0100 schrieb wi nk:
> I've yet to see any instability after 45 minutes of exercising it, I
> do see a couple of messages that came out of the driver:
> 
> [    8.963389] ath11k_pci 0000:55:00.0: Unknown eventid: 0x16005
> [   11.342317] ath11k_pci 0000:55:00.0: Unknown eventid: 0x1d00a
> 
> then when it associates:
> 
> [   16.718895] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
> [   16.722636] wlp85s0: authenticated
> [   16.724150] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
> [   16.726486] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
> (capab=0x411 status=0 aid=8)
> [   16.738443] wlp85s0: associated
> [   16.764966] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes
> ready
> 
> The adapter is achieving around 500 mbps on my gigabit connection, my
> 2018 mbp sees around 650, so it's doing pretty well so far.
> 
> Stefani - when you applied the patch that Kalle shared, which branch
> did you apply it to?  I applied it to ath11k-qca6390-bringup and when
> I revert 7fef431be9c9 there is a small merge conflict I needed to
> resolve.  I wonder if either the starting branch, or your chosen
> resolution are related to the instability you see (or I'm just lucky
> so far! :)).
> 

I used the vanilla kernel tree 
https://git.kernel.org/torvalds/t/linux-5.10-rc2.tar.gz. On top of this
i applied the 

RFT-ath11k-pci-support-platforms-with-one-MSI-vector.patch

and reverted the patch 7fef431be9c9



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
