Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfK0F-00077l-76
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 08:07:04 +0000
MIME-Version: 1.0
Date: Mon, 24 Jun 2019 13:37:02 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH] ath11k/dp: Cleanup type casting in WBM link descriptor
 setup
In-Reply-To: <20190624073851.25EF660A05@smtp.codeaurora.org>
References: <1561089055-7355-1-git-send-email-vthiagar@codeaurora.org>
 <20190624073851.25EF660A05@smtp.codeaurora.org>
Message-ID: <eb8c19780528f9c14f0b4ffb79dd4405@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

On 2019-06-24 13:08, Kalle Valo wrote:
> Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:
> 
>> Change the type of virtual address of struct hal_wbm_idle_scatter_list
>> from u32 * to struct hal_wbm_link_desc *. This also makes the pointer
>> arithmetic simpler. This also fixes a bug in pointer arithmetic
>> on scatter buffer address. Scatter buffer address was incremented
>> by HAL_LINK_DESC_SIZE instead of sizeof(hal_wbm_link_desc).
>> 
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> This had conflicts:
> 
> Applying: ath11k/dp: Cleanup type casting in WBM link descriptor setup
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath11k/dp.c
> M       drivers/net/wireless/ath/ath11k/hal.c
> M       drivers/net/wireless/ath/ath11k/hal.h
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath11k/hal.h
> Auto-merging drivers/net/wireless/ath/ath11k/hal.c
> CONFLICT (content): Merge conflict in 
> drivers/net/wireless/ath/ath11k/hal.c
> Auto-merging drivers/net/wireless/ath/ath11k/dp.c
> CONFLICT (content): Merge conflict in 
> drivers/net/wireless/ath/ath11k/dp.c
> Recorded preimage for 'drivers/net/wireless/ath/ath11k/dp.c'
> Recorded preimage for 'drivers/net/wireless/ath/ath11k/hal.c'
> error: Failed to merge in the changes.
> Patch failed at 0001 ath11k/dp: Cleanup type casting in WBM link
> descriptor setup
> 
> Please double check my resolution:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-ath11k&id=c23d1428eb9c1bfeb1167d8770e58e55e1217170

Looks good, thanks.

Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
