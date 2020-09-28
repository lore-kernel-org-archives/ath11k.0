Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMrDi-0001cD-OI
 for ath11k@lists.infradead.org; Mon, 28 Sep 2020 11:21:27 +0000
Message-ID: <6cc3e6fc2575e3ea2bcf6ac53b8d199f6c2eff21.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: notify non-transmitting BSS of color changes
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 28 Sep 2020 13:21:16 +0200
In-Reply-To: <20200822153902.4091442-1-john@phrozen.org>
References: <20200822153902.4091442-1-john@phrozen.org>
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

On Sat, 2020-08-22 at 17:39 +0200, John Crispin wrote:
> When a transmitting multiple bssid BSS changes its bss color, we need to
> also notify the non transmitting BSSs of the new bss color.
> 
> This patch depends on the multiple bssid and bss coloring series.

It's probably the second or third time I've tried applying this ...
please resend it with the prerequisites.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
