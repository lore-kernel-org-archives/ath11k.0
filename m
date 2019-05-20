Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSdbi-0000Ow-2U
 for ath11k@lists.infradead.org; Mon, 20 May 2019 08:25:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: Process radar detected event
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557808879-26933-2-git-send-email-srirrama@codeaurora.org>
References: <1557808879-26933-2-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190520082516.C919761834@smtp.codeaurora.org>
Date: Mon, 20 May 2019 08:25:16 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> Add support for processing radar detected event
> coming from the firmware. The detected radar
> is indicated to mac80211 after checking the
> validity of detection.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

3 patches applied to ath.git, thanks.

844193a286b5 ath11k: Process radar detected event
1256bb1040d9 ath11k: Initialize and enable dfs radar detection
83c457124fa5 ath11k: Add dfs debug and test interface

-- 
https://patchwork.kernel.org/patch/10942009/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
