Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMsr-0000aC-Ql
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 17:47:47 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix wmi init configuration
Date: Wed,  4 Nov 2020 23:17:00 +0530
Message-Id: <1604512020-25197-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>, linux-wireless@vger.kernel.org

Assign the correct hw_op ath11k_init_wmi_config_ipq8074 to
the hw IPQ8074. Also update the correct TWT radio count.
Incorrect TWT radio count cause TWT feature fails on radio2
because physical device count is hardcoded to 2. so set
the value dynamically.

Found this during code review.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Fixes: 2d4bcbed5b7d53e1 ("ath11k: initialize wmi config based on hw_params")
Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 11a411b..66331da 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -127,7 +127,7 @@ static void ath11k_init_wmi_config_ipq8074(struct ath11k_base *ab,
 	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
 	config->rx_batchmode = TARGET_RX_BATCHMODE;
 	config->peer_map_unmap_v2_support = 1;
-	config->twt_ap_pdev_count = 2;
+	config->twt_ap_pdev_count = ab->num_radios;
 	config->twt_ap_sta_count = 1000;
 }
 
@@ -157,7 +157,7 @@ static int ath11k_hw_mac_id_to_srng_id_qca6390(struct ath11k_hw_params *hw,
 
 const struct ath11k_hw_ops ipq8074_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
-	.wmi_init_config = ath11k_init_wmi_config_qca6390,
+	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
 	.mac_id_to_pdev_id = ath11k_hw_mac_id_to_pdev_id_ipq8074,
 	.mac_id_to_srng_id = ath11k_hw_mac_id_to_srng_id_ipq8074,
 };
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
