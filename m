Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9n-0002d1-R3
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 11/12] ath11k: don't use defines in hw_params
Date: Tue, 16 Jun 2020 17:00:54 +0300
Message-Id: <1592316055-24958-12-git-send-email-kvalo@codeaurora.org>
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

These defines are not used anywhere else so to avoid extra indirection add the
values directly to hw_params.

No functional changes. Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 4 ++--
 drivers/net/wireless/ath/ath11k/hw.h   | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 84a566dffad9..38e830a2395b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -23,8 +23,8 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.name = "ipq8074 hw2.0",
 		.fw = {
 			.dir = "IPQ8074/hw2.0",
-			.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
-			.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
+			.board_size = 256 * 1024,
+			.cal_size = 256 * 1024,
 		},
 		.max_radios = 3,
 		.bdf_addr = 0x4B0C0000,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 828c8c076218..f31d53f6adb8 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -68,10 +68,6 @@
 
 #define ATH11K_FW_DIR			"ath11k"
 
-/* IPQ8074 definitions */
-#define IPQ8074_MAX_BOARD_DATA_SZ	(256 * 1024)
-#define IPQ8074_MAX_CAL_DATA_SZ		IPQ8074_MAX_BOARD_DATA_SZ
-
 #define ATH11K_BOARD_MAGIC		"QCA-ATH11K-BOARD"
 #define ATH11K_BOARD_API2_FILE		"board-2.bin"
 #define ATH11K_DEFAULT_BOARD_FILE	"board.bin"
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
