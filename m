Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kClVv-0007Kj-Jj
 for ath11k@lists.infradead.org; Mon, 31 Aug 2020 15:14:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 04/16] wireless: ath11k: convert tasklets to use new
 tasklet_setup() API
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200817090637.26887-5-allen.cryptic@gmail.com>
References: <20200817090637.26887-5-allen.cryptic@gmail.com>
Message-Id: <20200831151424.95D2DC433B1@smtp.codeaurora.org>
Date: Mon, 31 Aug 2020 15:14:24 +0000 (UTC)
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
To: Allen Pais <allen.cryptic@gmail.com>
Cc: brcm80211-dev-list.pdl@broadcom.com, pkshih@realtek.com, yhchuang@realtek.com, keescook@chromium.org, linux-kernel@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>, linux-wireless@vger.kernel.org, helmut.schaa@googlemail.com, b43-dev@lists.infradead.org, ath11k@lists.infradead.org, brcm80211-dev-list@cypress.com, mcgrof@kernel.org, netdev@vger.kernel.org, mickflemm@gmail.com, dsd@gentoo.org, chunkeey@googlemail.com, kuba@kernel.org, jirislaby@kernel.org, kune@deine-taler.de, stas.yakovlev@gmail.com, Larry.Finger@lwfinger.net

Allen Pais <allen.cryptic@gmail.com> wrote:

> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c08279a93191 ath11k: convert tasklets to use new tasklet_setup() API

-- 
https://patchwork.kernel.org/patch/11717399/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
