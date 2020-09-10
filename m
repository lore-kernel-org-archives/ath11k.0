Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGOz7-0007RU-Db
 for ath11k@lists.infradead.org; Thu, 10 Sep 2020 15:59:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v7 3/3] ath11k: add ipq6018 support
References: <1599551717-3801-1-git-send-email-akolli@codeaurora.org>
 <010101746cb68afd-6bca691b-12eb-40bd-bf2d-f22769b756ed-000000@us-west-2.amazonses.com>
Date: Thu, 10 Sep 2020 15:59:38 +0000
In-Reply-To: <010101746cb68afd-6bca691b-12eb-40bd-bf2d-f22769b756ed-000000@us-west-2.amazonses.com>
 (Anilkumar Kolli's message of "Tue, 8 Sep 2020 07:55:36 +0000")
Message-ID: <0101017478be6788-cb76bdf2-cdeb-424a-a17e-09a3135b028e-000000@us-west-2.amazonses.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> IPQ6018 has one 5G and one 2G radio with 2x2,
> shares ipq8074 configurations.
>
> Tested on: IPQ6018 hw1.0 AHB WLAN.HK.2.2-02134-QCAHKSWPL_SILICONZ-1
> Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -90,6 +90,7 @@ struct ath11k_skb_rxcb {
>  
>  enum ath11k_hw_rev {
>  	ATH11K_HW_IPQ8074,
> +	ATH11K_HW_IPQ6018,
>  	ATH11K_HW_QCA6390_HW20,
>  };

In the pending branch I changed this to:

enum ath11k_hw_rev {
	ATH11K_HW_IPQ8074,
	ATH11K_HW_QCA6390_HW20,
	ATH11K_HW_IPQ6018_HW10,
};

Also ATH11K_HW_IPQ8074 should be renamed to ATH11K_HW_IPQ8074_HW20, but
in a separate patch later.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
