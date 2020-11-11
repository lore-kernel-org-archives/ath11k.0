Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcmKc-0002tI-Dq
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 09:22:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de>
 <87wnz0hr9k.fsf@codeaurora.org> <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
Date: Wed, 11 Nov 2020 11:22:04 +0200
In-Reply-To: <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de> (Thomas Krause's
 message of "Wed, 11 Nov 2020 09:53:51 +0100")
Message-ID: <87v9ec9rk3.fsf@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, Christoph Hellwig <hch@lst.de>, Bjorn Helgaas <helgaas@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, ath11k@lists.infradead.org, David Woodhouse <dwmw@amazon.co.uk>

Thomas Krause <thomaskrause@posteo.de> writes:

> Am 10.11.20 um 09:33 schrieb Kalle Valo:
>>
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
> enabled. Secure boot was also turned off. BIOS version is also at the
> most current version 1.1.1.

This is good to know, thanks for testing. Now we have explored all
possible BIOS options as I know of.

> Because of the dmesg errors Thomas Gleixner mentioned, I assume it
> would be best to contact Dell directly (even if I'm not sure if and
> how fast they will respond).

I have asked our people to report this to Dell, but no response yet.

> If the driver would manage to work with only 1 vector, I assume this
> would also make it work on my configuration, even with possible
> performance hits.

This is the workaround we are working on at the moment. There's now a
proof of concept patch but I'm not certain if it will work. I'll post it
as soon as I can and will provide the link in this thread.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
