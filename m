Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQhzT-0008OZ-Rj
 for ath11k@lists.infradead.org; Fri, 09 Oct 2020 02:18:42 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH 2/4] ath11k: fix incorrect wmi param for configuring HE
 operation
Date: Thu,  8 Oct 2020 19:18:09 -0700
Message-Id: <20201009021811.18584-3-pradeepc@codeaurora.org>
In-Reply-To: <20201009021811.18584-1-pradeepc@codeaurora.org>
References: <20201009021811.18584-1-pradeepc@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

WMI_VDEV_PARAM_TX_OFDMA_CPLEN has been added with incorrect enum
value. Fix the enum to represent WMI param for configuring HE
operation field.

This is applicable to firmwares under
https://github.com/kvalo/ath11k-firmware/tree/master/IPQ8074/hw2.0
https://github.com/kvalo/ath11k-firmware/tree/master/IPQ6018/hw1.0
https://github.com/kvalo/ath11k-firmware/tree/master/QCN9074/hw1.0

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 5a32ba0eb4f5..55b1a5db206a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1032,7 +1032,7 @@ enum wmi_tlv_vdev_param {
 	WMI_VDEV_PARAM_PROTOTYPE = 0x8000,
 	WMI_VDEV_PARAM_BSS_COLOR,
 	WMI_VDEV_PARAM_SET_HEMU_MODE,
-	WMI_VDEV_PARAM_TX_OFDMA_CPLEN,
+	WMI_VDEV_PARAM_HEOPS_0_31 = 0x8003,
 };
 
 enum wmi_tlv_peer_flags {
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
