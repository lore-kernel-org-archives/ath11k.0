Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k18GL-0006QD-Vq
 for ath11k@lists.infradead.org; Thu, 30 Jul 2020 13:06:23 +0000
Message-ID: <b454115ff41f6b52cb511a21dc093e8ce4d72ee2.camel@sipsolutions.net>
Subject: Re: [PATCH V2 05/10] mac80211: propagate multi bssid settings when
 starting
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 15:06:13 +0200
In-Reply-To: <20200706115219.663650-5-john@phrozen.org>
References: <20200706115219.663650-1-john@phrozen.org>
 <20200706115219.663650-5-john@phrozen.org>
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

On Mon, 2020-07-06 at 13:52 +0200, John Crispin wrote:
> 
> +	memcpy(&sdata->vif.bss_conf.multi_bssid, &params->multi_bssid,
> +	       sizeof(struct ieee80211_multi_bssid));

What's wrong with struct assignments? :)

	sdata->vif.bss_conf.multi_bssid = params->multi_bssid;

works just fine ...

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
