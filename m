Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmtX8-0000gB-F0
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 07:05:07 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] ath11k: fix incorrect wmi param for configuring HE
 operation
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201020183111.25458-3-pradeepc@codeaurora.org>
References: <20201020183111.25458-3-pradeepc@codeaurora.org>
Message-Id: <20201209070503.612FFC433ED@smtp.codeaurora.org>
Date: Wed,  9 Dec 2020 07:05:03 +0000 (UTC)
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> WMI_VDEV_PARAM_TX_OFDMA_CPLEN has been added with incorrect enum
> value. Fix the enum to represent WMI param for configuring HE
> operation field.
> 
> This is applicable to firmwares under
> https://github.com/kvalo/ath11k-firmware/tree/master/IPQ8074/hw2.0
> https://github.com/kvalo/ath11k-firmware/tree/master/IPQ6018/hw1.0
> https://github.com/kvalo/ath11k-firmware/tree/master/QCN9074/hw1.0
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

f00490432b60 ath11k: fix incorrect wmi param for configuring HE operation
bd88815060d9 ath11k: support TXOP duration based RTS threshold
743b9065fe63 ath11k: mesh: add support for 256 bitmap in blockack frames in 11ax

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201020183111.25458-3-pradeepc@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
