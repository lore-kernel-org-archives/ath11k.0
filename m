Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka50s-0006XQ-V1
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 22:42:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
In-Reply-To: <874km61732.fsf@nanos.tec.linutronix.de>
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
Date: Tue, 03 Nov 2020 23:42:47 +0100
Message-ID: <87wnz2ysd4.fsf@nanos.tec.linutronix.de>
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
To: Bjorn Helgaas <helgaas@kernel.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, Christoph Hellwig <hch@lst.de>, Thomas Krause <thomaskrause@posteo.de>, ath11k@lists.infradead.org

On Tue, Nov 03 2020 at 22:08, Thomas Gleixner wrote:
> On Tue, Nov 03 2020 at 10:08, Bjorn Helgaas wrote:
>>> > But it seems a little greedy if the device can't operate at all unless
>>> > it gets 32 vectors.  Are you sure that's a hard requirement?  Most
>>> > devices can work with fewer vectors, even if it reduces performance.
>
> Right, even most high end network cards work with one interrupt.
>
>>> This was my first reaction as well when I saw the code for the first
>>> time. And the reply I got is that the firmware needs all 32 vectors, it
>>> won't work with less.
>
> Great design.

Just to put more information to this:

Enforcing 32 vectors with MSI is beyond silly. Due to the limitations of
MSI all of these vectors will be affine to a single CPU unless irq
remapping is available and enabled.

So if irq remapping is not enabled, then what are the 32 vectors buying?
Exactly nothing because they just compete to be handled on the very same
CPU. If the design requires more than one vector, then this should be
done with MSI-X (which allows individual affinities and individual
masking).

That's known for 20 years and MSI-X exists for exactly that reason. But
hardware people still insist on implementing MSI (probably because it
saves 0.002$ per chip).

But there is also the firmware side. Enforcing the availability of 32
vectors on MSI is silly to begin with as explained above, but it's also
silly given the constraints of the x86 vector space. It takes just 6
devices having the same 32 vector requirement to exhaust it. Oh well...

Thanks,

        tglx









-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
