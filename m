Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3hKJ-0006ty-SR
 for ath11k@lists.infradead.org; Mon, 17 Feb 2020 14:24:49 +0000
Message-ID: <040f0fd3f209ea2fe4bbea6c754f6004808c1267.camel@sipsolutions.net>
Subject: Re: [RFC 1/2] mac80211: add receive path for ethernet frame format
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 17 Feb 2020 15:24:45 +0100
In-Reply-To: <1581942277-585-2-git-send-email-mpubbise@codeaurora.org>
 (sfid-20200217_132514_136661_63733C38)
References: <1581942277-585-1-git-send-email-mpubbise@codeaurora.org>
 <1581942277-585-2-git-send-email-mpubbise@codeaurora.org>
 (sfid-20200217_132514_136661_63733C38)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>, ath11k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, linux-wireless@vger.kernel.org

On Mon, 2020-02-17 at 17:54 +0530, Manikanta Pubbisetty wrote:
> 
> +	/* FIXME: Since rx.seqno_idx is not available for decap offloaded frames
> +	 * rx msdu stats update at the seqno_idx in ieee80211_deliver_skb()
> +	 * will always be updated at index 0 and will not be very useful.
> +	 * Should we disable these statistics in the case of decap offload?
> +	 */
> 

I think the answer is yes.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
