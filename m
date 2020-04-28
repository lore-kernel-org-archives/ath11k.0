Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMJi-000233-UR
 for ath11k@lists.infradead.org; Tue, 28 Apr 2020 09:14:20 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath11k: use GFP_ATOMIC under spin lock
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200427092417.56236-1-weiyongjun1@huawei.com>
References: <20200427092417.56236-1-weiyongjun1@huawei.com>
Message-Id: <20200428091400.9525BC433F2@smtp.codeaurora.org>
Date: Tue, 28 Apr 2020 09:14:00 +0000 (UTC)
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
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org, linaro-mm-sig@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> A spin lock is taken here so we should use GFP_ATOMIC.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

69c93f9674c9 ath11k: use GFP_ATOMIC under spin lock

-- 
https://patchwork.kernel.org/patch/11511711/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
