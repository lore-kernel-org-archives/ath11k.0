Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfIX-0007Ox-CK
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 10:37:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix debugfs build failure
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200107215036.1333983-1-arnd@arndb.de>
References: <20200107215036.1333983-1-arnd@arndb.de>
Message-Id: <20200126103743.80EE7C433CB@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:37:43 +0000 (UTC)
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Sriram R <srirrama@codeaurora.org>, Venkateswara Naralasetty <vnaralas@codeaurora.org>, Muna Sinada <msinada@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>, Tamizh chelvam <tamizhr@codeaurora.org>, kbuild test robot <lkp@intel.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Sven Eckelmann <seckelmann@datto.com>, Ganesh Sesetti <gseset@codeaurora.org>, Sathishkumar Muruganandam <murugana@codeaurora.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, Miles Hu <milehu@codeaurora.org>, Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>, Govindaraj Saminathan <gsamin@codeaurora.org>, Bhagavathi Perumal S <bperumal@codeaurora.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, Manikanta Pubbisetty <mpubbise@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, "David S. Miller" <davem@davemloft.net>

Arnd Bergmann <arnd@arndb.de> wrote:

> When CONFIG_ATH11K_DEBUGFS is disabled, but CONFIG_MAC80211_DEBUGFS
> is turned on, the driver fails to build:
> 
> drivers/net/wireless/ath/ath11k/debugfs_sta.c: In function 'ath11k_dbg_sta_open_htt_peer_stats':
> drivers/net/wireless/ath/ath11k/debugfs_sta.c:416:4: error: 'struct ath11k' has no member named 'debug'
>   ar->debug.htt_stats.stats_req = stats_req;
>     ^~
> 
> It appears that just using the former symbol is sufficient here,
> adding a Kconfig dependency takes care of the corner cases.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a45ceea5015d ath11k: fix debugfs build failure

-- 
https://patchwork.kernel.org/patch/11321921/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
