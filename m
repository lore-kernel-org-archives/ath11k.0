Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69AH-0006cf-Es
 for ath11k@lists.infradead.org; Thu, 13 Aug 2020 09:04:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 02/10] ath11k: add hw_params entry for QCA6390
Date: Thu, 13 Aug 2020 12:04:18 +0300
Message-Id: <1597309466-19688-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
References: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

Define own firmware directory and settings for QCA6390.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.c   |  4 ++++
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 4 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 38e830a2395b..093faf20f324 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -30,6 +30,18 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.bdf_addr = 0x4B0C0000,
 		.hw_ops = &ipq8074_ops,
 	},
+	{
+		.name = "qca6390 hw2.0",
+		.hw_rev = ATH11K_HW_QCA6390_HW20,
+		.fw = {
+			.dir = "QCA6390/hw2.0",
+			.board_size = 256 * 1024,
+			.cal_size = 256 * 1024,
+		},
+		.max_radios = 3,
+		.bdf_addr = 0x4B0C0000,
+		.hw_ops = &qca6390_ops,
+	},
 };
 
 static int ath11k_core_create_board_name(struct ath11k_base *ab, char *name,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b6ccd9f93853..c48d53ec4fa7 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -90,6 +90,7 @@ struct ath11k_skb_rxcb {
 
 enum ath11k_hw_rev {
 	ATH11K_HW_IPQ8074,
+	ATH11K_HW_QCA6390_HW20,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 7cc5f36509c0..6feb0f699cfc 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -32,3 +32,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 const struct ath11k_hw_ops ipq6018_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq6018_mac_from_pdev_id,
 };
+
+const struct ath11k_hw_ops qca6390_ops = {
+	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
+};
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index f31d53f6adb8..1958830c01ec 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -120,6 +120,7 @@ struct ath11k_hw_params {
 
 extern const struct ath11k_hw_ops ipq8074_ops;
 extern const struct ath11k_hw_ops ipq6018_ops;
+extern const struct ath11k_hw_ops qca6390_ops;
 
 static inline
 int ath11k_hw_get_mac_from_pdev_id(struct ath11k_hw_params *hw,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
