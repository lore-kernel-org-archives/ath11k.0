Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCFQ-0001Zh-Tg
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:48:14 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: qmi: Use memcpy_toio() function on I/O memory
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557316483-18397-1-git-send-email-vthiagar@codeaurora.org>
References: <1557316483-18397-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190513144812.9441560AE0@smtp.codeaurora.org>
Date: Mon, 13 May 2019 14:48:11 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> The usage of memcpy() function on I/O memory is not recommended
> when doing a bulk data copy. Instead use memcpy_toio() function
> while copying bulk data to I/O memory. Using the right function
> takes care of platform specific alignment requirement as well
> in arm64. This fixes the below kernel crash due to unaligned
> memory access in 64-bit arm during memory copy of board data to I/O
> memory.
> 
> [   15.672513] ath11k c000000.wifi1: Downloading BDF: IPQ8074/board-2.bin, size: 917972
> [   15.672635] Unhandled fault: alignment fault (0x96000061) at 0xffffff8007200004
> [   15.680449] Internal error: : 96000061 [#1] PREEMPT SMP
> [   15.946227] CPU: 0 PID: 890 Comm: kworker/u8:5 Tainted: P
> [   15.968272] task: ffffffc03cae9f80 ti: ffffffc03cae9f80 task.ti: ffffffc03cae9f80
> [   15.968552] PC is at __efistub_memcpy+0x48/0x180
> [   15.976011] LR is at ath11k_ce_get_attr_flags+0xc14/0x1594 [ath11k]
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Tested-by: Sven Eckelmann <sven@narfation.org>

Patch applied to ath.git, thanks.

83ac6fc1f56d ath11k: qmi: Use memcpy_toio() function on I/O memory

-- 
https://patchwork.kernel.org/patch/10935537/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
