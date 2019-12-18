Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdZ7-0003oJ-2S
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:56:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove an unneeded NULL check
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213105219.qbpng7eut5zgty2p@kili.mountain>
References: <20191213105219.qbpng7eut5zgty2p@kili.mountain>
Message-Id: <20191218175650.41296C433A2@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:56:50 +0000 (UTC)
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
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The list iterator is always non-NULL so it doesn't need to be checked.
> I also removed the unnecessary initializer because the list iterator is
> always initialized.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

269663f18474 ath11k: remove an unneeded NULL check

-- 
https://patchwork.kernel.org/patch/11290433/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
