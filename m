Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZuMR-0004j7-BM
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 11:20:25 +0000
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
References: <20201102205752.GA34153@bjorn-Precision-5520>
From: Devin Bayer <dev@doubly.so>
Message-ID: <8996fd9c-0d6c-5c0c-670e-86c537509030@doubly.so>
Date: Tue, 3 Nov 2020 12:20:16 +0100
MIME-Version: 1.0
In-Reply-To: <20201102205752.GA34153@bjorn-Precision-5520>
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
To: Bjorn Helgaas <helgaas@kernel.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-pci@vger.kernel.org, Thomas Krause <thomaskrause@posteo.de>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 02/11/2020 21.57, Bjorn Helgaas wrote:
>>>
>>> CONFIG_IRQ_REMAP did not do the trick. I noticed that the Wi-Fi card
>>> is behind a PCI bridge which is also disabled, could this be a
>>> problem?

Just to provide another case, I have the same issue with this driver.

CONFIG_IRQ_REMAP=y and doesn't have any effect.

I'm unsure if the issue could be my system (Atom / Intel J1900) or the
that I'm using a slightly different card. Is there anyway to tell from the
lspci output? Here is what I guess is most relevant:

00:1c.2 PCI bridge: Intel Corporation Atom Processor E3800 Series PCI Express Root Port 3 (rev 0e) (prog-if 00 [Normal decode])
        Memory behind bridge: d0000000-d0ffffff [size=16M]
        Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
                Address: fee08004  Data: 4021

03:00.0 Unassigned class [ff00]: Qualcomm Device 1101
        Subsystem: Qualcomm Device 0108
        Region 0: Memory at d0000000 (64-bit, non-prefetchable) [size=16M]
        Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit-
                Address: fee01004  Data: 40ef
                Masking: ffffffff  Pending: 00000000
        Capabilities: [70] Express (v2) Endpoint, MSI 00

Thanks,
Devin

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
