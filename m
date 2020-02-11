Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1aOb-0007Bh-2F
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 18:36:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix incorrect peer stats counters update
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1580891730-23868-1-git-send-email-vnaralas@codeaurora.org>
References: <1580891730-23868-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20200211183626.CEF17C433A2@smtp.codeaurora.org>
Date: Tue, 11 Feb 2020 18:36:26 +0000 (UTC)
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
To: Venkateswara Rao Naralasetty <vnaralas@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Venkateswara Rao Naralasetty <vnaralas@codeaurora.org> wrote:

> Convert mac80211 bw to ath11k bw before updating peer stats
> bw counters, which fixes incorrect peer stats counters update.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

92bacd1c165c ath11k: fix incorrect peer stats counters update

-- 
https://patchwork.kernel.org/patch/11365883/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
