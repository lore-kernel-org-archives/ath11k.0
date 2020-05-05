Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVsal-0004oW-UA
 for ath11k@lists.infradead.org; Tue, 05 May 2020 08:06:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V2] ath11k: add tx hw 802.11 encapusaltion offloading
 support
References: <20200430152814.18481-1-john@phrozen.org>
Date: Tue, 05 May 2020 11:06:05 +0300
In-Reply-To: <20200430152814.18481-1-john@phrozen.org> (John Crispin's message
 of "Thu, 30 Apr 2020 17:28:14 +0200")
Message-ID: <87ftcedcwi.fsf@kamboji.qca.qualcomm.com>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> writes:

> This patch adds support for ethernet rxtx mode to the driver. The feature
> is enabled via a new module parameter. If enabled to driver will enable
> the feature on a per vif basis if all other requirements were met.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -33,6 +33,11 @@
>  	.max_power              = 30, \
>  }
>  
> +/* frame mode values are mapped as per enum ath11k_hw_txrx_mode */
> +static unsigned int ath11k_ath11k_frame_mode = ATH11K_HW_TXRX_NATIVE_WIFI;
> +module_param_named(ath11k_frame_mode, ath11k_ath11k_frame_mode, uint, 0644);
> +MODULE_PARM_DESC(ath11k_frame_mode, "Datapath frame mode");

I don't think we should add ath11k_ prefix to module names, right? So I
changed that and documented the values:

/* frame mode values are mapped as per enum ath11k_hw_txrx_mode */
static unsigned int ath11k_frame_mode = ATH11K_HW_TXRX_NATIVE_WIFI;
module_param_named(frame_mode, ath11k_frame_mode, uint, 0644);
MODULE_PARM_DESC(frame_mode,
		 "Datapath frame mode (0: raw, 1: native wifi (default), 2: ethernet)");

Also I added a comment to enum ath11k_hw_txrx_mode so that we don't
accidentally change the values. This is now in pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=f0717ed39d06a9f2fd32edbdf88f29939dc25516

Please check my changes.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
