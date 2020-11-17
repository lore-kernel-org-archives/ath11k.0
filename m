Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf4bg-0002CP-GZ
 for ath11k@lists.infradead.org; Tue, 17 Nov 2020 17:17:29 +0000
MIME-Version: 1.0
Date: Tue, 17 Nov 2020 09:17:24 -0800
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: [PATCH] ath11k: use MHI provided APIs to allocate and free MHI
 controller
In-Reply-To: <87tutozc7h.fsf@codeaurora.org>
References: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org>
 <87tutozc7h.fsf@codeaurora.org>
Message-ID: <d06eae092fcb0c3319ab793c8063a12d@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: bbhatt@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: jhugo@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kvalo=codeaurora.org@codeaurora.org, manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org, ath11k@lists.infradead.org

On 2020-11-16 11:14 PM, Kalle Valo wrote:
> Bhaumik Bhatt <bbhatt@codeaurora.org> writes:
> 
>> Use MHI provided APIs to allocate and free MHI controller to
>> improve MHI host driver handling.
> 
> How does it improve the handling?
> 
Main reason is we want to ensure the MHI controller is zero-initialized 
and
we want to mandate it as it is better to have it under our control in 
case
we also want to allocate and track peripheral data/memory related to the 
MHI
controller.
>> This also fixes a memory leak as the MHI controller was allocated but
>> never freed.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath11k/mhi.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> For ath11k patches please CC ath11k and linux-wireless lists so that
> patchwork sees it. So you need to resend this.
> 
> Is this a new API? I need to understand if there are any dependencies
> between mhi and ath trees, or if I can apply this directly to my 
> ath.git
> tree.

This one should be dependent on the patch [1] which exists on mainline 
and
should already part of your tree if you're on any 5.10 RC.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bus/mhi?h=v5.10-rc4&id=f42dfbe8f712127031e7b9bc938a1c33cec2ff57

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
