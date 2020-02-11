Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1WlY-0001dj-K8
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 14:43:58 +0000
Subject: Re: [RESEND V2 3/4] ath11k: switch to using ieee80211_tx_status_ext()
References: <20200204151135.25302-1-john@phrozen.org>
 <20200204151135.25302-3-john@phrozen.org>
 <87h7zxxob7.fsf@kamboji.qca.qualcomm.com> <4744821.iAptAJfnkX@bentobox>
From: John Crispin <john@phrozen.org>
Message-ID: <94d0da89-6b48-0433-7a01-275af1a99ca1@phrozen.org>
Date: Tue, 11 Feb 2020 15:43:46 +0100
MIME-Version: 1.0
In-Reply-To: <4744821.iAptAJfnkX@bentobox>
Content-Language: en-US
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
To: Sven Eckelmann <sven@narfation.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>

On 11/02/2020 15:38, Sven Eckelmann wrote:
> On Tuesday, 11 February 2020 14:10:04 CET Kalle Valo wrote:
> [...]
>>> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
>>> index 7b532bf9acd8..66a6cfd54ad9 100644
>>> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
>>> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
>>> @@ -357,9 +357,12 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
>>>   				       struct sk_buff *msdu,
>>>   				       struct hal_tx_status *ts)
>>>   {
>>> +	struct ieee80211_tx_status status = { 0 };
>>
>> This adds a sparse warning:
>>
>> drivers/net/wireless/ath/ath11k/dp_tx.c:350:47: warning: Using plain integer as NULL pointer
>>
>> Seems like a false warning, no? But not sure how to shut up the warning,
>> using '{ NULL }' would do that but just feels wrong. Any opinions?
> 
> Why is this a false warning? The structure is following:
> 
>      struct ieee80211_tx_status {
>      	struct ieee80211_sta *sta;
>      	struct ieee80211_tx_info *info;
>      	struct sk_buff *skb;
>      	struct rate_info *rate;
>      };
> 
> And this is a pre-C99 initializer. The equal C99-Initializer would be
> 
>      struct ieee80211_tx_status status = {
>      	.sta = NULL,
> 	};
> 
> So it is initializing status.sta with 0. But status.sta is a pointer
> and we should use NULL for pointers instead of plain 0. If you want
> to initialize the object on stack to zero but not initialize each
> member then just use {}.
> 
> Kind regards,
> 	Sven
> 

yup, i just need to drop the 0 and use {}. I'll respin/send
	John

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
