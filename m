Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k18Ff-0006Oa-Ev
 for ath11k@lists.infradead.org; Thu, 30 Jul 2020 13:05:42 +0000
Message-ID: <a29acdbce66cda7d2fa6db9798a2f32b0668a832.camel@sipsolutions.net>
Subject: Re: [PATCH V2 04/10] mac80211: add multiple bssid IE parsing
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 15:05:33 +0200
In-Reply-To: <20200706115219.663650-4-john@phrozen.org>
References: <20200706115219.663650-1-john@phrozen.org>
 <20200706115219.663650-4-john@phrozen.org>
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

On Mon, 2020-07-06 at 13:52 +0200, John Crispin wrote:
> 
> + * @mbssid_offset: position of mbssid_offset
> + * @mbssid_length: position of mbssid_offset
> 
> +
> +	u16 multiple_bssid_offset;
> +	u16 multiple_bssid_length;

that doesn't match :)


Oh. This patch is both AP- and client-side ... got confused there a bit
:)

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
