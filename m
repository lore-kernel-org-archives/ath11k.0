Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcmaP-0004RM-5R
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 08:01:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix sparse warnings in mac.c
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560328682-23694-1-git-send-email-kvalo@codeaurora.org>
References: <1560328682-23694-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190617080152.4F56360314@smtp.codeaurora.org>
Date: Mon, 17 Jun 2019 08:01:52 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> drivers/net/wireless/ath/ath11k/mac.c:1306:83: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/mac.c:1306:83:    expected unsigned int
> drivers/net/wireless/ath/ath11k/mac.c:1306:83:    got restricted __le16 const [usertype] rx_mcs_80p80
> drivers/net/wireless/ath/ath11k/mac.c:1308:83: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/mac.c:1308:83:    expected unsigned int
> drivers/net/wireless/ath/ath11k/mac.c:1308:83:    got restricted __le16 const [usertype] tx_mcs_80p80
> drivers/net/wireless/ath/ath11k/mac.c:1312:73: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/mac.c:1312:73:    expected unsigned int
> drivers/net/wireless/ath/ath11k/mac.c:1312:73:    got restricted __le16 const [usertype] rx_mcs_160
> drivers/net/wireless/ath/ath11k/mac.c:1314:73: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/mac.c:1314:73:    expected unsigned int
> drivers/net/wireless/ath/ath11k/mac.c:1314:73:    got restricted __le16 const [usertype] tx_mcs_160
> drivers/net/wireless/ath/ath11k/mac.c:1320:72: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/mac.c:1320:72:    expected unsigned int
> drivers/net/wireless/ath/ath11k/mac.c:1320:72:    got restricted __le16 const [usertype] rx_mcs_80
> drivers/net/wireless/ath/ath11k/mac.c:1322:72: warning: incorrect type in assignment (different base types)
> drivers/net/wireless/ath/ath11k/mac.c:1322:72:    expected unsigned int
> drivers/net/wireless/ath/ath11k/mac.c:1322:72:    got restricted __le16 const [usertype] tx_mcs_80
> 
> Fixes: 17aca2d9a969 ("ath11k: add HE support")
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

3db59a23db43 ath11k: fix sparse warnings in mac.c

-- 
https://patchwork.kernel.org/patch/10988969/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
