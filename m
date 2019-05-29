Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0Bj-0000K7-EL
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:08:24 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: add sta_statistics callback
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190523104431.8996-1-john@phrozen.org>
References: <20190523104431.8996-1-john@phrozen.org>
Message-Id: <20190529150823.18D8B607C3@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:08:23 +0000 (UTC)
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

> Add the callback allowing us to pass the rates to userland for iw tool
> to display.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

2 patches applied to ath.git, thanks.

4ae8ed9835a0 ath11k: add sta_statistics callback
d9a34e89f148 ath11k: properly convert bw

-- 
https://patchwork.kernel.org/patch/10957381/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
