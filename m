Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcP6H-00061U-Bz
 for ath11k@lists.infradead.org; Tue, 10 Nov 2020 08:34:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de>
 <87wnz0hr9k.fsf@codeaurora.org>
Date: Tue, 10 Nov 2020 10:33:52 +0200
In-Reply-To: <87wnz0hr9k.fsf@codeaurora.org> (Kalle Valo's message of "Thu, 05
 Nov 2020 15:23:03 +0200")
Message-ID: <87ft5hehlb.fsf@codeaurora.org>
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
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Thomas Krause <thomaskrause@posteo.de>, Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>, David Woodhouse <dwmw@amazon.co.uk>

Kalle Valo <kvalo@codeaurora.org> writes:

> Thomas Gleixner <tglx@linutronix.de> writes:
>
>> On Wed, Nov 04 2020 at 14:04, Thomas Krause wrote:
>>> config) but CONFIG_INTEL_IOMMU_DEFAULT_ON needed to be set manually. I 
>>> hope this helps, if there is more I can do to debug it on my side I'm 
>>> happy to do so.
>>
>>> [ 0.050130] DMAR: [Firmware Bug]: Your BIOS is broken; DMAR
>>> reported at address 0!
>>>                BIOS vendor: Dell Inc.; Ver: 1.1.1; Product Version:
>>
>>> [    0.103693] DMAR: Host address width 39
>>> [    0.103693] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
>>> [ 0.103697] DMAR: dmar0: reg_base_addr fed90000 ver 4:0 cap
>>> 1c0000c40660462 ecap 69e2ff0505e
>>> [    0.103698] DMAR: DRHD base: 0x000000fed84000 flags: 0x0
>>> [ 0.103701] DMAR: dmar1: reg_base_addr fed84000 ver 1:0 cap
>>> d2008c40660462 ecap f050da
>>> [    0.103702] DMAR: DRHD base: 0x000000fed86000 flags: 0x0
>>> [ 0.103706] DMAR: dmar2: reg_base_addr fed86000 ver 1:0 cap
>>> d2008c40660462 ecap f050da
>>> [    0.103707] DMAR: DRHD base: 0x00000000000000 flags: 0x1
>>> [    0.103707] DMAR: Parse DMAR table failure.
>>
>> which disables interrupt remapping and therefore the driver gets only
>> one MSI which makes it unhappy.
>>
>> Not that I'm surprised, it's Dell.... Can you check whether they have a
>> BIOS update for that box?
>
> I was told that on Dell XPS 15 (with a working QCA6390 setup) there's a
> separate "Virtualisation" setting in BIOS. See if you have that and try
> enabling it.

I was informed about another setting to test: try disabling "Enable
Secure Boot" in the BIOS. I don't know yet why it would help, but that's
what few people have recommended.

Please let me know how it goes.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
