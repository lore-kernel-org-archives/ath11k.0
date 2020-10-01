Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO4IT-00042B-Pi
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 19:31:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Correctly check errors for calls to
 debugfs_create_dir()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200927132451.585473-1-alex.dewar90@gmail.com>
References: <20200927132451.585473-1-alex.dewar90@gmail.com>
Message-Id: <20201001193026.6D3F8C433F1@smtp.codeaurora.org>
Date: Thu,  1 Oct 2020 19:30:26 +0000 (UTC)
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
To: Alex Dewar <alex.dewar90@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org

Alex Dewar <alex.dewar90@gmail.com> wrote:

> debugfs_create_dir() returns an ERR_PTR in case of error, but never a
> null pointer. There are a number of places where error-checking code can
> accordingly be simplified.
> 
> Addresses-Coverity: CID 1497150: Memory - illegal accesses (USE_AFTER_FREE)
> Addresses-Coverity: CID 1497158: Memory - illegal accesses (USE_AFTER_FREE)
> Addresses-Coverity: CID 1497160: Memory - illegal accesses (USE_AFTER_FREE)
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

476c1d3c2e61 ath11k: Correctly check errors for calls to debugfs_create_dir()

-- 
https://patchwork.kernel.org/patch/11802131/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
