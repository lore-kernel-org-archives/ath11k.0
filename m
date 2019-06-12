Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hazAb-0005SX-UA
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 09:03:51 +0000
MIME-Version: 1.0
Date: Wed, 12 Jun 2019 14:33:46 +0530
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: Re: [PATCH] ath11k: Cleanup the access code of hw mac_id mapping
In-Reply-To: <87o933fcpe.fsf@kamboji.qca.qualcomm.com>
References: <1560159795-5931-1-git-send-email-periyasa@codeaurora.org>
 <87o933fcpe.fsf@kamboji.qca.qualcomm.com>
Message-ID: <71aab85285e9b78a1a56b33a219c7be1@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

> 
> I simplified this function to:
> 
> u8 ath11k_core_get_hw_mac_id(struct ath11k_base *ab, int pdev_idx)
> {
> 	switch (pdev_idx) {
> 	case 0:
> 		return 0;
> 	case 1:
> 		return 2;
> 	case 2:
> 		return 1;
> 	default:
> 		ath11k_warn(ab, "Invalid pdev idx %d\n", pdev_idx);
> 		return ATH11K_INVALID_HW_MAC_ID;
> 	}
> }

Look fine to me

Thanks,
Karthikeyan

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
