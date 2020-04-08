Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMEhq-00074g-7b
 for ath11k@lists.infradead.org; Wed, 08 Apr 2020 17:41:45 +0000
From: Aloka Dixit <alokad@codeaurora.org>
Subject: [PATCH] ath11k: Fix TWT radio count
Date: Wed,  8 Apr 2020 10:41:17 -0700
Message-Id: <20200408174117.22957-1-alokad@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: Aloka Dixit <alokad@codeaurora.org>, linux-wireless@vger.kernel.org

TWT feature fails on radio2 because physical device count is
hardcoded to 2. Set value dynamically.

Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 973b72a0ca69..c2a972377687 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3245,7 +3245,7 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 	config.beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
 	config.rx_batchmode = TARGET_RX_BATCHMODE;
 	config.peer_map_unmap_v2_support = 1;
-	config.twt_ap_pdev_count = 2;
+	config.twt_ap_pdev_count = ab->num_radios;
 	config.twt_ap_sta_count = 1000;
 
 	memcpy(&wmi_sc->wlan_resource_config, &config, sizeof(config));
-- 
2.25.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
