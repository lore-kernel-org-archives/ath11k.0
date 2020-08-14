Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6TrR-0008Rf-Rj
 for ath11k@lists.infradead.org; Fri, 14 Aug 2020 07:10:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 03/11] ath11k: fill appropriate QMI service instance id for
 QCA6390
Date: Fri, 14 Aug 2020 10:10:22 +0300
Message-Id: <1597389030-13887-4-git-send-email-kvalo@codeaurora.org>
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

From: Govind Singh <govinds@codeaurora.org>

QMI service instance id is used for qmi service lookup, IPQ8074 and QCA6390
uses different instance id for service lookup.  Fill appropriate QMI service
instance id for respective targets.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 1 +
 drivers/net/wireless/ath/ath11k/pci.c | 1 +
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h | 3 +++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 06e599cbfbf9..2e0d90c022bb 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -581,6 +581,7 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
 	cfg->tgt_ce = target_ce_config_wlan;
 	cfg->svc_to_ce_map_len = ARRAY_SIZE(target_service_to_ce_map_wlan);
 	cfg->svc_to_ce_map = target_service_to_ce_map_wlan;
+	ab->qmi.service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074;
 }
 
 static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index dd3122b47d35..47ee5689a5e2 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -393,6 +393,7 @@ static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
 
 	cfg->svc_to_ce_map = target_service_to_ce_map_wlan;
 	cfg->svc_to_ce_map_len = ARRAY_SIZE(target_service_to_ce_map_wlan);
+	ab->qmi.service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390;
 }
 
 static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b182d6181057..acf7a3f2fe77 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2610,7 +2610,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 
 	ret = qmi_add_lookup(&ab->qmi.handle, ATH11K_QMI_WLFW_SERVICE_ID_V01,
 			     ATH11K_QMI_WLFW_SERVICE_VERS_V01,
-			     ATH11K_QMI_WLFW_SERVICE_INS_ID_V01);
+			     ab->qmi.service_ins_id);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to add qmi lookup\n");
 		return ret;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index cd484a4d0216..d55ce6cf7222 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -18,6 +18,8 @@
 #define ATH11K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH11K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
+#define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390	0x01
+#define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074	0x02
 #define ATH11K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH11K_QMI_RESP_LEN_MAX			8192
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	32
@@ -122,6 +124,7 @@ struct ath11k_qmi {
 	u8 cal_done;
 	struct target_info target;
 	struct m3_mem_region m3_mem;
+	unsigned int service_ins_id;
 };
 
 #define QMI_WLANFW_HOST_CAP_REQ_MSG_V01_MAX_LEN		189
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
