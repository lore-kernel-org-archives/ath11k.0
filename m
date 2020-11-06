Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www84.your-server.de ([213.133.104.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb0Mq-0006z9-8o
 for ath11k@lists.infradead.org; Fri, 06 Nov 2020 11:57:21 +0000
Message-ID: <b50d48a67bfb8797a4be0eea64c9514836f847af.camel@seibold.net>
Subject: Re: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
From: Stefani Seibold <stefani@seibold.net>
Date: Fri, 06 Nov 2020 12:57:08 +0100
In-Reply-To: <87wnz0hr9k.fsf@codeaurora.org>
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
To: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>


>> i tried the latest ath11k driver using linux 5.10 rc2 on a new dell
>> 9310 XPS 13.
>>
>> The driver will always complain "failed to get 32 MSI vectors, only
-28
>> available".
>>
>> I think the -28 is the error code for ENOSPC return by the
>> pci_alloc_irq_vectors() function.
>>

>Please try enabling Virtualisation and VT-d in BIOS. And also enable
>CONFIG_IRQ_REMAP in kernel config.

Thanks for the advise. I already configured the BIOS and kernel in this
way. I also update the BIOS XPS 13 9310 Bios to 1.1.1, but the 

 "DMAR: [Firmware Bug]: Your BIOS is broken; DMAR reported at address 0!"

still remains and therefor the 

 "failed to get 32 MSI vectors, only -28 available"

message.

The really bad thing is that the Killer Wi-Fi 6 AX500-DBS QCA6390 is
solder on the mainboard :-(

- Stefani



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
