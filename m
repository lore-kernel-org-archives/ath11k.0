Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4F2C433EF
	for <ath11k@archiver.kernel.org>; Thu, 21 Apr 2022 02:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ia1GYuupFjz5gAG1Y3pYy7eqAmzy7kUPUK7qK6dgK6Y=; b=zhDt7KmWZouEgx
	Dlm5Nu07ervyS10lR99kfVO9J5x1vaVvhI9rvgoy3r+laSNAi/zH/6cVG1+Na75igmZyXP0jEHiuZ
	kFF4mJfTvSTbWW7oyrlrVoyZXdEloDQqjLddGDZzcLa9MsH4NES6y5VTwsAPW1rmmRpD8O/WZVu3t
	lC/O4fxdohMLYRzyy3i3p3s1RYYH3GSXUGDmHceqJpQrqdWCH12uGashki7fRb7xyhRYVSuOTBf74
	7aMJMz1SYy2Ku7P9wJFXzA9JjtPaQZV0UATMQXYc5tlyyqbmgAjevtX7qN5AT71Yf2xosqOp/l7SA
	/tPCU4HgkuL+d8V6hgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhMfG-00BAdO-Ua; Thu, 21 Apr 2022 02:35:26 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhMfE-00BAba-5N
 for ath11k@lists.infradead.org; Thu, 21 Apr 2022 02:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650508524; x=1682044524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s3yIx6lzX2Qdd7/djdCHBUNrnWZkAuTzjG2OdUyyfcc=;
 b=oLYiGlVYRuy245Q3JoAjVUS6CqpXdpRwQg1QD0dvSduMxMJI/JvxlY1/
 +qKH0xxPWsZPaExLkmBwKi+SlB3yLhbl68hhW52o5LyFEoYpuoy5LXiAS
 wB48V9P4wFEFH4UbZORQdGcKas5+Hqn4xCNXOrI+hDhKKNYBnFBj290au g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Apr 2022 19:35:16 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 19:35:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 19:35:15 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 19:35:14 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: add read country code from SMBIOS for WCN6855/QCA6390
Date: Wed, 20 Apr 2022 22:35:01 -0400
Message-ID: <20220421023501.32167-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_193524_285957_BB617B49 
X-CRM114-Status: GOOD (  13.27  )
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

This read the country code from SMBIOS and send the country code
to firmware, firmware will indicate the regulatory domain info of the
country code and then ath11k will use the info.

dmesg:
[ 1242.637173] ath11k_pci 0000:02:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id 0x400c0200
[ 1242.637176] ath11k_pci 0000:02:00.0: fw_version 0x110b09e5 fw_build_timestamp 2021-06-22 09:32 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-02533-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
[ 1242.637253] ath11k_pci 0000:02:00.0: worldwide regdomain setting from SMBIOS
[ 1242.637259] ath11k_pci 0000:02:00.0: bdf variant name not found.
[ 1242.637261] ath11k_pci 0000:02:00.0: SMBIOS bdf variant name not set.
[ 1242.637263] ath11k_pci 0000:02:00.0: DT bdf variant name not set.
[ 1242.927543] ath11k_pci 0000:02:00.0: set current country pdev id 0 alpha2 00

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h | 23 +++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/mac.c  | 11 ++++++++++
 3 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 1537ec0ae2e7..721669c04dcf 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -538,13 +538,14 @@ int ath11k_core_resume(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_core_resume);
 
-static void ath11k_core_check_bdfext(const struct dmi_header *hdr, void *data)
+static void ath11k_core_check_cc_code_bdfext(const struct dmi_header *hdr, void *data)
 {
 	struct ath11k_base *ab = data;
 	const char *magic = ATH11K_SMBIOS_BDF_EXT_MAGIC;
 	struct ath11k_smbios_bdf *smbios = (struct ath11k_smbios_bdf *)hdr;
 	ssize_t copied;
 	size_t len;
+	u16 cc_code;
 	int i;
 
 	if (ab->qmi.target.bdf_ext[0] != '\0')
@@ -560,6 +561,29 @@ static void ath11k_core_check_bdfext(const struct dmi_header *hdr, void *data)
 		return;
 	}
 
+	spin_lock_bh(&ab->base_lock);
+
+	switch (smbios->country_code_flag) {
+	case ATH11K_SMBIOS_CC_ISO:
+		cc_code = __le16_to_cpu(smbios->cc_code);
+		ab->new_alpha2[0] = (cc_code >> 8) & 0xff;
+		ab->new_alpha2[1] = cc_code & 0xff;
+		ath11k_dbg(ab, ATH11K_DBG_BOOT, "cc code from SMBIOS %c%c\n",
+			   ab->new_alpha2[0], ab->new_alpha2[1]);
+		break;
+	case ATH11K_SMBIOS_CC_WW:
+		ab->new_alpha2[0] = '0';
+		ab->new_alpha2[1] = '0';
+		ath11k_dbg(ab, ATH11K_DBG_BOOT, "worldwide regdomain setting from SMBIOS\n");
+		break;
+	default:
+		ath11k_dbg(ab, ATH11K_DBG_BOOT, "ignore country code setting %d from SMBIOS\n",
+			   smbios->country_code_flag);
+		break;
+	}
+
+	spin_unlock_bh(&ab->base_lock);
+
 	if (!smbios->bdf_enabled) {
 		ath11k_dbg(ab, ATH11K_DBG_BOOT, "bdf variant name not found.\n");
 		return;
@@ -599,7 +623,7 @@ static void ath11k_core_check_bdfext(const struct dmi_header *hdr, void *data)
 int ath11k_core_check_smbios(struct ath11k_base *ab)
 {
 	ab->qmi.target.bdf_ext[0] = '\0';
-	dmi_walk(ath11k_core_check_bdfext, ab);
+	dmi_walk(ath11k_core_check_cc_code_bdfext, ab);
 
 	if (ab->qmi.target.bdf_ext[0] == '\0')
 		return -ENODATA;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index fa299bfb4efc..88f87b212ac7 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -169,12 +169,31 @@ struct ath11k_ext_irq_grp {
 	struct net_device napi_ndev;
 };
 
+enum ath11k_smbios_cc_type {
+	/* disable country code setting from SMBIOS */
+	ATH11K_SMBIOS_CC_DISABLE = 0,
+	/* set country code by ANSI country name, based on ISO3166-1 alpha2 */
+	ATH11K_SMBIOS_CC_ISO = 1,
+	/* worldwide regdomain */
+	ATH11K_SMBIOS_CC_WW = 2,
+};
+
 struct ath11k_smbios_bdf {
 	struct dmi_header hdr;
-	u32 padding;
+	u8 features_disabled;
+	/* enum ath11k_smbios_cc_type */
+	u8 country_code_flag;
+	/* To set specific country, you need to set country code
+	 * flag=ATH11K_SMBIOS_CC_ISO first, then if country is United States, then country
+	 * code value = 0x5553 ("US",'U' = 0x55, 'S'= 0x53), To set country
+	 * to INDONESIA, then country code value = 0x4944 ("IN", 'I'=0x49, 'D'=0x44).
+	 * If country code flag = ATH11K_SMBIOS_CC_WW, then you can use
+	 * worldwide regulatory setting.
+	 */
+	__le16 cc_code;
 	u8 bdf_enabled;
 	u8 bdf_ext[];
-};
+} __packed;
 
 #define HEHANDLE_CAP_PHYINFO_SIZE       3
 #define HECAP_PHYINFO_SIZE              9
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ca998fb13b62..06d6261e49b2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8773,6 +8773,17 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		goto err_unregister_hw;
 	}
 
+	if (ab->hw_params.current_cc_support && ab->new_alpha2[0]) {
+		struct wmi_set_current_country_params set_current_param = {};
+
+		memcpy(&set_current_param.alpha2, ab->new_alpha2, 2);
+		memcpy(&ar->alpha2, ab->new_alpha2, 2);
+		ret = ath11k_wmi_send_set_current_country_cmd(ar, &set_current_param);
+		if (ret)
+			ath11k_warn(ar->ab,
+				    "failed set cc code for mac register: %d\n", ret);
+	}
+
 	ret = ath11k_debugfs_register(ar);
 	if (ret) {
 		ath11k_err(ar->ab, "debugfs registration failed: %d\n", ret);

base-commit: 00576220f0dea728fdecfd0d31a0dd661c14e6a1
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
