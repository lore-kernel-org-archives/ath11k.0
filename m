Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeHWR-0005VG-VQ
 for ath11k@lists.infradead.org; Thu, 28 May 2020 12:20:33 +0000
Message-ID: <ce7d58fd1b504dfa8d4444d1fe8e62e2f475dab9.camel@sipsolutions.net>
Subject: Re: [PATCH v3 07/11] mac80211: add HE 6 GHz Band Capability IE in
 Assoc. Request
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 May 2020 14:20:27 +0200
In-Reply-To: <1589399105-25472-7-git-send-email-rmanohar@codeaurora.org>
 (sfid-20200513_214546_498367_3B5A386B)
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-7-git-send-email-rmanohar@codeaurora.org>
 (sfid-20200513_214546_498367_3B5A386B)
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Hi again :)

So ...

> @@ -4803,7 +4809,8 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
>  	if (!sband->ht_cap.ht_supported) {
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_HT;
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
> -		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
> +		if (sband->band != NL80211_BAND_6GHZ)
> +			ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
>  	}
>  
>  	if (!sband->vht_cap.vht_supported)
> @@ -5493,7 +5500,8 @@ int ieee80211_mgd_assoc(struct ieee80211_sub_if_data *sdata,
>  	if (req->flags & ASSOC_REQ_DISABLE_HT) {
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_HT;
>  		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
> -		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
> +		if (sband->band != NL80211_BAND_6GHZ)
> +			ifmgd->flags |= IEEE80211_STA_DISABLE_HE;

I had dropped these bits from the patch earlier, because they didn't
really seem to belong here.

Now that I look at them in more detail, and compare to what I had done
before, it seems that this isn't really suitable...

For example for better or worse, IEEE80211_STA_DISABLE_HT and
IEEE80211_STA_DISABLE_VHT are checked in various places, for example in
the CSA code.

I had instead done here

bool is_6ghz = cbss->channel->band == NL80211_BAND_6GHZ;

[...]

-        if (!sband->ht_cap.ht_supported) {
+        if (!sband->ht_cap.ht_supported && !is_6ghz) {

and so on.


Technically, *of course* you're right in that HT/VHT are disabled on 6
GHz channels. In practice, we've clearly not disentangled that enough
yet, I think.

I'll post the patch as I had it, wrt. these flags, and then we can see
about cleaning it up?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
