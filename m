Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1aJA-0006JO-Ad
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 18:30:53 +0000
MIME-Version: 1.0
Subject: Re: [RESEND V2 1/4] ath11k: drop tx_info from ath11k_sta
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200204151135.25302-1-john@phrozen.org>
References: <20200204151135.25302-1-john@phrozen.org>
Message-Id: <20200211183050.6E98EC4479D@smtp.codeaurora.org>
Date: Tue, 11 Feb 2020 18:30:50 +0000 (UTC)
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> We will start using ieee80211_tx_status_ext() so we do not need to track
> tx rates inside a struct ieee80211_tx_info. It is currently not possible
> to populate that struct with HE rate info anyhow.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

be43ce646b93 ath11k: drop tx_info from ath11k_sta
6a0c370259c7 ath11k: add HE rate accounting to driver

-- 
https://patchwork.kernel.org/patch/11364815/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
