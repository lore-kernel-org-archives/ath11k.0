Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsqBf-0000Cq-5Q
 for ath11k@lists.infradead.org; Wed, 31 Jul 2019 15:06:44 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k/hal: Fix few bugs in
 ath11k_hal_srng_dst_num_free()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1563423855-32397-1-git-send-email-vthiagar@codeaurora.org>
References: <1563423855-32397-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190731150642.C3DFB60588@smtp.codeaurora.org>
Date: Wed, 31 Jul 2019 15:06:42 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> The logic to compute the number of available buffers in destination
> ring is wrong. It should be just the different between head and
> tail pointers in terms of the entry size. This functions currently
> unused, this is fixed to make use of this function in follow-up
> patches. Also make destination ring head pointer volatile because
> it is independently updated by HW.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath11k-bringup branch of ath.git, thanks.

df3ae4c41c13 ath11k/hal: Fix few bugs in ath11k_hal_srng_dst_num_free()
b5ca4711131d ath11k/dp_rx: Fix possible REO ring desc overwrite

-- 
https://patchwork.kernel.org/patch/11048495/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
