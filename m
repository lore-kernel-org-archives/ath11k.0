Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hr0F4-0004ar-Ta
 for ath11k@lists.infradead.org; Fri, 26 Jul 2019 13:26:40 +0000
Message-ID: <f2e16d10ce3eb3ff08c97c27424b824b8e012553.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] mac80211_hwsim: Register support for HE meshpoint
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 26 Jul 2019 15:26:32 +0200
In-Reply-To: <20190724163359.3507-3-sven@narfation.org>
 (sfid-20190724_183423_401572_761C0A47)
References: <20190724163359.3507-1-sven@narfation.org>
 <20190724163359.3507-3-sven@narfation.org>
 (sfid-20190724_183423_401572_761C0A47)
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
To: Sven Eckelmann <sven@narfation.org>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, Sven Eckelmann <seckelmann@datto.com>

On Wed, 2019-07-24 at 18:33 +0200, Sven Eckelmann wrote:
> From: Sven Eckelmann <seckelmann@datto.com>
> 
> Some features of 802.11ax without central organizing (AP) STA can also be
> used in mesh mode. hwsim can be used to assist initial development of these
> features without having access to HW.
> 
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>

Even with the tshark workaround in place, this breaks 68 mesh-related
tests in hwsim tests. Jouni says only 3 use tshark ...

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
