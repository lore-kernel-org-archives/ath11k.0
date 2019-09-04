Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5X6W-0004fo-Jz
 for ath11k@lists.infradead.org; Wed, 04 Sep 2019 15:21:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/4] ath11k: add spatial reuse support
References: <20190904091211.26868-1-john@phrozen.org>
 <20190904091211.26868-4-john@phrozen.org>
Date: Wed, 04 Sep 2019 18:21:49 +0300
In-Reply-To: <20190904091211.26868-4-john@phrozen.org> (John Crispin's message
 of "Wed, 4 Sep 2019 11:12:10 +0200")
Message-ID: <87mufknl2q.fsf@kamboji.qca.qualcomm.com>
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> Trigger the WMI call en/disabling OBSS PD when the bss config changes or we
> assoc to an AP that broadcasts the IE.
>
> Signed-off-by: John Crispin <john@phrozen.org>

I fixed this checkpatch warning in pending branch:

drivers/net/wireless/ath/ath11k/wmi.c:2573: Alignment should match open parenthesis

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
