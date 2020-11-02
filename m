Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZeuU-0004HJ-1X
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 18:50:36 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <2849fd39-a7a6-8366-7c78-fc9fec4dffa4@posteo.de>
 <87tuuqhc1i.fsf@codeaurora.org>
 <1ce6f735-21ff-db7e-c8dc-d567761964aa@posteo.de>
Date: Mon, 02 Nov 2020 20:49:51 +0200
In-Reply-To: <1ce6f735-21ff-db7e-c8dc-d567761964aa@posteo.de> (Thomas Krause's
 message of "Tue, 20 Oct 2020 22:46:00 +0200")
Message-ID: <871rhbvbjk.fsf@codeaurora.org>
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
To: Thomas Krause <thomaskrause@posteo.de>
Cc: linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Devin Bayer <dev@doubly.so>

+ linux-wireless, linux-pci, devin

Thomas Krause <thomaskrause@posteo.de> writes:

>> I had the same problem as well back in the days, for me enabling
>> CONFIG_IRQ_REMAP helped. If it helps for you also I wonder if we should
>> mention that in the ath11k warning above :)
>
> CONFIG_IRQ_REMAP did not do the trick. I noticed that the Wi-Fi card
> is behind a PCI bridge which is also disabled, could this be a
> problem?
>
> 00:1c.0 PCI bridge: Intel Corporation Device a0b8 (rev 20) (prog-if 00
> [Normal decode])
> 	Flags: bus master, fast devsel, latency 0, IRQ 123
> 	Bus: primary=00, secondary=56, subordinate=56, sec-latency=0
> 	I/O behind bridge: [disabled]
> 	Memory behind bridge: 8c300000-8c3fffff [size=1M]
> 	Prefetchable memory behind bridge: [disabled]
> 	Capabilities: [40] Express Root Port (Slot+), MSI 00
> 	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
> 	Capabilities: [90] Subsystem: Dell Device 0991
> 	Capabilities: [a0] Power Management version 3
> 	Capabilities: [100] Advanced Error Reporting
> 	Capabilities: [220] Access Control Services
> 	Capabilities: [150] Precision Time Measurement
> 	Capabilities: [200] L1 PM Substates
> 	Capabilities: [a00] Downstream Port Containment
> 	Kernel driver in use: pcieport

I don't know enough about PCI to say if the bridge is a problem or not.
I'm adding linux-wireless and linux-pci in someone can help. Also Devin
seems to have a similar problem.

To summarise: Thomas is reporting[1] a problem with ath11k on QCA6390
PCI device where he is not having enough MSI vectors. ath11k needs 32
vectors but pci_alloc_irq_vectors() returns -ENOSPC. PCI support is new
for ath11k and introduced in v5.10-rc1. The irq allocation code is in
drivers/net/wireless/ath/ath11k/pci.c. [2]

Can PCI folks help, what could cause this and how to debug it further?

I would first try with a full distro kernel config, just in case there's
some another important kernel config missing.

[1] http://lists.infradead.org/pipermail/ath11k/2020-October/000466.html

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/pci.c#n633

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
