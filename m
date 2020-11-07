Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJCv-0007sb-5U
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:04:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix single phy hw mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604511331-22477-1-git-send-email-periyasa@codeaurora.org>
References: <1604511331-22477-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20201107080420.4ACF8C433C8@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:04:20 +0000 (UTC)
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

> driver not able to bootup in the single radio configured board.
> single phy hw mode is converted to invalid hw mode and sent to FW
> through wmi init cmd. In that case driver is not receiving wmi
> ready event which leads to driver bootup fail. single phy hw mode
> is a valid for single radio configured board. so removed the
> conversion logic.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9fb13b81e145 ath11k: Fix single phy hw mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604511331-22477-1-git-send-email-periyasa@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
