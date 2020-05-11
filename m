Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYCi9-0005Mt-4D
 for ath11k@lists.infradead.org; Mon, 11 May 2020 17:59:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/4] ath11k: Add PCI client driver for QCA6390 chipset
References: <20200508085850.23363-1-govinds@codeaurora.org>
 <20200508085850.23363-2-govinds@codeaurora.org>
Date: Mon, 11 May 2020 20:59:14 +0300
In-Reply-To: <20200508085850.23363-2-govinds@codeaurora.org> (Govind Singh's
 message of "Fri, 8 May 2020 14:28:47 +0530")
Message-ID: <87h7wm4akt.fsf@kamboji.qca.qualcomm.com>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> writes:

> QCA6390 is PCI based 11ax chipset, add
> pci client driver for QCA6390 target.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

This patch had multiple problems, most important ones were:

* a break missing in ath11k_pci_probe()

* it's not possible to have static variables in .h files, I fixed by
  moving the ring variables to core.c in a separate patch:

  https://patchwork.kernel.org/patch/11541355/

* this patch didn't link (at least when compiling as modules), I fixed
  those by adding missing EXPORT_SYMBOL() macros

Please double check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=44a28b572070f578914367dc2469cef48ece13f4

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
