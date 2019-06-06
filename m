Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvaP-0001Fg-M6
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 16:49:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Remove probe response offload template setup
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559561890-27984-1-git-send-email-srirrama@codeaurora.org>
References: <1559561890-27984-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190606164957.5B55C6049C@smtp.codeaurora.org>
Date: Thu,  6 Jun 2019 16:49:57 +0000 (UTC)
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

> Probe response offload support is not supported by
> IPQ8074 firmware. Hence do not advertise or set probe
> response template to the firmware.
> 
> This would avoid the below error during template setup.
> 'failed to update prb tmpl -1'
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

Patch applied to ath.git, thanks.

10c16c257e4e ath11k: Remove probe response offload template setup

-- 
https://patchwork.kernel.org/patch/10972793/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
