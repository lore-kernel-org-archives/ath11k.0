Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBGxW-00022J-Ho
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 12:24:52 +0000
Message-ID: <c5b79f189345b0fccbe797a8ed158dcae30fdd10.camel@sipsolutions.net>
Subject: Re: [PATCH V5 3/5] nl80211: add support for BSS coloring
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 27 Aug 2020 14:24:45 +0200
In-Reply-To: <20200826055650.1101224-3-john@phrozen.org>
 (sfid-20200826_075709_238174_DD905459)
References: <20200826055650.1101224-1-john@phrozen.org>
 <20200826055650.1101224-3-john@phrozen.org>
 (sfid-20200826_075709_238174_DD905459)
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


> +	if (info->attrs[NL80211_ATTR_CNTDWN_OFFS_PRESP]) {
> +		params.counter_offset_presp =
> +			nla_get_u16(info->attrs[NL80211_ATTR_CNTDWN_OFFS_PRESP]);

You need to check the attribute size here, apparently only exactly a
single counter is supported.

I'm not really sure *why* though - wouldn't be that much more difficult
to add support for an arbitrary number in mac80211?

Either way this is missing a check.

johannes



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
