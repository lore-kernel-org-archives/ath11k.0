Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNBL2-0002Gr-Eo
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 08:50:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: remove auto_start from channel config struct
References: <20200928101420.18745-1-manivannan.sadhasivam@linaro.org>
Date: Tue, 29 Sep 2020 11:50:12 +0300
In-Reply-To: <20200928101420.18745-1-manivannan.sadhasivam@linaro.org>
 (Manivannan Sadhasivam's message of "Mon, 28 Sep 2020 15:44:20 +0530")
Message-ID: <87k0wddl17.fsf@codeaurora.org>
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
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: sfr@canb.auug.org.au, govinds@codeaurora.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, davem@davemloft.net

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> Recent change in MHI bus removed the option to auto start the channels
> during MHI driver probe. The channel will only be started when the MHI
> client driver like QRTR gets probed. So, remove the option from ath11k
> channel config struct.
>
> Fixes: 1399fb87ea3e ("ath11k: register MHI controller device for QCA6390")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

In the future please cc linux-wireless so that patchwork sees the patch.
I'll resend this as v2 and add the cc.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
