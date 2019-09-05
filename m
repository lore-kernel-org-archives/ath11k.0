Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5smE-00012i-9o
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 14:30:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: add HE support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190904091211.26868-2-john@phrozen.org>
References: <20190904091211.26868-2-john@phrozen.org>
Message-Id: <20190905143020.C3BFE60863@smtp.codeaurora.org>
Date: Thu,  5 Sep 2019 14:30:20 +0000 (UTC)
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> wrote:

> Add basic HE support to the driver. The sband_iftype data is generated from
> the capabilities read from the FW.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath11k-post-bringup branch of ath.git, thanks.

7c7ed585ad7b ath11k: add HE support
e65a616f4e74 ath11k: add TWT support
f73f939a61a1 ath11k: add spatial reuse support

-- 
https://patchwork.kernel.org/patch/11129761/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
