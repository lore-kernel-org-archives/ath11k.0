Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0223.hostedemail.com ([216.40.44.223]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0931-0007sr-TX
 for ath11k@lists.infradead.org; Mon, 27 Jul 2020 19:44:32 +0000
Message-ID: <70ed74d65b5909615c7a9430f3479695465d3b1d.camel@perches.com>
Subject: Re: [PATCH][next] ath11k: Use fallthrough pseudo-keyword
From: Joe Perches <joe@perches.com>
Date: Mon, 27 Jul 2020 12:44:26 -0700
In-Reply-To: <20200727194415.GA1275@embeddedor>
References: <20200727194415.GA1275@embeddedor>
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
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org

On Mon, 2020-07-27 at 14:44 -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
[]
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
[]
> @@ -159,7 +159,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
>  			break;
>  		}
>  		/* follow through when ring_num >= 3 */
> -		/* fall through */
> +		fallthrough;

Likely the /* follow through ... */ comment can be deleted too



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
