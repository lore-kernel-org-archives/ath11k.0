Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMCrJ-0004JK-G7
 for ath11k@lists.infradead.org; Thu, 02 May 2019 14:38:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: fix build issues on disabling ATH11K_DEBUG
References: <1556045425-28750-1-git-send-email-akolli@codeaurora.org>
 <87woj9m1jk.fsf@kamboji.qca.qualcomm.com>
 <6e9f3d1bb1a3ec7e925d8866dce0cdb1@codeaurora.org>
Date: Thu, 02 May 2019 17:38:45 +0300
In-Reply-To: <6e9f3d1bb1a3ec7e925d8866dce0cdb1@codeaurora.org> (Anilkumar
 Kolli's message of "Thu, 02 May 2019 19:42:22 +0530")
Message-ID: <87tvecly4q.fsf@kamboji.qca.qualcomm.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> On 2019-05-02 18:55, Kalle Valo wrote:
>> Anilkumar Kolli <akolli@codeaurora.org> writes:
>>
>> Failed to apply:
>>
>> Applying: ath11k: fix build issues on disabling ATH11K_DEBUG
>> fatal: sha1 information is lacking or useless
>> (drivers/net/wireless/ath/ath11k/dp_rx.c).
>> error: could not build fake ancestor
>> Patch failed at 0001 ath11k: fix build issues on disabling ATH11K_DEBUG
>>
>> Please use ath11k-bringup branch as the baseline so that git can use
>> 3-way merge. Otherwise it will be hard to resolve conflicts.
>
> Hi Kalle,
>
> Could you please try in this order,
> 0001-ath11k-move-per-peer-pktlog-entry-to-per-sta-debugfs.patch
> 0001-ath11k-fix-build-issues-on-disabling-ATH11K_DEBUG.patch

If there are dependencies you should put them in the same patchset,
otherwise there's no guarantee of the order they are applied.

But still this fails to apply, please rebase and resend.

Applying: ath11k: fix build issues on disabling ATH11K_DEBUG
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/dp_rx.c).
error: could not build fake ancestor
Patch failed at 0001 ath11k: fix build issues on disabling ATH11K_DEBUG

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
