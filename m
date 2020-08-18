Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
References: <20200817090637.26887-1-allen.cryptic@gmail.com>
 <9cbb824a-5769-dd24-dcec-d9522d93e9b2@kernel.org>
In-Reply-To: <9cbb824a-5769-dd24-dcec-d9522d93e9b2@kernel.org>
From: Allen <allen.lkml@gmail.com>
Date: Tue, 18 Aug 2020 14:44:12 +0530
Message-ID: <CAOMdWSKLPuXsQRoVKr5zOLoh1RZ1Z0VTcxvW=++CfoS0s7azSQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] wirless: convert tasklets to use new tasklet_setup()
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
To: Jiri Slaby <jirislaby@kernel.org>
Cc: brcm80211-dev-list.pdl@broadcom.com, pkshih@realtek.com, yhchuang@realtek.com, dsd@gentoo.org, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, mcgrof@kernel.org, b43-dev@lists.infradead.org, helmut.schaa@googlemail.com, brcm80211-dev-list@cypress.com, Allen Pais <allen.cryptic@gmail.com>, netdev@vger.kernel.org, mickflemm@gmail.com, stas.yakovlev@gmail.com, chunkeey@googlemail.com, kuba@kernel.org, ath11k@lists.infradead.org, kune@deine-taler.de, Kalle Valo <kvalo@codeaurora.org>, Larry.Finger@lwfinger.net

>
> General question for the whole series: have you considered the long-term
> aim instead? That is: convert away from tasklets completely? I.e. use
> threaded irqs or workqueues?
>

 Yes, since changing tasklets to workqueues or threaded irqs
becomes a little trivial when it comes to tree-wide change, this
approach was considered. I am open to both.

-- 
       - Allen

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
