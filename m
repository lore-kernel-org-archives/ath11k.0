Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUAFR-0008AA-Lv
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 14:00:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: unlock mutex during failure in qmi fw ready
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1572524747-25843-1-git-send-email-gsamin@codeaurora.org>
References: <1572524747-25843-1-git-send-email-gsamin@codeaurora.org>
Message-Id: <20191111140053.50E4660E0E@smtp.codeaurora.org>
Date: Mon, 11 Nov 2019 14:00:53 +0000 (UTC)
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
To: Govindaraj Saminathan <gsamin@codeaurora.org>
Cc: ath11k@lists.infradead.org

Govindaraj Saminathan <gsamin@codeaurora.org> wrote:

> qmi firmware ready event start to initialize the core modules and
> the sequence executed with mutex lock. In case of any failure
> mutex should be unlocked otherwise it will hang during the recovery.
> 
> Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

c1283e0e7f1a ath11k: unlock mutex during failure in qmi fw ready

-- 
https://patchwork.kernel.org/patch/11221153/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
