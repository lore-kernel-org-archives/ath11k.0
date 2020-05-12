Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPRd-00056h-GJ
 for ath11k@lists.infradead.org; Tue, 12 May 2020 07:35:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH next] ath11k: convert to
 devm_platform_get_and_ioremap_resource
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200508075323.81128-1-weiyongjun1@huawei.com>
References: <20200508075323.81128-1-weiyongjun1@huawei.com>
Message-Id: <20200512073453.4F990C44788@smtp.codeaurora.org>
Date: Tue, 12 May 2020 07:34:53 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Use the helper function that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c8ffcd122760 ath11k: convert to devm_platform_get_and_ioremap_resource

-- 
https://patchwork.kernel.org/patch/11535829/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
