Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
References: <20200817090637.26887-2-allen.cryptic@gmail.com>
 <20200827101540.6589BC433CB@smtp.codeaurora.org>
In-Reply-To: <20200827101540.6589BC433CB@smtp.codeaurora.org>
From: Allen Pais <allen.cryptic@gmail.com>
Date: Thu, 27 Aug 2020 16:14:45 +0530
Message-ID: <CAEogwTB=S6M6Xp4w5dd_W3b6Depmn6Gmu3RmAf96pRankoJQqg@mail.gmail.com>
Subject: Re: [PATCH 01/16] wireless: ath5k: convert tasklets to use new
 tasklet_setup() API
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
Cc: Allen Pais <allen.lkml@gmail.com>, chunkeey@googlemail.com, jirislaby@kernel.org, brcm80211-dev-list@cypress.com, pkshih@realtek.com, b43-dev@lists.infradead.org, dsd@gentoo.org, ath11k@lists.infradead.org, kune@deine-taler.de, mickflemm@gmail.com, Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>, brcm80211-dev-list.pdl@broadcom.com, yhchuang@realtek.com, netdev@vger.kernel.org, helmut.schaa@googlemail.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, stas.yakovlev@gmail.com, Romain Perier <romain.perier@gmail.com>, Larry.Finger@lwfinger.net

Hi,
>
> Allen Pais <allen.cryptic@gmail.com> wrote:
>
> > In preparation for unconditionally passing the
> > struct tasklet_struct pointer to all tasklet
> > callbacks, switch to using the new tasklet_setup()
> > and from_tasklet() to pass the tasklet pointer explicitly.
> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> Patch applied to ath-next branch of ath.git, thanks.
>
> c068a9ec3c94 ath5k: convert tasklets to use new tasklet_setup() API
>
> --
> https://patchwork.kernel.org/patch/11717393/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Could you please drop these and wait for V2. A change was proposed
for from_tasklet() api. The new API should be picked shortly. I will send out
the updated version early next week.

Thanks,
- Allen

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
