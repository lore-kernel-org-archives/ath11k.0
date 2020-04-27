Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT0E4-0005bs-RW
 for ath11k@lists.infradead.org; Mon, 27 Apr 2020 09:38:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH net-next] ath11k: use GFP_ATOMIC under spin lock
In-Reply-To: <20200427092417.56236-1-weiyongjun1@huawei.com> (Wei Yongjun's
 message of "Mon, 27 Apr 2020 09:24:17 +0000")
References: <20200427092417.56236-1-weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 12:38:35 +0300
Message-ID: <877dy1gtes.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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

Wei Yongjun <weiyongjun1@huawei.com> writes:

> A spin lock is taken here so we should use GFP_ATOMIC.
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Do note that ath11k patches go to my ath.git tree, not net-next. But no
need to resend because of this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
