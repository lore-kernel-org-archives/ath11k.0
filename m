Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBH24-0002Jp-AH
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 12:29:34 +0000
Message-ID: <3f8502b5e185e2d21fe50d9039524d0dc30a0d14.camel@sipsolutions.net>
Subject: Re: [PATCH V5 4/5] mac80211: add support for BSS coloring
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 27 Aug 2020 14:29:26 +0200
In-Reply-To: <20200826055650.1101224-4-john@phrozen.org>
 (sfid-20200826_075710_318035_1DE9E6C8)
References: <20200826055650.1101224-1-john@phrozen.org>
 <20200826055650.1101224-4-john@phrozen.org>
 (sfid-20200826_075710_318035_1DE9E6C8)
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

On Wed, 2020-08-26 at 07:56 +0200, John Crispin wrote:
> 
> +	INIT_WORK(&sdata->color_change_finalize_work, ieee80211_color_change_finalize_work);

Here, for example.

But that wasn't why I replied again.

Do we really need a separate work? We already make quite a few
assumptions about this not happening in parallel with CSA, and so it
seems we could even reuse this bit of the code?


johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
