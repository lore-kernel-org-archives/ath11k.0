Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJEA-0000RF-Q4
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 17:15:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/8] ath11k: support loading ELF board files
Date: Tue, 29 Sep 2020 20:15:29 +0300
Message-Id: <1601399736-3210-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
References: <1601399736-3210-1-git-send-email-kvalo@codeaurora.org>
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

From: Ben Greear <greearb@candelatech.com>

The QCA6390 board I have, model 8291M-PR comes with an ELF board file.  To get
this to at least somewhat work, I renamed bdwlan.e04 to 'board.bin' and then
added this patch to check for ELF magic string in the beginning of the file.
If that is found, use type ELF.  After this the driver loads.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Ben Greear <greearb@candelatech.com>
[kvalo@codeaurora.org: use elf.h, minor cleanup]
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b906b50ee57e..9144f28b37d1 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/elf.h>
+
 #include "qmi.h"
 #include "core.h"
 #include "debug.h"
@@ -1990,6 +1992,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 	struct qmi_txn txn = {};
 	int ret;
 	const u8 *temp;
+	int bdf_type;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
@@ -2006,6 +2009,13 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 	temp = bd.data;
 	remaining = bd.len;
 
+	if (bd.len >= SELFMAG && memcmp(bd.data, ELFMAG, SELFMAG) == 0)
+		bdf_type = ATH11K_QMI_BDF_TYPE_ELF;
+	else
+		bdf_type = ATH11K_QMI_BDF_TYPE_BIN;
+
+	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
+
 	while (remaining) {
 		req->valid = 1;
 		req->file_id_valid = 1;
@@ -2015,7 +2025,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 		req->seg_id_valid = 1;
 		req->data_valid = 1;
 		req->data_len = ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE;
-		req->bdf_type = ATH11K_QMI_BDF_TYPE_BIN;
+		req->bdf_type = bdf_type;
 		req->bdf_type_valid = 1;
 		req->end_valid = 1;
 		req->end = 0;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
