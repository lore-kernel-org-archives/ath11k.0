Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hblQV-0005S9-U1
 for ath11k@lists.infradead.org; Fri, 14 Jun 2019 12:35:29 +0000
Message-ID: <3ef2937994bb0c4c9076b153deaf3c42e2e9a75f.camel@sipsolutions.net>
Subject: Re: [PATCH V2 4/6] mac80211: HE: add Spatial Reuse IE parsing support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 14 Jun 2019 14:34:15 +0200
In-Reply-To: <20190528114952.838-5-john@phrozen.org>
References: <20190528114952.838-1-john@phrozen.org>
 <20190528114952.838-5-john@phrozen.org>
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

> +/*
> + * ieee80211_he_spr_size - calculate 802.11ax HE Spatial Reuse IE size
> + * @he_spr_ie: byte data of the He Spatial Reuse IE, stating from the the byte
> + *	after the ext ID byte. It is assumed that he_spr_ie has at least
> + *	sizeof(struct ieee80211_he_spr) bytes, checked already in
> + *	ieee802_11_parse_elems_crc()

That reference to mac80211 isn't really quite appropriate here - should
say something like "the caller must have validated this". This is a
lower layer usable by non-mac80211 as well.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
