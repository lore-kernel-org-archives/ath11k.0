Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivitQ-0008Fh-3j
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 14:28:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: htt stats module does not handle multiple skbs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191217172200.7470-1-john@phrozen.org>
References: <20191217172200.7470-1-john@phrozen.org>
Message-Id: <20200126142755.D656DC4479C@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 14:27:55 +0000 (UTC)
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> This patch removes the "done" check from the stats handler thus allowing
> the code to parse more skbs.
> 
> Reviewed-by: John Crispin <john@phrozen.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

s-o-b from John missing

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11298295/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
