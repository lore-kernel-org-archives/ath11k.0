Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHZU-0004MI-Lh
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 13:04:06 +0000
Message-ID: <f74dcc5216cc5a9b14033ce3741216e8bdb88dbe.camel@sipsolutions.net>
Subject: Re: [PATCH V3 2/9] mac80211: add multiple bssid support to
 interface handling
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 27 Aug 2020 15:03:55 +0200
In-Reply-To: <20200812150050.2683396-3-john@phrozen.org>
References: <20200812150050.2683396-1-john@phrozen.org>
 <20200812150050.2683396-3-john@phrozen.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org


> +	struct {
> +		struct ieee80211_vif *parent;
> +		struct list_head list;

Is there a lot of value in having a separate list, vs. iterating all
interfaces and checking the parent pointer?

And exposing the list to the driver seems like a bad idea anyway, they
can't really get locking right.

(to be continued, mail client is acting up)

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
