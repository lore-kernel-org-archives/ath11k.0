Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWZI3-0004Th-Ab
 for ath11k@lists.infradead.org; Thu, 07 May 2020 05:41:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: Add support for multibus support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200506094400.4740-2-govinds@codeaurora.org>
References: <20200506094400.4740-2-govinds@codeaurora.org>
Message-Id: <20200507054144.E8F95C433BA@smtp.codeaurora.org>
Date: Thu,  7 May 2020 05:41:44 +0000 (UTC)
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

Govind Singh <govinds@codeaurora.org> wrote:

> Current design supports only AHB interface for
> 11ax chipset. Refactor the code by adding hif layer
> for bus level abstraction to support  PCI based device.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This had sparse warnings, I fixed them in the pending branch:

drivers/net/wireless/ath/ath11k/ahb.c:1020:5: warning: no previous prototype for 'ath11k_ahb_init' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/ahb.c:1026:6: warning: no previous prototype for 'ath11k_ahb_exit' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/ahb.c:1020:5: warning: symbol 'ath11k_ahb_init' was not declared. Should it be static?
drivers/net/wireless/ath/ath11k/ahb.c:1026:6: warning: symbol 'ath11k_ahb_exit' was not declared. Should it be static?

-- 
https://patchwork.kernel.org/patch/11530873/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
