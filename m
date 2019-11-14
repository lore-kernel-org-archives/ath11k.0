Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV8mF-0006Ki-Iz
 for ath11k@lists.infradead.org; Thu, 14 Nov 2019 06:38:48 +0000
Message-ID: <aa0257b408dc7ad6d5f457ac611e76059549737b.camel@sipsolutions.net>
Subject: Re: [EXT] Re: [PATCH v2 0/2] add Wide Band Scan support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 14 Nov 2019 07:38:34 +0100
In-Reply-To: <6ea305b2ac09c340181623a23cf4180b@codeaurora.org>
References: <1572869374-9635-1-git-send-email-murugana@codeaurora.org>
 <53d45563803b3f96be0d53731408cc3af028c510.camel@sipsolutions.net>
 <00d301d593c2$bd37d8f0$37a78ad0$@codeaurora.org>
 <867302d58d3183ce7e2c7afa846027a787579b87.camel@sipsolutions.net>
 <6ea305b2ac09c340181623a23cf4180b@codeaurora.org>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Mon, 2019-11-11 at 13:27 +0530, Sathishkumar Muruganandam wrote:
> 
> > How is this related to scanning? It sounds to me like you're just
> > (ab)using scan as a somewhat convenient "do some channel hopping" API
> > ...
> > 
> 
> Whether this can be used under "iw offchannel" with 
> NL80211_CMD_REMAIN_ON_CHANNEL?

Not sure what you're asking. Are you asking if I would accept wide
channel extensions to R-O-C? That seems more reasonable than for
scanning anyway. Still I guess I'd like to see an actual reason for it.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
