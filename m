Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD2XP-0002tk-94
 for ath11k@lists.infradead.org; Tue, 01 Sep 2020 09:25:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 12/16] wireless: mediatek: convert tasklets to use new
 tasklet_setup() API
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200817090637.26887-13-allen.cryptic@gmail.com>
References: <20200817090637.26887-13-allen.cryptic@gmail.com>
Message-Id: <20200901092503.BF2D4C433CB@smtp.codeaurora.org>
Date: Tue,  1 Sep 2020 09:25:03 +0000 (UTC)
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
Cc: Allen Pais <allen.lkml@gmail.com>, chunkeey@googlemail.com, jirislaby@kernel.org, brcm80211-dev-list@cypress.com, pkshih@realtek.com, b43-dev@lists.infradead.org, dsd@gentoo.org, ath11k@lists.infradead.org, kune@deine-taler.de, mickflemm@gmail.com, keescook@chromium.org, kuba@kernel.org, brcm80211-dev-list.pdl@broadcom.com, yhchuang@realtek.com, netdev@vger.kernel.org, helmut.schaa@googlemail.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, stas.yakovlev@gmail.com, Romain Perier <romain.perier@gmail.com>, Larry.Finger@lwfinger.net

Allen Pais <allen.cryptic@gmail.com> wrote:

> From: Allen Pais <allen.lkml@gmail.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

Please split this patch into two, mt76 and mt7601u patches go into
separate trees.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11717429/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
