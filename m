Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcCDT-0007lC-Nm
 for ath11k@lists.infradead.org; Mon, 09 Nov 2020 18:48:36 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <20201103160838.GA246433@bjorn-Precision-5520>
Date: Mon, 09 Nov 2020 20:48:28 +0200
In-Reply-To: <20201103160838.GA246433@bjorn-Precision-5520> (Bjorn Helgaas's
 message of "Tue, 3 Nov 2020 10:08:38 -0600")
Message-ID: <87wnyue58j.fsf@codeaurora.org>
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
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Thomas Krause <thomaskrause@posteo.de>, Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>

Bjorn Helgaas <helgaas@kernel.org> writes:

>> > Tangent: have you considered getting this list archived on
>> > https://lore.kernel.org/lists.html?
>> 
>> Good point, actually I have not. I'll add both ath10k and ath11k lists
>> to lore. It's even more important now that lists.infradead.org had a
>> hard drive crash and lost years of archives.
>
> Or you could just add linux-wireless, e.g.,
>
>   L:      ath11k@lists.infradead.org
>   L:      linux-wireless@vger.kernel.org
>
> or even consider moving from ath10k and ath11k to
> linux-wireless@vger.kernel.org.  I think there's some value in
> consolidating low-volume lists.  It looks like ath11k had < 90
> messages for all of October.

The background here is that linux-wireless is quite high volume list and
not everyone have time to follow that, so having specific ath10k and
ath11k lists make it easier for those people. So I'm hesitant to
shutdown driver lists for that reason.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
