Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hblOf-000429-Vp
 for ath11k@lists.infradead.org; Fri, 14 Jun 2019 12:33:35 +0000
Message-ID: <507ecb111701598ed812dda95c18381a7ae9b720.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] mac80211: add support for the ADDBA extension element
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 14 Jun 2019 14:32:50 +0200
In-Reply-To: <20190521150259.2414-2-john@phrozen.org>
References: <20190521150259.2414-1-john@phrozen.org>
 <20190521150259.2414-2-john@phrozen.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>


>  
> +#define IEEE80211_ADDBA_EXT_ELEM_ID		0x9f

That doesn't really belong here.

> +#define IEEE80211_ADDBA_EXT_ELEM_ID_LEN		0x01

And that's usually not a define?

> +#define IEEE80211_ADDBA_EXT_FRAG_LEVEL_MASK	GENMASK(2, 1)
> +#define IEEE80211_ADDBA_EXT_FRAG_LEVEL_SHIFT	1
> +#define IEEE80211_ADDBA_EXT_NO_FRAG		BIT(0)
> +
> +struct ieee80211_addbaext {
> +	u8 eid;
> +	u8 length;
> +	u8 data;
> +} __packed;

I think we don't typically put the eid/len inside, and then we use
sizeof(struct ...) for the size.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
