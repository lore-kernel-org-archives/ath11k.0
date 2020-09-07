Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFEck-0000vO-Gn
 for ath11k@lists.infradead.org; Mon, 07 Sep 2020 10:43:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: add raw mode and software crypto support
References: <1592281555-31556-1-git-send-email-vnaralas@codeaurora.org>
Date: Mon, 7 Sep 2020 10:43:42 +0000
In-Reply-To: <1592281555-31556-1-git-send-email-vnaralas@codeaurora.org>
 (Venkateswara Naralasetty's message of "Tue, 16 Jun 2020 09:55:55
 +0530")
Message-ID: <01010174682a15ec-973dcb7c-129e-40e3-9484-ab591fd19aeb-000000@us-west-2.amazonses.com>
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> writes:

> From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
>
> Adding raw mode tx/rx support; also, adding support
> for software crypto which depends on raw mode.
>
> To enable raw mode tx/rx:
> insmod ath11k.ko frame_mode=0
>
> To enable software crypto:
> insmod ath11k.ko cryptmode=1
>
> These modes could be helpful in debugging crypto related issues.
>
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Adds new warnings:

drivers/net/wireless/ath/ath11k/core.c:23:14: warning: symbol 'cryptmode' was not declared. Should it be static?
drivers/net/wireless/ath/ath11k/mac.c:46:14: warning: symbol 'ath11k_frame_mode' was not declared. Should it be static?

> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -13,10 +13,16 @@
>  #include "debug.h"
>  #include "hif.h"
>  
> +extern unsigned int ath11k_frame_mode;

Please move this to core.h

>  unsigned int ath11k_debug_mask;
>  module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
>  MODULE_PARM_DESC(debug_mask, "Debugging mask");
>  
> +unsigned int cryptmode;

static unsigned int ath11k_crypto_mode;

> +module_param_named(cryptmode, cryptmode, uint, 0644);

module_param_named(crypto_mode, ath11k_crypto_mode, uint, 0644);

[...]

> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -34,7 +34,7 @@
>  }
>  
>  /* frame mode values are mapped as per enum ath11k_hw_txrx_mode */
> -static unsigned int ath11k_frame_mode = ATH11K_HW_TXRX_NATIVE_WIFI;
> +unsigned int ath11k_frame_mode = ATH11K_HW_TXRX_NATIVE_WIFI;
>  module_param_named(frame_mode, ath11k_frame_mode, uint, 0644);
>  MODULE_PARM_DESC(frame_mode,
>  		 "Datapath frame mode (0: raw, 1: native wifi (default), 2: ethernet)"

Better to move this to core.c so that all module parameters are in one
place.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
