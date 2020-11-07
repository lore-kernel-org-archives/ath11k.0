Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJBO-0007sb-Ih
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:02:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Initialize complete alpha2 for regulatory change
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201021140555.4114715-1-sven@narfation.org>
References: <20201021140555.4114715-1-sven@narfation.org>
Message-Id: <20201107080241.CD848C433CB@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:02:41 +0000 (UTC)
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
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> wrote:

> The function ath11k_wmi_send_init_country_cmd is taking 3 byte from alpha2
> of the structure wmi_init_country_params. But the function
> ath11k_reg_notifier is only initializing 2 bytes. The third byte is
> therefore always an uninitialized value.
> 
> The command can happen to look like
> 
>   0c 00 87 02 01 00 00 00 00 00 00 00 43 41 f8 00
> 
> instead of
> 
>   0c 00 87 02 01 00 00 00 00 00 00 00 43 41 00 00
> 
> Tested-on: IPQ8074 hw2.0 WLAN.HK.2.1.0.1-01161-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> Tested-on: IPQ8074 hw2.0 WLAN.HK.2.4.0.1.r1-00019-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

383a32cde417 ath11k: Initialize complete alpha2 for regulatory change

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201021140555.4114715-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
