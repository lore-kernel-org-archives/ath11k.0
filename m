Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEAIV-0006gO-Aa
 for ath11k@lists.infradead.org; Fri, 04 Sep 2020 11:54:29 +0000
Message-ID: <8cb5f5e38fd5c7ba86eeb89c4aa2da84c16b0d94.camel@sipsolutions.net>
Subject: Re: [PATCH v2 24/24] nl80211/cfg80211: support 6 GHz scanning
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 04 Sep 2020 13:54:01 +0200
In-Reply-To: <0101017458f6053e-2ee09f0c-2268-4538-af18-1ed0681f259b-000000@us-west-2.amazonses.com>
References: <20200528213443.993f108e96ca.I0086ae42d672379380d04ac5effb2f3d5135731b@changeid>
 <20200528213443.1b4cb4ffc82b.I9d94ae093e08fb15b6c8f8fb7406b316778c6a5f@changeid>
 <0101017458f6053e-2ee09f0c-2268-4538-af18-1ed0681f259b-000000@us-west-2.amazonses.com>
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
Cc: Tova Mussai <tova.mussai@intel.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, linux-wireless-owner@vger.kernel.org, ath11k@lists.infradead.org

On Fri, 2020-09-04 at 11:52 +0000, Wen Gong wrote:
> On 2020-05-29 03:34, Johannes Berg wrote:
> > From: Tova Mussai <tova.mussai@intel.com>
> > 
> > Support 6 GHz scanning, by
> >  * a new scan flag to scan for colocated BSSes advertised
> >    by (and found) APs on 2.4 & 5 GHz
> >  * doing the necessary reduced neighbor report parsing for
> >    this, to find them
> >  * adding the ability to split the scan request in case the
> >    device by itself cannot support this.
> > 
> > Also add some necessary bits in mac80211 to not break with
> > these changes.
> > 
> > Signed-off-by: Tova Mussai <tova.mussai@intel.com>
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> > ---
> >  include/net/cfg80211.h       |  29 ++-
> >  include/uapi/linux/nl80211.h |   3 +
> >  net/mac80211/scan.c          |   9 +-
> >  net/wireless/core.c          |   4 +-
> >  net/wireless/core.h          |   5 +-
> >  net/wireless/nl80211.c       |  11 +-
> >  net/wireless/scan.c          | 482 ++++++++++++++++++++++++++++++++++-
> >  7 files changed, 527 insertions(+), 16 deletions(-)
> ...
> Is this patch have interface for application such as iw, wpa_supplicant?

It's mostly standalone, but yeah, there are a few flags to add like
"please scan the colocated APs". I can post an iw/wpa_s patch for them
too.

Mostly though I'm wondering how everyone else did this since I haven't
seen any other patches along these lines? Even if the logic in cfg80211
isn't needed because it's in firmware, it seems the small API changes
would still be good to have?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
