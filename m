Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihXek-0005LY-Iv
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 11:38:20 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3 7/9] ath11k: move some tx_status parsing to debugfs code
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213153839.12372-8-john@phrozen.org>
References: <20191213153839.12372-8-john@phrozen.org>
Message-Id: <20191218113817.43D27C433A2@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 11:38:17 +0000 (UTC)
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

> Some of the fields are only used by debugfs. Move the parsing of these
> from the data hot path to the debugfs code.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This added a new warning, fixed in pending branch:

drivers/net/wireless/ath/ath11k/debugfs_sta.c: In function 'ath11k_update_per_peer_stats_from_txcompl':
drivers/net/wireless/ath/ath11k/debugfs_sta.c:138:6: warning: variable 'num_tones_in_ru' set but not used [-Wunused-but-set-variable]

-- 
https://patchwork.kernel.org/patch/11290753/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
