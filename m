Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFENX-0004S3-V9
 for ath11k@lists.infradead.org; Mon, 07 Sep 2020 10:28:05 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH -next] ath11k: Add checked value for ath11k_ahb_remove
References: <20200621095136.7xdbzkthoxuw2qow@debian.debian-2>
Date: Mon, 7 Sep 2020 10:28:01 +0000
In-Reply-To: <20200621095136.7xdbzkthoxuw2qow@debian.debian-2> (Bo YU's
 message of "Sun, 21 Jun 2020 17:51:40 +0800")
Message-ID: <01010174681bb751-308defb0-0333-43ee-99ef-7f1d1ee3358b-000000@us-west-2.amazonses.com>
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
To: Bo YU <tsu.yubo@gmail.com>
Cc: rmanohar@codeaurora.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

+ rajkumar

Bo YU <tsu.yubo@gmail.com> writes:

> Return value form wait_for_completion_timeout should to be checked.
>
> This is detected by Coverity,#CID:1464479 (CHECKED_RETURN)
>
> FIXES: d5c65159f2895(ath11k: driver for Qualcomm IEEE 802.11ax devices)

This should be

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

But I can fix that.

> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -981,12 +981,16 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
> static int ath11k_ahb_remove(struct platform_device *pdev)
> {
> 	struct ath11k_base *ab = platform_get_drvdata(pdev);
> -
> +	int ret = 0;
> 	reinit_completion(&ab->driver_recovery);
>
> 	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags))
> -		wait_for_completion_timeout(&ab->driver_recovery,
> -					    ATH11K_AHB_RECOVERY_TIMEOUT);
> +		if (!wait_for_completion_timeout(&ab->driver_recovery,
> +						 ATH11K_AHB_RECOVERY_TIMEOUT)) {
> +			ath11k_warn(ab, "fail to receive recovery response completion.\n");
> +			ret = -ETIMEDOUT;
> +		}

This is a good find. Rajkumar, can you take a look if this is ok?

>
> 	set_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags);
> 	cancel_work_sync(&ab->restart_work);
> @@ -999,7 +1003,7 @@ static int ath11k_ahb_remove(struct platform_device *pdev)
> 	ath11k_core_free(ab);
> 	platform_set_drvdata(pdev, NULL);
>
> -	return 0;
> +	return ret;
> }

Especially I wonder what happens if ath11k_ahb_remove() returns an
error. Should we just print a warning and return 0 instead?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
