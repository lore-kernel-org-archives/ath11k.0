Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwMo-0005GL-GE
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 13:29:02 +0000
MIME-Version: 1.0
Date: Tue, 03 Nov 2020 11:01:56 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
In-Reply-To: <20201102205752.GA34153@bjorn-Precision-5520>
References: <20201102205752.GA34153@bjorn-Precision-5520>
Message-ID: <ea5a2a1956ffd19ae61c42f895d90961@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, Thomas Krause <thomaskrause@posteo.de>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2020-11-03 04:57, Bjorn Helgaas wrote:
> [+cc Govind, author of 5697a564d369 ("ath11k: pci: add MSI config
> initialisation")]
> 
> On Mon, Nov 02, 2020 at 08:49:51PM +0200, Kalle Valo wrote:
>> + linux-wireless, linux-pci, devin
>> 
>> Thomas Krause <thomaskrause@posteo.de> writes:
>> 
>> >> I had the same problem as well back in the days, for me enabling
>> >> CONFIG_IRQ_REMAP helped. If it helps for you also I wonder if we should
>> >> mention that in the ath11k warning above :)
>> >
>> > CONFIG_IRQ_REMAP did not do the trick. I noticed that the Wi-Fi card
>> > is behind a PCI bridge which is also disabled, could this be a
>> > problem?
>> >
>> > 00:1c.0 PCI bridge: Intel Corporation Device a0b8 (rev 20) (prog-if 00
>> > [Normal decode])
>> > 	Flags: bus master, fast devsel, latency 0, IRQ 123
>> > 	Bus: primary=00, secondary=56, subordinate=56, sec-latency=0
>> > 	I/O behind bridge: [disabled]
>> > 	Memory behind bridge: 8c300000-8c3fffff [size=1M]
>> > 	Prefetchable memory behind bridge: [disabled]
>> > 	Capabilities: [40] Express Root Port (Slot+), MSI 00
>> > 	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
>> > 	Capabilities: [90] Subsystem: Dell Device 0991
>> > 	Capabilities: [a0] Power Management version 3
>> > 	Capabilities: [100] Advanced Error Reporting
>> > 	Capabilities: [220] Access Control Services
>> > 	Capabilities: [150] Precision Time Measurement
>> > 	Capabilities: [200] L1 PM Substates
>> > 	Capabilities: [a00] Downstream Port Containment
>> > 	Kernel driver in use: pcieport
>> 
>> I don't know enough about PCI to say if the bridge is a problem or 
>> not.
> 
> I don't think the bridge is an issue here.  AFAICT the bridge's I/O
> and prefetchable memory windows are disabled, but the non-prefetchable
> window *is* enabled and contains the space consumed by the ath11k
> device:
> 
>   00:1c.0 PCI bridge: Intel Corporation Device a0b8 (rev 20)
> 	Bus: primary=00, secondary=56, subordinate=56, sec-latency=0
> 	Memory behind bridge: 8c300000-8c3fffff [size=1M]
>   56:00.0 Network controller: Qualcomm Device 1101 (rev 01)
>      Region 0: Memory at 8c300000 (64-bit, non-prefetchable) [size=1M]
> 

Have you enabled VT-d from BIOS? This is required at least on some old 
laptops.


>> To summarise: Thomas is reporting[1] a problem with ath11k on QCA6390
>> PCI device where he is not having enough MSI vectors. ath11k needs 32
>> vectors but pci_alloc_irq_vectors() returns -ENOSPC. PCI support is 
>> new
>> for ath11k and introduced in v5.10-rc1. The irq allocation code is in
>> drivers/net/wireless/ath/ath11k/pci.c. [2]
> 
> This code is needlessly complicated.  If you absolutely need
> msi_config.total_vectors and can't settle for any less, you can do
> this:
> 
>   num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
>                                       msi_config.total_vectors,
>                                       msi_config.total_vectors,
>                                       PCI_IRQ_MSI);
> 
>   if (num_vectors < 0) {
>     ath11k_err(ab, "failed to get %d MSI vectors (%d)\n",
>                msi_config.total_vectors, num_vectors);
>     return num_vectors;
>   }
> 
> But it seems a little greedy if the device can't operate at all unless
> it gets 32 vectors.  Are you sure that's a hard requirement?  Most
> devices can work with fewer vectors, even if it reduces performance.
> 
>> I would first try with a full distro kernel config, just in case 
>> there's
>> some another important kernel config missing.
>> 
>> [1] 
>> http://lists.infradead.org/pipermail/ath11k/2020-October/000466.html
> 
> Tangent: have you considered getting this list archived on
> https://lore.kernel.org/lists.html?
> 
>> [2] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/pci.c#n633
>> 
>> --
>> https://patchwork.kernel.org/project/linux-wireless/list/
>> 
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
