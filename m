Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kClYl-00080s-SA
 for ath11k@lists.infradead.org; Mon, 31 Aug 2020 15:17:30 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: fix missing error check on call to
 ath11k_pci_get_user_msi_assignment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200819111452.52419-1-colin.king@canonical.com>
References: <20200819111452.52419-1-colin.king@canonical.com>
Message-Id: <20200831151652.3B9A0C433A0@smtp.codeaurora.org>
Date: Mon, 31 Aug 2020 15:16:52 +0000 (UTC)
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
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>

Colin King <colin.king@canonical.com> wrote:

> The return error check on the call to ath11k_pci_get_user_msi_assignment is
> missing.  If an error does occur, num_vectors is still set to zero and
> later on a division by zero can occur when variable vector is being
> calculated.  Fix this by adding an error check after the call.
> 
> Addresses-Coverity: ("Division or modulo by zero")
> Fixes: d4ecb90b3857 ("ath11k: enable DP interrupt setup for QCA6390")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b2c094582e38 ath11k: fix missing error check on call to ath11k_pci_get_user_msi_assignment

-- 
https://patchwork.kernel.org/patch/11723523/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
