Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irev9-0005jE-LM
 for ath11k@lists.infradead.org; Wed, 15 Jan 2020 09:25:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: mask out vht beamforming if a fixed rate is set
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191217171827.6780-1-john@phrozen.org>
References: <20191217171827.6780-1-john@phrozen.org>
Message-Id: <20200115092502.35F64C4479C@smtp.codeaurora.org>
Date: Wed, 15 Jan 2020 09:25:02 +0000 (UTC)
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
Cc: Ritesh Singh <ritesi@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> From: Ritesh Singh <ritesi@codeaurora.org>
> 
> After setting a fixed vht-rate we see a FW assert if a STA tries to
> (re)assoc with the mu_bfee cap set. This patch masks out the capability
> bits if a fixed rate is set.
> 
> Reviewed-by: John Crispin <john@phrozen.org>
> Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>

John's s-o-b missing. Also no magic numbers, please. Isn't there a proper
define for 0x3?

-- 
https://patchwork.kernel.org/patch/11298287/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
