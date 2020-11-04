Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLoP-00059A-8i
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 16:39:07 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 0/3] wireless: convert tasklets to use new
References: <20201007103309.363737-1-allen.lkml@gmail.com>
 <c3d71677-a428-f215-2ba8-4dd277a69fb6@linux.microsoft.com>
Date: Wed, 04 Nov 2020 18:38:56 +0200
In-Reply-To: <c3d71677-a428-f215-2ba8-4dd277a69fb6@linux.microsoft.com> (Allen
 Pais's message of "Tue, 3 Nov 2020 13:05:23 +0530")
Message-ID: <87blgdqdpb.fsf@codeaurora.org>
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
To: Allen Pais <apais@linux.microsoft.com>
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>, davem@davemloft.net, lorenzo.bianconi83@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, ath11k@lists.infradead.org, nbd@nbd.name

Allen Pais <apais@linux.microsoft.com> writes:

>>
>> This series converts the remaining drivers to use new
>> tasklet_setup() API.
>>
>> The patches are based on wireless-drivers-next (c2568c8c9e63)
>
>  Is this series queue? I haven't seen any email. This is the last
> series as part of the tasklet conversion effort.

They are queued in linux-wireless patchwork, see the link below. I have
lots of patches pending but hopefully I'll tackle most of them soon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
