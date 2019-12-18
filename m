Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdJR-0006py-4l
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:40:42 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3 7/9] ath11k: move some tx_status parsing to debugfs code
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213153839.12372-8-john@phrozen.org>
References: <20191213153839.12372-8-john@phrozen.org>
Message-Id: <20191218174037.6D2F0C43383@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:40:37 +0000 (UTC)
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

3 patches applied to ath-next branch of ath.git, thanks.

8cfa7ef8127b ath11k: move some tx_status parsing to debugfs code
d0998eb84ed3 ath11k: optimise ath11k_dp_tx_completion_handler
2ad578fdb7b5 ath11k: optimize ath11k_hal_tx_status_parse

-- 
https://patchwork.kernel.org/patch/11290753/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
