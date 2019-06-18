Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdDCO-0006Jq-Qc
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 12:26:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] ath11k: 'static' is not at beginning of declaration
 [-Wold-style-declaration]
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
References: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190618122652.770E56070D@smtp.codeaurora.org>
Date: Tue, 18 Jun 2019 12:26:52 +0000 (UTC)
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

> Fix gcc W=1 warnings:
> 
> drivers/net/wireless/ath/ath11k/mac.c:5375:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
> drivers/net/wireless/ath/ath11k/mac.c:5380:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
> drivers/net/wireless/ath/ath11k/mac.c:5386:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
> drivers/net/wireless/ath/ath11k/mac.c:5392:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

5 patches applied to ath11k-bringup branch of ath.git, thanks.

0ef38ce491f8 ath11k: 'static' is not at beginning of declaration [-Wold-style-declaration]
1e854321455c ath11k: this statement may fall through [-Wimplicit-fallthrough=]
022ffde5c6a1 ath11k: variable set but not used [-Wunused-but-set-variable]
f39b098aac7e ath11k: comparison is always true due to limited range of data type [-Wtype-limits]
34276bb47f8d ath11k: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]

-- 
https://patchwork.kernel.org/patch/10999767/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
