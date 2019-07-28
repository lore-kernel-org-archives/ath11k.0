Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrXdb-0000JK-Kc
 for ath11k@lists.infradead.org; Sun, 28 Jul 2019 01:06:12 +0000
MIME-Version: 1.0
Date: Sat, 27 Jul 2019 18:06:10 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH] MAINTAINERS: add ath11k
In-Reply-To: <20190718054757.32693-1-john@phrozen.org>
References: <20190718054757.32693-1-john@phrozen.org>
Message-ID: <d68716087ac28578e24e9e4b080cae10@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-07-17 22:47, John Crispin wrote:
> This makes the get_maintainer.pl script work.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c2fce72e694..43006c2debf0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12827,6 +12827,13 @@ T:	git
> git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
>  S:	Supported
>  F:	drivers/net/wireless/ath/ath10k/
> 
> +QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
> 
Typo here. ATH11K?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
