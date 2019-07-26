Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hr0L8-0007gz-3Q
 for ath11k@lists.infradead.org; Fri, 26 Jul 2019 13:32:55 +0000
Message-ID: <eaaff61b1e35c43ee64f728c97a02bfcd15c295a.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] mac80211_hwsim: Register support for HE meshpoint
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 26 Jul 2019 15:32:50 +0200
In-Reply-To: <3082836.hUm4yBdaKs@sven-edge>
References: <20190724163359.3507-1-sven@narfation.org>
 <20190724163359.3507-3-sven@narfation.org>
 <f2e16d10ce3eb3ff08c97c27424b824b8e012553.camel@sipsolutions.net>
 <3082836.hUm4yBdaKs@sven-edge>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Sven Eckelmann <seckelmann@datto.com>

On Fri, 2019-07-26 at 15:31 +0200, Sven Eckelmann wrote:

> As I already wrote:
> 
> > The first three things looks like wpa_supplicant problems. Seems to be 
> > caused by the way HE forces VHT to be enabled and now the tests fail 
> > which try to disable VHT. There was already a patch [0] for that but it
> > wasn't considered a good solution.
> > But beside these three things there are various other problems in 
> > > wpa_supplicant regarding HE with pending patches. So I've used 
> > wpa_supplicant 91b6eba7732354ed3dfe0aa9715dc4c0746e3336 with two 
> > additional patches [1,2] and increased the VM memory to 1024 MB. Also 
> > wireshark (tshark to be more precise) had to be updated to 
> > v3.1.0rc0-1192-gf64990438c

Ok, dunno. But I don't really want to break everything in the hwsim
tests, even if the kernel patch may be correct ... so I guess I'll wait
until you resubmit after some fixes go into wpa_s?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
