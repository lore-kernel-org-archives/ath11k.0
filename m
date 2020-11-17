Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kevCn-00023L-3G
 for ath11k@lists.infradead.org; Tue, 17 Nov 2020 07:15:10 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: use MHI provided APIs to allocate and free MHI
 controller
References: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org>
Date: Tue, 17 Nov 2020 09:14:58 +0200
In-Reply-To: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org> (Bhaumik
 Bhatt's message of "Mon, 16 Nov 2020 16:01:40 -0800")
Message-ID: <87tutozc7h.fsf@codeaurora.org>
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
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: jhugo@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org, ath11k@lists.infradead.org

Bhaumik Bhatt <bbhatt@codeaurora.org> writes:

> Use MHI provided APIs to allocate and free MHI controller to
> improve MHI host driver handling.

How does it improve the handling?

> This also fixes a memory leak as the MHI controller was allocated but
> never freed.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

For ath11k patches please CC ath11k and linux-wireless lists so that
patchwork sees it. So you need to resend this.

Is this a new API? I need to understand if there are any dependencies
between mhi and ath trees, or if I can apply this directly to my ath.git
tree.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
