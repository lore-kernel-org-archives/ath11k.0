Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfT89-0003cZ-Dy
 for ath11k@lists.infradead.org; Sun, 31 May 2020 18:56:24 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH v4 6/8] ath11k: Add 6G scan dwell time parameter in scan
 request command
Date: Sun, 31 May 2020 11:55:58 -0700
Message-Id: <20200531185600.20789-7-pradeepc@codeaurora.org>
In-Reply-To: <20200531185600.20789-1-pradeepc@codeaurora.org>
References: <20200531185600.20789-1-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org

Add 6G scan active and passive dwell time parameter to scan request.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
 drivers/net/wireless/ath/ath11k/wmi.h | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index a6bbb3badd1f..239a336f55f4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1899,6 +1899,8 @@ void ath11k_wmi_start_scan_init(struct ath11k *ar,
 	arg->dwell_time_active = 50;
 	arg->dwell_time_active_2g = 0;
 	arg->dwell_time_passive = 150;
+	arg->dwell_time_active_6g = 40;
+	arg->dwell_time_passive_6g = 30;
 	arg->min_rest_time = 50;
 	arg->max_rest_time = 500;
 	arg->repeat_probe_time = 0;
@@ -2045,6 +2047,8 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	cmd->dwell_time_active = params->dwell_time_active;
 	cmd->dwell_time_active_2g = params->dwell_time_active_2g;
 	cmd->dwell_time_passive = params->dwell_time_passive;
+	cmd->dwell_time_active_6g = params->dwell_time_active_6g;
+	cmd->dwell_time_passive_6g = params->dwell_time_passive_6g;
 	cmd->min_rest_time = params->min_rest_time;
 	cmd->max_rest_time = params->max_rest_time;
 	cmd->repeat_probe_time = params->repeat_probe_time;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 76c2da2c5db7..4937d02839fc 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3061,6 +3061,9 @@ struct  wmi_start_scan_cmd {
 	u32 num_vendor_oui;
 	u32 scan_ctrl_flags_ext;
 	u32 dwell_time_active_2g;
+	u32 dwell_time_active_6g;
+	u32 dwell_time_passive_6g;
+	u32 scan_start_offset;
 } __packed;
 
 #define WMI_SCAN_FLAG_PASSIVE        0x1
@@ -3127,6 +3130,8 @@ struct scan_req_params {
 	u32 dwell_time_active;
 	u32 dwell_time_active_2g;
 	u32 dwell_time_passive;
+	u32 dwell_time_active_6g;
+	u32 dwell_time_passive_6g;
 	u32 min_rest_time;
 	u32 max_rest_time;
 	u32 repeat_probe_time;
-- 
2.17.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
