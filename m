Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0CE-0000MO-4t
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:08:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Avoid frequency offset based sanity check in
 radar detection event
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558962845-12903-1-git-send-email-srirrama@codeaurora.org>
References: <1558962845-12903-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190529150853.D797D6029B@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:08:53 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> Currently the detected radar is indicated to mac80211 only when the active
> rx channel is indicated in the event through channel frequency and offset.
> But in case there is a minor difference in this offset provided,say +/- 1,
> the event will rejected.
> 
> Hence avoid having these checks to indicate radar to mac80211. Basically the
> event from firmware is highly reliable and such sanity checks are not
> necessary.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

Patch applied to ath.git, thanks.

48177eb4fb0e ath11k: Avoid frequency offset based sanity check in radar detection event

-- 
https://patchwork.kernel.org/patch/10963033/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
