Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJE2-00088B-GQ
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:05:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix the hal descriptor mask
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604511921-24840-1-git-send-email-periyasa@codeaurora.org>
References: <1604511921-24840-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20201107080519.262FCC433CB@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:05:19 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> Below listed hal descriptor mask are incorrect, so modify it to correct one
>  - CE destination status description meta info mask is increased from
>    8 bits to 16 bits from the 0th bit position
>  - Rx Reo queue duplicate count mask is decreased from 22 bits to 16 bits
>  - Reo threshold status counter sum mask is increased from 24 bits to 26 bits
> 
> No functionality impact, these descriptors are currently not used in any
> supported platform. But in future if someone referred these descriptor then
> ended with wrong values.
> 
> Found this during code review.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ab041d060ee6 ath11k: Fix the hal descriptor mask

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604511921-24840-1-git-send-email-periyasa@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
