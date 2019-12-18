Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdUp-0001oU-I7
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:52:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: fix memory leak on reg_info
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191212183228.105993-1-colin.king@canonical.com>
References: <20191212183228.105993-1-colin.king@canonical.com>
Message-Id: <20191218175226.B5379C4479D@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:52:26 +0000 (UTC)
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

> Currently a return path is leaking the previously allocate reg_info. Fix
> this by exiting via the return path mem_free.  Since the return value ret
> is defaulted to 0, there is no need to re-assign ret to the 0 before
> the goto.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b5316db229d5 ath11k: fix memory leak on reg_info

-- 
https://patchwork.kernel.org/patch/11289073/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
