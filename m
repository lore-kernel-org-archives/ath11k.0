Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ickbJ-0000aw-2Y
 for ath11k@lists.infradead.org; Thu, 05 Dec 2019 06:26:58 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 1/2] ath11k: add some missing __packed qualifiers
Date: Thu,  5 Dec 2019 07:26:44 +0100
Message-Id: <20191205062645.6033-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

A few of the WMI parameter structs were missing this.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 0d7caa1e4d75..7a1ed73d8b7b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4562,12 +4562,12 @@ struct wmi_twt_enable_params_cmd {
 	u32 mode_check_interval;
 	u32 add_sta_slot_interval;
 	u32 remove_sta_slot_interval;
-};
+} __packed;
 
 struct wmi_twt_disable_params_cmd {
 	u32 tlv_header;
 	u32 pdev_id;
-};
+} __packed;
 
 enum WMI_HOST_TWT_COMMAND {
 	WMI_HOST_TWT_COMMAND_REQUEST_TWT = 0,
@@ -4682,7 +4682,7 @@ struct wmi_obss_spatial_reuse_params_cmd {
 	s32 obss_min;
 	s32 obss_max;
 	u32 vdev_id;
-};
+} __packed;
 
 struct target_resource_config {
 	u32 num_vdevs;
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
