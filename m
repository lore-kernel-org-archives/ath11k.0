Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOGzj-0001tL-DL
 for ath11k@lists.infradead.org; Tue, 14 Apr 2020 08:32:40 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix TWT radio count
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200408174117.22957-1-alokad@codeaurora.org>
References: <20200408174117.22957-1-alokad@codeaurora.org>
Message-Id: <20200414083227.7505AC433F2@smtp.codeaurora.org>
Date: Tue, 14 Apr 2020 08:32:27 +0000 (UTC)
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
To: Aloka Dixit <alokad@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Aloka Dixit <alokad@codeaurora.org> wrote:

> TWT feature fails on radio2 because physical device count is
> hardcoded to 2. Set value dynamically.
> 
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a3baa8f08419 ath11k: Fix TWT radio count

-- 
https://patchwork.kernel.org/patch/11480581/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
