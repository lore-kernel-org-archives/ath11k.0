Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9Z-0002rw-AH
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 03/12] ath11k: define max_radios in hw_params
Date: Tue, 16 Jun 2020 17:00:46 +0300
Message-Id: <1592316055-24958-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
References: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Anilkumar Kolli <akolli@codeaurora.org>

IPQ6018 needs different value for max_radios so make it configurable via hw_params.

No functional changes. Compile tested only.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 drivers/net/wireless/ath/ath11k/htc.c   | 2 +-
 drivers/net/wireless/ath/ath11k/hw.h    | 1 +
 drivers/net/wireless/ath/ath11k/reg.c   | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.c   | 4 ++--
 6 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 92d7925ad0f4..67822508327c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -26,6 +26,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
 			.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
 		},
+		.max_radios = 3,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 791d971784ce..5680b99a4f5c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3820,7 +3820,7 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 	int total_num_buffs_reaped = 0;
 	int ret, i;
 
-	for (i = 0; i < MAX_RADIOS; i++)
+	for (i = 0; i < ab->num_radios; i++)
 		__skb_queue_head_init(&msdu_list[i]);
 
 	srng = &ab->hal.srng_list[dp->rx_rel_ring.ring_id];
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index ad13c648b679..bc0026c1e4a6 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -748,7 +748,7 @@ int ath11k_htc_init(struct ath11k_base *ab)
 		htc->wmi_ep_count = 3;
 		break;
 	default:
-		htc->wmi_ep_count = 3;
+		htc->wmi_ep_count = ab->hw_params.max_radios;
 		break;
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index f95ad31d3d6c..ba897d186cf5 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -107,6 +107,7 @@ enum ath11k_bus {
 struct ath11k_hw_params {
 	const char *name;
 	u16 hw_rev;
+	u8 max_radios;
 	struct {
 		const char *dir;
 		size_t board_size;
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 7c9dc91cc48a..0ba80e6f3979 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -699,7 +699,7 @@ void ath11k_reg_free(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < MAX_RADIOS; i++) {
+	for (i = 0; i < ab->hw_params.max_radios; i++) {
 		kfree(ab->default_regd[i]);
 		kfree(ab->new_regd[i]);
 	}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 8e3437a65673..cd1bdb2a75c9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6682,7 +6682,7 @@ int ath11k_wmi_connect(struct ath11k_base *ab)
 	u8 wmi_ep_count;
 
 	wmi_ep_count = ab->htc.wmi_ep_count;
-	if (wmi_ep_count > MAX_RADIOS)
+	if (wmi_ep_count > ab->hw_params.max_radios)
 		return -1;
 
 	for (i = 0; i < wmi_ep_count; i++)
@@ -6704,7 +6704,7 @@ int ath11k_wmi_pdev_attach(struct ath11k_base *ab,
 {
 	struct ath11k_pdev_wmi *wmi_handle;
 
-	if (pdev_id >= MAX_RADIOS)
+	if (pdev_id >= ab->hw_params.max_radios)
 		return -EINVAL;
 
 	wmi_handle = &ab->wmi_ab.wmi[pdev_id];
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
