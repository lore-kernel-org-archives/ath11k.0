Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMBdU-0005yz-NU
 for ath11k@lists.infradead.org; Thu, 02 May 2019 13:20:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 0/6] ath11k: add monitor mode support
References: <1556064387-4668-1-git-send-email-milehu@codeaurora.org>
Date: Thu, 02 May 2019 16:20:20 +0300
In-Reply-To: <1556064387-4668-1-git-send-email-milehu@codeaurora.org> (Miles
 Hu's message of "Tue, 23 Apr 2019 17:06:21 -0700")
Message-ID: <875zqtngbv.fsf@kamboji.qca.qualcomm.com>
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
To: Miles Hu <milehu@codeaurora.org>
Cc: ath11k@lists.infradead.org

Miles Hu <milehu@codeaurora.org> writes:

> Adding monitor mode in ath11k. It can be enabled
>  by commands below:
>
>   ifconfig wlan0 down
>   iw wlan0 set type monitor
>   ifconfig wlan0 up
>
> change channel:
>   iw wlan0 set freq 5805 80 5775
>
> Change summary:
> 1. create monitor status/destination/buffer/link descriptor rings.
> 2. enable these rings and push ring filters to buffer/status rings.
> 3. add napi entry point for monitor status and destination rings process.
> 4. implement monitor status/buffer rings replenish.
> 5. process entries from the status ring to get ppdu id and tlv status.
> 6. process entries from the destination ring by comparing ppdu id to build
>     msdu list.
> 7. merge msdu list to mpdu and copy rx status to cb.
> 8. deliver mpdu to upper layer.
>
> Known issues:
>  - Coexist with other interface type (AP/STA) not fully supported.
>  - higher data rates (11ax) not supported. radiotap needs proper info.
>  - signal strength and rate idx not accurate in some packets.
>
> -Miles Hu
>
> Miles Hu (6):
>   ath11k: init/deinit monitor rings
>   ath11k: monitor filter set function
>   ath11k: htt setup monitor rings
>   ath11k: monitor mode attach/detach
>   ath11k: enable/disable monitor mode and destination ring entry process
>   ath11k: merge msdu tlv process and status/destination ring process

Applies now but does not compile:

drivers/net/wireless/ath/ath11k/dp.c:867:39: error: passing argument 2 of 'ath11k_wbm_idle_ring_setup' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/net/wireless/ath/ath11k/dp.c:476:68: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'size_t *' {aka 'long unsigned int *'}

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
