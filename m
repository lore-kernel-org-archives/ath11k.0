Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho5Ht-0001dp-VK
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 12:13:31 +0000
MIME-Version: 1.0
Date: Thu, 18 Jul 2019 17:43:29 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 1/2] ath11k/hal: Fix few bugs in
 ath11k_hal_srng_dst_num_free()
In-Reply-To: <87blxr376n.fsf@kamboji.qca.qualcomm.com>
References: <1563423855-32397-1-git-send-email-vthiagar@codeaurora.org>
 <87blxr376n.fsf@kamboji.qca.qualcomm.com>
Message-ID: <1bd36139025a437846b547810f51c724@codeaurora.org>
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

On 2019-07-18 17:07, Kalle Valo wrote:
> Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> writes:
> 
>> The logic to compute the number of available buffers in destination
>> ring is wrong. It should be just the different between head and
>> tail pointers in terms of the entry size. This functions currently
>> unused, this is fixed to make use of this function in follow-up
>> patches. Also make destination ring head pointer volatile because
>> it is independently updated by HW.
>> 
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath11k/hal.h
>> +++ b/drivers/net/wireless/ath/ath11k/hal.h
>> @@ -538,7 +538,7 @@ struct hal_srng {
>>  			u32 tp;
>> 
>>  			/* Shadow head pointer location to be updated by HW */
>> -			u32 *hp_addr;
>> +			volatile u32 *hp_addr;
> 
> What about tp_addr, shouldn't we make that also volatile to remove the
> ugly cast? Can someone send another patch to fix that, please?

As mentioned, i'll address the other case separately.

Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
