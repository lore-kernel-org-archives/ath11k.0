Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout02.posteo.de ([185.67.36.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcltC-0002Aj-5e
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 08:54:03 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id F3BF42400FE
 for <ath11k@lists.infradead.org>; Wed, 11 Nov 2020 09:53:55 +0100 (CET)
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de> <87wnz0hr9k.fsf@codeaurora.org>
 <87ft5hehlb.fsf@codeaurora.org>
From: Thomas Krause <thomaskrause@posteo.de>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
Message-ID: <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
Date: Wed, 11 Nov 2020 09:53:51 +0100
MIME-Version: 1.0
In-Reply-To: <87ft5hehlb.fsf@codeaurora.org>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>, David Woodhouse <dwmw@amazon.co.uk>


Am 10.11.20 um 09:33 schrieb Kalle Valo:
>
>> I was told that on Dell XPS 15 (with a working QCA6390 setup) there's a
>> separate "Virtualisation" setting in BIOS. See if you have that and try
>> enabling it.
> I was informed about another setting to test: try disabling "Enable
> Secure Boot" in the BIOS. I don't know yet why it would help, but that's
> what few people have recommended.
>
> Please let me know how it goes.
>
I have two options under "Virtualization" in the BIOS: "Enable Intel 
Virtualization Technology (VT)" and "VT for Direct I/O". Both were 
enabled. Secure boot was also turned off. BIOS version is also at the 
most current version 1.1.1. Because of the dmesg errors Thomas Gleixner 
mentioned, I assume it would be best to contact Dell directly (even if 
I'm not sure if and how fast they will respond). If the driver would 
manage to work with only 1 vector, I assume this would also make it work 
on my configuration, even with possible performance hits.

Best,

Thomas



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
