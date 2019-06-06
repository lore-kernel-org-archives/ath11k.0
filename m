Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYu5P-0005UN-6N
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 15:13:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: fix fallthrough warnings
References: <1559754036-2358-1-git-send-email-msinada@codeaurora.org>
Date: Thu, 06 Jun 2019 18:13:46 +0300
In-Reply-To: <1559754036-2358-1-git-send-email-msinada@codeaurora.org> (Muna
 Sinada's message of "Wed, 5 Jun 2019 10:00:36 -0700")
Message-ID: <87lfyevj9x.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Muna Sinada <msinada@codeaurora.org>
Cc: ath11k@lists.infradead.org

Muna Sinada <msinada@codeaurora.org> writes:

> Marked expected switch case fall-through.
>
> Fall through warnings were generated when running ath11k-check script
> with --extra flag:
>
>     drivers/net/wireless/ath/ath11k/core.c:741:14:
> 	warning: this statement may fall through Wimplicit-fallthrough=]
>     drivers/net/wireless/ath/ath11k/dp.c:133:6:
> 	warning: this statement may fall through [-Wplicit-fallthrough=]
>
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -138,6 +138,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
>  			break;
>  		}
>  		/* follow through when ring_num >= 3 */
> +		/* fall through */

Duplicate comments saying the same thing, can't you merge those?

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
