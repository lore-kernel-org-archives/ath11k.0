Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfmPS-0002qR-3N
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 14:26:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] ath11k: fix variable name warnings
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561435999-28316-1-git-send-email-periyasa@codeaurora.org>
References: <1561435999-28316-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190625142657.C134A6028D@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 14:26:57 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> drivers/net/wireless/ath/ath11k/wmi.h:2728: <BK_Minfree>
> drivers/net/wireless/ath/ath11k/wmi.h:2729: <BE_Minfree>
> drivers/net/wireless/ath/ath11k/wmi.h:2730: <VI_Minfree>
> drivers/net/wireless/ath/ath11k/wmi.h:2731: <VO_Minfree>
> drivers/net/wireless/ath/ath11k/wmi.h:2965: <bcn_txPower>
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

5 patches applied to ath11k-bringup branch of ath.git, thanks.

1f200e02d5c1 ath11k: fix variable name warnings
323d5816437a ath11k: avoid unnecessary 'out of memory' message
f94a9da4292b ath11k: fix space related warnings
e8ab43824092 ath11k: avoid min() warning
4fed41ea71bf ath11k: fix brace warning

-- 
https://patchwork.kernel.org/patch/11014649/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
