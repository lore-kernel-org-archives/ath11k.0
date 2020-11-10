Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcLkS-0001mE-Q4
 for ath11k@lists.infradead.org; Tue, 10 Nov 2020 04:59:18 +0000
MIME-Version: 1.0
Date: Tue, 10 Nov 2020 10:29:12 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH] ath11k: Fix the rx_filter flag setting for peer rssi stats
In-Reply-To: <1604408857-5912-1-git-send-email-mkenna@codeaurora.org>
References: <1604408857-5912-1-git-send-email-mkenna@codeaurora.org>
Message-ID: <4d2ad5a7a45c1d8c2550ebdbf634d688@codeaurora.org>
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
To: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-11-03 18:37, Maharaja Kennadyrajan wrote:
> Set the rx_filter in ath11k_mac_config_mon_status_default(),
> only when the rx_filter value exists in ath11k_debug_rx_filter().
> 
> Without this change, rx_filter gets set to 0 and peer rssi stats
> aren't updating properly from firmware.
> 
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01230-QCAHKSWPL_SILICONZ-4
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> b/drivers/net/wireless/ath/ath11k/mac.c
> index 7f8dd47..c2d013a 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -4094,7 +4094,8 @@ static int
> ath11k_mac_config_mon_status_default(struct ath11k *ar, bool enable)
> 
>  	if (enable) {
>  		tlv_filter = ath11k_mac_mon_status_filter_default;
> -		tlv_filter.rx_filter = ath11k_debugfs_rx_filter(ar);
> +		if (ath11k_debug_rx_filter(ar))
> +			tlv_filter.rx_filter = ath11k_debug_rx_filter(ar);
>  	}
> 
>  	for (i = 0; i < ab->hw_params.num_rxmda_per_pdev; i++) {

[Maha]: Hi all, please drop this patch as this patch needs a comment to 
be addressed.
I will send v2 patch.

Regards,
Maha

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
