Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO4ER-0003mu-8t
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 19:27:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: remove auto_start from channel config struct
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1601369799-22328-1-git-send-email-kvalo@codeaurora.org>
References: <1601369799-22328-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20201001192659.EAB62C433F1@smtp.codeaurora.org>
Date: Thu,  1 Oct 2020 19:26:59 +0000 (UTC)
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
Cc: sfr@canb.auug.org.au, govinds@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, manivannan.sadhasivam@linaro.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Recent change in MHI bus removed the option to auto start the channels
> during MHI driver probe. The channel will only be started when the MHI
> client driver like QRTR gets probed. So, remove the option from ath11k
> channel config struct.
> 
> Fixes: 1399fb87ea3e ("ath11k: register MHI controller device for QCA6390")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

To avoid breaking ath11k we decided to postpone this change after the
merge window, it's a lot easier to deal at that time.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11805307/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
