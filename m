Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg8zt-0005Ni-2W
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 14:34:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath11k: Fix rx_duration reporting
References: <1561548145-23950-1-git-send-email-gseset@codeaurora.org>
Date: Wed, 26 Jun 2019 17:34:01 +0300
In-Reply-To: <1561548145-23950-1-git-send-email-gseset@codeaurora.org> (Ganesh
 Sesetti's message of "Wed, 26 Jun 2019 16:52:25 +0530")
Message-ID: <87zhm4l8km.fsf@kamboji.qca.qualcomm.com>
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
To: Ganesh Sesetti <gseset@codeaurora.org>
Cc: ath11k@lists.infradead.org

Ganesh Sesetti <gseset@codeaurora.org> writes:

> Since rx duration is wrongly reported in iw wlanX station dump,
> fetch correct rx duration reported in PPDU_END tlv.
> Enable PPDU_END, MPDU_START and PPDU_END_STATUS_DONE tlv
> reporting in monitor status by default. Pass the sta's Rx duration
> to mac80211 in sta_statistics() ops.
>
> Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>

Fails to compile:

drivers/net/wireless/ath/ath11k/hal_rx.c: In function 'ath11k_hal_rx_parse_mon_status_tlv':
drivers/net/wireless/ath/ath11k/hal_rx.c:1155:4: error: initialization of 'struct hal_rx_ppdu_end_duration *' from incompatible pointer type 'struct hal_rx_ppdu_start *' [-Werror=incompatible-pointer-types]

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
