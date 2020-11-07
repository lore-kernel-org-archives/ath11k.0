Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJ8V-0007cz-7F
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 07:59:50 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Remove unnecessary data sync to cpu on monitor
 buffer
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1602744454-22969-1-git-send-email-vthiagar@codeaurora.org>
References: <1602744454-22969-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20201107075934.75936C433F0@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 07:59:34 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> Monitor ring Rx buffer is not really modified between dma map
> and unmap. So remove the unnecssary data sync before dma unmap.
> This does not fix any visible issue, found in code review.
> 
> Compile tested only.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bafdbd79aae4 ath11k: Remove unnecessary data sync to cpu on monitor buffer

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1602744454-22969-1-git-send-email-vthiagar@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
