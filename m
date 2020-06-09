Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiWQT-0001h7-Mo
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 05:03:56 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 2/8] ath11k: rename default board file
Date: Tue,  9 Jun 2020 10:33:07 +0530
Message-Id: <1591678993-11016-3-git-send-email-akolli@codeaurora.org>
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

Rename default BDF to make it consistent with board-2.bin naming.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 6e065c4e5935..f7f070af233c 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -75,7 +75,7 @@
 
 #define ATH11K_BOARD_MAGIC		"QCA-ATH11K-BOARD"
 #define ATH11K_BOARD_API2_FILE		"board-2.bin"
-#define ATH11K_DEFAULT_BOARD_FILE	"bdwlan.bin"
+#define ATH11K_DEFAULT_BOARD_FILE	"board.bin"
 #define ATH11K_DEFAULT_CAL_FILE		"caldata.bin"
 
 enum ath11k_hw_rate_cck {
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
