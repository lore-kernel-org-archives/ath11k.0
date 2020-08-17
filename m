Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7cB9-0003KO-Oh
 for ath11k@lists.infradead.org; Mon, 17 Aug 2020 10:15:49 +0000
Received: by mail-qk1-x744.google.com with SMTP id b79so14425471qkg.9
 for <ath11k@lists.infradead.org>; Mon, 17 Aug 2020 03:15:46 -0700 (PDT)
Subject: Re: [PATCH 07/16] wireless: brcm80211: convert tasklets to use new
 tasklet_setup() API
References: <20200817090637.26887-1-allen.cryptic@gmail.com>
 <20200817090637.26887-8-allen.cryptic@gmail.com>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5080db28-3112-7d0a-ec7c-f437f670cfa3@broadcom.com>
Date: Mon, 17 Aug 2020 12:15:39 +0200
MIME-Version: 1.0
In-Reply-To: <20200817090637.26887-8-allen.cryptic@gmail.com>
Content-Language: en-US
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
To: Allen Pais <allen.cryptic@gmail.com>, kvalo@codeaurora.org, kuba@kernel.org, jirislaby@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org, chunkeey@googlemail.com, Larry.Finger@lwfinger.net, stas.yakovlev@gmail.com, helmut.schaa@googlemail.com, pkshih@realtek.com, yhchuang@realtek.com, dsd@gentoo.org, kune@deine-taler.de
Cc: brcm80211-dev-list.pdl@broadcom.com, keescook@chromium.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, brcm80211-dev-list@cypress.com, b43-dev@lists.infradead.org, Allen Pais <allen.lkml@gmail.com>, Romain Perier <romain.perier@gmail.com>, ath11k@lists.infradead.org

On 8/17/2020 11:06 AM, Allen Pais wrote:
> From: Allen Pais <allen.lkml@gmail.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>   .../net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c  | 6 +++---
>   .../net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h  | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
