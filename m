Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1aKC-0006uO-P8
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 18:31:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix rcu lock protect in peer assoc confirmation
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1580865748-31286-1-git-send-email-periyasa@codeaurora.org>
References: <1580865748-31286-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20200211183154.A4059C4479D@smtp.codeaurora.org>
Date: Tue, 11 Feb 2020 18:31:54 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> ath11k_mac_get_ar_by_vdev_id() get protected under rcu lock
> and unlock. peer association confirmation event get used this API
> without rcu protection, so corrected it.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

db0889aba262 ath11k: fix rcu lock protect in peer assoc confirmation

-- 
https://patchwork.kernel.org/patch/11365669/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
