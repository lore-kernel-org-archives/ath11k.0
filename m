Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY6Pz-0005ua-RD
 for ath11k@lists.infradead.org; Fri, 22 Nov 2019 10:44:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Skip update peer stats for management packets
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1573657697-10845-1-git-send-email-vnaralas@codeaurora.org>
References: <1573657697-10845-1-git-send-email-vnaralas@codeaurora.org>
Message-ID: <0101016e92b623e0-4c87290e-ee46-44e4-af8b-02d37fe2a1a4-000000@us-west-2.amazonses.com>
Date: Fri, 22 Nov 2019 10:44:00 +0000
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

> Currently HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS tag of PPDU stats
> doesn't have valid success bytes info of management frames.
> So skip update peer stats for management packets.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

954788ec34d6 ath11k: Skip update peer stats for management packets

-- 
https://patchwork.kernel.org/patch/11242075/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
