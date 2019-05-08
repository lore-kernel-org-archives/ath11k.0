Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOJBv-0007pa-2z
 for ath11k@lists.infradead.org; Wed, 08 May 2019 09:48:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: clean up in qmi source files
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557154051-8682-1-git-send-email-akolli@codeaurora.org>
References: <1557154051-8682-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20190508094846.C1EF5609EF@smtp.codeaurora.org>
Date: Wed,  8 May 2019 09:48:46 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> Fix coding style, Remove unused variable.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Fails to apply, most likely due to my GCC warning patch. Please rebase.

Recorded preimage for 'drivers/net/wireless/ath/ath11k/qmi.c'
error: Failed to merge in the changes.
Applying: ath11k: clean up in qmi source files
Using index info to reconstruct a base tree...
M	drivers/net/wireless/ath/ath11k/qmi.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/qmi.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/qmi.c
Patch failed at 0001 ath11k: clean up in qmi source files
The copy of the patch that failed is found in: .git/rebase-apply/patch

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10931175/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
