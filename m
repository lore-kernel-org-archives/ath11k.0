Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQVe8-0007IX-QS
 for ath11k@lists.infradead.org; Tue, 14 May 2019 11:31:02 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 386F0601D4
 for <ath11k@lists.infradead.org>; Tue, 14 May 2019 11:30:59 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Merging v5.1
References: <87k1etfymo.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 14 May 2019 14:30:57 +0300
In-Reply-To: <87k1etfymo.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 14 May 2019 07:28:31 +0300")
Message-ID: <875zqdff2m.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> I'm planning today to merge v5.1 into ath11k-bringup. There's one API
> change DMA allocations, patch below how I'm planning to fix that. If
> there are any issues with this merge please let me know ASAP.

I merged it now:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath11k-bringup&id=d93d992c092c72566e6bc37d4393bf0295cb8a4a

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
