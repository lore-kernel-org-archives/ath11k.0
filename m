Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbMPh-0002gx-R3
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 11:29:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] wireless: mt7601u: convert tasklets to use new
 tasklet_setup() API
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201007103309.363737-3-allen.lkml@gmail.com>
References: <20201007103309.363737-3-allen.lkml@gmail.com>
Message-Id: <20201107112936.F22F1C433F0@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 11:29:36 +0000 (UTC)
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com, kuba@kernel.org, Romain Perier <romain.perier@gmail.com>, Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name

Allen Pais <allen.lkml@gmail.com> wrote:

> From: Allen Pais <apais@linux.microsoft.com>
> 
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <apais@linux.microsoft.com>

Patch applied to wireless-drivers-next.git, thanks.

7eae05184f3a wireless: mt7601u: convert tasklets to use new tasklet_setup() API

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201007103309.363737-3-allen.lkml@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
