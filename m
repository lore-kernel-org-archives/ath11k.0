Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www84.your-server.de ([213.133.104.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcyBx-0005OX-2v
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 22:02:13 +0000
Message-ID: <b2129a70db2b36c5015b4143a839f47dfc3153af.camel@seibold.net>
Subject: Re: pci_alloc_irq_vectors fails ENOSPC for XPS 13 9310
From: Stefani Seibold <stefani@seibold.net>
Date: Wed, 11 Nov 2020 23:02:07 +0100
In-Reply-To: <87imab4slq.fsf@codeaurora.org>
References: <20201103160838.GA246433@bjorn-Precision-5520>
 <874km61732.fsf@nanos.tec.linutronix.de>
 <fa26ac8b-ed48-7ea3-c21b-b133532716b8@posteo.de>
 <87mtzxkus5.fsf@nanos.tec.linutronix.de> <87wnz0hr9k.fsf@codeaurora.org>
 <87ft5hehlb.fsf@codeaurora.org>
 <6b60c8f1-ec37-d601-92c2-97a485b73431@posteo.de>
 <87v9ec9rk3.fsf@codeaurora.org> <87imab4slq.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, Thomas Krause <thomaskrause@posteo.de>
Cc: Govind Singh <govinds@codeaurora.org>, wink@technolu.st, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, Devin Bayer <dev@doubly.so>, ath11k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>, David Woodhouse <dwmw@amazon.co.uk>

On Wed, 2020-11-11 at 21:10 +0200, Kalle Valo wrote:
> 
> The proof of concept patch for v5.10-rc2 is here:
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/1605121102-14352-1-git-send-email-kvalo@codeaurora.org/
> 
> Hopefully it makes it possible to boot the firmware now. But this is
> a
> quick hack and most likely buggy, so keep your expectations low :)
> 
> In case there are these warnings during firmware initialisation:
> 
> ath11k_pci 0000:05:00.0: qmi failed memory request, err = -110
> ath11k_pci 0000:05:00.0: qmi failed to respond fw mem req:-110
> 
> Try reverting this commit:
> 
> 7fef431be9c9 mm/page_alloc: place pages to tail in
> __free_pages_core()
> 
> That's another issue which is debugged here:
> 
> http://lists.infradead.org/pipermail/ath11k/2020-November/000550.html
> 

Applying the patch and revert patch 7fef431be9c9 worked on the first
glance.

After a couple of minutes the connection get broken. The kernel log
shows the following error:

ath11k_pci 0000:55:00.0: wmi command 16387 timeout
ath11k_pci 0000:55:00.0: failed to send WMI_PDEV_SET_PARAM cmd
ath11k_pc
i 0000:55:00.0: failed to enable PMF QOS: (-11

It is also not possible to unload the ath11k_pci, rmmod will hang.



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
