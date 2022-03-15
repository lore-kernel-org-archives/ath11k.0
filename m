Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12696C433EF
	for <ath11k@archiver.kernel.org>; Tue, 15 Mar 2022 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dusEtXbTukLMVbvo1g6oUBDAByl6rWLLD/rfT1GqnOw=; b=PbfRHBQoWcPXeA
	jwqunaHcL9DJeRhXqnMWwudiXRieKJE+I91agzIAgHcZ+Q8lCMTPw+kc4WGQgjGQrb7/pQgWs7hR8
	N39HwmN6SSc8hMl3tYppqqPdIYnAtg1GGCgshWd2NP+PQ7WeRCxY55sQYqtaEtSaZ+6HdXqeSgRtY
	RzbSWGfmgAevfMYY5pUrh5jaWFj7rh9JQH0goNrWwPIsX3FID4bssSb2k93wDI41g7WAWC/Duf5yB
	wmi4gWpBm3/9cXhM3Map7JNln1KvuYZLct4PitNgCxNaPOfiKiZ0kA2JExYQFtnviwbDmcNXx1skF
	6xAxy5IMBahvpaOp4VFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU4iR-008m7B-3b; Tue, 15 Mar 2022 10:47:47 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU4iN-008m5P-Cb
 for ath11k@lists.infradead.org; Tue, 15 Mar 2022 10:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647341263; x=1678877263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4pdRjqqAdK6Gq4JFTKaznUNw1oFlisnbZpSDzmMzMQI=;
 b=sgVrtwyzZMrk5Jm0WfKrEf8+q6CJAn/Kdoocal8crJWkndk1pp+6VlSm
 PWj0BWmYxc0ec2zQNzZeZhUcPTVjvWjPHwcYz3BGc7ozIRVkg5TzTrMra
 KHXKtvlcusOzEauar5uxY/ci+Oegf5RLEi2FlRorXdkf88V4hxHYnKVYn Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Mar 2022 03:47:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 03:47:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 03:47:41 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 03:47:40 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v6 2/2] ath11k: add read variant from SMBIOS for download
 board data
Date: Tue, 15 Mar 2022 06:47:21 -0400
Message-ID: <20220315104721.26649-3-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220315104721.26649-1-quic_wgong@quicinc.com>
References: <20220315104721.26649-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_034743_506184_60DE6BD0 
X-CRM114-Status: GOOD (  17.35  )
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

This is to read variant from SMBIOS such as read from DT, the variant
string will be used to one part of string which used to search board
data from board-2.bin.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 68 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h | 20 +++++++-
 drivers/net/wireless/ath/ath11k/qmi.c  |  4 ++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7711bdb36170..6a2cbd07525d 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -9,6 +9,7 @@
 #include <linux/remoteproc.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
+
 #include "core.h"
 #include "dp_tx.h"
 #include "dp_rx.h"
@@ -509,6 +510,73 @@ int ath11k_core_resume(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_core_resume);
 
+static void ath11k_core_check_bdfext(const struct dmi_header *hdr, void *data)
+{
+	struct ath11k_base *ab = data;
+	const char *magic = ATH11K_SMBIOS_BDF_EXT_MAGIC;
+	struct ath11k_smbios_bdf *smbios = (struct ath11k_smbios_bdf *)hdr;
+	int i;
+	size_t len;
+
+	if (ab->qmi.target.bdf_ext[0] != '\0')
+		return;
+
+	if (hdr->type != ATH11K_SMBIOS_BDF_EXT_TYPE)
+		return;
+
+	if (hdr->length != ATH11K_SMBIOS_BDF_EXT_LENGTH) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT,
+			   "wrong smbios bdf ext type length (%d).\n",
+			   hdr->length);
+		return;
+	}
+
+	if (!smbios->bdf_enabled) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT, "bdf variant name not found.\n");
+		return;
+	}
+
+	/* Only one string exists (per spec) */
+	if (memcmp(smbios->bdf_ext, magic, strlen(magic)) != 0) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT,
+			   "bdf variant magic does not match.\n");
+		return;
+	}
+
+	len = min_t(size_t,
+		    strlen(smbios->bdf_ext), sizeof(ab->qmi.target.bdf_ext));
+	for (i = 0; i < len; i++) {
+		if (!isascii(smbios->bdf_ext[i]) || !isprint(smbios->bdf_ext[i])) {
+			ath11k_dbg(ab, ATH11K_DBG_BOOT,
+				   "bdf variant name contains non ascii chars.\n");
+			return;
+		}
+	}
+
+	/* Copy extension name without magic prefix */
+	if (strscpy(ab->qmi.target.bdf_ext, smbios->bdf_ext + strlen(magic),
+		    sizeof(ab->qmi.target.bdf_ext)) < 0) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT,
+			   "bdf variant string is longer than the buffer can accommodate\n");
+		return;
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_BOOT,
+		   "found and validated bdf variant smbios_type 0x%x bdf %s\n",
+		   ATH11K_SMBIOS_BDF_EXT_TYPE, ab->qmi.target.bdf_ext);
+}
+
+int ath11k_core_check_smbios(struct ath11k_base *ab)
+{
+	ab->qmi.target.bdf_ext[0] = '\0';
+	dmi_walk(ath11k_core_check_bdfext, ab);
+
+	if (ab->qmi.target.bdf_ext[0] == '\0')
+		return -ENODATA;
+
+	return 0;
+}
+
 int ath11k_core_check_dt(struct ath11k_base *ab)
 {
 	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index c0228e91a596..891507dbccc7 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -10,6 +10,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/bitfield.h>
+#include <linux/dmi.h>
+#include <linux/ctype.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -36,6 +38,15 @@
 #define ATH11K_INVALID_HW_MAC_ID	0xFF
 #define ATH11K_CONNECTION_LOSS_HZ	(3 * HZ)
 
+/* SMBIOS type containing Board Data File Name Extension */
+#define ATH11K_SMBIOS_BDF_EXT_TYPE 0xF8
+
+/* SMBIOS type structure length (excluding strings-set) */
+#define ATH11K_SMBIOS_BDF_EXT_LENGTH 0x9
+
+/* The magic used by QCA spec */
+#define ATH11K_SMBIOS_BDF_EXT_MAGIC "BDF_"
+
 extern unsigned int ath11k_frame_mode;
 
 #define ATH11K_MON_TIMER_INTERVAL  10
@@ -147,6 +158,13 @@ struct ath11k_ext_irq_grp {
 	struct net_device napi_ndev;
 };
 
+struct ath11k_smbios_bdf {
+	struct dmi_header hdr;
+	u32 padding;
+	u8 bdf_enabled;
+	u8 bdf_ext[1];
+};
+
 #define HEHANDLE_CAP_PHYINFO_SIZE       3
 #define HECAP_PHYINFO_SIZE              9
 #define HECAP_MACINFO_SIZE              5
@@ -996,7 +1014,7 @@ int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
 				       const char *name);
 void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
 int ath11k_core_check_dt(struct ath11k_base *ath11k);
-
+int ath11k_core_check_smbios(struct ath11k_base *ab);
 void ath11k_core_halt(struct ath11k *ar);
 int ath11k_core_resume(struct ath11k_base *ab);
 int ath11k_core_suspend(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 04e966830c18..14d7dfa788cd 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2082,6 +2082,10 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		    ab->qmi.target.fw_build_timestamp,
 		    ab->qmi.target.fw_build_id);
 
+	r = ath11k_core_check_smbios(ab);
+	if (r)
+		ath11k_dbg(ab, ATH11K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
+
 	r = ath11k_core_check_dt(ab);
 	if (r)
 		ath11k_dbg(ab, ATH11K_DBG_QMI, "DT bdf variant name not set.\n");
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
