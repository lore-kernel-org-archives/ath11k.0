Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg9gl-0006dP-FH
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 15:18:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/4] ath11k: Remove prototype interface
Date: Wed, 26 Jun 2019 18:18:13 +0300
Message-Id: <1561562295-17402-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1561562295-17402-1-git-send-email-kvalo@codeaurora.org>
References: <1561562295-17402-1-git-send-email-kvalo@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

From: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Remove prototype interfaces which we don't support
any of these prototype interfaces in upstream.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index e6566f7e6b66..7d933eafd3cd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1936,7 +1936,6 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_PER_VDEV_CHAINMASK_CONFIG_SUPPORT = 173,
 	WMI_TLV_SERVICE_TX_DATA_MGMT_ACK_RSSI = 174,
 	WMI_TLV_SERVICE_NAN_DISABLE_SUPPORT = 175,
-	WMI_TLV_SERVICE_NAN_DISABLE_SUPPORT__prototype = WMI_TLV_SERVICE_NAN_DISABLE_SUPPORT,
 	WMI_TLV_SERVICE_HTT_H2T_NO_HTC_HDR_LEN_IN_MSG_LEN = 176,
 
 	WMI_MAX_EXT_SERVICE
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
