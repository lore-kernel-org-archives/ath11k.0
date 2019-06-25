Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfcpx-0003Em-5v
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 04:13:42 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH 1/5] ath11k: fix variable name warnings
Date: Tue, 25 Jun 2019 09:43:15 +0530
Message-Id: <1561435999-28316-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/wmi.h:2728: <BK_Minfree>
drivers/net/wireless/ath/ath11k/wmi.h:2729: <BE_Minfree>
drivers/net/wireless/ath/ath11k/wmi.h:2730: <VI_Minfree>
drivers/net/wireless/ath/ath11k/wmi.h:2731: <VO_Minfree>
drivers/net/wireless/ath/ath11k/wmi.h:2965: <bcn_txPower>

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4e92bf0..779209a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2725,10 +2725,10 @@ struct wmi_resource_config {
 	u32 num_ocb_schedules;
 	u32 flag1;
 	u32 smart_ant_cap;
-	u32 BK_Minfree;
-	u32 BE_Minfree;
-	u32 VI_Minfree;
-	u32 VO_Minfree;
+	u32 bk_minfree;
+	u32 be_minfree;
+	u32 vi_minfree;
+	u32 vo_minfree;
 	u32 alloc_frag_desc_for_data_pkt;
 	u32 num_ns_ext_tuples_cfg;
 	u32 bpf_instruction_size;
@@ -2962,7 +2962,7 @@ struct wmi_vdev_start_request_cmd {
 	u32 flags;
 	struct wmi_ssid ssid;
 	u32 bcn_tx_rate;
-	u32 bcn_txPower;
+	u32 bcn_txpower;
 	u32 num_noa_descriptors;
 	u32 disable_hw_ack;
 	u32 preferred_tx_streams;
@@ -5122,10 +5122,10 @@ struct target_resource_config {
 	u32 max_frag_entries;
 	u32 max_peer_ext_stats;
 	u32 smart_ant_cap;
-	u32 BK_Minfree;
-	u32 BE_Minfree;
-	u32 VI_Minfree;
-	u32 VO_Minfree;
+	u32 bk_minfree;
+	u32 be_minfree;
+	u32 vi_minfree;
+	u32 vo_minfree;
 	u32 rx_batchmode;
 	u32 tt_support;
 	u32 atf_config;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
