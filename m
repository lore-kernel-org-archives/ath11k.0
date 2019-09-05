Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5sng-00018K-GV
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 14:31:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix resource leak in ath11k_mac_sta_state
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1564635259-27502-1-git-send-email-periyasa@codeaurora.org>
References: <1564635259-27502-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190905143152.398D0602DC@smtp.codeaurora.org>
Date: Thu,  5 Sep 2019 14:31:52 +0000 (UTC)
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

> Handled the error case with proper resource cleanup and
> moved the handling into a separate function from
> ath11k_mac_sta_state.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

37c3d6552273 ath11k: fix resource leak in ath11k_mac_sta_state

-- 
https://patchwork.kernel.org/patch/11070167/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
