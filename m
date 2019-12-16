Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ign7q-0006Gy-W4
 for ath11k@lists.infradead.org; Mon, 16 Dec 2019 09:57:16 +0000
Message-ID: <1a8b7f092969b673c85b21c298f4465b2cce389c.camel@sipsolutions.net>
Subject: Re: [PATCH v2 5/7] mac80211: drop now unused bss_color element
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 16 Dec 2019 10:57:10 +0100
In-Reply-To: <20191213155802.25491-5-john@phrozen.org>
References: <20191213155802.25491-1-john@phrozen.org>
 <20191213155802.25491-5-john@phrozen.org>
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

On Fri, 2019-12-13 at 16:58 +0100, John Crispin wrote:
> With all users of bss_color converted we can drop the old element. Driver
> code should now use the new he_bss_color struct.

I think it'd be OK to squash patches 3-5 together, minimal driver
updates for changing mac80211 API are totally fine and will need to go
via my tree anyway.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
