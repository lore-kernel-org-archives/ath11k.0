Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOJ9E-0007Ub-NX
 for ath11k@lists.infradead.org; Wed, 08 May 2019 09:46:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: fix assignment of struct
 hal_rx_mon_ppdu_info::ldpc
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557212312-11990-1-git-send-email-kvalo@codeaurora.org>
References: <1557212312-11990-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190508094600.6E477609CD@smtp.codeaurora.org>
Date: Wed,  8 May 2019 09:46:00 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> ath11k_dp_rx_update_peer_stats() assumes that struct hal_rx_mon_ppdu_info::ldpc
> contains the value enum hal_rx_su_mu_coding but way it was assigned in
> ath11k_hal_rx_parse_mon_status_tlv() was completely broken. Fix that using
> FIELD_GET().
> 
> Fixes GCC warnings:
> 
> drivers/net/wireless/ath/ath11k/hal_rx.c:932:45: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
> drivers/net/wireless/ath/ath11k/hal_rx.c:985:50: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
> drivers/net/wireless/ath/ath11k/hal_rx.c:1026:46: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
> drivers/net/wireless/ath/ath11k/hal_rx.c:1110:51: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
> drivers/net/wireless/ath/ath11k/hal_rx.c:1131:51: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
> 
> Only compile tested and I didn't check if the firmware interface definitions are correct.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath.git, thanks.

2c5fefcb949e ath11k: fix assignment of struct hal_rx_mon_ppdu_info::ldpc
1e3e4fdc27c6 ath11k: qmi: fix frame size warnings

-- 
https://patchwork.kernel.org/patch/10932359/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
