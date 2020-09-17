Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvgQ-0003ZS-BC
 for ath11k@lists.infradead.org; Thu, 17 Sep 2020 15:18:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCHv2] ath11k: add raw mode and software crypto support
References: <010101746c6a54fa-91406158-3f0a-4f10-8328-a7f560dd3feb-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2020 18:18:22 +0300
In-Reply-To: <010101746c6a54fa-91406158-3f0a-4f10-8328-a7f560dd3feb-000000@us-west-2.amazonses.com>
 (Venkateswara Naralasetty's message of "Tue, 8 Sep 2020 06:32:22
 +0000")
Message-ID: <871rj0h1oh.fsf@codeaurora.org>
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> writes:

> Adding raw mode tx/rx support. Also, adding support
> for software crypto which depends on raw mode.
>
> To enable raw mode tx/rx:
> insmod ath11k.ko frame_mode=0
>
> To enable software crypto:
> insmod ath11k.ko crypto_mode=1
>
> These modes could be helpful in debugging crypto related issues.
>
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -3366,6 +3366,10 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
>  	config.rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
>  	config.rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
>  	config.rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
> +
> +	if (test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
> +		config.rx_decap_mode = TARGET_DECAP_MODE_RAW;

Did you test this at all? Because to me it looks like in
ath11k_init_wmi_config_ipq8074() this is overwritten with:

	config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;

So I can't see how this would even work. I noticed this while I was
cleaning up ath11k_wmi_cmd_init(). I'll send a patch soon, please test
that and let me know if it works.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
