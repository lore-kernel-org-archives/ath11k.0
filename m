Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7Xk-0003XO-58
 for ath11k@lists.infradead.org; Mon, 11 May 2020 12:28:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove stale monitor status descriptor
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588642063-6950-1-git-send-email-rmanohar@codeaurora.org>
References: <1588642063-6950-1-git-send-email-rmanohar@codeaurora.org>
Message-Id: <20200511122754.79249C432C2@smtp.codeaurora.org>
Date: Mon, 11 May 2020 12:27:54 +0000 (UTC)
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Rajkumar Manoharan <rmanohar@codeaurora.org> wrote:

> The driver is not handling monitor status descriptor whenever
> the done bit of status descriptor is not set by hardware. This leave
> a stale entry in monitor status ring and flooding warning message.
> Fix that by removing the descriptor and move forward to next one
> in monitor status ring.
> 
> Co-developed-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

32a2be499c01 ath11k: remove stale monitor status descriptor

-- 
https://patchwork.kernel.org/patch/11527999/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
