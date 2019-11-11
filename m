Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUADI-0006ny-8R
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 13:58:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: update bawindow size in delba process
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1572500150-13044-1-git-send-email-vnaralas@codeaurora.org>
References: <1572500150-13044-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20191111135839.431B660E3C@smtp.codeaurora.org>
Date: Mon, 11 Nov 2019 13:58:39 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: ath11k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> Currenly in delba process calling ath11k_peer_rx_tid_delete() updates
> reo with desc invalid and add tid queue to the flush list. If station
> send data traffic without addba req and before tid flush, hw gives
> those packets as invalid desc reo error. Since we are dropping these
> invalid desc packets results in traffic stall.
> 
> This patch fix this issue by updating the reo queue with bawindow size 1
> instead of tid removal in delba process.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

8f10140436f9 ath11k: update bawindow size in delba process

-- 
https://patchwork.kernel.org/patch/11220623/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
