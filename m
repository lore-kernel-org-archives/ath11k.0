Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbmvH-0006Re-4K
 for ath11k@lists.infradead.org; Fri, 14 Jun 2019 14:11:22 +0000
Message-ID: <8d0d11ca39b6216b24cf4e9e3a1522072db5c0d2.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/3] mac80211: implement HE support for mesh
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 14 Jun 2019 16:11:15 +0200
In-Reply-To: <20190612193510.29489-3-sven@narfation.org>
 (sfid-20190612_213644_171180_98373DED)
References: <20190612193510.29489-1-sven@narfation.org>
 <20190612193510.29489-3-sven@narfation.org>
 (sfid-20190612_213644_171180_98373DED)
Mime-Version: 1.0
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
To: Sven Eckelmann <sven@narfation.org>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, Sven Eckelmann <seckelmann@datto.com>

On Wed, 2019-06-12 at 21:35 +0200, Sven Eckelmann wrote:
> 
> +u8 ieee80211_ie_len_he_cap(struct ieee80211_sub_if_data *sdata)
> +{
> +	const struct ieee80211_sta_he_cap *he_cap;
> +	struct ieee80211_supported_band *sband;
> +	u8 ie_len;
> +	u8 n;
> +
> +	sband = ieee80211_get_sband(sdata);
> +	if (!sband)
> +		return 0;
> +
> +	he_cap = ieee80211_get_he_mesh_cap(sband);
> +	if (!he_cap)
> +		return 0;
> +
> +	n = ieee80211_he_mcs_nss_size(&he_cap->he_cap_elem);
> +	ie_len = 2 + 1 +
> +		 sizeof(he_cap->he_cap_elem) + n +
> +		 ieee80211_he_ppe_size(he_cap->ppe_thres[0],
> +				       he_cap->he_cap_elem.phy_cap_info);
> +
> +	return ie_len;

There's no value in the "ie_len" variable here.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
