Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdYE-000295-16
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:55:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: checking for NULL vs IS_ERR()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213105127.kijiazxwtghmubyk@kili.mountain>
References: <20191213105127.kijiazxwtghmubyk@kili.mountain>
Message-Id: <20191218175556.AA276C4479F@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:55:56 +0000 (UTC)
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
Cc: Miles Hu <milehu@codeaurora.org>, kernel-janitors@vger.kernel.org, Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, Muna Sinada <msinada@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The ath11k_ce_alloc_ring() function returns error pointers on error, not
> NULL.  The rest of the driver assumes that "pipe->src_ring" is either
> valid or NULL so this patch introduces a temporary varaible to avoid
> leaving it as an error pointer.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c76fa846b0e1 ath11k: checking for NULL vs IS_ERR()

-- 
https://patchwork.kernel.org/patch/11290421/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
