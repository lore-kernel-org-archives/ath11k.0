Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbmyP-0007XO-Ek
 for ath11k@lists.infradead.org; Fri, 14 Jun 2019 14:14:34 +0000
Message-ID: <bd02c49411759bcbb5305d0f361791ecaf0281b6.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/3] mac80211: implement HE support for mesh
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 14 Jun 2019 16:14:20 +0200
In-Reply-To: <2194147.kqlnQF7k4C@bentobox>
References: <20190612193510.29489-1-sven@narfation.org>
 <20190612193510.29489-3-sven@narfation.org>
 <8d0d11ca39b6216b24cf4e9e3a1522072db5c0d2.camel@sipsolutions.net>
 <2194147.kqlnQF7k4C@bentobox>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Fri, 2019-06-14 at 16:13 +0200, Sven Eckelmann wrote:
> On Friday, 14 June 2019 16:11:15 CEST Johannes Berg wrote:
> > > +       ie_len = 2 + 1 +
> > > +                sizeof(he_cap->he_cap_elem) + n +
> > > +                ieee80211_he_ppe_size(he_cap->ppe_thres[0],
> > > +                                      he_cap->he_cap_elem.phy_cap_info);
> > > +
> > > +       return ie_len;
> > 
> > There's no value in the "ie_len" variable here.
> 
> Sorry, my parser just broke. Why is there no value in ie_len? Was just 
> assigned a line before. Or are you talking about something else?

Heh, sorry. I mean, there's no value in having the variable, you could
just
	return 2 + 1 + ...

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
