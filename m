Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 01/16] wireless: ath5k: convert tasklets to use new
 tasklet_setup() API
References: <20200817090637.26887-2-allen.cryptic@gmail.com>
 <20200827101540.6589BC433CB@smtp.codeaurora.org>
 <CAEogwTB=S6M6Xp4w5dd_W3b6Depmn6Gmu3RmAf96pRankoJQqg@mail.gmail.com>
Date: Mon, 7 Sep 2020 16:32:21 +0000
In-Reply-To: <CAEogwTB=S6M6Xp4w5dd_W3b6Depmn6Gmu3RmAf96pRankoJQqg@mail.gmail.com>
 (Allen Pais's message of "Thu, 27 Aug 2020 16:14:45 +0530")
Message-ID: <0101017469694695-c3bf1ce4-cb67-4ddd-bab9-f1e8031b9bb0-000000@us-west-2.amazonses.com>
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
To: Allen Pais <allen.cryptic@gmail.com>
Cc: Allen Pais <allen.lkml@gmail.com>, chunkeey@googlemail.com, jirislaby@kernel.org, brcm80211-dev-list@cypress.com, pkshih@realtek.com, b43-dev@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, stas.yakovlev@gmail.com, mickflemm@gmail.com, Kees Cook <keescook@chromium.org>, dsd@gentoo.org, kune@deine-taler.de, brcm80211-dev-list.pdl@broadcom.com, yhchuang@realtek.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, helmut.schaa@googlemail.com, linux-kernel@vger.kernel.org, mcgrof@kernel.org, Romain Perier <romain.perier@gmail.com>, Larry.Finger@lwfinger.net

Allen Pais <allen.cryptic@gmail.com> writes:

> Hi,
>>
>> Allen Pais <allen.cryptic@gmail.com> wrote:
>>
>> > In preparation for unconditionally passing the
>> > struct tasklet_struct pointer to all tasklet
>> > callbacks, switch to using the new tasklet_setup()
>> > and from_tasklet() to pass the tasklet pointer explicitly.
>> >
>> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
>> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
>> > Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>>
>> Patch applied to ath-next branch of ath.git, thanks.
>>
>> c068a9ec3c94 ath5k: convert tasklets to use new tasklet_setup() API
>>
>> --
>> https://patchwork.kernel.org/patch/11717393/
>>
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> Could you please drop these and wait for V2. A change was proposed
> for from_tasklet() api. The new API should be picked shortly. I will send out
> the updated version early next week.

Too late, I don't normally rebase my trees as it's just too much of a
hassle. Please don't submit patches which are not ready to be applied!

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
