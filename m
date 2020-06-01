Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jft8u-0002aG-Rn
 for ath11k@lists.infradead.org; Mon, 01 Jun 2020 22:42:58 +0000
MIME-Version: 1.0
Date: Mon, 01 Jun 2020 15:42:29 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v3 11/11] ath11k: build HE 6 GHz capability
In-Reply-To: <1589399105-25472-11-git-send-email-rmanohar@codeaurora.org>
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-11-git-send-email-rmanohar@codeaurora.org>
Message-ID: <21cc960760e4b3c3c4723fa6d03260c7@codeaurora.org>
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
To: johannes@sipsolutions.net, kvalo@codeaurora.org
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-05-13 12:45, Rajkumar Manoharan wrote:
> Build 6 GHz band capability from HT and VHT capabilities reported
> by firmware.
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.h |  1 +
>  drivers/net/wireless/ath/ath11k/mac.c  | 34 
> ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
Kalle,

Please drop this patch as it needs to be reworked on top of latest 
mac80211 series.
Will submit ath11k patch again as the rest of the series were handled by 
Johannes.

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
