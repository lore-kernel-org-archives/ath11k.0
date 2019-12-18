Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdXC-000295-3t
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:54:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: delete a stray unlock in
 ath11k_dbg_htt_stats_req()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213104754.2lwrq2qqokycjjbm@kili.mountain>
References: <20191213104754.2lwrq2qqokycjjbm@kili.mountain>
Message-Id: <20191218175453.3747CC433CB@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:54:53 +0000 (UTC)
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The callers unlock this lock so this error path has a double unlock.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

cd21c827a155 ath11k: delete a stray unlock in ath11k_dbg_htt_stats_req()

-- 
https://patchwork.kernel.org/patch/11290409/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
