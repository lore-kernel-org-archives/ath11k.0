Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnkcU-0005WK-P4
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 14:09:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: remove deprecated WMI PEER stats
References: <1563342664-4938-1-git-send-email-murugana@codeaurora.org>
 <87pnm83ju2.fsf@kamboji.qca.qualcomm.com>
 <4b49f72c171a37529d6edc8dd382e225@codeaurora.org>
Date: Wed, 17 Jul 2019 17:09:18 +0300
In-Reply-To: <4b49f72c171a37529d6edc8dd382e225@codeaurora.org> (Sathishkumar
 Muruganandam's message of "Wed, 17 Jul 2019 18:59:16 +0530")
Message-ID: <87ftn43g8h.fsf@kamboji.qca.qualcomm.com>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> writes:

> On 2019-07-17 18:21, Kalle Valo wrote:
>> Sathishkumar Muruganandam <murugana@codeaurora.org> writes:
>>
>>> Removing WMI PEER stats which has been deprecated in FW and
>>> rx_duration of
>>> a peer is now fetched from HTT PPDU_END stats.
>>>
>>> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
>>
>> This does not apply and sha1 id is invalid. Please use ath11k-bringup
>> branch as the baseline, do NOT have any other patches applied.
>>
>> Applying: ath11k: remove deprecated WMI PEER stats
>> fatal: sha1 information is lacking or useless
>> (drivers/net/wireless/ath/ath11k/wmi.c).
>> error: could not build fake ancestor
>> Patch failed at 0001 ath11k: remove deprecated WMI PEER stats
>
> Sorry, my bad. There was an older patch applied before this.
>
> Corrected and sent v2 patch, please check.

I was able to apply v2 to pending-ath11k branch, thanks.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
