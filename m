Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieAlI-0003J0-RJ
 for ath11k@lists.infradead.org; Mon, 09 Dec 2019 04:35:10 +0000
MIME-Version: 1.0
Date: Mon, 9 Dec 2019 04:35:05 +0000
From: vthiagar@codeaurora.org
Subject: Re: [PATCH 7/7] ath11k: add handling for BSS color
In-Reply-To: <20191206143401.4080-7-john@phrozen.org>
References: <20191206143401.4080-1-john@phrozen.org>
 <20191206143401.4080-7-john@phrozen.org>
Message-ID: <0101016ee8f07d9b-f7bef638-39da-4143-9dab-7261ee278bc5-000000@us-west-2.amazonses.com>
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
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-12-06 20:04, John Crispin wrote:
> This patch adds code to handle the BSS_CHANGED_BSS_COLOR flag. IT will
> trigger the propagation of BSS color settings into the FW. Handling is
> slightly different between AP and STA interfaces.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> b/drivers/net/wireless/ath/ath11k/mac.c
> index 6a8c1c3b8da2..c692922513b2 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -1928,6 +1928,19 @@ static void
> ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  		ath11k_wmi_send_obss_spr_cmd(ar, arvif->vdev_id,
>  					     &info->he_obss_pd);
> 
> +	if (changed & BSS_CHANGED_HE_BSS_COLOR) {
> +		if (vif->type == NL80211_IFTYPE_AP) {
> +			ath11k_wmi_send_obss_color_collision_cfg_cmd(
> +				ar, arvif->vdev_id, info->he_bss_color.color,
> +				ATH11K_BSS_COLOR_COLLISION_DETECTION_AP_PERIOD_MS,
> +				!info->he_bss_color.disabled);

No error code check required, why?

> +		} else if (vif->type == NL80211_IFTYPE_STATION) {
> +			ath11k_wmi_send_bss_color_change_enable_cmd(ar, arvif->vdev_id, 1);
> +			ath11k_wmi_send_obss_color_collision_cfg_cmd(ar, arvif->vdev_id, 0,
> +				ATH11K_BSS_COLOR_COLLISION_DETECTION_STA_PERIOD_MS, 1);

Same here.


Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
