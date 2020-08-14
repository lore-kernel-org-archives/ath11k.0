Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6VHQ-0001H5-HQ
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 08:41:41 +0000
MIME-Version: 1.0
Date: Fri, 14 Aug 2020 14:11:38 +0530
From: Karthikeyan periyasamy <periyasa@codeaurora.org>
Subject: Re: [PATCH V4 4/5] mac80211: add support for BSS coloring
In-Reply-To: <20200811080107.3615705-4-john@phrozen.org>
References: <20200811080107.3615705-1-john@phrozen.org>
 <20200811080107.3615705-4-john@phrozen.org>
Message-ID: <fe02e5697e40cb02aa007acc50fb3a60@codeaurora.org>
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
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

> The CCA (color change announcement) is very similar to how CSA works 
> where
> we have an IE that includes a counter. When the counter hits 0, the new
> color is applied via an updated beacon.
> 
> This patch makes the CSA counter functionality reusable, rather than
> implementing it again. This also allows for future reuse incase support
> for other counter IEs gets added.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  include/net/mac80211.h     |  28 +++++
>  net/mac80211/cfg.c         | 227 +++++++++++++++++++++++++++++++++++--
>  net/mac80211/ieee80211_i.h |  12 ++
>  net/mac80211/iface.c       |   3 +
>  net/mac80211/tx.c          |  24 ++--
>  5 files changed, 276 insertions(+), 18 deletions(-)
...
> 
> +static int ieee80211_cca_finalize(struct ieee80211_sub_if_data *sdata)
> +{
> +	struct ieee80211_local *local = sdata->local;
> +	u32 changed = 0;
> +	int err;
> +
> +	sdata_assert_lock(sdata);
> +	lockdep_assert_held(&local->mtx);
> +
> +	sdata->vif.cca_active = false;
> +
> +	err = ieee80211_set_after_cca_beacon(sdata, &changed);
> +	if (err) {
> +		cfg80211_color_change_aborted_notify(sdata->dev);
> +		return err;
> +	}
> +
> +	sdata->vif.bss_conf.he_bss_color.color = sdata->vif.cca_color;
> +	sdata->vif.bss_conf.he_bss_color.enabled = 1;
> +	changed |= BSS_CHANGED_HE_BSS_COLOR;
> +

Why we are not updating the bss color information in he_oper.params.
IMHO remove the redundant information of bss color in the "struct 
ieee80211_bss_conf" by removing
the he_bss_color since he_oper.params holds more information in u32 
itself.
What do you think?

> +	ieee80211_bss_info_change_notify(sdata, changed);
> +
> +	cfg80211_color_change_notify(sdata->dev);
> +
> +	return 0;
> +}
> +
> +void ieee80211_cca_finalize_work(struct work_struct *work)
> +{
> +	struct ieee80211_sub_if_data *sdata =
> +		container_of(work, struct ieee80211_sub_if_data,
> +			     cca_finalize_work);
> +	struct ieee80211_local *local = sdata->local;
> +
> +	sdata_lock(sdata);
> +	mutex_lock(&local->mtx);
> +
> +	/* AP might have been stopped while waiting for the lock. */
> +	if (!sdata->vif.cca_active)
> +		goto unlock;
> +
> +	if (!ieee80211_sdata_running(sdata))
> +		goto unlock;
> +
> +	ieee80211_cca_finalize(sdata);
> +
> +unlock:
> +	mutex_unlock(&local->mtx);
> +	sdata_unlock(sdata);
> +}
> +
> +void ieee80211_cca_finish(struct ieee80211_vif *vif)
> +{
> +	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
> +
> +	ieee80211_queue_work(&sdata->local->hw,
> +			     &sdata->cca_finalize_work);
> +}
> +EXPORT_SYMBOL_GPL(ieee80211_cca_finish);
> +
> +void
> +ieeee80211_obss_color_collision_notify(struct ieee80211_vif *vif,
> +				       u64 color_bitmap)
> +{
> +	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
> +
> +	if (sdata->vif.cca_active || sdata->vif.csa_active)
> +		return;
> +
> +	cfg80211_obss_color_collision_notify(sdata->dev, color_bitmap);
> +}
> +EXPORT_SYMBOL_GPL(ieeee80211_obss_color_collision_notify);
> +
> +static int
> +__ieee80211_color_change(struct wiphy *wiphy, struct net_device *dev,
> +			 struct cfg80211_color_change_settings *params)
> +{
> +	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
> +	struct ieee80211_local *local = sdata->local;
> +	u32 changed = 0;
> +	int err;
> +
> +	sdata_assert_lock(sdata);
> +	lockdep_assert_held(&local->mtx);
> +
> +	/* don't allow another color change if one is already active or if 
> csa
> +	 * is active
> +	 */
> +	if (sdata->vif.cca_active || sdata->vif.csa_active)
> +		return -EBUSY;
> +
> +	err = ieee80211_set_cca_beacon(sdata, params, &changed);
> +	if (err)
> +		return err;
> +
> +	sdata->vif.cca_active = true;
> +	sdata->vif.cca_color = params->color;
> +
> +	cfg80211_color_change_started_notify(sdata->dev, params->count);
> +
> +	if (changed) {
> +		sdata->vif.bss_conf.he_bss_color.enabled = 0;
> +		changed |= BSS_CHANGED_HE_BSS_COLOR;

same here

> +		ieee80211_bss_info_change_notify(sdata, changed);
> +	} else {
> +		/* if the beacon didn't change, we can finalize immediately */
> +		ieee80211_cca_finalize(sdata);
> +	}
> +
> +	return 0;
> +}

Thanks
Karthikeyan P

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
