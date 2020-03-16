Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDx5B-0002TC-6R
 for ath11k@lists.infradead.org; Mon, 16 Mar 2020 21:15:34 +0000
Received: by mail-pj1-x1041.google.com with SMTP id q16so1714522pje.1
 for <ath11k@lists.infradead.org>; Mon, 16 Mar 2020 14:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200130015905.18610-1-natechancellor@gmail.com>
 <20200211142431.243E6C433A2@smtp.codeaurora.org>
In-Reply-To: <20200211142431.243E6C433A2@smtp.codeaurora.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Mar 2020 14:15:17 -0700
Message-ID: <CAKwvOdkcT6jdFu2Mj5ZKErKmm+MyGAoJ=R_0LatR+_A0j7OtYw@mail.gmail.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <natechancellor@gmail.com>, CI Notify <ci_notify@linaro.org>, ath11k@lists.infradead.org

Hi Kalle, I still see this warning in KernelCI builds of linux-next.
Is ath-next flowing into linux-next?  I just want to triple check that
this fix gets sent along.

On Tue, Feb 11, 2020 at 6:24 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Nathan Chancellor <natechancellor@gmail.com> wrote:
>
> > Clang warns a few times (trimmed for brevity):
> >
> > ../drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning:
> > variable 'rate_idx' is used uninitialized whenever 'if' condition is
> > false [-Wsometimes-uninitialized]
> >
> > It is not wrong, rate_idx is only initialized in the first if block.
> > However, this is not necessarily an issue in practice because rate_idx
> > will only be used when initialized because
> > ath11k_accumulate_per_peer_tx_stats only uses rate_idx when flags is not
> > set to RATE_INFO_FLAGS_HE_MCS, RATE_INFO_FLAGS_VHT_MCS, or
> > RATE_INFO_FLAGS_MCS. Still, it is not good to stick uninitialized values
> > into another function so initialize it to zero to prevent any issues
> > down the line.
> >
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/832
> > Reported-by: ci_notify@linaro.org
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> Patch applied to ath-next branch of ath.git, thanks.
>
> df57acc415b1 ath11k: Silence clang -Wsometimes-uninitialized in ath11k_update_per_peer_stats_from_txcompl
>
> --
> https://patchwork.kernel.org/patch/11357331/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200211142431.243E6C433A2%40smtp.codeaurora.org.



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
