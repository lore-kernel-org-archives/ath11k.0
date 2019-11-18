Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWnjf-00030N-6A
 for ath11k@lists.infradead.org; Mon, 18 Nov 2019 20:35:00 +0000
Subject: Re: [PATCH] trivial: ath11k: fix indentation error
References: <20191118203351.24899-1-john@phrozen.org>
From: John Crispin <john@phrozen.org>
Message-ID: <3ae3a4a6-d265-ecd5-86e2-d028ba892372@phrozen.org>
Date: Mon, 18 Nov 2019 21:34:56 +0100
MIME-Version: 1.0
In-Reply-To: <20191118203351.24899-1-john@phrozen.org>
Content-Language: en-US
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
Cc: ath11k@lists.infradead.org

On 18/11/2019 21:33, John Crispin wrote:
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 4e0800205a71..2bb1397eb22c 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3891,7 +3891,7 @@ ath11k_mac_prepare_he_mode(struct ath11k_pdev *pdev, u32 viftype)
>   	/* TODO WDS and other modes */
>   	if (viftype == NL80211_IFTYPE_AP) {
>   		hemode |= FIELD_PREP(HE_MODE_MU_TX_BFER,
> -			   HECAP_PHY_MUBFMR_GET(hecap_phy_ptr)) |
> +			HECAP_PHY_MUBFMR_GET(hecap_phy_ptr)) |
>   			FIELD_PREP(HE_MODE_DL_OFDMA, HE_DL_MUOFDMA_ENABLE) |
>   			FIELD_PREP(HE_MODE_UL_OFDMA, HE_UL_MUOFDMA_ENABLE);
>   	} else {
> 

ignore V1 please

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
