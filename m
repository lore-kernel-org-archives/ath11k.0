Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOH1x-00020c-GF
 for ath11k@lists.infradead.org; Tue, 14 Apr 2020 08:34:57 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: rx path optimizations
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586421797-885-1-git-send-email-mpubbise@codeaurora.org>
References: <1586421797-885-1-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20200414083439.3099CC433F2@smtp.codeaurora.org>
Date: Tue, 14 Apr 2020 08:34:39 +0000 (UTC)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> During RX, accessing the reo dest ring descriptor directly is consuming
> a lot of CPU cycles. Accessing the descriptor after copying it locally
> has improved CPU usage by around ~10-15% while measuring throughput
> in RX DBTC test cases(all radios are involved in the throughput
> measurement).
> 
> HW tested: IPQ8074
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7395fb496577 ath11k: rx path optimizations

-- 
https://patchwork.kernel.org/patch/11481425/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
