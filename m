Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2XSh-0007bp-Du
 for ath11k@lists.infradead.org; Mon, 03 Aug 2020 10:12:59 +0000
Message-ID: <78592978a8f3abab0130afc31e8d1fd210cd7d6f.camel@sipsolutions.net>
Subject: Re: [PATCH V5 1/3] nl80211: add support for setting fixed HE
 rate/gi/ltf
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 03 Aug 2020 12:12:44 +0200
In-Reply-To: <90e2d09f1d175e858964517b7365919c5d2b46f2.camel@sipsolutions.net>
 (sfid-20200803_111204_131961_556F5939)
References: <20200803085127.180550-1-john@phrozen.org>
 <90e2d09f1d175e858964517b7365919c5d2b46f2.camel@sipsolutions.net>
 (sfid-20200803_111204_131961_556F5939)
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Mon, 2020-08-03 at 11:11 +0200, Johannes Berg wrote:
> On Mon, 2020-08-03 at 10:51 +0200, John Crispin wrote:
> > From: Miles Hu <milehu@codeaurora.org>
> > 
> > This patch adds the nl80211 structs, definitions, policies and parsing
> > code required to pass fixed HE rate, gi and ltf settings.
> 
> Would be nice to capitalize acronyms like 'GI' and 'LTF' in free text
> ... :)
> 
> >  	[NL80211_TXRATE_VHT] = NLA_POLICY_EXACT_LEN_WARN(sizeof(struct nl80211_txrate_vht)),
> >  	[NL80211_TXRATE_GI] = { .type = NLA_U8 },
> > +	[NL80211_TXRATE_HE] = NLA_POLICY_EXACT_LEN_WARN(sizeof(struct nl80211_txrate_he)),
> 
> _WARN is for backward compatibility, don't use it for new stuff.
> 
> 
> But fixed those and applied.

I take that back, it causes tests that hit the set rate code to crash.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
