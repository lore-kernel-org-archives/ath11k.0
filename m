Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDreg-0000ju-UO
 for ath11k@lists.infradead.org; Fri, 27 Sep 2019 14:55:36 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH bringup 1/3] ath11k: Clean ups in
 ath11k_ce_rx_buf_enqueue_pipe() error path
References: <1569386658-1325-1-git-send-email-vthiagar@codeaurora.org>
 <20190927145215.1111760BFE@smtp.codeaurora.org>
Date: Fri, 27 Sep 2019 17:55:31 +0300
In-Reply-To: <20190927145215.1111760BFE@smtp.codeaurora.org> (Kalle Valo's
 message of "Fri, 27 Sep 2019 14:52:14 +0000 (UTC)")
Message-ID: <878sq9dc0s.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:
>
>> Unify the unlock/ring_access_end calls with error path in
>> ath11k_ce_rx_buf_enqueue_pipe(). Update to ce_pipe->rx_buf_needed
>> is done inside srng->lock before ath11k_hal_srng_access_end().
>> Also rename the goto label from err to exit.
>> 
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> 3 patches applied to ath11k-post-bringup branch of ath.git, thanks.
>
> d28909b5a9ac ath11k: Clean ups in ath11k_ce_rx_buf_enqueue_pipe() error path
> 759b5305b0bc ath11k: Clean up parameter list in ath11k_ce_completed_send_next()
> 51725f95094a ath11k: Use struct_size() to get the structure size with trailing array

Please disregard, I applied to a wrong branch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
