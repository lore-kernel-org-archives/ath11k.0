Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C145C5479D
	for <ath11k@archiver.kernel.org>; Mon,  9 Jan 2023 10:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZJxDHXbGlYiZ+1/1zMvxth+/MqsqMmPSerCDqMyCg0=; b=bpdk00WlxNRYF1
	7GwFtAqhpMgWYZfu7GSY97bUcIYT2JnSaGk0kfU9lWfJr647ekpyrvm7tC4LkJffhqHhKkx+oNGp1
	c9d2rfjWi9zkZxh1z0kWahxVRINciWxFOzjXlSgAab+i0roylJ5qGcZZ06J432H1JE9FAr5bOyWmi
	O8HxL6bEqWyxNpIwEfEgoOrPmbNKwgIffZGCzjgqCD82Ltf3l6bZ4Tz7kaZmXHz/pPOvc+IW+TBII
	+8C3znu3R5L9YP4M/ufc1+7yt3VeGDDM505hfa43qEJKsZuwSIWR5vfcITaAObB7v1LpxcTDKiqgX
	6yDK220h6+TPO1t7Palw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEp1s-000hlm-7I; Mon, 09 Jan 2023 10:05:20 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEp1o-000hkV-SC
	for ath11k@lists.infradead.org; Mon, 09 Jan 2023 10:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=WZWeJLEzMsm5772nG/08xGtisx6me5lL7YIJqPjIX/k=;
	t=1673258716; x=1674468316; b=MaWhNPUwzMF/aFRMvyvmihHt6mD4pVsAnq3iQMvD/b7a4a0
	5DBpAVyaKX1VFB/46qfTnwSZF7eygWZnOF5a3GMXCRWzT70V/6Z+IWXscaB9hCN0aaO8uJENze7FT
	xWq1lx4b/ETxOi7nxBSpLtALrQCFkWaBkvstR8ZfoKNE/Kr2p999uaMQyQyDOV3BlJb5zMPNQq9m7
	H9C6fwALd9BdgeL94BdBHipOTAQEV87a4Z69ad8RnXuLMp56H5QVpEaEEXbc55wmG2bdbcnY7CYjc
	LFnRnCNlZhSTkuzS16NwM8kJigY00Pp+lkgIn8kJit11WyzJqZTaT5q070gst3Jg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pEp1f-00EE9O-0B;
	Mon, 09 Jan 2023 11:05:07 +0100
Message-ID: <6187b1566674ba2e0d7d5413af5475688d8421b3.camel@sipsolutions.net>
Subject: Re: [PATCH v10 3/5] cfg80211/mac80211: move interface counting for
 combination check to mac80211
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, Luciano Coelho
 <luciano.coelho@intel.com>,  linux-wireless@vger.kernel.org
Cc: michal.kazior@tieto.com, sw@simonwunderlich.de, 
 andrei.otcheretianski@intel.com, eliad@wizery.com,
 ath11k@lists.infradead.org
Date: Mon, 09 Jan 2023 11:05:06 +0100
In-Reply-To: <4de1f964-b623-2b31-c044-60cc188fc134@quicinc.com>
References: <1394547394-3910-1-git-send-email-luciano.coelho@intel.com>
	 <1394547394-3910-4-git-send-email-luciano.coelho@intel.com>
	 <4de1f964-b623-2b31-c044-60cc188fc134@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_020517_080386_183109F2 
X-CRM114-Status: GOOD (  13.50  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, 2023-01-09 at 17:39 +0800, Wen Gong wrote:
> On 3/11/2014 10:16 PM, Luciano Coelho wrote:
> > ...
> > +int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
> > +				 const struct cfg80211_chan_def *chandef,
> > +				 enum ieee80211_chanctx_mode chanmode,
> > +				 u8 radar_detect)
> > +{
> > +	struct ieee80211_local *local = sdata->local;
> > +	struct ieee80211_sub_if_data *sdata_iter;
> > +	enum nl80211_iftype iftype = sdata->wdev.iftype;
> > +	int num[NUM_NL80211_IFTYPES];
> > +	struct ieee80211_chanctx *ctx;
> > +	int num_different_channels = 1;
> > +	int total = 1;
> > +
> > +	lockdep_assert_held(&local->chanctx_mtx);
> > +
> > +	if (WARN_ON(hweight32(radar_detect) > 1))
> > +		return -EINVAL;
> > +
> > +	if (WARN_ON(chanmode == IEEE80211_CHANCTX_SHARED && !chandef->chan))
> > +		return -EINVAL;
> > +
> > +	if (WARN_ON(iftype >= NUM_NL80211_IFTYPES))
> > +		return -EINVAL;
> > +
> > +	/* Always allow software iftypes */
> > +	if (local->hw.wiphy->software_iftypes & BIT(iftype)) {
> > +		if (radar_detect)
> > +			return -EINVAL;
> > +		return 0;
> > +	}
> > +
> > +	memset(num, 0, sizeof(num));
> > +
> > +	if (iftype != NL80211_IFTYPE_UNSPECIFIED)
> > +		num[iftype] = 1;
> > +
> > +	list_for_each_entry(ctx, &local->chanctx_list, list) {
> > +		if (ctx->conf.radar_enabled)
> > +			radar_detect |= BIT(ctx->conf.def.width);
> > +		if (ctx->mode == IEEE80211_CHANCTX_EXCLUSIVE) {
> > +			num_different_channels++;
> > +			continue;
> > +		}
> > +		if ((chanmode == IEEE80211_CHANCTX_SHARED) &&
> > +		    cfg80211_chandef_compatible(chandef,
> > +						&ctx->conf.def))
> > +			continue;
> > +		num_different_channels++;
> > +	}
> > +
> > +	list_for_each_entry_rcu(sdata_iter, &local->interfaces, list) {
> > +		struct wireless_dev *wdev_iter;
> > +
> > +		wdev_iter = &sdata_iter->wdev;
> > +
> > +		if (sdata_iter == sdata ||
> > +		    rcu_access_pointer(sdata_iter->vif.chanctx_conf) == NULL ||
> > +		    local->hw.wiphy->software_iftypes & BIT(wdev_iter->iftype))
> > +			continue;
> > +
> > +		num[wdev_iter->iftype]++;
> > +		total++;
> > +	}
> > +
> > +	if (total == 1 && !radar_detect)
> > +		return 0;
> > +
> 
> should also check with cfg80211_check_combinations() when total == 1 and 
> num_different_channels > 1 ?
> 
> When MLO is enabled, it could have 2 channels for one ieee80211_sub_if_data.
> 

Heh. You're commenting on a patch from 2014, well before MLO :-)

Not sure what happens in the code now?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
