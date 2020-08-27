Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHfP-0004rc-R3
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 13:10:13 +0000
Message-ID: <9037f817f2b65ca469967eff6c4b7301d4ae796e.camel@sipsolutions.net>
Subject: Re: [PATCH V3 4/9] mac80211: add multiple bssid/ema support to bcn
 templating
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 27 Aug 2020 15:10:06 +0200
In-Reply-To: <20200812150050.2683396-5-john@phrozen.org>
References: <20200812150050.2683396-1-john@phrozen.org>
 <20200812150050.2683396-5-john@phrozen.org>
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

On Wed, 2020-08-12 at 17:00 +0200, John Crispin wrote:
> Extend ieee80211_beacon_get_template() to allow generation of EMA beacons.
> Drivers for hardware that does not support ema offloading can use this
> function to update their becaons after they receive beacon completion
> events from the hardware.
> 

This all seems really quite simple when you have the software fallbacks,
so is there any chance you could add it to hwsim, in particular for
hostap tests? I'm sure Jouni would also appreciate tests for this on the
hostap side.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
