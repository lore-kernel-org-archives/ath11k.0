Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf84e-0004zR-Vd
 for ath11k@lists.infradead.org; Tue, 17 Nov 2020 20:59:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
In-Reply-To: <CAHUdJJXy4FvmTeO648QMst9-bm1asqjZz=ktkps3ug4Hw=UweQ@mail.gmail.com>
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
 <0b58872b4f27dbf5aad2a39f5ec4a066e080d806.camel@seibold.net>
 <875z6b3v22.fsf@codeaurora.org>
 <CAHUdJJVK1vH2_9YkCQ99n5mak3oGN09422gG0APkWwcy=ZDQ-Q@mail.gmail.com>
 <87pn4j2bna.fsf@codeaurora.org>
 <CAHUdJJXpfkNikreQ_JdpKDkwjEGN0oY8PyYT=aWsw1armz83Kw@mail.gmail.com>
 <e4ba4457-bd08-42fe-ade7-32059367701a@posteo.de>
 <CAHUdJJVoi2_BnubtADpdLQoe1xAuHCvkPF-RMX=dnY3nXoTm5g@mail.gmail.com>
 <CAHUdJJXy4FvmTeO648QMst9-bm1asqjZz=ktkps3ug4Hw=UweQ@mail.gmail.com>
Date: Tue, 17 Nov 2020 21:59:32 +0100
Message-ID: <87sg97wvgr.fsf@nanos.tec.linutronix.de>
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
To: wi nk <wink@technolu.st>, Thomas Krause <thomaskrause@posteo.de>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Christoph Hellwig <hch@lst.de>, Kalle Valo <kvalo@codeaurora.org>

On Tue, Nov 17 2020 at 16:49, wi nk wrote:
> On Sun, Nov 15, 2020 at 8:55 PM wi nk <wink@technolu.st> wrote:
> So up until this point, everything is working without issues.
> Everything seems to spiral out of control a couple of seconds later
> when my system attempts to actually bring up the adapter.  In most of
> the crash states I will see this:
>
> [   31.286725] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
> [   31.390187] wlp85s0: send auth to ec:08:6b:27:01:ea (try 2/3)
> [   31.391928] wlp85s0: authenticated
> [   31.394196] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
> [   31.396513] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
> (capab=0x411 status=0 aid=6)
> [   31.407730] wlp85s0: associated
> [   31.434354] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready
>
> And then either somewhere in that pile of messages, or a second or two
> after this my machine will start to stutter as I mentioned before, and
> then it either hangs, or I see this message (I'm truncating the
> timestamp):
>
> [   35.xxxx ] sched: RT throttling activated

As this driver uses threaded interrupts, this looks like an interrupt
storm and the interrupt thread consumes the CPU fully. The RT throttler
limits the RT runtime of it which allows other tasks make some
progress. That's what you observe as stutter.

You can apply the hack below so the irq thread(s) run in the SCHED_OTHER
class which prevents them from monopolizing the CPU. That might make the
problem simpler to debug.

Thanks,

        tglx
---
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index c460e0496006..8473ecacac7a 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1320,7 +1320,7 @@ setup_irq_thread(struct irqaction *new, unsigned int irq, bool secondary)
 	if (IS_ERR(t))
 		return PTR_ERR(t);
 
-	sched_set_fifo(t);
+	//sched_set_fifo(t);
 
 	/*
 	 * We keep the reference to the task struct even if

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
