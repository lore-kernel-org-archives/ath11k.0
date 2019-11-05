Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRvzK-00081w-3l
 for ath11k@lists.infradead.org; Tue, 05 Nov 2019 10:23:03 +0000
Message-ID: <867302d58d3183ce7e2c7afa846027a787579b87.camel@sipsolutions.net>
Subject: Re: [EXT] Re: [PATCH v2 0/2] add Wide Band Scan support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 05 Nov 2019 11:22:52 +0100
In-Reply-To: <00d301d593c2$bd37d8f0$37a78ad0$@codeaurora.org>
References: <1572869374-9635-1-git-send-email-murugana@codeaurora.org>
 <53d45563803b3f96be0d53731408cc3af028c510.camel@sipsolutions.net>
 <00d301d593c2$bd37d8f0$37a78ad0$@codeaurora.org>
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

On Tue, 2019-11-05 at 15:51 +0530, Sathishkumar Muruganandam wrote:
> > Neither of these are scan use cases (at least not that are covered by
> > nl80211 scan APIs), so that doesn't make sense.
> > 
> 
> Actually we had extended the existing 'iw scan' command to do Wide
> Band Scan using nl80211 scan APIs.

Yes ... but ... that doesn't address my question.

How is this related to scanning? It sounds to me like you're just
(ab)using scan as a somewhat convenient "do some channel hopping" API
...

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
