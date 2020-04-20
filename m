Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQVGH-0000ws-7G
 for ath11k@lists.infradead.org; Mon, 20 Apr 2020 12:10:54 +0000
From: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] ath11k: remove conversion to bool in
 ath11k_dp_rxdesc_mpdu_valid()
Date: Mon, 20 Apr 2020 20:37:18 +0800
Message-ID: <20200420123718.3384-1-yanaijie@huawei.com>
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
To: kvalo@codeaurora.org, davem@davemloft.net, srirrama@codeaurora.org, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Yan <yanaijie@huawei.com>

The '==' expression itself is bool, no need to convert it to bool again.
This fixes the following coccicheck warning:

drivers/net/wireless/ath/ath11k/dp_rx.c:255:46-51: WARNING: conversion
to bool not needed here

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 203fd44ff352..bbd7da48518f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -252,7 +252,7 @@ static bool ath11k_dp_rxdesc_mpdu_valid(struct hal_rx_desc *rx_desc)
 	tlv_tag = FIELD_GET(HAL_TLV_HDR_TAG,
 			    __le32_to_cpu(rx_desc->mpdu_start_tag));
 
-	return tlv_tag == HAL_RX_MPDU_START ? true : false;
+	return tlv_tag == HAL_RX_MPDU_START;
 }
 
 static u32 ath11k_dp_rxdesc_get_ppduid(struct hal_rx_desc *rx_desc)
-- 
2.21.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
