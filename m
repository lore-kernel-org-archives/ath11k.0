Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIw2q-0004qR-FY
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 14:05:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 0/6] ath11k: add monitor mode support
References: <1555373576-4771-1-git-send-email-milehu@codeaurora.org>
Date: Tue, 23 Apr 2019 17:05:07 +0300
In-Reply-To: <1555373576-4771-1-git-send-email-milehu@codeaurora.org> (Miles
 Hu's message of "Mon, 15 Apr 2019 17:12:50 -0700")
Message-ID: <87a7ggzujw.fsf@kamboji.qca.qualcomm.com>
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

This does not apply:

Applying: ath11k: init/deinit monitor rings
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/core.h).
error: could not build fake ancestor
Patch failed at 0001 ath11k: init/deinit monitor rings

And the sha1 id is incorrect so I can't use 3-way merge to correct it
myself. Please ALWAYS use the ath11k-bringup branch as the baseline and
make sure you don't have other patches applied, otherwise it will be
pain to handle conflicts.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
