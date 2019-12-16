Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ign0g-0002DK-Pe
 for ath11k@lists.infradead.org; Mon, 16 Dec 2019 09:49:52 +0000
Message-ID: <c4b44147e00a8c86931f680d8ea4825cebb4a524.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/7] mac80211: add a struct for holding BSS color
 settings
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 16 Dec 2019 10:49:42 +0100
In-Reply-To: <20191213155802.25491-1-john@phrozen.org>
References: <20191213155802.25491-1-john@phrozen.org>
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
To: John Crispin <john@phrozen.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Fri, 2019-12-13 at 16:57 +0100, John Crispin wrote:
> Right now we only track the actual color but not the other bits contained
> within the he_oper field. Fix this by creating a new struct to hold all
> of the info.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  include/net/cfg80211.h | 15 +++++++++++++++
>  include/net/mac80211.h |  2 ++
>  2 files changed, 17 insertions(+)

I think you should drop this patch and put the cfg80211 and mac80211
update into the second and third patch of this series, respectively. It
doesn't make much sense to add some unused structs.

> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 8140c4837122..e395ef48af83 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h
> @@ -259,6 +259,19 @@ struct ieee80211_he_obss_pd {

It looks like I didn't see that previously for that one,

> + * struct ieee80211_he_bss_color - AP settings for BSS coloring

but I'd kinda prefer this be called cfg80211_... since it's not part of
ieee80211.h with all the over-the-air struct definitions. I'm sure we
have some non-over-the-air things that are called ieee80211_*, but ...

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
