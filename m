Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jln6a-0002mq-5B
 for ath11k@lists.infradead.org; Thu, 18 Jun 2020 05:28:53 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v3 3/3] ath11k: add IPQ6018 support
Date: Thu, 18 Jun 2020 10:58:24 +0530
Message-Id: <1592458104-2961-4-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
References: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org

IPQ6018 has one 5G and one 2G radio with 2x2,
shares ipq8074 configurations.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V3:
 - rebased on Kalles patches

 drivers/net/wireless/ath/ath11k/ahb.c  | 115 ++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/core.c |  12 ++++
 drivers/net/wireless/ath/ath11k/core.h |   1 +
 3 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index aa74d27e5871..21f23ac75650 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -20,6 +20,9 @@ static const struct of_device_id ath11k_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq8074-wifi",
 	  .data = (void *)ATH11K_HW_IPQ8074,
 	},
+	{ .compatible = "qcom,ipq6018-wifi",
+	  .data = (void *)ATH11K_HW_IPQ6018,
+	},
 	{ }
 };
 
@@ -264,6 +267,108 @@ static const struct service_to_pipe target_service_to_ce_map_wlan_ipq8074[] = {
 	{ /* terminator entry */ }
 };
 
+static const struct service_to_pipe target_service_to_ce_map_wlan_ipq6018[] = {
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BK),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BK),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BE),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BE),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VI),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VI),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(7),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_RSVD_CTRL),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(0),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_RSVD_CTRL),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(1),
+	},
+	{ /* not used */
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(0),
+	},
+	{ /* not used */
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(1),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_HTT_DATA_MSG),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(4),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_HTT_DATA_MSG),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(1),
+	},
+	{
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_PKT_LOG),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(5),
+	},
+
+	/* (Additions here) */
+
+	{ /* terminator entry */ }
+};
+
 #define ATH11K_IRQ_CE0_OFFSET 4
 
 static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
@@ -956,9 +1061,15 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ab->hw_params.svc_to_ce_map_len =
+	if (ab->hw_rev == ATH11K_HW_IPQ8074) {
+		ab->hw_params.svc_to_ce_map_len =
 			ARRAY_SIZE(target_service_to_ce_map_wlan_ipq8074);
-	ab->hw_params.svc_to_ce_map = target_service_to_ce_map_wlan_ipq8074;
+		ab->hw_params.svc_to_ce_map = target_service_to_ce_map_wlan_ipq8074;
+	} else if (ab->hw_rev == ATH11K_HW_IPQ6018) {
+		ab->hw_params.svc_to_ce_map_len =
+			ARRAY_SIZE(target_service_to_ce_map_wlan_ipq6018);
+		ab->hw_params.svc_to_ce_map = target_service_to_ce_map_wlan_ipq6018;
+	}
 
 	ath11k_ahb_init_qmi_ce_config(ab);
 
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 0bf8bb1674dc..5f794f97d359 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -30,6 +30,18 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.bdf_addr = 0x4B0C0000,
 		.hw_ops = &ipq8074_ops,
 	},
+	{
+		.hw_rev = ATH11K_HW_IPQ6018,
+		.name = "ipq6018 hw1.0",
+		.fw = {
+			.dir = "IPQ6018/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_size = 256 * 1024,
+		},
+		.max_radios = 2,
+		.bdf_addr = 0x4ABC0000,
+		.hw_ops = &ipq6018_ops,
+	},
 };
 
 static int ath11k_core_create_board_name(struct ath11k_base *ab, char *name,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 98b994984c25..fe11fcd9e914 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -90,6 +90,7 @@ struct ath11k_skb_rxcb {
 
 enum ath11k_hw_rev {
 	ATH11K_HW_IPQ8074,
+	ATH11K_HW_IPQ6018,
 };
 
 enum ath11k_firmware_mode {
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
