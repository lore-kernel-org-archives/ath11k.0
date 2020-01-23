Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuZ3K-0006iR-IW
 for ath11k@lists.infradead.org; Thu, 23 Jan 2020 09:45:33 +0000
MIME-Version: 1.0
Date: Thu, 23 Jan 2020 15:15:26 +0530
From: periyasa@codeaurora.org
Subject: Re: [RESEND] ath11k: add tx hw 802.11 encapusaltion offloading support
In-Reply-To: <20200122142930.19239-1-john@phrozen.org>
References: <20200122142930.19239-1-john@phrozen.org>
Message-ID: <d4c4c85868ad02bb4b65b7de0f31f264@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>

> This patch adds support for ethernet rxtx mode to the driver. The 
> feature
> is enabled via a new module parameter. If enabled to driver will enable
> the feature on a per vif basis if all other requirements were met.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.h  |  5 +++
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 16 ++++++++--
>  drivers/net/wireless/ath/ath11k/mac.c   | 41 ++++++++++++++++++++-----
>  3 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> b/drivers/net/wireless/ath/ath11k/mac.c
> index 556eef9881a7..f56adba5f838 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -33,6 +33,10 @@
>  	.max_power              = 30, \
>  }
> 
> +static unsigned int ath11k_ethernet_mode;
> +module_param_named(ethernet_mode, ath11k_ethernet_mode, uint, 0644);
> +MODULE_PARM_DESC(ethernet_mode, "Use ethernet frame datapath");
> +

Shall we have a generic module parameter instead of a dedicated module 
parameter for ethernet mode?
so that we can extend this module parameter for raw mode also like below

/* 0 - Nativi wifi
  * 1 - Ethernet mode
  */
static unsigned int ath11k_mode;
module_param_named(mode, ath11k_mode, uint, 0644);
MODULE_PARM_DESC(mode, "Use for rxtx frame datapath");

- Karthikeyan

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
