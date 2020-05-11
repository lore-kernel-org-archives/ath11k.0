Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY6k5-0007Cl-JI
 for ath11k@lists.infradead.org; Mon, 11 May 2020 11:37:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 90/99]
 drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4613:2-8: preceding lock on
 line 4604 (fwd)
References: <alpine.DEB.2.21.2005072001560.2505@hadrien>
Date: Mon, 11 May 2020 14:36:53 +0300
In-Reply-To: <alpine.DEB.2.21.2005072001560.2505@hadrien> (Julia Lawall's
 message of "Thu, 7 May 2020 20:03:02 +0200 (CEST)")
Message-ID: <87d07a66ui.fsf@kamboji.qca.qualcomm.com>
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
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Miles Hu <milehu@codeaurora.org>, kbuild-all@lists.01.org, ath11k@lists.infradead.org

(moving to ath11k list)

Julia Lawall <julia.lawall@inria.fr> writes:

> Hello,
>
> An unlock may be missing on line 4613.
>
> julia
>
> ---------- Forwarded message ----------
> Date: Thu, 7 May 2020 20:37:55 +0800
> From: kbuild test robot <lkp@intel.com>
> To: kbuild@lists.01.org
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@lip6.fr>
> Subject: [ath6kl:pending 90/99]
>     drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4613:2-8: preceding lock
>     on line 4604
>
> CC: kbuild-all@lists.01.org
> CC: Kalle Valo <kvalo@codeaurora.org>
> CC: ath10k@lists.infradead.org
> TO: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> CC: Kalle Valo <kvalo@codeaurora.org>
> CC: Miles Hu <milehu@codeaurora.org>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   d9e109721e24a6923a36ec88710086c3c23d3429
> commit: a803b0a31d641cde3f7f2e68541ec318349b27a2 [90/99] ath11k: fix
> htt stats module not handle multiple skbs
> :::::: branch date: 7 hours ago
> :::::: commit date: 7 hours ago
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
>
>
> coccinelle warnings: (new ones prefixed by >>)
>
>>> drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4613:2-8:
> preceding lock on line 4604

Indeed, I reported that to the author and dropped the patch from my
pending branch:

https://patchwork.kernel.org/patch/11529687/

Thanks for the report.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
