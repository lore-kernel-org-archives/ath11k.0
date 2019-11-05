Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRvxY-0007rP-Kc
 for ath11k@lists.infradead.org; Tue, 05 Nov 2019 10:21:13 +0000
From: "Sathishkumar Muruganandam" <murugana@codeaurora.org>
References: <1572869374-9635-1-git-send-email-murugana@codeaurora.org>
 <53d45563803b3f96be0d53731408cc3af028c510.camel@sipsolutions.net>
In-Reply-To: <53d45563803b3f96be0d53731408cc3af028c510.camel@sipsolutions.net>
Subject: RE: [EXT] Re: [PATCH v2 0/2] add Wide Band Scan support
Date: Tue, 5 Nov 2019 15:51:04 +0530
Message-ID: <00d301d593c2$bd37d8f0$37a78ad0$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Johannes Berg' <johannes@sipsolutions.net>
Cc: murugana@codeaurora.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

> Neither of these are scan use cases (at least not that are covered by
> nl80211 scan APIs), so that doesn't make sense.
> 

Actually we had extended the existing 'iw scan' command to do Wide Band Scan using nl80211 scan APIs.

dev <devname> scan freq <freq> [HT40+|HT40-|80MHz] [ap-force]

dev <devname> scan trigger freq <freq> [HT40+|HT40-|80MHz] [ap-force]

Raised patch for above change, [PATCH] iw: Add phymode parameters to scan command for Wide Band Scan support.

--
Sathishkumar


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
