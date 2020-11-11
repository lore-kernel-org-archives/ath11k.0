Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcmb8-0006Sl-0R
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 09:39:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
In-Reply-To: <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de> <87wnz0hr9k.fsf@codeaurora.org>
 <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
Date: Wed, 11 Nov 2020 10:39:22 +0100
Message-ID: <87r1p0fd11.fsf@nanos.tec.linutronix.de>
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
To: Thomas Krause <thomaskrause@posteo.de>, Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>, David Woodhouse <dwmw@amazon.co.uk>

On Wed, Nov 11 2020 at 09:53, Thomas Krause wrote:
> Am 10.11.20 um 09:33 schrieb Kalle Valo:
>>> I was told that on Dell XPS 15 (with a working QCA6390 setup) there's a
>>> separate "Virtualisation" setting in BIOS. See if you have that and try
>>> enabling it.
>> I was informed about another setting to test: try disabling "Enable
>> Secure Boot" in the BIOS. I don't know yet why it would help, but that's
>> what few people have recommended.
>>
>> Please let me know how it goes.
>>
> I have two options under "Virtualization" in the BIOS: "Enable Intel 
> Virtualization Technology (VT)" and "VT for Direct I/O". Both were

VT for Direct I/O enables the IOMMU and the interrupt remapping unit,
but the kernel can't use it because the ACPI tables are busted.

> enabled. Secure boot was also turned off. BIOS version is also at the 
> most current version 1.1.1. Because of the dmesg errors Thomas Gleixner 
> mentioned, I assume it would be best to contact Dell directly (even if 
> I'm not sure if and how fast they will respond). If the driver would

Good luck.

Thanks,

        tglx

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
