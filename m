Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiWQL-0001ev-GK
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 05:03:47 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 5/8] ath11k: define max_radios in hw_params
Date: Tue,  9 Jun 2020 10:33:10 +0530
Message-Id: <1591678993-11016-6-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1591678993-11016-1-git-send-email-akolli@codeaurora.org>
References: <1591678993-11016-1-git-send-email-akolli@codeaurora.org>
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

Define max_radios supported in hw_params.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c  | 2 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 drivers/net/wireless/ath/ath11k/htc.c   | 2 +-
 drivers/net/wireless/ath/ath11k/hw.h    | 1 +
 drivers/net/wireless/ath/ath11k/reg.c   | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.c   | 4 ++--
 6 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index abe9edb56309..115db4c21e70 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -26,6 +26,7 @@ static const struct ath11k_hw_params ath11k_hw_params_list[] = {
 			.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
 			.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
 		},
+		.max_radios = 3,
 	},
 	{
 		.dev_id = ATH11K_HW_IPQ6018,
@@ -35,6 +36,7 @@ static const struct ath11k_hw_params ath11k_hw_params_list[] = {
 			.board_size = IPQ6018_MAX_BOARD_DATA_SZ,
 			.cal_size =  IPQ6018_MAX_CAL_DATA_SZ,
 		},
+		.max_radios = 2,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index a54610d75c40..57aee0d9a124 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3792,7 +3792,7 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
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
index e66f0e0138c4..d1a08d529988 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -112,6 +112,7 @@ enum ath11k_bus {
 struct ath11k_hw_params {
 	const char *name;
 	u16 dev_id;
+	u8 max_radios;
 	struct {
 		const char *dir;
 		size_t board_size;
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 453aa9c06969..831f11d1b42e 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -695,7 +695,7 @@ void ath11k_reg_free(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < MAX_RADIOS; i++) {
+	for (i = 0; i < ab->hw_params.max_radios; i++) {
 		kfree(ab->default_regd[i]);
 		kfree(ab->new_regd[i]);
 	}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c2a972377687..5324782c355b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6152,7 +6152,7 @@ int ath11k_wmi_connect(struct ath11k_base *ab)
 	u8 wmi_ep_count;
 
 	wmi_ep_count = ab->htc.wmi_ep_count;
-	if (wmi_ep_count > MAX_RADIOS)
+	if (wmi_ep_count > ab->hw_params.max_radios)
 		return -1;
 
 	for (i = 0; i < wmi_ep_count; i++)
@@ -6174,7 +6174,7 @@ int ath11k_wmi_pdev_attach(struct ath11k_base *ab,
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
