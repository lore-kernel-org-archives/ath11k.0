Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQJsf-0002YX-PC
 for ath11k@lists.infradead.org; Thu, 08 Oct 2020 00:34:02 +0000
MIME-Version: 1.0
Date: Wed, 07 Oct 2020 17:33:58 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH V3 2/9] mac80211: add multiple bssid support to interface
 handling
In-Reply-To: <20200812150050.2683396-3-john@phrozen.org>
References: <20200812150050.2683396-1-john@phrozen.org>
 <20200812150050.2683396-3-john@phrozen.org>
Message-ID: <6e914f17bc1fcd57bfb1a0d9f68fe4ad@codeaurora.org>
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

> 
>  static int ieee80211_del_iface(struct wiphy *wiphy, struct 
> wireless_dev *wdev)
>  {
> +	struct ieee80211_sub_if_data *sdata;
> +	struct ieee80211_vif *child, *tmp;
> +
> +	sdata = IEEE80211_WDEV_TO_SUB_IF(wdev);
> +	if (sdata->vif.type == NL80211_IFTYPE_AP) {
Hi John, Observed a NULL ptr dereference error here..

Thanks
Pradeep

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
