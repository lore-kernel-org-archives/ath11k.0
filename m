Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khGhP-0004hl-Ld
 for ath11k@lists.infradead.org; Mon, 23 Nov 2020 18:36:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add 64bit check before reading msi high addr
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1605758301-11249-1-git-send-email-akolli@codeaurora.org>
References: <1605758301-11249-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20201123183623.3AE01C433C6@smtp.codeaurora.org>
Date: Mon, 23 Nov 2020 18:36:23 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> In QCN9074 ath11k boot, firmware crash is observed in 64-bit
> builds and is due to wrong 64 bit MSI address size. This patch
> fixes the firmware crash. Read msi high addr if 64-bit addresses
> allowed on MSI.
> 
> Tested-On: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Fails to build:

drivers/net/wireless/ath/ath11k/pci.c: In function 'ath11k_pci_get_msi_address':
drivers/net/wireless/ath/ath11k/pci.c:273:43: error: 'ab_pci' undeclared (first use in this function); did you mean 'ar_pci'?
  273 |  if (test_bit(ATH11K_PCI_FLAG_IS_MSI_64, &ab_pci->flags)) {
      |                                           ^~~~~~
      |                                           ar_pci
drivers/net/wireless/ath/ath11k/pci.c:273:43: note: each undeclared identifier is reported only once for each function it appears in
drivers/net/wireless/ath/ath11k/pci.c:267:21: warning: unused variable 'ar_pci' [-Wunused-variable]
  267 |  struct ath11k_pci *ar_pci = ath11k_pci_priv(ab);
      |                     ^~~~~~
make[5]: *** [drivers/net/wireless/ath/ath11k/pci.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [drivers/net/wireless/ath/ath11k] Error 2
make[3]: *** [drivers/net/wireless/ath] Error 2
make[2]: *** [drivers/net/wireless] Error 2
make[1]: *** [drivers/net] Error 2
make: *** [drivers] Error 2

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1605758301-11249-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
