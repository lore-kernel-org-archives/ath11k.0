Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0DQ-0002DL-4x
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:10:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix qmi cfg send message fail
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558962917-29104-1-git-send-email-akolli@codeaurora.org>
References: <1558962917-29104-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20190529151007.C231260DA8@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:10:07 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> Fix ath11k qmi fail issue,
>  ath11k c000000.wifi1: qmi wlan config request failed, result: 1, err: 48
> 
> Fixes: 1e3e4fdc27c6 ("ath11k: qmi: fix frame size warnings")
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Patch applied to ath.git, thanks.

7e971d50571b ath11k: fix qmi cfg send message fail

-- 
https://patchwork.kernel.org/patch/10963037/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
