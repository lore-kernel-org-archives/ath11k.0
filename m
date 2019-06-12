Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hayIr-0003Kq-Er
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 08:08:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Cleanup the access code of hw mac_id mapping
References: <1560159795-5931-1-git-send-email-periyasa@codeaurora.org>
Date: Wed, 12 Jun 2019 11:08:13 +0300
In-Reply-To: <1560159795-5931-1-git-send-email-periyasa@codeaurora.org>
 (Karthikeyan Periyasamy's message of "Mon, 10 Jun 2019 15:13:15
 +0530")
Message-ID: <87o933fcpe.fsf@kamboji.qca.qualcomm.com>
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> writes:

> Added separate function call to get the hw mac id from the pdev index.
>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

[...]

> +/* Map from pdev index to hw mac index */
> +u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx)
> +{
> +	u8 mac_id;
> +
> +	switch (pdev_idx) {
> +	case 0:
> +		mac_id = 0;
> +		break;
> +	case 1:
> +		mac_id = 2;
> +		break;
> +	case 2:
> +		mac_id = 1;
> +		break;
> +	default:
> +		mac_id = ATH11K_INVALID_HW_MAC_ID;
> +		ath11k_warn(ab, "Invalid pdev idx %d\n", pdev_idx);
> +		break;
> +	}
> +	return mac_id;
> +}

I simplified this function to:

u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx)
{
	switch (pdev_idx) {
	case 0:
		return 0;
	case 1:
		return 2;
	case 2:
		return 1;
	default:
		ath11k_warn(ab, "Invalid pdev idx %d\n", pdev_idx);
		return ATH11K_INVALID_HW_MAC_ID;
	}
}

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
