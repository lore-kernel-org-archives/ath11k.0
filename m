Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout01.posteo.de ([185.67.36.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUyWE-0007MN-R2
 for ath11k@lists.infradead.org; Tue, 20 Oct 2020 20:46:08 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 9BE9416005C
 for <ath11k@lists.infradead.org>; Tue, 20 Oct 2020 22:46:02 +0200 (CEST)
References: <2849fd39-a7a6-8366-7c78-fc9fec4dffa4@posteo.de>
 <87tuuqhc1i.fsf@codeaurora.org>
From: Thomas Krause <thomaskrause@posteo.de>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
Message-ID: <1ce6f735-21ff-db7e-c8dc-d567761964aa@posteo.de>
Date: Tue, 20 Oct 2020 22:46:00 +0200
MIME-Version: 1.0
In-Reply-To: <87tuuqhc1i.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org


Am 19.10.20 um 10:09 schrieb Kalle Valo:
>> some variants of Dell XPS 13 9310 model have a QCA6390 device
> Do you happen to know which models exacly have it? I'm trying to find a
> reasonably priced laptop with QCA6390 from Finland or EU, no luck yet.
> Apparently there was a certain Dell XPS 15 9500 model but it was almost
> 4k EUR.
Dell at least sold the XPS 13 9310 with 32 GB RAM in Germany 
(https://www.dell.com/de-de/shop/laptops/neu-xps-13/spd/xps-13-9310-laptop/cn93212) 
with the QCA6390 device. With around 2300 EUR, this offer is still 
expensive but it's less than the 4000. In the delivery notes they called 
the Wi-Fi card "Killer Wi-Fi 6 AX500-DBS (2 x 2)" (part number 555-BFPF) 
but in the current version of the linked listing this is now "Killer 
Wifi 7 AX500". I'm not sure if the "DBS" part has anything to say.
>
> I had the same problem as well back in the days, for me enabling
> CONFIG_IRQ_REMAP helped. If it helps for you also I wonder if we should
> mention that in the ath11k warning above :)

CONFIG_IRQ_REMAP did not do the trick. I noticed that the Wi-Fi card is behind a PCI bridge which is also disabled, could this be a problem?

00:1c.0 PCI bridge: Intel Corporation Device a0b8 (rev 20) (prog-if 00 [Normal decode])
	Flags: bus master, fast devsel, latency 0, IRQ 123
	Bus: primary=00, secondary=56, subordinate=56, sec-latency=0
	I/O behind bridge: [disabled]
	Memory behind bridge: 8c300000-8c3fffff [size=1M]
	Prefetchable memory behind bridge: [disabled]
	Capabilities: [40] Express Root Port (Slot+), MSI 00
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Dell Device 0991
	Capabilities: [a0] Power Management version 3
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [220] Access Control Services
	Capabilities: [150] Precision Time Measurement
	Capabilities: [200] L1 PM Substates
	Capabilities: [a00] Downstream Port Containment
	Kernel driver in use: pcieport




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
