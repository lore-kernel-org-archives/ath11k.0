Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZyrR-0005U5-1v
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 16:08:42 +0000
Date: Tue, 3 Nov 2020 10:08:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
Message-ID: <20201103160838.GA246433@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0v3szod.fsf@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, Christoph Hellwig <hch@lst.de>, Thomas Krause <thomaskrause@posteo.de>, Thomas Gleixner <tglx@linutronix.de>, ath11k@lists.infradead.org

[+cc Thomas, Christoph for question about not enough MSI IRQ vectors]

On Tue, Nov 03, 2020 at 08:49:06AM +0200, Kalle Valo wrote:
> Bjorn Helgaas <helgaas@kernel.org> writes:
> > On Mon, Nov 02, 2020 at 08:49:51PM +0200, Kalle Valo wrote:
> >> + linux-wireless, linux-pci, devin
> >> 
> >> Thomas Krause <thomaskrause@posteo.de> writes:
> >> 
> >> >> I had the same problem as well back in the days, for me enabling
> >> >> CONFIG_IRQ_REMAP helped. If it helps for you also I wonder if we should
> >> >> mention that in the ath11k warning above :)
> >> >
> >> > CONFIG_IRQ_REMAP did not do the trick. I noticed that the Wi-Fi card
> >> > is behind a PCI bridge which is also disabled, could this be a
> >> > problem?
> >> >
> >> > 00:1c.0 PCI bridge: Intel Corporation Device a0b8 (rev 20) (prog-if 00
> >> > [Normal decode])
> >> > 	Flags: bus master, fast devsel, latency 0, IRQ 123
> >> > 	Bus: primary=00, secondary=56, subordinate=56, sec-latency=0
> >> > 	I/O behind bridge: [disabled]
> >> > 	Memory behind bridge: 8c300000-8c3fffff [size=1M]
> >> > 	Prefetchable memory behind bridge: [disabled]
> >> > 	Capabilities: [40] Express Root Port (Slot+), MSI 00
> >> > 	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
> >> > 	Capabilities: [90] Subsystem: Dell Device 0991
> >> > 	Capabilities: [a0] Power Management version 3
> >> > 	Capabilities: [100] Advanced Error Reporting
> >> > 	Capabilities: [220] Access Control Services
> >> > 	Capabilities: [150] Precision Time Measurement
> >> > 	Capabilities: [200] L1 PM Substates
> >> > 	Capabilities: [a00] Downstream Port Containment
> >> > 	Kernel driver in use: pcieport
> >> 
> >> I don't know enough about PCI to say if the bridge is a problem or not.
> >
> > I don't think the bridge is an issue here.  AFAICT the bridge's I/O
> > and prefetchable memory windows are disabled, but the non-prefetchable
> > window *is* enabled and contains the space consumed by the ath11k
> > device:
> >
> >   00:1c.0 PCI bridge: Intel Corporation Device a0b8 (rev 20)
> > 	Bus: primary=00, secondary=56, subordinate=56, sec-latency=0
> > 	Memory behind bridge: 8c300000-8c3fffff [size=1M]
> >   56:00.0 Network controller: Qualcomm Device 1101 (rev 01)
> >      Region 0: Memory at 8c300000 (64-bit, non-prefetchable) [size=1M]
> 
> Good to know that the bridge shouldn't be the problem. Do you have any
> ideas how to make more vectors available to ath11k, besides
> CONFIG_IRQ_REMAP? Because QCA6390 works in Windows I doubt this is a
> hardware problem.
> 
> >> To summarise: Thomas is reporting[1] a problem with ath11k on QCA6390
> >> PCI device where he is not having enough MSI vectors. ath11k needs 32
> >> vectors but pci_alloc_irq_vectors() returns -ENOSPC. PCI support is new
> >> for ath11k and introduced in v5.10-rc1. The irq allocation code is in
> >> drivers/net/wireless/ath/ath11k/pci.c. [2]

> > But it seems a little greedy if the device can't operate at all unless
> > it gets 32 vectors.  Are you sure that's a hard requirement?  Most
> > devices can work with fewer vectors, even if it reduces performance.
> 
> This was my first reaction as well when I saw the code for the first
> time. And the reply I got is that the firmware needs all 32 vectors, it
> won't work with less.

I do see a couple other drivers that are completely inflexible (they
request min==max).  But I don't know the system constraint you're
hitting.  CC'd Thomas & Christoph in case they have time to give us a
hint.

> >> I would first try with a full distro kernel config, just in case there's
> >> some another important kernel config missing.
> >> 
> >> [1] http://lists.infradead.org/pipermail/ath11k/2020-October/000466.html
> >
> > Tangent: have you considered getting this list archived on
> > https://lore.kernel.org/lists.html?
> 
> Good point, actually I have not. I'll add both ath10k and ath11k lists
> to lore. It's even more important now that lists.infradead.org had a
> hard drive crash and lost years of archives.

Or you could just add linux-wireless, e.g.,

  L:      ath11k@lists.infradead.org
  L:      linux-wireless@vger.kernel.org

or even consider moving from ath10k and ath11k to
linux-wireless@vger.kernel.org.  I think there's some value in
consolidating low-volume lists.  It looks like ath11k had < 90
messages for all of October.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
