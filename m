Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iydVA-0005eD-Fj
 for ath11k@lists.infradead.org; Mon, 03 Feb 2020 15:19:06 +0000
Received: by mail-pl1-x642.google.com with SMTP id b22so5967911pls.12
 for <ath11k@lists.infradead.org>; Mon, 03 Feb 2020 07:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20200130015905.18610-1-natechancellor@gmail.com>
In-Reply-To: <20200130015905.18610-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 3 Feb 2020 15:18:49 +0000
Message-ID: <CAKwvOd=kehh2A6O1my6FbYtSU7e=p0JVM0+RBSF=rpPU7QWbOw@mail.gmail.com>
Subject: Re: [PATCH] ath11k: Silence clang -Wsometimes-uninitialized in
 ath11k_update_per_peer_stats_from_txcompl
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
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, CI Notify <ci_notify@linaro.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Thu, Jan 30, 2020 at 1:59 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns a few times (trimmed for brevity):
>
> ../drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning:
> variable 'rate_idx' is used uninitialized whenever 'if' condition is
> false [-Wsometimes-uninitialized]
>
> It is not wrong, rate_idx is only initialized in the first if block.
> However, this is not necessarily an issue in practice because rate_idx
> will only be used when initialized because
> ath11k_accumulate_per_peer_tx_stats only uses rate_idx when flags is not
> set to RATE_INFO_FLAGS_HE_MCS, RATE_INFO_FLAGS_VHT_MCS, or
> RATE_INFO_FLAGS_MCS. Still, it is not good to stick uninitialized values
> into another function so initialize it to zero to prevent any issues
> down the line.
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Link: https://github.com/ClangBuiltLinux/linux/issues/832
> Reported-by: ci_notify@linaro.org
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch. A bit tricky to follow that this (previously) is safe.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/net/wireless/ath/ath11k/debugfs_sta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> index 743760c9bcae..a5bdd16d6d46 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> @@ -136,7 +136,7 @@ void ath11k_update_per_peer_stats_from_txcompl(struct ath11k *ar,
>         struct ath11k_sta *arsta;
>         struct ieee80211_sta *sta;
>         u16 rate;
> -       u8 rate_idx;
> +       u8 rate_idx = 0;
>         int ret;
>         u8 mcs;
>
> --
> 2.25.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200130015905.18610-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
