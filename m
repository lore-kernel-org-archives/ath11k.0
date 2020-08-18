Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH 00/16] wirless: convert tasklets to use new tasklet_setup()
References: <20200817090637.26887-1-allen.cryptic@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <9cbb824a-5769-dd24-dcec-d9522d93e9b2@kernel.org>
Date: Tue, 18 Aug 2020 07:44:38 +0200
MIME-Version: 1.0
In-Reply-To: <20200817090637.26887-1-allen.cryptic@gmail.com>
Content-Language: en-US
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
To: Allen Pais <allen.cryptic@gmail.com>, kvalo@codeaurora.org, kuba@kernel.org, mickflemm@gmail.com, mcgrof@kernel.org, chunkeey@googlemail.com, Larry.Finger@lwfinger.net, stas.yakovlev@gmail.com, helmut.schaa@googlemail.com, pkshih@realtek.com, yhchuang@realtek.com, dsd@gentoo.org, kune@deine-taler.de
Cc: brcm80211-dev-list.pdl@broadcom.com, keescook@chromium.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, brcm80211-dev-list@cypress.com, b43-dev@lists.infradead.org, Allen Pais <allen.lkml@gmail.com>, ath11k@lists.infradead.org

On 17. 08. 20, 11:06, Allen Pais wrote:
> From: Allen Pais <allen.lkml@gmail.com>
> 
> Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
> introduced a new tasklet initialization API. This series converts 
> all the wireless drivers to use the new tasklet_setup() API

General question for the whole series: have you considered the long-term
aim instead? That is: convert away from tasklets completely? I.e. use
threaded irqs or workqueues?

thanks,
-- 
js
suse labs

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
