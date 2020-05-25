Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8vp-0004I4-J0
 for ath11k@lists.infradead.org; Mon, 25 May 2020 08:58:03 +0000
Message-ID: <695723cd3134d8abf120c886c5d7d5791cae0d03.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/9] cfg80211: Add new channel flag to identify 6GHz
 PSC channel
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 25 May 2020 10:57:56 +0200
In-Reply-To: <05fcfc43f2d59dd549a65a83ab60df60@codeaurora.org>
References: <20200522072431.27601-1-pradeepc@codeaurora.org>
 <20200522072431.27601-2-pradeepc@codeaurora.org>
 <fa1879bf357c091277972b2a370799fdf6192ae3.camel@sipsolutions.net>
 <05fcfc43f2d59dd549a65a83ab60df60@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Fri, 2020-05-22 at 16:46 -0700, Pradeep Kumar Chitrapu wrote:
> IMO, accessing flag would be faster instead of computation, as this info
> is handy (already in cache) when accessing ieee80211_channel.

True.

> However, considering general usage for this info would be only for 
> control
> path, it should be ok to expose function instead of maintaining separate 
> flag.

Yeah, I can't really see where we'd care ... this is used only when we
set up a scan, etc.

> Please let me know your suggestion..

I'll now go and try to consolidate all your changes and ours, we'll see
what falls out.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
