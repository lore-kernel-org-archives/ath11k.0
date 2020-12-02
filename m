Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-5.mailgun.net ([69.72.42.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWkD-00053o-M0
 for ath11k@lists.infradead.org; Wed, 02 Dec 2020 18:20:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix an error handling path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201122173943.1366167-1-christophe.jaillet@wanadoo.fr>
References: <20201122173943.1366167-1-christophe.jaillet@wanadoo.fr>
Message-Id: <20201202182032.78705C43463@smtp.codeaurora.org>
Date: Wed,  2 Dec 2020 18:20:32 +0000 (UTC)
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
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mkenna@codeaurora.org, gsamin@codeaurora.org, kernel-janitors@vger.kernel.org, pradeepc@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, gseset@codeaurora.org, slakkavalli@datto.com, kuba@kernel.org, davem@davemloft.net

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> If 'kzalloc' fails, we must return an error code.
> 
> While at it, remove a useless initialization of 'err' which could hide the
> issue.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e7bcc145bcd0 ath11k: Fix an error handling path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201122173943.1366167-1-christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
