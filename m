Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE7bm-0003Mo-VO
 for ath11k@lists.infradead.org; Tue, 17 Mar 2020 08:29:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Silence clang -Wsometimes-uninitialized in
 ath11k_update_per_peer_stats_from_txcompl
References: <20200130015905.18610-1-natechancellor@gmail.com>
 <20200211142431.243E6C433A2@smtp.codeaurora.org>
 <CAKwvOdkcT6jdFu2Mj5ZKErKmm+MyGAoJ=R_0LatR+_A0j7OtYw@mail.gmail.com>
Date: Tue, 17 Mar 2020 10:29:35 +0200
In-Reply-To: <CAKwvOdkcT6jdFu2Mj5ZKErKmm+MyGAoJ=R_0LatR+_A0j7OtYw@mail.gmail.com>
 (Nick Desaulniers's message of "Mon, 16 Mar 2020 14:15:17 -0700")
Message-ID: <87a74fl6z4.fsf@kamboji.qca.qualcomm.com>
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
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <natechancellor@gmail.com>, CI Notify <ci_notify@linaro.org>, ath11k@lists.infradead.org

Nick Desaulniers <ndesaulniers@google.com> writes:

> Hi Kalle, I still see this warning in KernelCI builds of linux-next.
> Is ath-next flowing into linux-next?  I just want to triple check that
> this fix gets sent along.

ath-next is not pulled to linux-next. But this commit is in
wireless-drivers-next now and that tree is pulled to linux-next.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
