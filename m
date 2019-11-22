Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY8JR-0006Rc-5n
 for ath11k@lists.infradead.org; Fri, 22 Nov 2019 12:45:30 +0000
Message-ID: <71e7fef40c048be83c92c60fbf4166ec41a6a018.camel@sipsolutions.net>
Subject: Re: [EXT] Re: [PATCH v2 0/2] add Wide Band Scan support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 22 Nov 2019 13:45:17 +0100
In-Reply-To: <2354c9e9f86b2207d6828b45e4055191@codeaurora.org>
References: <1572869374-9635-1-git-send-email-murugana@codeaurora.org>
 <53d45563803b3f96be0d53731408cc3af028c510.camel@sipsolutions.net>
 <00d301d593c2$bd37d8f0$37a78ad0$@codeaurora.org>
 <867302d58d3183ce7e2c7afa846027a787579b87.camel@sipsolutions.net>
 <6ea305b2ac09c340181623a23cf4180b@codeaurora.org>
 <aa0257b408dc7ad6d5f457ac611e76059549737b.camel@sipsolutions.net>
 <2354c9e9f86b2207d6828b45e4055191@codeaurora.org>
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

On Thu, 2019-11-14 at 18:03 +0530, Sathishkumar Muruganandam wrote:
> On 2019-11-14 12:08, Johannes Berg wrote:
> > On Mon, 2019-11-11 at 13:27 +0530, Sathishkumar Muruganandam wrote:
> > > > How is this related to scanning? It sounds to me like you're just
> > > > (ab)using scan as a somewhat convenient "do some channel hopping" API
> > > > ...
> > > > 
> > > 
> > > Whether this can be used under "iw offchannel" with
> > > NL80211_CMD_REMAIN_ON_CHANNEL?
> > 
> > Are you asking if I would accept wide
> > channel extensions to R-O-C?
> 
> Yes, adding bandwidth config to existing command.
> 
> Something like this,
> 
> iw offchannel <freq> [HT40+|HT40-|80MHz] <duration>
> 
> > Still I guess I'd like to see an actual reason for it.
> 
> Wide band scan is actually moving to a off-channel for a
> specified duration to capture 40, 80Mhz data frames.
> 
> So, I hope offchannel would accommodate this extension.

That certainly makes more sense to me than scan, but it'd *still* be
good to come up with use cases for supporting it and have that in the
commit details.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
