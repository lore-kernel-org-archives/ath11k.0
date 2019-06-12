Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb1Bb-0005WJ-He
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 11:13:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: cleanup in rx data path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560159611-5864-1-git-send-email-periyasa@codeaurora.org>
References: <1560159611-5864-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190612111259.4923160213@smtp.codeaurora.org>
Date: Wed, 12 Jun 2019 11:12:59 +0000 (UTC)
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

> Removed all unused function definition from dp_rx.
> Moved all non exposed API inside the dp_rx.
> Removed inline attribute and let the compiler handle
> the optimization.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Failed to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/dp_rx.c:1064
error: drivers/net/wireless/ath/ath11k/dp_rx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10984581/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
