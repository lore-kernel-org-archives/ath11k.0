Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfQK-0001sT-0h
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 10:45:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: ensure ts.flags is initialized before bit-wise
 or'ing in values
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191221004046.15859-1-colin.king@canonical.com>
References: <20191221004046.15859-1-colin.king@canonical.com>
Message-Id: <20200126104545.80577C4479F@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:45:45 +0000 (UTC)
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
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>, ath11k@lists.infradead.org, Manikanta Pubbisetty <mpubbise@codeaurora.org>, "David S . Miller" <davem@davemloft.net>

Colin King <colin.king@canonical.com> wrote:

> Currently the structure ts is not inititalized and ts.flags contains
> garbage values from the stack.  This is being passed into function
> ath11k_dp_tx_status_parse that bit-wise or'ing in settings into the
> ts.flags field.  To avoid flags (and other fields) from containing
> garbage, initialize the structure to zero before use.
> 
> Addresses-Coverity: ("Uninitialized scalar variable)"
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

eefca584140b ath11k: ensure ts.flags is initialized before bit-wise or'ing in values

-- 
https://patchwork.kernel.org/patch/11306545/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
