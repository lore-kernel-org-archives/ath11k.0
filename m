Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if7Zl-0001TW-Ka
 for ath11k@lists.infradead.org; Wed, 11 Dec 2019 19:23:11 +0000
Received: by mail-oi1-x241.google.com with SMTP id d62so14232107oia.11
 for <ath11k@lists.infradead.org>; Wed, 11 Dec 2019 11:23:09 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] ath11k: Remove unnecessary enum scan_priority
Date: Wed, 11 Dec 2019 12:22:52 -0700
Message-Id: <20191211192252.35024-1-natechancellor@gmail.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nathan Chancellor <natechancellor@gmail.com>, ath11k@lists.infradead.org

Clang warns:

drivers/net/wireless/ath/ath11k/wmi.c:1827:23: warning: implicit
conversion from enumeration type 'enum wmi_scan_priority' to different
enumeration type 'enum scan_priority' [-Wenum-conversion]
        arg->scan_priority = WMI_SCAN_PRIORITY_LOW;
                           ~ ^~~~~~~~~~~~~~~~~~~~~
1 warning generated.

wmi_scan_priority and scan_priority have the same values but the wmi one
has WMI prefixed to the names. Since that enum is already being used,
get rid of scan_priority and switch its one use to wmi_scan_priority to
fix this warning.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Link: https://github.com/ClangBuiltLinux/linux/issues/808
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 4a518d406bc5..756101656391 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2896,15 +2896,6 @@ struct wmi_bcn_offload_ctrl_cmd {
 	u32 bcn_ctrl_op;
 } __packed;
 
-enum scan_priority {
-	SCAN_PRIORITY_VERY_LOW,
-	SCAN_PRIORITY_LOW,
-	SCAN_PRIORITY_MEDIUM,
-	SCAN_PRIORITY_HIGH,
-	SCAN_PRIORITY_VERY_HIGH,
-	SCAN_PRIORITY_COUNT,
-};
-
 enum scan_dwelltime_adaptive_mode {
 	SCAN_DWELL_MODE_DEFAULT = 0,
 	SCAN_DWELL_MODE_CONSERVATIVE = 1,
@@ -3056,7 +3047,7 @@ struct scan_req_params {
 	u32 scan_req_id;
 	u32 vdev_id;
 	u32 pdev_id;
-	enum scan_priority scan_priority;
+	enum wmi_scan_priority scan_priority;
 	union {
 		struct {
 			u32 scan_ev_started:1,
-- 
2.24.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
