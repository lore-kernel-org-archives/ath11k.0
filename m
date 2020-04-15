Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOd2L-0008Vy-Hg
 for ath11k@lists.infradead.org; Wed, 15 Apr 2020 08:04:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: cleanup reo command error code overwritten
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586776872-25766-1-git-send-email-gsamin@codeaurora.org>
References: <1586776872-25766-1-git-send-email-gsamin@codeaurora.org>
Message-Id: <20200415080443.99B60C4478C@smtp.codeaurora.org>
Date: Wed, 15 Apr 2020 08:04:43 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Govindaraj Saminathan <gsamin@codeaurora.org> wrote:

> should not overwrite the error code. No buffer available then return
> invalid. For other failures return the error code of actual failure.
> 
> Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e190bc05b191 ath11k: cleanup reo command error code overwritten

-- 
https://patchwork.kernel.org/patch/11485447/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
