Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZ72b-000107-GI
 for ath11k@lists.infradead.org; Fri, 07 Jun 2019 05:03:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: fix fallthrough warnings
References: <1559754036-2358-1-git-send-email-msinada@codeaurora.org>
 <87lfyevj9x.fsf@kamboji.qca.qualcomm.com>
 <40b6f93fd815c3826d11088788a176e6@codeaurora.org>
Date: Fri, 07 Jun 2019 08:03:44 +0300
In-Reply-To: <40b6f93fd815c3826d11088788a176e6@codeaurora.org>
 (msinada@codeaurora.org's message of "Thu, 06 Jun 2019 14:19:56
 -0700")
Message-ID: <87muiut2a7.fsf@kamboji.qca.qualcomm.com>
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
To: msinada@codeaurora.org
Cc: ath11k@lists.infradead.org

msinada@codeaurora.org writes:

> On 2019-06-06 08:13, Kalle Valo wrote:
>> Muna Sinada <msinada@codeaurora.org> writes:
>>
>>> Marked expected switch case fall-through.
>>>
>>> Fall through warnings were generated when running ath11k-check script
>>> with --extra flag:
>>>
>>>     drivers/net/wireless/ath/ath11k/core.c:741:14:
>>> 	warning: this statement may fall through Wimplicit-fallthrough=]
>>>     drivers/net/wireless/ath/ath11k/dp.c:133:6:
>>> 	warning: this statement may fall through [-Wplicit-fallthrough=]
>>>
>>> Signed-off-by: Muna Sinada <msinada@codeaurora.org>
>>
>> [...]
>>
>>> --- a/drivers/net/wireless/ath/ath11k/dp.c
>>> +++ b/drivers/net/wireless/ath/ath11k/dp.c
>>> @@ -138,6 +138,7 @@ int ath11k_dp_srng_setup(struct ath11k_base
>>> *ab, struct dp_srng *ring,
>>>  			break;
>>>  		}
>>>  		/* follow through when ring_num >= 3 */
>>> +		/* fall through */
>>
>> Duplicate comments saying the same thing, can't you merge those?
>
> ath11k_check did not recognize "fall through" in the first comment
> causing the initial fall through warning. It seems that fall through
> comment needs to be on a separate comment to avoid getting warning
> from ath11k_check. Should I get rid of first comment or leave things
> how they are now?

Ah, I tested this myself now and indeed GCC does not regocnise '/* fall
through when ring_num >= 3 */' as a valid fallthrough comment even the
recommendation implied otherwise:

https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html

Oh well, so I guess we just need to have two comments even it's IMHO
ugly. Unless someone has other ideas?

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
