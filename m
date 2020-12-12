Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwgX-0007Jk-Rk
 for ath11k@lists.infradead.org; Sat, 12 Dec 2020 04:39:15 +0000
MIME-Version: 1.0
Subject: Re: [RESEND PATCH] ath11k: use MHI provided APIs to allocate and free
 MHI controller
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1605634436-36506-1-git-send-email-bbhatt@codeaurora.org>
References: <1605634436-36506-1-git-send-email-bbhatt@codeaurora.org>
Message-Id: <20201212043858.9DDAAC43462@smtp.codeaurora.org>
Date: Sat, 12 Dec 2020 04:38:58 +0000 (UTC)
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
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org, ath11k@lists.infradead.org

Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:

> Use MHI provided APIs to allocate and free MHI controller to
> improve MHI host driver handling. This also fixes a memory leak
> as the MHI controller was allocated but never freed.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

57449b07eafc ath11k: use MHI provided APIs to allocate and free MHI controller

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1605634436-36506-1-git-send-email-bbhatt@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
