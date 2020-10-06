Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhFT-0006Bb-H8
 for ath11k@lists.infradead.org; Tue, 06 Oct 2020 07:19:05 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] wireless: mt76: convert tasklets to use new
 tasklet_setup() API
References: <20201006055135.291411-1-allen.lkml@gmail.com>
 <20201006055135.291411-3-allen.lkml@gmail.com>
Date: Tue, 06 Oct 2020 10:18:43 +0300
In-Reply-To: <20201006055135.291411-3-allen.lkml@gmail.com> (Allen Pais's
 message of "Tue, 6 Oct 2020 11:21:35 +0530")
Message-ID: <87h7r7bz58.fsf@codeaurora.org>
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
To: Allen Pais <allen.lkml@gmail.com>
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, davem@davemloft.net, lorenzo.bianconi83@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, Romain Perier <romain.perier@gmail.com>, Allen Pais <apais@linux.microsoft.com>, ath11k@lists.infradead.org, nbd@nbd.name

Allen Pais <allen.lkml@gmail.com> writes:

> From: Allen Pais <apais@linux.microsoft.com>
>
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <apais@linux.microsoft.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7603/beacon.c |  4 ++--
>  drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +--
>  drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   |  6 +++---
>  drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c   | 10 +++++-----
>  drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |  7 +++----
>  drivers/net/wireless/mediatek/mt76/usb.c           |  6 +++---
>  drivers/net/wireless/mediatek/mt7601u/dma.c        | 12 ++++++------

mt76 and mt7601u patches go into separate trees, so please split the
patch into two.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
