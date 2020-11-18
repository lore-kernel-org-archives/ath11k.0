Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfSHe-0001oM-E5
 for ath11k@lists.infradead.org; Wed, 18 Nov 2020 18:34:23 +0000
Subject: Re: [PATCH] net: qrtr: Unprepare MHI channels during remove
References: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <5e94c0be-9402-7309-5d65-857a27d1f491@codeaurora.org>
Date: Wed, 18 Nov 2020 11:34:17 -0700
MIME-Version: 1.0
In-Reply-To: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
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
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org, cjhuang@codeaurora.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org, netdev@vger.kernel.org, hemantk@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

On 11/18/2020 11:20 AM, Bhaumik Bhatt wrote:
> Reset MHI device channels when driver remove is called due to
> module unload or any crash scenario. This will make sure that
> MHI channels no longer remain enabled for transfers since the
> MHI stack does not take care of this anymore after the auto-start
> channels feature was removed.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   net/qrtr/mhi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 7100f0b..2bf2b19 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -104,6 +104,7 @@ static void qcom_mhi_qrtr_remove(struct mhi_device *mhi_dev)
>   	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
>   
>   	qrtr_endpoint_unregister(&qdev->ep);
> +	mhi_unprepare_from_transfer(mhi_dev);
>   	dev_set_drvdata(&mhi_dev->dev, NULL);
>   }
>   
> 

I admit, I didn't pay much attention to the auto-start being removed, 
but this seems odd to me.

As a client, the MHI device is being removed, likely because of some 
factor outside of my control, but I still need to clean it up?  This 
really feels like something MHI should be handling.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
