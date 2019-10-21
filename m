Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMegb-0005ph-2p
 for ath11k@lists.infradead.org; Mon, 21 Oct 2019 20:53:54 +0000
MIME-Version: 1.0
Date: Mon, 21 Oct 2019 13:53:51 -0700
From: Jeff Johnson <jjohnson@codeaurora.org>
Subject: Re: [PATCH v2 02/49] ath11k: add Kconfig
In-Reply-To: <1571565847-10338-3-git-send-email-kvalo@codeaurora.org>
References: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
 <1571565847-10338-3-git-send-email-kvalo@codeaurora.org>
Message-ID: <6ffc215251b54d562496d978bdbbcead@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2019-10-20 03:03, Kalle Valo wrote:
> [...snip...]
> +config ATH11K_TRACING
> +	bool "ath11k tracing support"
> +	depends on ATH11K && EVENT_TRACING
> +	---help---
> +	  Select this to ath11k use tracing infrastructure.

Help text does not parse

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
