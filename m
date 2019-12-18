Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdWW-000295-VL
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:54:14 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix missing free of skb on error return path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191212194251.108343-1-colin.king@canonical.com>
References: <20191212194251.108343-1-colin.king@canonical.com>
Message-Id: <20191218175412.0C110C4479F@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:54:12 +0000 (UTC)
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
Cc: kernel-janitors@vger.kernel.org, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Ganesh Sesetti <gseset@codeaurora.org>, John Crispin <john@phrozen.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, ath11k@lists.infradead.org

Colin King <colin.king@canonical.com> wrote:

> The error handling when the call to ath11k_hal_srng_get_entrysize fails
> leaks skb, fix this by returning via the err_free return path that will
> ensure the skb is free'd.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4358bcb54bb9 ath11k: fix missing free of skb on error return path

-- 
https://patchwork.kernel.org/patch/11289341/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
