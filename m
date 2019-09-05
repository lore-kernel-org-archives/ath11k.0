Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5smv-00015M-RR
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 14:31:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Fix htt stats sounding info and pdev cca stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1564628769-23490-1-git-send-email-gseset@codeaurora.org>
References: <1564628769-23490-1-git-send-email-gseset@codeaurora.org>
Message-Id: <20190905143105.850C46058E@smtp.codeaurora.org>
Date: Thu,  5 Sep 2019 14:31:05 +0000 (UTC)
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
To: Ganesh Sesetti <gseset@codeaurora.org>
Cc: ath11k@lists.infradead.org

Ganesh Sesetti <gseset@codeaurora.org> wrote:

> The Previous configuartion of htt stats sounding info and pdev cca stats
> are invalid due to that getting time out error.
> 
> Changing htt stats sounding info value from 0xFF to 0x00 and htt pdev cca
> stats from 0x10 to 0x00
> 
> Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

a349c4b7a080 ath11k: Fix htt stats sounding info and pdev cca stats

-- 
https://patchwork.kernel.org/patch/11070087/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
