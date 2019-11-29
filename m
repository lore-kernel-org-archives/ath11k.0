Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iabhH-0005ZO-Dk
 for ath11k@lists.infradead.org; Fri, 29 Nov 2019 08:32:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: move some tx_status parsing to debugfs code
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191120202956.4401-2-john@phrozen.org>
References: <20191120202956.4401-2-john@phrozen.org>
Message-ID: <0101016eb64a01c1-0320908c-e296-4d67-8aae-d06b66923e3d-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 08:32:13 +0000
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
Cc: ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> Some of the fields are only used by debugfs. Move the parsing of these
> from the data hot path to the debugfs code.
> 
> Signed-off-by: John Crispin <john@phrozen.org>

Does not apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/dp_tx.c:167
error: drivers/net/wireless/ath/ath11k/dp_tx.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/hal_tx.c:74
error: drivers/net/wireless/ath/ath11k/hal_tx.c: patch does not apply
stg import: Diff does not apply cleanly

3 patches set to Changes Requested.

11254761 [1/3] ath11k: move some tx_status parsing to debugfs code
11254765 [2/3] ath11k: optimise ath11k_dp_tx_completion_handler
11254767 [3/3] ath11k: optimize ath11k_hal_tx_status_parse

-- 
https://patchwork.kernel.org/patch/11254761/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
