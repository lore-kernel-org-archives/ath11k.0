Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBMSa-0005t7-LH
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 18:17:17 +0000
Received: by mail-pf1-x443.google.com with SMTP id d22so4140929pfn.5
 for <ath11k@lists.infradead.org>; Thu, 27 Aug 2020 11:17:16 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:17:12 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [05/16] atmel: convert tasklets to use new tasklet_setup() API
Message-ID: <202008271115.A54F087@keescook>
References: <20200817090637.26887-6-allen.cryptic@gmail.com>
 <20200827132320.B70A9C433AD@smtp.codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827132320.B70A9C433AD@smtp.codeaurora.org>
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
Cc: helmut.schaa@googlemail.com, chunkeey@googlemail.com, jirislaby@kernel.org, brcm80211-dev-list@cypress.com, pkshih@realtek.com, Allen Pais <allen.cryptic@gmail.com>, b43-dev@lists.infradead.org, Allen Pais <allen.lkml@gmail.com>, dsd@gentoo.org, ath11k@lists.infradead.org, kune@deine-taler.de, mickflemm@gmail.com, kuba@kernel.org, brcm80211-dev-list.pdl@broadcom.com, yhchuang@realtek.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, stas.yakovlev@gmail.com, Romain Perier <romain.perier@gmail.com>, Larry.Finger@lwfinger.net

On Thu, Aug 27, 2020 at 01:23:20PM +0000, Kalle Valo wrote:
> Allen Pais <allen.cryptic@gmail.com> wrote:
> 
> > From: Allen Pais <allen.lkml@gmail.com>
> > 
> > In preparation for unconditionally passing the
> > struct tasklet_struct pointer to all tasklet
> > callbacks, switch to using the new tasklet_setup()
> > and from_tasklet() to pass the tasklet pointer explicitly
> > and remove .data field.
> > 
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> 
> 11 patches applied to wireless-drivers-next.git, thanks.
> 
> a36f50e5b937 atmel: convert tasklets to use new tasklet_setup() API
> fc6722301428 b43legacy: convert tasklets to use new tasklet_setup() API
> 427a06beb072 brcmsmac: convert tasklets to use new tasklet_setup() API
> ae6cf59f80f7 ipw2x00: convert tasklets to use new tasklet_setup() API
> b81b9d372ac8 iwlegacy: convert tasklets to use new tasklet_setup() API
> 7433c9690318 intersil: convert tasklets to use new tasklet_setup() API
> 51c41aa93ef5 mwl8k: convert tasklets to use new tasklet_setup() API
> aff8e8d02ec2 qtnfmac: convert tasklets to use new tasklet_setup() API
> a0d6ea9b6e1c rt2x00: convert tasklets to use new tasklet_setup() API
> d3ccc14dfe95 rtlwifi/rtw88: convert tasklets to use new tasklet_setup() API
> 26721b02466e zd1211rw: convert tasklets to use new tasklet_setup() API
> 
> -- 
> https://patchwork.kernel.org/patch/11717451/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

FWIW, I don't think a revert is needed here to wait for the from_tasket()
-> container_from() API to land since from_tasklet() is already being
used by other trees. Let's just get this done so we can get closer to
ripping out the old tasklet API. We'll have to do a treewide
from_timer(), from_tasklet() -> container_from() anyway...

-- 
Kees Cook

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
