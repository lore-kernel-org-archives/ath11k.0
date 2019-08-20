Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0B1e-000315-1R
 for ath11k@lists.infradead.org; Tue, 20 Aug 2019 20:46:43 +0000
Message-ID: <4076919b34cad119eb4146025f587285ef40e37c.camel@sipsolutions.net>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 20 Aug 2019 22:46:37 +0200
In-Reply-To: <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_181539_894705_E3B317D0)
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_181539_894705_E3B317D0)
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
To: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org

On Tue, 2019-08-20 at 18:47 +0300, Kalle Valo wrote:

> +static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
> +{
> +	struct ath11k *ar = hw->priv;
> +	int ret = 0;
> +
> +	/* mac80211 requires this op to be present and that's why
> +	 * there's an empty function, this can be extended when
> +	 * required.
> +	 */

Well, oops. Maybe it shouldn't be required?

> +	mutex_lock(&ar->conf_mutex);
> +
> +	/* TODO: Handle configuration changes as appropriate */
> +
> +	mutex_unlock(&ar->conf_mutex);

It's not actually empty though - why bother locking the mutex for
nothing?

> +	if (sta->mfp) {
> +		/* TODO: Need to check if FW supports PMF? */

Probably not? shouldn't get a sta with MFP unless you advertised support
for it. At least I'd think so, and consider it a mac80211 bug if you
still did.

> +	/* This is a workaround for HT-enabled STAs which break the spec
> +	 * and have no HT capabilities RX mask (no HT RX MCS map).
> +	 *
> +	 * As per spec, in section 20.3.5 Modulation and coding scheme (MCS),
> +	 * MCS 0 through 7 are mandatory in 20MHz with 800 ns GI at all STAs.

Wouldn't that better be in mac80211?

> +	ampdu_factor = (vht_cap->cap &
> +			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK) >>
> +		       IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_SHIFT;

consider u32_get_bits() or something like that from bitfield.h

> +	/* Workaround: Some Netgear/Linksys 11ac APs set Rx A-MPDU factor to
> +	 * zero in VHT IE. Using it would result in degraded throughput.
> +	 * arg->peer_max_mpdu at this point contains HT max_mpdu so keep
> +	 * it if VHT max_mpdu is smaller.
> +	 */
> +	arg->peer_max_mpdu = max(arg->peer_max_mpdu,
> +				 (1U << (IEEE80211_HT_MAX_AMPDU_FACTOR +
> +					ampdu_factor)) - 1);

Wait, that seems familiar. Again, put it into mac80211?

> +static void ath11k_peer_assoc_h_smps(struct ieee80211_sta *sta,
> +				     struct peer_assoc_params *arg)
> +{
> +	const struct ieee80211_sta_ht_cap *ht_cap = &sta->ht_cap;
> +	int smps;
> +
> +	if (!ht_cap->ht_supported)
> +		return;
> +
> +	smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
> +	smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;

also here, u*_get_bits() or something might be nicer

(and yes, I've written tons of code like this myself before that
existed, which is why I'm pointing it out - it's much nicer)

> +void ath11k_mac_drain_tx(struct ath11k *ar)
> +{
> +	/* make sure rcu-protected mac80211 tx path itself is drained */
> +	synchronize_net();

Doesn't mac80211 ensure that in the relevant places like flush()? But
then again, not sure where you call this.

> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac set fixed rate params vdev %i rate 0x%02hhx nss %hhu sgi %hhu\n",
> +		   arvif->vdev_id, rate, nss, sgi);

nit: that could use a line-break

> +	vdev_param = WMI_VDEV_PARAM_FIXED_RATE;
> +	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
> +					    vdev_param, rate);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to set fixed rate param 0x%02x: %d\n",
> 
> +	/* TODO: Check if HT capability advertised from firmware is different
> +	 * for each band for a dual band capable radio. It will be tricky to
> +	 * handle it when the ht capability different for each band.
> +	 */

For each band shouldn't really be that tricky?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
