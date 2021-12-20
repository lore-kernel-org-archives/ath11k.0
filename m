Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9573FC433F5
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xtYD9aEThufQfS2zp90PfIFeq29+yEhytkOySjV0agY=; b=F1bvWvc38bvEq/
	jlSV/8HrGB5nuK4J7c5MvDKSTXfBW18JSqPP0tfQvmS6El3f7v0sLzxk3nqwAEl4enQAF0D+xRUN2
	3rJ6X+koYaA1gT5GrT+JtpcODmfT0wjZ9WGvEK3SZocFGcoNZdAcMK9IRNWQvpqhJaky4Uztp4aw8
	SSb7FUF9IUpYc0qJ5S4cH+6c3oi+BySa4NjymjCjZQvXo40+nXfyxesmVx40YFI3RX1Gy/1KvjKXj
	IXi8isjGSfueIO5q0+yRf1MKXkdeBut19kSg76PQf2XL/+U9DhOUSGwYmDX6N1dxBsPcgk62msXQt
	dcoGiPl+eJTj/MxNHWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzC7O-000nPa-SS; Mon, 20 Dec 2021 06:25:54 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzC7L-000nOs-Si
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 06:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639981551; x=1671517551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1KNLNzHxxNJVMet4pVJV8X7eB6VOawovBafxxzoGAkQ=;
 b=v8O0jUryVwtOHOmsFRK3TC69c1Ejbge+bidOO6uN5guwbVcNwbdhFvuo
 B1pNFTynutTgEf43wdUPrSSifuw5EHfuy+g6v+cxMQtfzzvBcbKxDo7nU
 ltnzSv7ifKC4w50FRzgDgS+Rl7Je7pdzJ1ekVVKjkZLg1NvsKr+5hNB/P I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Dec 2021 22:25:50 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:25:50 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 19 Dec 2021 22:25:50 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 19 Dec 2021 22:25:48 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3] ath11k: add regdb.bin download for regdb offload
Date: Mon, 20 Dec 2021 01:23:55 -0500
Message-ID: <20211220062355.17021-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_222552_013866_0ACC4CF4 
X-CRM114-Status: GOOD (  23.74  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The regdomain is self-managed type for ath11k, the regdomain info is
reported from firmware, it is not from wireless regdb. Firmware fetch
the regdomain info from board data file before. Currently most of the
regdomain info has moved to another file regdb.bin from board data
file for some chips such as QCA6390 and WCN6855, so the regdomain info
left in board data file is not enough to support the feature which need
more regdomain info.

After download regdb.bin, firmware will fetch the regdomain info from
regdb.bin instead of board data file and report to ath11k. If it does
not have the file regdb.bin, it also can initialize wlan success and
firmware then fetch regdomain info from board data file.

Add download the regdb.bin before download board data for some specific
chip which support supports_regdb in hardware parameters.

download regdb.bin log:
[430082.334162] ath11k_pci 0000:05:00.0: chip_id 0x2 chip_family 0xb board_id 0x106 soc_id 0x400c0200
[430082.334169] ath11k_pci 0000:05:00.0: fw_version 0x110c8b4c fw_build_timestamp 2021-10-25 07:41 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-02892-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
[430082.334414] ath11k_pci 0000:05:00.0: boot firmware request ath11k/WCN6855/hw2.0/regdb.bin size 24310

output of "iw reg get"
global
country US: DFS-FCC
        (2402 - 2472 @ 40), (N/A, 30), (N/A)
        (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
        (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
        (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
        (5735 - 5835 @ 80), (N/A, 30), (N/A)
        (57240 - 63720 @ 2160), (N/A, 40), (N/A)

phy#0 (self-managed)
country US: DFS-FCC
        (2402 - 2472 @ 40), (6, 30), (N/A)
        (5170 - 5250 @ 80), (N/A, 24), (N/A), AUTO-BW
        (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
        (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
        (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
        (5945 - 7125 @ 160), (N/A, 24), (N/A), NO-OUTDOOR, AUTO-BW

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v3:
   1. rebased to ath.git ath-202112161538
   2. fix warning message "qmi failed to load CAL data file:cal-pci-0000:06:00.0.bin"

v2:
   1. rebased to ath.git ath-202112141538
   2. add separate ath11k_core_fetch_regdb()
   3. add supports_regdb=true for wcn6855 hw2.0 as well as qca6390 hw2.0/wcn6855 hw2.1
   4. remove warning "qmi failed to fetch board file" if no regdb.bin

 drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/core.h |  4 ++++
 drivers/net/wireless/ath/ath11k/hw.h   |  2 ++
 drivers/net/wireless/ath/ath11k/qmi.c  | 30 ++++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/qmi.h  |  1 +
 5 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 606e867c36ec..acdd4fab2515 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -84,6 +84,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_peers = 512,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
+		.supports_regdb = false,
 		.fix_l1ss = true,
 		.credit_flow = false,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX,
@@ -142,6 +143,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_peers = 512,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
+		.supports_regdb = false,
 		.fix_l1ss = true,
 		.credit_flow = false,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX,
@@ -199,6 +201,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
+		.supports_regdb = true,
 		.fix_l1ss = true,
 		.credit_flow = true,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
@@ -256,6 +259,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_peers = 128,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
+		.supports_regdb = false,
 		.fix_l1ss = true,
 		.credit_flow = false,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX,
@@ -313,6 +317,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
+		.supports_regdb = true,
 		.fix_l1ss = false,
 		.credit_flow = true,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
@@ -369,6 +374,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
+		.supports_regdb = true,
 		.fix_l1ss = false,
 		.credit_flow = true,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
@@ -736,10 +742,12 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
 	return ret;
 }
 
-static int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
-					      struct ath11k_board_data *bd)
+int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
+				       struct ath11k_board_data *bd,
+				       const char *name)
 {
-	bd->fw = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_BOARD_FILE);
+	bd->fw = ath11k_core_firmware_request(ab, name);
+
 	if (IS_ERR(bd->fw))
 		return PTR_ERR(bd->fw);
 
@@ -767,7 +775,7 @@ int ath11k_core_fetch_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd)
 		goto success;
 
 	ab->bd_api = 1;
-	ret = ath11k_core_fetch_board_data_api_1(ab, bd);
+	ret = ath11k_core_fetch_board_data_api_1(ab, bd, ATH11K_DEFAULT_BOARD_FILE);
 	if (ret) {
 		ath11k_err(ab, "failed to fetch board-2.bin or board.bin from %s\n",
 			   ab->hw_params.fw.dir);
@@ -779,6 +787,18 @@ int ath11k_core_fetch_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd)
 	return 0;
 }
 
+int ath11k_core_fetch_regdb(struct ath11k_base *ab, struct ath11k_board_data *bd)
+{
+	int ret;
+
+	ret = ath11k_core_fetch_board_data_api_1(ab, bd, ATH11K_REGDB_FILE_NAME);
+	if (ret)
+		ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to fetch %s from %s\n",
+			   ATH11K_REGDB_FILE_NAME, ab->hw_params.fw.dir);
+
+	return ret;
+}
+
 static void ath11k_core_stop(struct ath11k_base *ab)
 {
 	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index bab3878a41a7..193ea719da2a 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -969,6 +969,10 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 void ath11k_core_free(struct ath11k_base *ath11k);
 int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
 			  struct ath11k_board_data *bd);
+int ath11k_core_fetch_regdb(struct ath11k_base *ab, struct ath11k_board_data *bd);
+int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
+				       struct ath11k_board_data *bd,
+				       const char *name);
 void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
 int ath11k_core_check_dt(struct ath11k_base *ath11k);
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 23f3ce741636..a99b521f5286 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -77,6 +77,7 @@
 #define ATH11K_DEFAULT_CAL_FILE		"caldata.bin"
 #define ATH11K_AMSS_FILE		"amss.bin"
 #define ATH11K_M3_FILE			"m3.bin"
+#define ATH11K_REGDB_FILE_NAME		"regdb.bin"
 
 enum ath11k_hw_rate_cck {
 	ATH11K_HW_RATE_CCK_LP_11M = 0,
@@ -178,6 +179,7 @@ struct ath11k_hw_params {
 	u32 num_peers;
 	bool supports_suspend;
 	u32 hal_desc_sz;
+	bool supports_regdb;
 	bool fix_l1ss;
 	bool credit_flow;
 	u8 max_tx_ring;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 3b9ba0e03a66..4c21d488beda 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2161,7 +2161,8 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 	return ret;
 }
 
-static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
+static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab,
+				   bool regdb)
 {
 	struct device *dev = ab->dev;
 	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
@@ -2172,13 +2173,21 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 	const u8 *tmp;
 
 	memset(&bd, 0, sizeof(bd));
-	ret = ath11k_core_fetch_bdf(ab, &bd);
-	if (ret) {
-		ath11k_warn(ab, "qmi failed to fetch board file: %d\n", ret);
-		goto out;
+
+	if (regdb) {
+		ret = ath11k_core_fetch_regdb(ab, &bd);
+	} else {
+		ret = ath11k_core_fetch_bdf(ab, &bd);
+		if (ret)
+			ath11k_warn(ab, "qmi failed to fetch board file: %d\n", ret);
 	}
 
-	if (bd.len >= SELFMAG && memcmp(bd.data, ELFMAG, SELFMAG) == 0)
+	if (ret)
+		goto out;
+
+	if (regdb)
+		bdf_type = ATH11K_QMI_BDF_TYPE_REGDB;
+	else if (bd.len >= SELFMAG && memcmp(bd.data, ELFMAG, SELFMAG) == 0)
 		bdf_type = ATH11K_QMI_BDF_TYPE_ELF;
 	else
 		bdf_type = ATH11K_QMI_BDF_TYPE_BIN;
@@ -2193,8 +2202,8 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 		goto out;
 	}
 
-	/* QCA6390 does not support cal data, skip it */
-	if (bdf_type == ATH11K_QMI_BDF_TYPE_ELF)
+	/* QCA6390/WCN6855 does not support cal data, skip it */
+	if (bdf_type == ATH11K_QMI_BDF_TYPE_ELF || bdf_type == ATH11K_QMI_BDF_TYPE_REGDB)
 		goto out;
 
 	if (ab->qmi.target.eeprom_caldata) {
@@ -2626,7 +2635,10 @@ static int ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
 		return ret;
 	}
 
-	ret = ath11k_qmi_load_bdf_qmi(ab);
+	if (ab->hw_params.supports_regdb)
+		ath11k_qmi_load_bdf_qmi(ab, true);
+
+	ret = ath11k_qmi_load_bdf_qmi(ab, false);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to load board data file: %d\n", ret);
 		return ret;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index a6fb7d47ee82..983b0b1480dc 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -48,6 +48,7 @@ enum ath11k_qmi_file_type {
 enum ath11k_qmi_bdf_type {
 	ATH11K_QMI_BDF_TYPE_BIN			= 0,
 	ATH11K_QMI_BDF_TYPE_ELF			= 1,
+	ATH11K_QMI_BDF_TYPE_REGDB		= 4,
 };
 
 enum ath11k_qmi_event_type {

base-commit: 12018ad8603a598d773e2cae12542a1981c94886
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
