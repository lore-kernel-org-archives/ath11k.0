Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jf2LA-0006cV-DP
 for ath11k@lists.infradead.org; Sat, 30 May 2020 14:20:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: reset trigger frame MAC padding duration
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1590706483-27609-1-git-send-email-msinada@codeaurora.org>
References: <1590706483-27609-1-git-send-email-msinada@codeaurora.org>
Message-Id: <20200530141953.B5ED4C43387@smtp.codeaurora.org>
Date: Sat, 30 May 2020 14:19:53 +0000 (UTC)
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
To: Muna Sinada <msinada@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Muna Sinada <msinada@codeaurora.org> wrote:

> The value was 3 and it's reserved value. Corrected to maintain fw
> defaults.
> 
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9529cba988b7 ath11k: reset trigger frame MAC padding duration

-- 
https://patchwork.kernel.org/patch/11577193/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
