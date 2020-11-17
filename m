Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kernc-0006PC-VJ
 for ath11k@lists.infradead.org; Tue, 17 Nov 2020 03:36:58 +0000
Received: by mail-pg1-x544.google.com with SMTP id i13so15107771pgm.9
 for <ath11k@lists.infradead.org>; Mon, 16 Nov 2020 19:36:56 -0800 (PST)
Date: Tue, 17 Nov 2020 09:06:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] ath11k: use MHI provided APIs to allocate and free MHI
 controller
Message-ID: <20201117033648.GA7787@work>
References: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605571300-4438-1-git-send-email-bbhatt@codeaurora.org>
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
Cc: jhugo@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, hemantk@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

+ath11k list

On Mon, Nov 16, 2020 at 04:01:40PM -0800, Bhaumik Bhatt wrote:
> Use MHI provided APIs to allocate and free MHI controller to
> improve MHI host driver handling. This also fixes a memory leak
> as the MHI controller was allocated but never freed.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index aded9a7..1c9d9dc 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -218,7 +218,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	struct mhi_controller *mhi_ctrl;
>  	int ret;
>  
> -	mhi_ctrl = kzalloc(sizeof(*mhi_ctrl), GFP_KERNEL);
> +	mhi_ctrl = mhi_alloc_controller();
>  	if (!mhi_ctrl)
>  		return -ENOMEM;
>  
> @@ -234,7 +234,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	ret = ath11k_mhi_get_msi(ab_pci);
>  	if (ret) {
>  		ath11k_err(ab, "failed to get msi for mhi\n");
> -		kfree(mhi_ctrl);
> +		mhi_free_controller(mhi_ctrl);
>  		return ret;
>  	}
>  
> @@ -252,7 +252,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	ret = mhi_register_controller(mhi_ctrl, &ath11k_mhi_config);
>  	if (ret) {
>  		ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
> -		kfree(mhi_ctrl);
> +		mhi_free_controller(mhi_ctrl);
>  		return ret;
>  	}
>  
> @@ -265,6 +265,7 @@ void ath11k_mhi_unregister(struct ath11k_pci *ab_pci)
>  
>  	mhi_unregister_controller(mhi_ctrl);
>  	kfree(mhi_ctrl->irq);
> +	mhi_free_controller(mhi_ctrl);
>  }
>  
>  static char *ath11k_mhi_state_to_str(enum ath11k_mhi_state mhi_state)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
