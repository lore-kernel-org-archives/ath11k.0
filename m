Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9X-0002pb-R2
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:36 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 05/12] ath11k: Add bdf-addr in hw_params
Date: Tue, 16 Jun 2020 17:00:48 +0300
Message-Id: <1592316055-24958-6-git-send-email-kvalo@codeaurora.org>
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

bdf-addr is different for IPQ8074 and IPQ6018 so add it to hw_params.

No functional changes. Compile tested only.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 drivers/net/wireless/ath/ath11k/hw.h   | 2 ++
 drivers/net/wireless/ath/ath11k/qmi.c  | 6 +++---
 drivers/net/wireless/ath/ath11k/qmi.h  | 1 -
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 089b46ba86c5..5232a355ac12 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -27,6 +27,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
 		},
 		.max_radios = 3,
+		.bdf_addr = 0x4B0C0000,
 		.hw_ops = &ipq8074_ops,
 	},
 };
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 2fb986b9a6cb..78518e3f773d 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -112,6 +112,8 @@ struct ath11k_hw_params {
 	const char *name;
 	u16 hw_rev;
 	u8 max_radios;
+	u32 bdf_addr;
+
 	struct {
 		const char *dir;
 		size_t board_size;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index c00a99ad8dbc..e4198d3b0bae 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1681,8 +1681,8 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		switch (ab->qmi.target_mem[i].type) {
 		case BDF_MEM_REGION_TYPE:
-			ab->qmi.target_mem[idx].paddr = ATH11K_QMI_BDF_ADDRESS;
-			ab->qmi.target_mem[idx].vaddr = ATH11K_QMI_BDF_ADDRESS;
+			ab->qmi.target_mem[idx].paddr = ab->hw_params.bdf_addr;
+			ab->qmi.target_mem[idx].vaddr = ab->hw_params.bdf_addr;
 			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
 			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
 			idx++;
@@ -1854,7 +1854,7 @@ static int ath11k_qmi_load_bdf(struct ath11k_base *ab)
 		return -ENOMEM;
 	memset(&resp, 0, sizeof(resp));
 
-	bdf_addr = ioremap(ATH11K_QMI_BDF_ADDRESS, ATH11K_QMI_BDF_MAX_SIZE);
+	bdf_addr = ioremap(ab->hw_params.bdf_addr, ATH11K_QMI_BDF_MAX_SIZE);
 	if (!bdf_addr) {
 		ath11k_warn(ab, "qmi ioremap error for BDF\n");
 		ret = -EIO;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 3f7db642d869..a7a0a189cbe4 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -12,7 +12,6 @@
 #define ATH11K_HOST_VERSION_STRING		"WIN"
 #define ATH11K_QMI_WLANFW_TIMEOUT_MS		5000
 #define ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE	64
-#define ATH11K_QMI_BDF_ADDRESS			0x4B0C0000
 #define ATH11K_QMI_BDF_MAX_SIZE			(256 * 1024)
 #define ATH11K_QMI_CALDATA_OFFSET		(128 * 1024)
 #define ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
