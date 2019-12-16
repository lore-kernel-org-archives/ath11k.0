Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igsfc-0003UW-5y
 for ath11k@lists.infradead.org; Mon, 16 Dec 2019 15:52:30 +0000
Subject: Re: [PATCH v2 2/7] nl80211: add handling for BSS color
References: <20191213155802.25491-1-john@phrozen.org>
 <20191213155802.25491-2-john@phrozen.org>
 <a67dd924ebb638a8ba2b742a07fd3d1db34732ce.camel@sipsolutions.net>
From: John Crispin <john@phrozen.org>
Message-ID: <fc64ea0b-d2c3-79a3-6973-c822078db01f@phrozen.org>
Date: Mon, 16 Dec 2019 16:52:20 +0100
MIME-Version: 1.0
In-Reply-To: <a67dd924ebb638a8ba2b742a07fd3d1db34732ce.camel@sipsolutions.net>
Content-Language: en-US
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 16/12/2019 10:56, Johannes Berg wrote:
> 
> Also, not directly related to any code, can't the BSS color change, and
> thus you need a method to update it?

Coming shortly once I start working on the collission events and then 
the hostapd color change algorithm
	John

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
