Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iabew-0003xJ-QL
 for ath11k@lists.infradead.org; Fri, 29 Nov 2019 08:29:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Add missing pdev rx rate stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ea6b37701-c96a715a-3466-4836-9152-079584e49603-000000@us-west-2.amazonses.com>
References: <0101016ea6b37701-c96a715a-3466-4836-9152-079584e49603-000000@us-west-2.amazonses.com>
Message-ID: <0101016eb647c829-26d7a55a-e8db-4a38-b115-60b33d1a572d-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 08:29:47 +0000
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: ath11k@lists.infradead.org

Bhagavathi Perumal S <bperumal@codeaurora.org> wrote:

> This adds missing rx rate info stats like pilot evm,
> per chain rssi, per user ul ppdu and mpdu counts and
> ul ofdma rate info etc.
> 
> And add null checks for memory alloc failures.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>

Please CC linux-wireless and resend.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11261571/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
