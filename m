Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D7AC433F5
	for <ath11k@archiver.kernel.org>; Thu,  2 Dec 2021 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BoT+qOO5bz8Wv/IL05+SzRQz7m/EC+MDkskiqn/50G0=; b=ZJtU7H7C4KgH25
	LFmBtJ3sNz677fsV2aMQQRoxnsngnw5Z/ieY3WOCn3yoIqaYAOPQGfpSFbSFKJ1M4TBPpmrA0gL8i
	6lW7rDNFRRqzBBfic6PXwoZLy96pyNaxpeQVfk+NZADF5QPd93hjxQmSBYizNREOMGqobLdQyWmHv
	LnRa0iNv9Hzu8tOcXaLd+JlrByERnLOhOZiGjW82pvg+VtnQXTQAPQvAybTwJ+JR+aH8rpA2UGlOS
	YNol+2KJN38lcXD1x9VnnZSoxE9rYu5UXnaEv9FxCxry03YUfPIjHEBtzTYQQ3M6jhKfgqIOiOOvU
	a23wWXGbEUyxtMNXjYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mshbD-00BQak-2N; Thu, 02 Dec 2021 08:37:51 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msha8-00BQ7K-Hn
 for ath11k@lists.infradead.org; Thu, 02 Dec 2021 08:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638434204; x=1669970204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JXveHdo2NanSwyJKUg6M4GaejzAJwxakgF2GaMRdF4Y=;
 b=BuhF3D2Xy8qsu4h/3daO5+L6WasoxJAddjYtOvHxFvJo7lDZxrkVKsDy
 WhUMpRTjCtwFgtkEJ4QLnjorKVNyzZEsL75orQzJRz6pvVqZGhpHrQoQH
 lkNc1OWknpPLn+bjl2iaI5SvunnAaxiRQFSyIS/au0AX+SJsSbQ8JCp4r c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 02 Dec 2021 00:36:42 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 00:36:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 2 Dec 2021 00:36:42 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 2 Dec 2021 00:36:40 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: add regdb.bin download for regdb offload
Date: Thu, 2 Dec 2021 03:36:16 -0500
Message-ID: <20211202083616.15406-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_003644_713089_C3B2F059 
X-CRM114-Status: GOOD (  22.29  )
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
more reg rules such as 6 GHz LPI, SP and VLP.

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
 drivers/net/wireless/ath/ath11k/core.c | 15 +++++++++++----
 drivers/net/wireless/ath/ath11k/core.h |  3 +++
 drivers/net/wireless/ath/ath11k/hw.h   |  2 ++
 drivers/net/wireless/ath/ath11k/qmi.c  | 24 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/qmi.h  |  1 +
 5 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index dd1a1bb078c3..42a147063502 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -87,6 +87,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = true,
 		.wakeup_mhi = false,
+		.supports_regdb = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -141,6 +142,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = true,
 		.wakeup_mhi = false,
+		.supports_regdb = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -194,6 +196,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
 		.wakeup_mhi = true,
+		.supports_regdb = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -247,6 +250,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = true,
 		.alloc_cacheable_memory = true,
 		.wakeup_mhi = false,
+		.supports_regdb = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -300,6 +304,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
 		.wakeup_mhi = true,
+		.supports_regdb = true,
 	},
 };
 
@@ -660,10 +665,12 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
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
 
@@ -691,7 +698,7 @@ int ath11k_core_fetch_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd)
 		goto success;
 
 	ab->bd_api = 1;
-	ret = ath11k_core_fetch_board_data_api_1(ab, bd);
+	ret = ath11k_core_fetch_board_data_api_1(ab, bd, ATH11K_DEFAULT_BOARD_FILE);
 	if (ret) {
 		ath11k_err(ab, "failed to fetch board-2.bin or board.bin from %s\n",
 			   ab->hw_params.fw.dir);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 0103cfd0508d..bbf7ff1f9f48 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -957,6 +957,9 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 void ath11k_core_free(struct ath11k_base *ath11k);
 int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
 			  struct ath11k_board_data *bd);
+int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
+				       struct ath11k_board_data *bd,
+				       const char *name);
 void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
 int ath11k_core_check_dt(struct ath11k_base *ath11k);
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 2c9d232ebfed..5cc0c5b91973 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -77,6 +77,7 @@
 #define ATH11K_DEFAULT_CAL_FILE		"caldata.bin"
 #define ATH11K_AMSS_FILE		"amss.bin"
 #define ATH11K_M3_FILE			"m3.bin"
+#define ATH11K_REGDB_FILE_NAME		"regdb.bin"
 
 enum ath11k_hw_rate_cck {
 	ATH11K_HW_RATE_CCK_LP_11M = 0,
@@ -181,6 +182,7 @@ struct ath11k_hw_params {
 	bool supports_dynamic_smps_6ghz;
 	bool alloc_cacheable_memory;
 	bool wakeup_mhi;
+	bool supports_regdb;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 25eb22cbeaeb..311beeace9b7 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2115,7 +2115,8 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 	return ret;
 }
 
-static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
+static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab,
+				   bool regdb)
 {
 	struct device *dev = ab->dev;
 	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
@@ -2126,13 +2127,25 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab)
 	const u8 *tmp;
 
 	memset(&bd, 0, sizeof(bd));
-	ret = ath11k_core_fetch_bdf(ab, &bd);
+
+	if (regdb) {
+		ret = ath11k_core_fetch_board_data_api_1(ab, &bd,
+							 ATH11K_REGDB_FILE_NAME);
+		if (ret)
+			ath11k_dbg(ab, ATH11K_DBG_QMI, "failed to fetch %s from %s\n",
+				   ATH11K_REGDB_FILE_NAME, ab->hw_params.fw.dir);
+	} else {
+		ret = ath11k_core_fetch_bdf(ab, &bd);
+	}
+
 	if (ret) {
 		ath11k_warn(ab, "qmi failed to fetch board file: %d\n", ret);
 		goto out;
 	}
 
-	if (bd.len >= SELFMAG && memcmp(bd.data, ELFMAG, SELFMAG) == 0)
+	if (regdb)
+		bdf_type = ATH11K_QMI_BDF_TYPE_REGDB;
+	else if (bd.len >= SELFMAG && memcmp(bd.data, ELFMAG, SELFMAG) == 0)
 		bdf_type = ATH11K_QMI_BDF_TYPE_ELF;
 	else
 		bdf_type = ATH11K_QMI_BDF_TYPE_BIN;
@@ -2580,7 +2593,10 @@ static int ath11k_qmi_event_load_bdf(struct ath11k_qmi *qmi)
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
index 3bb0f9ef7996..9ba499ce3b78 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -49,6 +49,7 @@ enum ath11k_qmi_file_type {
 enum ath11k_qmi_bdf_type {
 	ATH11K_QMI_BDF_TYPE_BIN			= 0,
 	ATH11K_QMI_BDF_TYPE_ELF			= 1,
+	ATH11K_QMI_BDF_TYPE_REGDB		= 4,
 };
 
 enum ath11k_qmi_event_type {
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
