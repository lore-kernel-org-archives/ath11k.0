Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Trr-0008Rf-E6
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 07:11:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 10/11] ath11k: enable internal sleep clock
Date: Fri, 14 Aug 2020 10:10:29 +0300
Message-Id: <1597389030-13887-11-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
References: <1597389030-13887-1-git-send-email-kvalo@codeaurora.org>
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

On x86 and other non-qcom platforms, host needs to explicitly tell the firmware
to use the internal sleep clock. Some QCA6390 modules have OTP burnt with
external sleep clock selected, and these modules can't work expectedly unless
firmware selects internal sleep clock.

Add a field to hw_params to support this difference.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  2 ++
 drivers/net/wireless/ath/ath11k/hw.h   |  2 ++
 drivers/net/wireless/ath/ath11k/qmi.c  | 17 +++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index a3a53debc24f..f1c07583836f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -31,6 +31,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.bdf_addr = 0x4B0C0000,
 		.hw_ops = &ipq8074_ops,
 		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
+		.internal_sleep_clock = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -44,6 +45,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.bdf_addr = 0x4B0C0000,
 		.hw_ops = &qca6390_ops,
 		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
+		.internal_sleep_clock = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 5b443a212c85..aacd092dbddb 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -133,6 +133,8 @@ struct ath11k_hw_params {
 	const struct ath11k_hw_ops *hw_ops;
 
 	const struct ath11k_hw_ring_mask *ring_mask;
+
+	bool internal_sleep_clock;
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 12991a835b8b..b81897131f0a 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -9,6 +9,9 @@
 #include <linux/of.h>
 #include <linux/firmware.h>
 
+#define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
+#define HOST_CSTATE_BIT			0x04
+
 static struct qmi_elem_info qmi_wlanfw_host_cap_req_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_OPT_FLAG,
@@ -1531,6 +1534,20 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 	req.cal_done_valid = 1;
 	req.cal_done = ab->qmi.cal_done;
 
+	if (ab->hw_params.internal_sleep_clock) {
+		req.nm_modem_valid = 1;
+
+		/* Notify firmware that this is non-qualcomm platform. */
+		req.nm_modem |= HOST_CSTATE_BIT;
+
+		/* Notify firmware about the sleep clock selection,
+		 * nm_modem_bit[1] is used for this purpose. Host driver on
+		 * non-qualcomm platforms should select internal sleep
+		 * clock.
+		 */
+		req.nm_modem |= SLEEP_CLOCK_SELECT_INTERNAL_BIT;
+	}
+
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
 	if (ret < 0)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
