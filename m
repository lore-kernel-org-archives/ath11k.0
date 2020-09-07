Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDvw-0006tS-Fq
 for ath11k@lists.infradead.org; Mon, 07 Sep 2020 09:59:33 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6 2/3] ath11k: copy ce service configs to hw_params
References: <1598287470-1871-1-git-send-email-akolli@codeaurora.org>
 <1598287470-1871-3-git-send-email-akolli@codeaurora.org>
Date: Mon, 7 Sep 2020 09:59:28 +0000
In-Reply-To: <1598287470-1871-3-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Mon, 24 Aug 2020 22:14:29 +0530")
Message-ID: <01010174680195b4-3d9a2fb7-0f3d-4974-8df9-a7e401a567a6-000000@us-west-2.amazonses.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> No functional changes, added target ce service configurations to hw_params.
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -812,12 +812,6 @@ int ath11k_core_init(struct ath11k_base *ab)
>  		return ret;
>  	}
>  
> -	ret = ath11k_init_hw_params(ab);
> -	if (ret) {
> -		ath11k_err(ab, "failed to get hw params %d\n", ret);
> -		return ret;
> -	}

This is very suspicious.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
