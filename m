Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQTXS-0005ZK-Sp
 for ath11k@lists.infradead.org; Thu, 08 Oct 2020 10:52:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: fix memory leak of 'combinations'
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201006174225.545919-1-colin.king@canonical.com>
References: <20201006174225.545919-1-colin.king@canonical.com>
Message-Id: <20201008105245.9A837C433FF@smtp.codeaurora.org>
Date: Thu,  8 Oct 2020 10:52:45 +0000 (UTC)
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
To: Colin King <colin.king@canonical.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the error return path when 'limits' fails to allocate
> does not free the memory allocated for 'combinations'. Fix this
> by adding a kfree before returning.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 2626c269702e ("ath11k: add interface_modes to hw_params")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Alex already sent an identical patch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git/commit/?id=8431350eee2e27ae60f5250e0437ab298329070e

Patch set to Superseded.

-- 
https://patchwork.kernel.org/patch/11819025/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
