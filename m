Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZeew-0002Tj-0Z
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 18:34:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <2849fd39-a7a6-8366-7c78-fc9fec4dffa4@posteo.de>
 <87tuuqhc1i.fsf@codeaurora.org>
 <1ce6f735-21ff-db7e-c8dc-d567761964aa@posteo.de>
Date: Mon, 02 Nov 2020 20:34:11 +0200
In-Reply-To: <1ce6f735-21ff-db7e-c8dc-d567761964aa@posteo.de> (Thomas Krause's
 message of "Tue, 20 Oct 2020 22:46:00 +0200")
Message-ID: <875z6nvc9o.fsf@codeaurora.org>
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
Cc: ath11k@lists.infradead.org

Thomas Krause <thomaskrause@posteo.de> writes:

> Am 19.10.20 um 10:09 schrieb Kalle Valo:
>>> some variants of Dell XPS 13 9310 model have a QCA6390 device
>> Do you happen to know which models exacly have it? I'm trying to find a
>> reasonably priced laptop with QCA6390 from Finland or EU, no luck yet.
>> Apparently there was a certain Dell XPS 15 9500 model but it was almost
>> 4k EUR.
>
> Dell at least sold the XPS 13 9310 with 32 GB RAM in Germany
> (https://www.dell.com/de-de/shop/laptops/neu-xps-13/spd/xps-13-9310-laptop/cn93212)
> with the QCA6390 device. With around 2300 EUR, this offer is still
> expensive but it's less than the 4000. In the delivery notes they
> called the Wi-Fi card "Killer Wi-Fi 6 AX500-DBS (2 x 2)" (part number
> 555-BFPF) but in the current version of the linked listing this is now
> "Killer Wifi 7 AX500". I'm not sure if the "DBS" part has anything to
> say.

Yeah, that's more reasonable price for a laptop. Thanks, this is very
good info. I'll try to find one from Finland.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
