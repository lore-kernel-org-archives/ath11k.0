Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWrB-0000TO-2o
 for ath11k@lists.infradead.org; Mon, 04 May 2020 08:53:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath11k: fix error return code in
 ath11k_dp_alloc()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200427104621.23752-1-weiyongjun1@huawei.com>
References: <20200427104621.23752-1-weiyongjun1@huawei.com>
Message-Id: <20200504085336.01C7BC433D2@smtp.codeaurora.org>
Date: Mon,  4 May 2020 08:53:36 +0000 (UTC)
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
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: d0998eb84ed3 ("ath11k: optimise ath11k_dp_tx_completion_handler")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f76f750aeea4 ath11k: fix error return code in ath11k_dp_alloc()

-- 
https://patchwork.kernel.org/patch/11511849/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
