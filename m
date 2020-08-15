Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6qAl-0005XE-Hy
 for ath11k@lists.infradead.org; Sat, 15 Aug 2020 07:00:14 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 11/12] ath11k: wmi: put hardware to DBS mode
Date: Sat, 15 Aug 2020 09:59:11 +0300
Message-Id: <1597474752-23287-12-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597474752-23287-1-git-send-email-kvalo@codeaurora.org>
References: <1597474752-23287-1-git-send-email-kvalo@codeaurora.org>
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

For QCA6390, host puts hardware to Dual Band Simultaneous (DBS) mode by default
so both 2G and 5G bands can be used. Otherwise only the 5G band can be used.
QCA6390 doesn't provide band_to_mac configuration and firmware will do the
band_to_mac map.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  2 ++
 drivers/net/wireless/ath/ath11k/hw.h   |  6 ++++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 10 +++++-----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 62fac8bbf221..b94630822d1e 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -36,6 +36,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.host_ce_config = ath11k_host_ce_config_ipq8074,
 		.ce_count = 12,
 		.single_pdev_only = false,
+		.needs_band_to_mac = true,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -54,6 +55,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.host_ce_config = ath11k_host_ce_config_qca6390,
 		.ce_count = 9,
 		.single_pdev_only = true,
+		.needs_band_to_mac = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4651aed2eaf0..8db9534b176b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -145,6 +145,12 @@ struct ath11k_hw_params {
 	u32 ce_count;
 
 	bool single_pdev_only;
+
+	/* For example on QCA6390 struct
+	 * wmi_init_cmd_param::band_to_mac_config needs to be false as the
+	 * firmware creates the mapping.
+	 */
+	bool needs_band_to_mac;
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 21f9070a1300..4e100407fea6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3396,13 +3396,13 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 	init_param.hw_mode_id = wmi_sc->preferred_hw_mode;
 	init_param.mem_chunks = wmi_sc->mem_chunks;
 
-	if (wmi_sc->preferred_hw_mode == WMI_HOST_HW_MODE_SINGLE ||
-	    ab->hw_params.single_pdev_only)
+	if (wmi_sc->preferred_hw_mode == WMI_HOST_HW_MODE_SINGLE)
 		init_param.hw_mode_id = WMI_HOST_HW_MODE_MAX;
 
-	init_param.num_band_to_mac = ab->num_radios;
-
-	ath11k_fill_band_to_mac_param(ab, init_param.band_to_mac);
+	if (ab->hw_params.needs_band_to_mac) {
+		init_param.num_band_to_mac = ab->num_radios;
+		ath11k_fill_band_to_mac_param(ab, init_param.band_to_mac);
+	}
 
 	return ath11k_init_cmd_send(&wmi_sc->wmi[0], &init_param);
 }
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
