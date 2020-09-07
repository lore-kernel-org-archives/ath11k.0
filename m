Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDxw-0007Lv-Uy
 for ath11k@lists.infradead.org; Mon, 07 Sep 2020 10:01:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6 3/3] ath11k: add IPQ6018 support
References: <1598287470-1871-1-git-send-email-akolli@codeaurora.org>
 <1598287470-1871-4-git-send-email-akolli@codeaurora.org>
Date: Mon, 7 Sep 2020 10:01:33 +0000
In-Reply-To: <1598287470-1871-4-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Mon, 24 Aug 2020 22:14:30 +0530")
Message-ID: <0101017468037c4f-2de281be-f6fc-4679-bec6-a80ece121dfb-000000@us-west-2.amazonses.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> IPQ6018 has one 5G and one 2G radio with 2x2,
> shares ipq8074 configurations.
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

> @@ -890,9 +995,15 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
>  		goto err_hal_srng_deinit;
>  	}
>  
> -	ab->hw_params.svc_to_ce_map_len =
> +	if (ab->hw_rev == ATH11K_HW_IPQ8074) {
> +		ab->hw_params.svc_to_ce_map_len =
>  			ARRAY_SIZE(target_service_to_ce_map_wlan_ipq8074);
> -	ab->hw_params.svc_to_ce_map = target_service_to_ce_map_wlan_ipq8074;
> +		ab->hw_params.svc_to_ce_map = target_service_to_ce_map_wlan_ipq8074;
> +	} else if (ab->hw_rev == ATH11K_HW_IPQ6018) {
> +		ab->hw_params.svc_to_ce_map_len =
> +			ARRAY_SIZE(target_service_to_ce_map_wlan_ipq6018);
> +		ab->hw_params.svc_to_ce_map = target_service_to_ce_map_wlan_ipq6018;
> +	}

The idea of having ab->hw_params is to avoid the need for hw_rev
sprinkled all over the code, this here defeats the purpose. I recommend
checking if my proposal from an earlier version is implementable:

"You could copy the map arrays to hw.c, as an example see how
 ath11k_hw_ring_mask_ipq8074 is implemented. That way we don't need any
 new hw_rev checks."


-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
