Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJ4Q-0000kO-3y
 for ath11k@lists.infradead.org; Mon, 07 Dec 2020 16:09:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: add 64bit check before reading msi high addr
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1606199334-18206-1-git-send-email-akolli@codeaurora.org>
References: <1606199334-18206-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20201207160900.3048CC433C6@smtp.codeaurora.org>
Date: Mon,  7 Dec 2020 16:09:00 +0000 (UTC)
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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e8e55d8919ea ath11k: add 64bit check before reading msi high addr

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1606199334-18206-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
