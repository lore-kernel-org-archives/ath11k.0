Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka3Xv-0002iF-4F
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 21:08:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
In-Reply-To: <20201103160838.GA246433@bjorn-Precision-5520>
References: <20201103160838.GA246433@bjorn-Precision-5520>
Date: Tue, 03 Nov 2020 22:08:49 +0100
Message-ID: <874km61732.fsf@nanos.tec.linutronix.de>
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
To: Bjorn Helgaas <helgaas@kernel.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, Christoph Hellwig <hch@lst.de>, Thomas Krause <thomaskrause@posteo.de>, ath11k@lists.infradead.org

On Tue, Nov 03 2020 at 10:08, Bjorn Helgaas wrote:
> On Tue, Nov 03, 2020 at 08:49:06AM +0200, Kalle Valo wrote:
>> Bjorn Helgaas <helgaas@kernel.org> writes:
>> > On Mon, Nov 02, 2020 at 08:49:51PM +0200, Kalle Valo wrote:
>> >> Thomas Krause <thomaskrause@posteo.de> writes:
>> >> 
>> >> >> I had the same problem as well back in the days, for me enabling
>> >> >> CONFIG_IRQ_REMAP helped. If it helps for you also I wonder if we should
>> >> >> mention that in the ath11k warning above :)

Interrupt remapping only helps when the device supports only MSI (not
MSI-X) because x86 (kernel) does not support multiple MSI interrupts
without remapping.

So if only MSI is available then you get exactly _one_ MSI vector
without remapping.

>> >> > CONFIG_IRQ_REMAP did not do the trick.

The config alone does not help. The hardware has to support it and the
BIOS has to enable it.

Check the BIOS for a switch which is named 'VT-d' or such. It might
depend on 'Intel Virtualization Technology' or such.

>> >   00:1c.0 PCI bridge: Intel Corporation Device a0b8 (rev 20)
>> > 	Bus: primary=00, secondary=56, subordinate=56, sec-latency=0
>> > 	Memory behind bridge: 8c300000-8c3fffff [size=1M]
>> >   56:00.0 Network controller: Qualcomm Device 1101 (rev 01)
>> >      Region 0: Memory at 8c300000 (64-bit, non-prefetchable) [size=1M]

So I grabbed the PCI info from the link and it has:

     Capabilities: [50] MSI: Enable- Count=1/32 Maskable+ 64bit-

So no MSI-X, ergo only one MSI interrupt without remapping.
 
>> >> To summarise: Thomas is reporting[1] a problem with ath11k on QCA6390
>> >> PCI device where he is not having enough MSI vectors. ath11k needs 32
>> >> vectors but pci_alloc_irq_vectors() returns -ENOSPC. PCI support is new
>> >> for ath11k and introduced in v5.10-rc1. The irq allocation code is in
>> >> drivers/net/wireless/ath/ath11k/pci.c. [2]
>
>> > But it seems a little greedy if the device can't operate at all unless
>> > it gets 32 vectors.  Are you sure that's a hard requirement?  Most
>> > devices can work with fewer vectors, even if it reduces performance.

Right, even most high end network cards work with one interrupt.

>> This was my first reaction as well when I saw the code for the first
>> time. And the reply I got is that the firmware needs all 32 vectors, it
>> won't work with less.

Great design.

> I do see a couple other drivers that are completely inflexible (they
> request min==max).  But I don't know the system constraint you're
> hitting.  CC'd Thomas & Christoph in case they have time to give us a
> hint.

Can I have a full dmesg please?

Please enable CONFIG_IRQ_REMAP and CONFIG_INTEL_IOMMU (not strictly
required, but it's a Dell BIOS after all). Also set
CONFIG_INTEL_IOMMU_DEFAULT_ON.

Or simply try a distro kernel.

Thanks,

        tglx

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
