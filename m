Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBG9O-00072u-4Q
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 11:33:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: fix error check on return from call to
 ath11k_core_firmware_request
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200819105712.51886-1-colin.king@canonical.com>
References: <20200819105712.51886-1-colin.king@canonical.com>
Message-Id: <20200827113253.8C42EC43391@smtp.codeaurora.org>
Date: Thu, 27 Aug 2020 11:32:53 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to ath11k_core_firmware_request is returning a pointer that
> can be set to an error code, however, this is not being checked.
> Instead ret is being incorrecly checked for the error return. Fix the
> error checking.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 7b57b2ddec21 ("ath11k: create a common function to request all firmware files")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

A similar patch has been already applied.

error: patch failed: drivers/net/wireless/ath/ath11k/qmi.c:1886
error: drivers/net/wireless/ath/ath11k/qmi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/11723519/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
