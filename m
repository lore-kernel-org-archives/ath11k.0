Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDAd-0008NU-S3
 for ath11k@lists.infradead.org; Thu, 28 May 2020 07:41:45 +0000
MIME-Version: 1.0
Date: Thu, 28 May 2020 00:41:39 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH v3 1/9] cfg80211: Add helper function to identify 6GHz PSC
 channel
In-Reply-To: <643b2e386881de3051f35eaf64d36344cb2df9f6.camel@sipsolutions.net>
References: <20200526224217.11119-1-pradeepc@codeaurora.org>
 <20200526224217.11119-2-pradeepc@codeaurora.org>
 (sfid-20200527_004804_951011_BE3F0562)
 <643b2e386881de3051f35eaf64d36344cb2df9f6.camel@sipsolutions.net>
Message-ID: <4f4b4023d38d75bfa7f95db1aa1a3056@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org


> static inline bool cfg80211_channel_is_psc(struct ieee80211_channel 
> *chan)
> {
> 	if (chan->band != NL80211_BAND_6GHZ)
> 		return false;
> 
> 	return ieee80211_frequency_to_channel(chan->center_freq) % 16 == 5;
> }
> 
> johannes
sure Johannes. Above looks neat.

Thanks
pradeep

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
