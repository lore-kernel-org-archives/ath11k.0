Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUAEj-00080t-9a
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 14:00:11 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add support for controlling tx power to a station
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1572516491-18745-1-git-send-email-mkenna@codeaurora.org>
References: <1572516491-18745-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20191111140008.8479A60B12@smtp.codeaurora.org>
Date: Mon, 11 Nov 2019 14:00:08 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> This patch will add the support to control the transmit power
> for traffic to a station associated with the AP.
> 
> Underlying firmware will enforce that the maximum tx power will
> be based on the regulatory requirements. If the user given
> transmit power is greater than the allowed tx power in the given
> channel, then the firmware will use the maximum tx power in the
> same channel.
> 
> Max and Min tx power values will depends on number of tx chain
> masks. The allowed tx power range values are from 6 to 23.
> 
> When 0 is sent to the firmware as tx power, it will revert to
> the default tx power for the station.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

1b964c6fa08b ath11k: add support for controlling tx power to a station

-- 
https://patchwork.kernel.org/patch/11220849/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
