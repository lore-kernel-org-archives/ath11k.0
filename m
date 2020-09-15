Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIEJq-0007cE-Ob
 for ath11k@lists.infradead.org; Tue, 15 Sep 2020 17:00:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V6 2/2] ath11k: add support for setting fixed HE
 rate/gi/ltf
References: <20200804081630.2013619-1-john@phrozen.org>
 <20200804081630.2013619-2-john@phrozen.org>
Date: Tue, 15 Sep 2020 20:00:11 +0300
In-Reply-To: <20200804081630.2013619-2-john@phrozen.org> (John Crispin's
 message of "Tue, 4 Aug 2020 10:16:30 +0200")
Message-ID: <87zh5rkmas.fsf@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: Miles Hu <milehu@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> From: Miles Hu <milehu@codeaurora.org>
>
> This patch adds ath11k support for setting fixed HE rate/gi/ltf values that
> we are now able to send to the kernel using nl80211. The added code is
> reusing parts of the existing code path already used for HT/VHT. The new
> helpers are symmetric to how we do it for HT/VHT.
>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: John Crispin <john@phrozen.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -119,6 +119,22 @@ enum {
>  	WMI_HOST_WLAN_2G_5G_CAP	= 0x3,
>  };
>  
> +/* Parameters used for WMI_VDEV_PARAM_AUTORATE_MISC_CFG command.
> + * Used only for HE auto rate mode.
> + */
> +enum {
> +/* HE LTF related configuration */
> +	WMI_HE_AUTORATE_LTF_1X = (1 << 0),
> +	WMI_HE_AUTORATE_LTF_2X = (1 << 1),
> +	WMI_HE_AUTORATE_LTF_4X = (1 << 2),
> +
> +/* HE GI related configuration */
> +	WMI_AUTORATE_400NS_GI = (1 << 8),
> +	WMI_AUTORATE_800NS_GI = (1 << 9),
> +	WMI_AUTORATE_1600NS_GI = (1 << 10),
> +	WMI_AUTORATE_3200NS_GI = (1 << 11),
> +};

BIT()?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
