Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGR2N-0005LT-UA
 for ath11k@lists.infradead.org; Mon, 23 Mar 2020 17:38:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath: Replace zero-length array with flexible-array
 member
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200224165952.GA9377@embeddedor>
References: <20200224165952.GA9377@embeddedor>
Message-Id: <20200323173848.56CBFC432C2@smtp.codeaurora.org>
Date: Mon, 23 Mar 2020 17:38:48 +0000 (UTC)
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
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Maya Erez <merez@codeaurora.org>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org, wil6210@qti.qualcomm.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Christian Lamparter <chunkeey@googlemail.com>, wcn36xx@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was detected with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Fails to apply, please rebase on top of my ath.git master branch.

error: patch failed: drivers/net/wireless/ath/ath10k/core.h:1223
error: drivers/net/wireless/ath/ath10k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/debug.h:65
error: drivers/net/wireless/ath/ath11k/debug.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/rx_desc.h:1206
error: drivers/net/wireless/ath/ath11k/rx_desc.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11401227/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
