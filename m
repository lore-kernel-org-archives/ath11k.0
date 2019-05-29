Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0IH-0004LK-P5
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:15:11 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: Fix endianness related sparse warnings
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
References: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190529151509.708E4606DB@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:15:09 +0000 (UTC)
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

> drivers/net/wireless/ath/ath11k/hal_rx.c:1142:27: warning: cast to restricted __le32
> drivers/net/wireless/ath/ath11k/hal_rx.c:1142:27: warning: cast to restricted __le32
> 
> drivers/net/wireless/ath/ath11k/dp_rx.c:3433:16: warning: Using plain integer as NULL pointer
> drivers/net/wireless/ath/ath11k/dp_rx.h:335:19: warning: cast to restricted __le32
> drivers/net/wireless/ath/ath11k/dp_rx.h:335:19: warning: restricted __le32 degrades to integer
> drivers/net/wireless/ath/ath11k/dp_rx.h:335:19: warning: restricted __le32 degrades to integer
> drivers/net/wireless/ath/ath11k/dp_rx.h:344:35: warning: incorrect type in return expression (different base types)
> drivers/net/wireless/ath/ath11k/dp_rx.h:344:35:    expected unsigned int
> drivers/net/wireless/ath/ath11k/dp_rx.h:344:35:    got restricted __le16 [usertype] phy_ppdu_id
> drivers/net/wireless/ath/ath11k/dp_rx.h:306:16: warning: cast to restricted __le32
> drivers/net/wireless/ath/ath11k/dp_rx.h:306:16: warning: restricted __le32 degrades to integer
> drivers/net/wireless/ath/ath11k/dp_rx.h:306:16: warning: restricted __le32 degrades to integer
> drivers/net/wireless/ath/ath11k/dp_rx.h:316:16: warning: cast to restricted __le32
> drivers/net/wireless/ath/ath11k/dp_rx.h:316:16: warning: restricted __le32 degrades to integer
> drivers/net/wireless/ath/ath11k/dp_rx.h:316:16: warning: restricted __le32 degrades to integer
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

4 patches applied to ath.git, thanks.

f8c6d3bf42a5 ath11k: Fix endianness related sparse warnings
f155f8e3164f ath11k: Fix sparse warnings for symbol not being static
4913bc0f6cf8 ath11k: Fix bug in accessing rcu protected wiphy->regd
7a4a8402f3e9 ath11k: Fix sparse warning using palin integer as NULL pointer

-- 
https://patchwork.kernel.org/patch/10963713/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
