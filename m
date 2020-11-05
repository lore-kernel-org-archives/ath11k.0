Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH v2 0/3] wireless: convert tasklets to use new
References: <20201007103309.363737-1-allen.lkml@gmail.com>
 <c3d71677-a428-f215-2ba8-4dd277a69fb6@linux.microsoft.com>
 <87blgdqdpb.fsf@codeaurora.org>
From: Allen Pais <apais@linux.microsoft.com>
Message-ID: <9e9219d9-fab7-404b-0f40-f5721f781a1d@linux.microsoft.com>
Date: Thu, 5 Nov 2020 09:03:10 +0530
MIME-Version: 1.0
In-Reply-To: <87blgdqdpb.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>, davem@davemloft.net, lorenzo.bianconi83@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, ath11k@lists.infradead.org, nbd@nbd.name

>>>
>>> This series converts the remaining drivers to use new
>>> tasklet_setup() API.
>>>
>>> The patches are based on wireless-drivers-next (c2568c8c9e63)
>>
>>   Is this series queue? I haven't seen any email. This is the last
>> series as part of the tasklet conversion effort.
> 
> They are queued in linux-wireless patchwork, see the link below. I have
> lots of patches pending but hopefully I'll tackle most of them soon.
> 

Thank you very much.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
