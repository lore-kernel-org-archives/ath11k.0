Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgSNA-0007CZ-KA
 for ath11k@lists.infradead.org; Thu, 27 Jun 2019 11:15:26 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: Alignment should match open parenthesis
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561562295-17402-1-git-send-email-kvalo@codeaurora.org>
References: <1561562295-17402-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190627111523.CC40160DAA@smtp.codeaurora.org>
Date: Thu, 27 Jun 2019 11:15:23 +0000 (UTC)
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

> Fix checkpatch warning:
> 
> drivers/net/wireless/ath/ath11k/mac.c:5029: Alignment should match open parenthesis
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath11k-bringup branch of ath.git, thanks.

8f5a39b1cdaf ath11k: Alignment should match open parenthesis
810a4fb71e6a ath11k: Remove prototype interface
7b5a3ac963cb ath11k: line over 90 characters
4c6476d00657 ath11k: use kstrtoint_from_user() instead of sscanf()

-- 
https://patchwork.kernel.org/patch/11018091/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
