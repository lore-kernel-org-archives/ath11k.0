Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIOYu-00042z-0p
 for ath11k@lists.infradead.org; Wed, 16 Sep 2020 03:56:53 +0000
MIME-Version: 1.0
Date: Wed, 16 Sep 2020 11:56:47 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v5 2/8] ath11k: add support for 6GHz radio in driver
In-Reply-To: <20200603001724.12161-3-pradeepc@codeaurora.org>
References: <20200603001724.12161-1-pradeepc@codeaurora.org>
 <20200603001724.12161-3-pradeepc@codeaurora.org>
Message-ID: <98d81c8fab17ee4ed32aa8dee8dd7736@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-03 08:17, Pradeep Kumar Chitrapu wrote:
> This patch adds 6GHz band support and mac80211 registration for
> the 6G phy radio.
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> ---
> v5:
>  - do not add ht/vht caps in 6ghz band.
> v3:
>  - update 6GHz starting frequency as defined in IEEE P802.11ax/D6.1
> 
>  drivers/net/wireless/ath/ath11k/core.h |  6 +-
>  drivers/net/wireless/ath/ath11k/mac.c  | 93 +++++++++++++++++++++-----
>  drivers/net/wireless/ath/ath11k/wmi.c  | 16 ++++-
>  3 files changed, 94 insertions(+), 21 deletions(-)
> 
[...]
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c
> b/drivers/net/wireless/ath/ath11k/wmi.c
> index c2a972377687..291fb274134f 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -368,6 +368,17 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct
> ath11k_pdev_wmi *wmi_handle,
>  	memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
>  	       sizeof(struct ath11k_ppe_threshold));
> 
> +	cap_band = &pdev_cap->band[NL80211_BAND_6GHZ];
> +	cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
> +	cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
> +	cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
> +	cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
> +	cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
> +	memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
> +	       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
> +	memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
> +	       sizeof(struct ath11k_ppe_threshold));
> +
>  	return 0;
>  }
> 
I want to move this under below check(if (mac_phy_caps->supported_bands 
& WMI_HOST_WLAN_5G_CAP) ),
becuase single_pdev 
introduced(https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath11k?id=5f859bc02c7bc7a4094bfba0b4ed145edd7661f2)

Is it will distrub your original logic?
[...]

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
