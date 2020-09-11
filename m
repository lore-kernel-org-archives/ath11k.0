Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfNb-0002a6-OJ
 for ath11k@lists.infradead.org; Fri, 11 Sep 2020 09:30:04 +0000
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 09:29:59 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2 13/24] mac80211: determine chandef from HE 6 GHz
 operation
In-Reply-To: <20200528213443.25687d2695bc.I3f9747c1147480f65445f13eda5c4a5ed4e86757@changeid>
References: <20200528213443.993f108e96ca.I0086ae42d672379380d04ac5effb2f3d5135731b@changeid>
 <20200528213443.25687d2695bc.I3f9747c1147480f65445f13eda5c4a5ed4e86757@changeid>
Message-ID: <010101747c800753-865cd3de-a9d6-4707-8a74-33e643f0239a-000000@us-west-2.amazonses.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Johannes Berg <johannes.berg@intel.com>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, linux-wireless-owner@vger.kernel.org, ath11k@lists.infradead.org

On 2020-05-29 03:34, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> Support connecting to HE 6 GHz APs and mesh networks on 6 GHz,
> where the HT/VHT information is missing but instead the HE 6 GHz
> band capability is present, and the 6 GHz Operation information
> field is used to encode the channel configuration instead of the
> HT/VHT operation elements.
> 
> Also add some other bits needed to connect to 6 GHz networks.
> 
> Link:
> https://lore.kernel.org/r/1589399105-25472-10-git-send-email-rmanohar@codeaurora.org
> Co-developed-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>  net/mac80211/ieee80211_i.h |   3 ++
>  net/mac80211/mesh.c        |   1 +
>  net/mac80211/mlme.c        |  69 +++++++++++++++++-------
>  net/mac80211/util.c        | 106 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 160 insertions(+), 19 deletions(-)
> 
[...]
> @@ -4838,21 +4860,23 @@ static int ieee80211_prep_channel(struct
> ieee80211_sub_if_data *sdata,
>  			  IEEE80211_STA_DISABLE_160MHZ);
> 
>  	/* disable HT/VHT/HE if we don't support them */
> -	if (!sband->ht_cap.ht_supported) {
> +	if (!sband->ht_cap.ht_supported && !is_6ghz) {
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_HT;
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
>  	}
> 
> -	if (!sband->vht_cap.vht_supported)
> +	if (!sband->vht_cap.vht_supported && !is_6ghz) {
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
> +		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
> +	}
when connec to NL80211_BAND_2GHZ, it does not support vht, then it 
failed for HE and connected with HT mode.
I tesed with below change, it fix the issue, it connected with HE mode 
for NL80211_BAND_2GHZ with an HE mode 11AX AP.
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index b2a9d47cf86d..c85186799d05 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -4853,6 +4853,7 @@ static int ieee80211_prep_channel(struct 
ieee80211_sub_if_data *sdata,
         struct ieee80211_supported_band *sband;
         struct cfg80211_chan_def chandef;
         bool is_6ghz = cbss->channel->band == NL80211_BAND_6GHZ;
+       bool is_5ghz = cbss->channel->band == NL80211_BAND_5GHZ;
         struct ieee80211_bss *bss = (void *)cbss->priv;
         int ret;
         u32 i;
@@ -4871,7 +4872,7 @@ static int ieee80211_prep_channel(struct 
ieee80211_sub_if_data *sdata,
                 ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
         }

-       if (!sband->vht_cap.vht_supported && !is_6ghz) {
+       if (!sband->vht_cap.vht_supported && is_5ghz) {
                 ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
                 ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
         }
> 
>  	if (!ieee80211_get_he_sta_cap(sband))
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
> 
>  	rcu_read_lock();
> 
> -	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HT)) {
> +	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HT) && !is_6ghz) {
>  		const u8 *ht_oper_ie, *ht_cap_ie;
> 
>  		ht_oper_ie = ieee80211_bss_get_ie(cbss, WLAN_EID_HT_OPERATION);
[...]

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
