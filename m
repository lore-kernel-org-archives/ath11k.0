Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfwi-0001ZJ-1R
 for ath11k@lists.infradead.org; Fri, 11 Sep 2020 10:06:21 +0000
Message-ID: <e60a8168e11aa69a9778fae9a29b8735c5f737b5.camel@sipsolutions.net>
Subject: Re: [PATCH v2 13/24] mac80211: determine chandef from HE 6 GHz
 operation
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 11 Sep 2020 12:06:09 +0200
In-Reply-To: <010101747c80076d-8dc8fdae-d89b-497f-81ac-77d2dd7d94b5-000000@us-west-2.amazonses.com>
References: <20200528213443.993f108e96ca.I0086ae42d672379380d04ac5effb2f3d5135731b@changeid>
 <20200528213443.25687d2695bc.I3f9747c1147480f65445f13eda5c4a5ed4e86757@changeid>
 <010101747c80076d-8dc8fdae-d89b-497f-81ac-77d2dd7d94b5-000000@us-west-2.amazonses.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

On Fri, 2020-09-11 at 09:29 +0000, Wen Gong wrote:
> On 2020-05-29 03:34, Johannes Berg wrote:
> > From: Johannes Berg <johannes.berg@intel.com>
> > 
> > Support connecting to HE 6 GHz APs and mesh networks on 6 GHz,
> > where the HT/VHT information is missing but instead the HE 6 GHz
> > band capability is present, and the 6 GHz Operation information
> > field is used to encode the channel configuration instead of the
> > HT/VHT operation elements.
> > 
> > Also add some other bits needed to connect to 6 GHz networks.
> > 
> > Link:
> > https://lore.kernel.org/r/1589399105-25472-10-git-send-email-rmanohar@codeaurora.org
> > Co-developed-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> > Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> > ---
> >  net/mac80211/ieee80211_i.h |   3 ++
> >  net/mac80211/mesh.c        |   1 +
> >  net/mac80211/mlme.c        |  69 +++++++++++++++++-------
> >  net/mac80211/util.c        | 106 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 160 insertions(+), 19 deletions(-)
> > 
> [...]
> > @@ -4838,21 +4860,23 @@ static int ieee80211_prep_channel(struct
> > ieee80211_sub_if_data *sdata,
> >  			  IEEE80211_STA_DISABLE_160MHZ);
> > 
> >  	/* disable HT/VHT/HE if we don't support them */
> > -	if (!sband->ht_cap.ht_supported) {
> > +	if (!sband->ht_cap.ht_supported && !is_6ghz) {
> >  		ifmgd->flags |= IEEE80211_STA_DISABLE_HT;
> >  		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
> >  		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
> >  	}
> > 
> > -	if (!sband->vht_cap.vht_supported)
> > +	if (!sband->vht_cap.vht_supported && !is_6ghz) {
> >  		ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
> > +		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
> > +	}
> when connec to NL80211_BAND_2GHZ, it does not support vht, then it 
> failed for HE and connected with HT mode.
> I tesed with below change, it fix the issue, it connected with HE mode 
> for NL80211_BAND_2GHZ with an HE mode 11AX AP.

Hmm. Yeah, that seems reasonable. I wonder why/how we never saw this,
hm.

Can you send a real patch?

johannes



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
