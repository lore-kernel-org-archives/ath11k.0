Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khGEB-0000yN-Iu
 for ath11k@lists.infradead.org; Mon, 23 Nov 2020 18:06:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: add processor_id based ring_selector logic
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604914915-12831-1-git-send-email-ppranees@codeaurora.org>
References: <1604914915-12831-1-git-send-email-ppranees@codeaurora.org>
Message-Id: <20201123180615.091CBC43460@smtp.codeaurora.org>
Date: Mon, 23 Nov 2020 18:06:15 +0000 (UTC)
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
To: P Praneesh <ppranees@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

P Praneesh <ppranees@codeaurora.org> wrote:

> Current ring selector logic follows round-robin scheduling,
> when a process switch from one processor to another each time,
> the data in the cache would have to be invalidated
> and re-loaded from RAM leads to poor cache utilization.
> 
> Therefore smp_processor_id() attempt to keep processes
> on the same processor via processor affinity which improves
> cache utilization. Also, ring selection could be chosen round
> robin when the processor_id based ring selection does not
> have the resources.
> 
> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00874-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <ppranees@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0eaa4c1d34c5 ath11k: add processor_id based ring_selector logic

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604914915-12831-1-git-send-email-ppranees@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
