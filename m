Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxbW-0000QE-Bb
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 13:59:55 +0000
MIME-Version: 1.0
Date: Thu, 20 Jun 2019 19:29:52 +0530
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: Re: [PATCH] ath11k: fix extended stats update issue
In-Reply-To: <20190620134957.7A6726137D@smtp.codeaurora.org>
References: <1560832537-22777-1-git-send-email-periyasa@codeaurora.org>
 <20190620134957.7A6726137D@smtp.codeaurora.org>
Message-ID: <df48ce5832352029971c15cbc8e1dee4@codeaurora.org>
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

On 2019-06-20 19:19, Kalle Valo wrote:
> Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:
> 
>> user not able to see the valid tx stats. htt stats update
>> process get failed due to the wrong argument pass to
>> ath11k_get_ar_by_pdev_id API. Expected argument is pdev_id not
>> the pdev index. so avoid the conversion logic of pdev id to pdev
>> index in htt stats update process.
>> 
>> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> 
> This was already applied, right?

Yes, Its already applied

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath11k-bringup&id=b24d6461d9cf254e512a91ca430be59e70da0d5d


> 
> error: patch failed: drivers/net/wireless/ath/ath11k/dp_rx.c:1294
> error: drivers/net/wireless/ath/ath11k/dp_rx.c: patch does not apply
> stg import: Diff does not apply cleanly
> 
> Patch set to Rejected.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
