Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRbDD-0003dm-QL
 for ath11k@lists.infradead.org; Mon, 04 Nov 2019 12:12:01 +0000
Message-ID: <53d45563803b3f96be0d53731408cc3af028c510.camel@sipsolutions.net>
Subject: Re: [PATCH v2 0/2] add Wide Band Scan support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 04 Nov 2019 13:11:49 +0100
In-Reply-To: <1572869374-9635-1-git-send-email-murugana@codeaurora.org>
References: <1572869374-9635-1-git-send-email-murugana@codeaurora.org>
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

On Mon, 2019-11-04 at 17:39 +0530, Sathishkumar Muruganandam wrote:
> Wide Band Scan allows to perform off-channel scan on requested channel/
> frequency along with corresponding phy mode/bandwidth (40Mhz, 80Mhz).
> 
> Below are use cases of Wide Band Scan,
> 
> 1. In case of phy running both AP and monitor vifs, wide band scan on
>    a different channel along with phymode (40Mhz, 80Mhz) captures
>    those off-channel data frames to monitor vif.
> 
> 2. Doing wide band scan instead of normal 20Mhz scan before spectral
>    dump, allows to fetch FFT reports for the complete requested
>    bandwidth (40Mhz, 80Mhz).

Neither of these are scan use cases (at least not that are covered by
nl80211 scan APIs), so that doesn't make sense.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
