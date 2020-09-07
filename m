Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFEsL-0002kJ-Kw
 for ath11k@lists.infradead.org; Mon, 07 Sep 2020 10:59:54 +0000
MIME-Version: 1.0
Date: Mon, 7 Sep 2020 10:59:49 +0000
From: akolli@codeaurora.org
Subject: Re: [PATCH v6 2/3] ath11k: copy ce service configs to hw_params
In-Reply-To: <87363t52nj.fsf@codeaurora.org>
References: <1598287470-1871-1-git-send-email-akolli@codeaurora.org>
 <1598287470-1871-3-git-send-email-akolli@codeaurora.org>
 <87363t52nj.fsf@codeaurora.org>
Message-ID: <010101746838d751-613bfbba-7cfe-496c-9244-41fc2262f665-000000@us-west-2.amazonses.com>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-09-07 15:28, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> writes:
> 
>> No functional changes, added target ce service configurations to 
>> hw_params.
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -812,12 +812,6 @@ int ath11k_core_init(struct ath11k_base *ab)
>>  		return ret;
>>  	}
>> 
>> -	ret = ath11k_init_hw_params(ab);
>> -	if (ret) {
>> -		ath11k_err(ab, "failed to get hw params %d\n", ret);
>> -		return ret;
>> -	}
> 
> This is very suspicious.

ath11k_core_pre_init() is calling ath11k_init_hw_params(), again calling 
same function in ath11k_core_init()
is not needed. Will send this as a new patch ?

Thanks
Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
