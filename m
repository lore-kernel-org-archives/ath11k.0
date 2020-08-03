Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2WZe-0004XR-UU
 for ath11k@lists.infradead.org; Mon, 03 Aug 2020 09:16:05 +0000
Message-ID: <f1a40d9caf3b07bffe21f5bf33b2d15c1d3f6769.camel@sipsolutions.net>
Subject: Re: [PATCH V5 2/3] mac80211: add support for setting fixed HE
 rate/gi/ltf
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 03 Aug 2020 11:15:41 +0200
In-Reply-To: <20200803085127.180550-2-john@phrozen.org>
References: <20200803085127.180550-1-john@phrozen.org>
 <20200803085127.180550-2-john@phrozen.org>
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Mon, 2020-08-03 at 10:51 +0200, John Crispin wrote:
> From: Miles Hu <milehu@codeaurora.org>
> 
> With nl80211 now able to receive fixed HE rate/gi/ltf settings we want to
> propagate these further down the stack into the mac80211 drivers. This
> patch copies the values into the sdata struct.

I do not see any reason for this patch, copying data to a mac80211
internal structure and then not using it does ... nothing. Dropped this
patch.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
