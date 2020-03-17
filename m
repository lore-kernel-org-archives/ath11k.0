Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE5tg-0008Rw-7t
 for ath11k@lists.infradead.org; Tue, 17 Mar 2020 06:40:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: set queue_len to 4096
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200211122605.13002-2-john@phrozen.org>
References: <20200211122605.13002-2-john@phrozen.org>
Message-Id: <20200317064005.80303C433BA@smtp.codeaurora.org>
Date: Tue, 17 Mar 2020 06:40:05 +0000 (UTC)
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
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> The driver currently does not use wake_txq_queue. This leads to the
> tx_queue_len being defaulted to 1000. Setting this parameter will
> change the queue_len to 4096 which is more fitting for HE.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

107560d847e6 ath11k: set queue_len to 4096

-- 
https://patchwork.kernel.org/patch/11375351/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
