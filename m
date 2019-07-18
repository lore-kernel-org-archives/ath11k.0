Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho4dp-0003kv-7V
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 11:32:06 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: remove deprecated WMI PEER stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1563370022-6920-1-git-send-email-murugana@codeaurora.org>
References: <1563370022-6920-1-git-send-email-murugana@codeaurora.org>
Message-Id: <20190718113204.EFB1F60A0A@smtp.codeaurora.org>
Date: Thu, 18 Jul 2019 11:32:04 +0000 (UTC)
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> wrote:

> Removing WMI PEER stats which has been deprecated in FW and rx_duration of
> a peer is now fetched from HTT PPDU_END stats.
> 
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

ef1f8f9fda90 ath11k: remove deprecated WMI PEER stats

-- 
https://patchwork.kernel.org/patch/11047827/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
