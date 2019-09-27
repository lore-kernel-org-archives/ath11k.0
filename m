Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDroc-00040T-6E
 for ath11k@lists.infradead.org; Fri, 27 Sep 2019 15:05:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH bringup 1/5] ath11k: Use C99 structure initialization for
 target_service_to_ce_map_wlan[]
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1569386639-1242-1-git-send-email-vthiagar@codeaurora.org>
References: <1569386639-1242-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190927150549.D891660E73@smtp.codeaurora.org>
Date: Fri, 27 Sep 2019 15:05:49 +0000 (UTC)
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

> Also cleanup endian conversion for 0 in the last entry of
> target_service_to_ce_map_wlan[] with a comment saying it is
> the terminator entry of the map table as suggested during
> public review.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

5 patches applied to ath11k-bringup branch of ath.git, thanks.

b6b140aa1739 ath11k: Use C99 structure initialization for target_service_to_ce_map_wlan[]
d054355585aa ath11k: Remove ring mask macros defined for 0
4c980dcca60a ath11k: Move ath11k_ahb_read32() and ath11k_ahb_write32() to ahb.h
be7eb8bbca02 ath11k: Avoid code duplication in set/clear of a register bit values
11978c109885 ath11k: Few clean ups in comments

-- 
https://patchwork.kernel.org/patch/11160003/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
