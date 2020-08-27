Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHsF-0003D8-Tm
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 13:23:28 +0000
MIME-Version: 1.0
Subject: Re: [05/16] atmel: convert tasklets to use new tasklet_setup() API
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200817090637.26887-6-allen.cryptic@gmail.com>
References: <20200817090637.26887-6-allen.cryptic@gmail.com>
Message-Id: <20200827132320.AE277C433A1@smtp.codeaurora.org>
Date: Thu, 27 Aug 2020 13:23:20 +0000 (UTC)
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
> and from_tasklet() to pass the tasklet pointer explicitly
> and remove .data field.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

11 patches applied to wireless-drivers-next.git, thanks.

a36f50e5b937 atmel: convert tasklets to use new tasklet_setup() API
fc6722301428 b43legacy: convert tasklets to use new tasklet_setup() API
427a06beb072 brcmsmac: convert tasklets to use new tasklet_setup() API
ae6cf59f80f7 ipw2x00: convert tasklets to use new tasklet_setup() API
b81b9d372ac8 iwlegacy: convert tasklets to use new tasklet_setup() API
7433c9690318 intersil: convert tasklets to use new tasklet_setup() API
51c41aa93ef5 mwl8k: convert tasklets to use new tasklet_setup() API
aff8e8d02ec2 qtnfmac: convert tasklets to use new tasklet_setup() API
a0d6ea9b6e1c rt2x00: convert tasklets to use new tasklet_setup() API
d3ccc14dfe95 rtlwifi/rtw88: convert tasklets to use new tasklet_setup() API
26721b02466e zd1211rw: convert tasklets to use new tasklet_setup() API

-- 
https://patchwork.kernel.org/patch/11717451/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
