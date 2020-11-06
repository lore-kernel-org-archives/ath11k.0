Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout-p-103.mailbox.org ([80.241.56.161])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb0BD-0005Lu-KI
 for ath11k@lists.infradead.org; Fri, 06 Nov 2020 11:45:21 +0000
From: Devin Bayer <dev@doubly.so>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
Message-ID: <768b2f88-3da3-37bc-f512-f5249a52480e@doubly.so>
Date: Fri, 6 Nov 2020 12:45:10 +0100
MIME-Version: 1.0
In-Reply-To: <874km61732.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
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
To: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <helgaas@kernel.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Thomas Krause <thomaskrause@posteo.de>, Christoph Hellwig <hch@lst.de>

On 03/11/2020 22.08, Thomas Gleixner wrote:
> On Tue, Nov 03 2020 at 10:08, Bjorn Helgaas wrote:
> 
> Check the BIOS for a switch which is named 'VT-d' or such. It might
> depend on 'Intel Virtualization Technology' or such.
> 

Thanks for this info. The platform I have, J1900, indeed does not support VT-d.

So I guess I'm not able to use this card. That's unfortunate.

It doesn't seem like the Windows driver works either. It doesn't give any errors
but it fails to find any wireless networks.

~ dev

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
