Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLUTa-0005dc-OG
 for ath11k@lists.infradead.org; Mon, 06 Apr 2020 16:20:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: fix error message to correctly report the
 command that failed
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200327192639.363354-1-colin.king@canonical.com>
References: <20200327192639.363354-1-colin.king@canonical.com>
Message-Id: <20200406161933.86EC8C43637@smtp.codeaurora.org>
Date: Mon,  6 Apr 2020 16:19:33 +0000 (UTC)
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
Cc: kernel-janitors@vger.kernel.org, John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, ath11k@lists.infradead.org

Colin King <colin.king@canonical.com> wrote:

> Currently the error message refers to the command WMI_TWT_DIeABLE_CMDID
> which looks like a cut-n-paste mangled typo. Fix the message to match
> the command WMI_BSS_COLOR_CHANGE_ENABLE_CMDID that failed.
> 
> Fixes: 5a032c8d1953 ("ath11k: add WMI calls required for handling BSS color")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9a8074e3bcd7 ath11k: fix error message to correctly report the command that failed

-- 
https://patchwork.kernel.org/patch/11462997/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
