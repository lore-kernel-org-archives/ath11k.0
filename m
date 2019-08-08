Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4t-0008Jy-D4
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:37 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 15/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 wmi.h
Date: Thu,  8 Aug 2019 18:33:12 +0530
Message-Id: <1565269392-2838-16-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in wmi.h file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index f1930339e633..ff31aa7d8058 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4553,7 +4553,7 @@ struct target_resource_config {
 #define WMI_SEND_TIMEOUT_HZ (3 * HZ)
 
 struct ath11k_wmi_base {
-	struct ath11k_base *sc;
+	struct ath11k_base *ab;
 	struct ath11k_pdev_wmi wmi[MAX_RADIOS];
 	enum ath11k_htc_ep_id wmi_endpoint_id[MAX_RADIOS];
 	u32 max_msg_len[MAX_RADIOS];
@@ -4591,14 +4591,14 @@ int ath11k_wmi_set_peer_param(struct ath11k *ar, const u8 *peer_addr,
 			      u32 vdev_id, u32 param_id, u32 param_val);
 int ath11k_wmi_pdev_set_param(struct ath11k *ar, u32 param_id,
 			      u32 param_value, u8 pdev_id);
-int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *sc);
-int ath11k_wmi_cmd_init(struct ath11k_base *sc);
-int ath11k_wmi_wait_for_service_ready(struct ath11k_base *sc);
-int ath11k_wmi_connect(struct ath11k_base *sc);
-int ath11k_wmi_pdev_attach(struct ath11k_base *sc,
+int ath11k_wmi_wait_for_unified_ready(struct ath11k_base *ab);
+int ath11k_wmi_cmd_init(struct ath11k_base *ab);
+int ath11k_wmi_wait_for_service_ready(struct ath11k_base *ab);
+int ath11k_wmi_connect(struct ath11k_base *ab);
+int ath11k_wmi_pdev_attach(struct ath11k_base *ab,
 			   u8 pdev_id);
-int ath11k_wmi_attach(struct ath11k_base *sc);
-void ath11k_wmi_detach(struct ath11k_base *sc);
+int ath11k_wmi_attach(struct ath11k_base *ab);
+void ath11k_wmi_detach(struct ath11k_base *ab);
 int ath11k_wmi_vdev_create(struct ath11k *ar, u8 *macaddr,
 			   struct vdev_create_params *param);
 int ath11k_wmi_peer_rx_reorder_queue_setup(struct ath11k *ar, int vdev_id,
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
