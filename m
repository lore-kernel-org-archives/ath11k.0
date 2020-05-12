Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPQt-00056h-Nr
 for ath11k@lists.infradead.org; Tue, 12 May 2020 07:34:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: remove redundant initialization of pointer
 info
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200507164318.56570-1-colin.king@canonical.com>
References: <20200507164318.56570-1-colin.king@canonical.com>
Message-Id: <20200512073425.12DDBC432C2@smtp.codeaurora.org>
Date: Tue, 12 May 2020 07:34:25 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, "David S . Miller" <davem@davemloft.net>

Colin King <colin.king@canonical.com> wrote:

> Pointer info is being assigned twice, once at the start of the function
> and secondly when it is just about to be accessed. Remove the redundant
> initialization and keep the original assignment to info that is close
> to the memcpy that uses it.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

52b776fa5921 ath11k: remove redundant initialization of pointer info

-- 
https://patchwork.kernel.org/patch/11534415/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
