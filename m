Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC4TV-0000LZ-Pc
 for ath11k@lists.infradead.org; Wed, 11 Mar 2020 16:45:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: config reorder queue for all tids during peer
 setup
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1581646724-23098-1-git-send-email-tamizhr@codeaurora.org>
References: <1581646724-23098-1-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20200311164439.A6ED9C433D2@smtp.codeaurora.org>
Date: Wed, 11 Mar 2020 16:44:39 +0000 (UTC)
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>
Cc: Govindaraj Saminathan <gsamin@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Tamizh Chelvam <tamizhr@codeaurora.org> wrote:

> Currently rx tid setup is happening for TID 0 and TID 16
> during peer setup. And if other TID packets received for
> the peer it will be redirected to rx error ring and not through
> reo ring. And this rx tid configuration cannot be done
> in the rx error ring path since it is a atomic context.
> So moving the rx tid setup for all tids during the peer setup.
> This is required to enable PN offload functionality to route
> all packets through reo ring.
> 
> Co-developed-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a36adf54cbc8 ath11k: config reorder queue for all tids during peer setup

-- 
https://patchwork.kernel.org/patch/11381557/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
