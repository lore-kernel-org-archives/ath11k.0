Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNLCJ-0006pS-GV
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 19:22:02 +0000
MIME-Version: 1.0
Date: Wed, 30 Sep 2020 00:51:48 +0530
From: kathirve@codeaurora.org
Subject: Re: [PATCH] ath11k: removing the ath11k debugfs dir properly
In-Reply-To: <20200924161623.ED696C433F1@smtp.codeaurora.org>
References: <1600885519-29535-1-git-send-email-kathirve@codeaurora.org>
 <20200924161623.ED696C433F1@smtp.codeaurora.org>
Message-ID: <86f81823eb5ea6bd2f9c4bf91763da75@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Please ignore this patch

Thanks
Karthikeyan


On 2020-09-24 21:46, Kalle Valo wrote:
> Karthikeyan Kathirvel <kathirve@codeaurora.org> wrote:
> 
>> ath11k_debug_pdev_destroy was not called for proper cleaning of debug
>> files when destroying the pdev, this results in not removing the 
>> ath11k
>> directory in debugfs folder even after rmmod of ath11k. So when next
>> time doing insmod of ath11k prevents creating another ath11k 
>> directory,
>> hence causing ipq8074_2 to get created in parent dir of debugfs.
>> 
>> Signed-off-by: Karthikeyan Kathirvel <kathirve@codeaurora.org>
> 
> Fails to apply, please rebase. Also Tested-on missing.
> 
> error: patch failed: drivers/net/wireless/ath/ath11k/debug.c:973
> error: drivers/net/wireless/ath/ath11k/debug.c: patch does not apply
> stg import: Diff does not apply cleanly
> 
> Patch set to Changes Requested.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
