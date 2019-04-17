Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrnD-0001vb-18
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 21:08:32 +0000
MIME-Version: 1.0
Date: Wed, 17 Apr 2019 14:08:30 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 2/3] ath11k: allow 4 address transmission for mesh packet
In-Reply-To: <720f6c2d-bdec-0ec0-a06d-bf628addd23a@phrozen.org>
References: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
 <1555493358-16381-3-git-send-email-rmanohar@codeaurora.org>
 <720f6c2d-bdec-0ec0-a06d-bf628addd23a@phrozen.org>
Message-ID: <464f77b1eeafaaa28b3d84c6e7b02bd7@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath11k@lists.infradead.org

On 2019-04-17 02:57, John Crispin wrote:
> On 17/04/2019 11:29, Rajkumar Manoharan wrote:
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c 
>> b/drivers/net/wireless/ath/ath11k/mac.c
>> index b384395bb08c..aea99d9d8d1f 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -2550,6 +2550,17 @@ static int ath11k_sta_state(struct ieee80211_hw 
>> *hw,
>>   				goto exit;
>>   		}
>>   +		if (ieee80211_vif_is_mesh(vif)) {
>> +			ret = ath11k_wmi_set_peer_param(ar, sta->addr,
>> +							arvif->vdev_id,
>> +							WMI_PEER_USE_4ADDR, 1);
>> +			if (ret) {
>> +				ath11k_warn(ar->ab, "failed to STA %pM 4addr capability: %d\n",
>> +						sta->addr, ret);
> 
> Hi,
> 
> looks like the indentation is bad here
> 
John,

I don't see the indentation issue from patch and no warning in 
checkpatch.

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
