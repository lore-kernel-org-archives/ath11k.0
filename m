Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdkN-0005A4-0c
 for ath11k@lists.infradead.org; Thu, 07 Nov 2019 09:06:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: avoid burst time conversion logic
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1572420925-11452-1-git-send-email-periyasa@codeaurora.org>
References: <1572420925-11452-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20191107090630.058906076A@smtp.codeaurora.org>
Date: Thu,  7 Nov 2019 09:06:29 +0000 (UTC)
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

> WMI_VDEV_SET_WMM_PARAMS commmand expects the txoplimit param in the units of
> 32 microseconds. convert the txop unit from 32 microseconds to absolute
> microseconds leads to the higher burst values which is incorrect. so no need
> to convert the txop unit from 32 microseconds to absolute microseconds.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

ecbd15739034 ath11k: avoid burst time conversion logic

-- 
https://patchwork.kernel.org/patch/11219119/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
