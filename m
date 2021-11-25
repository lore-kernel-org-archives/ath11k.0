Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C708C433F5
	for <ath11k@archiver.kernel.org>; Thu, 25 Nov 2021 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFsEUiYMj4E6epJ501qxY+xcIuDrThck7eLj/UpRgWk=; b=4exRJjyg2PfccT
	7C5mSmh3TiW54symVCamhv8MvQd/G4y4qUVVDbBOJEnaAVIygfdGXap5nhkRCUoMApylKgPJfsrwC
	p3QXdyTuLAngC4+cY4EfChHKRiV4wVkQkj2gcf+k1ckxshqSwQyf8JPFWt4JJZw6Ux0fe89HbGtTA
	uuflIwAWRGSgLp1xhYsuaz09O8zVTLFFZyPQNflqTEChbIJSmClSvBLFEXZkegxvAFfi/03vV7EBG
	yIhIeZXiTpoUvSy57zm48eb5DX/f3PFfd4fWY/C6e+GWhCrAv06HRLZi++SDj0isnVrH1x4rBxT1N
	479GX56ZtMWjHR/uK+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqANg-006lD1-DG; Thu, 25 Nov 2021 08:45:24 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqANd-006lBI-HM
 for ath11k@lists.infradead.org; Thu, 25 Nov 2021 08:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637829921; x=1669365921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t2+HteUExqmKTygO7cw0YIgDfd+YtRcyeZbVfJ9b+5I=;
 b=NwK49narH/JSH4i9EpGYNHwyUEPAsAzwH0g9ZB5bjjK5U5XXAi29mEQ/
 kswYq6z/rxYbaVkfTYvTO2HdiE99RUgU48gQ9kyv+DELCnJOU3K4gXqqa
 T937gwqn7Nx2f8O1ko4oYJ+h3AmG9pPPPFfHYrj0bWPTf0dvw5PbrV1yB I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Nov 2021 00:45:20 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 00:45:19 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 00:45:19 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 00:45:17 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3 2/2] ath11k: add read variant from SMBIOS for download
 board data
Date: Thu, 25 Nov 2021 03:44:58 -0500
Message-ID: <20211125084458.16352-3-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125084458.16352-1-quic_wgong@quicinc.com>
References: <20211125084458.16352-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_004521_638445_FF357BE6 
X-CRM114-Status: GOOD (  14.90  )
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

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 74 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h | 11 ++++
 drivers/net/wireless/ath/ath11k/qmi.c  |  4 ++
 3 files changed, 89 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7fcc0ef821c6..22111feda913 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -8,6 +8,9 @@
 #include <linux/remoteproc.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
+#include <linux/dmi.h>
+#include <linux/ctype.h>
+
 #include "core.h"
 #include "dp_tx.h"
 #include "dp_rx.h"
@@ -384,6 +387,77 @@ int ath11k_core_resume(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_core_resume);
 
+static void ath11k_core_check_bdfext(const struct dmi_header *hdr, void *data)
+{
+	struct ath11k_base *ab = data;
+	const char *bdf_ext;
+	const char *magic = ATH11K_SMBIOS_BDF_EXT_MAGIC;
+	u8 bdf_enabled;
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
+	bdf_enabled = *((u8 *)hdr + ATH11K_SMBIOS_BDF_EXT_OFFSET);
+	if (!bdf_enabled) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT, "bdf variant name not found.\n");
+		return;
+	}
+
+	/* Only one string exists (per spec) */
+	bdf_ext = (char *)hdr + hdr->length;
+
+	if (memcmp(bdf_ext, magic, strlen(magic)) != 0) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT,
+			   "bdf variant magic does not match.\n");
+		return;
+	}
+
+	len = strlen(bdf_ext);
+	for (i = 0; i < len; i++) {
+		if (!isascii(bdf_ext[i]) || !isprint(bdf_ext[i])) {
+			ath11k_dbg(ab, ATH11K_DBG_BOOT,
+				   "bdf variant name contains non ascii chars.\n");
+			return;
+		}
+	}
+
+	/* Copy extension name without magic prefix */
+	if (strscpy(ab->qmi.target.bdf_ext, bdf_ext + strlen(magic),
+		    sizeof(ab->qmi.target.bdf_ext)) < 0) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT,
+			   "bdf variant string is longer than the buffer can accommodate (variant: %s)\n",
+			    bdf_ext);
+		return;
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_BOOT,
+		   "found and validated bdf variant smbios_type 0x%x bdf %s\n",
+		   ATH11K_SMBIOS_BDF_EXT_TYPE, bdf_ext);
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
index 0103cfd0508d..8cfbf91a7909 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -959,7 +959,18 @@ int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
 			  struct ath11k_board_data *bd);
 void ath11k_core_free_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd);
 int ath11k_core_check_dt(struct ath11k_base *ath11k);
+/* SMBIOS type containing Board Data File Name Extension */
+#define ATH11K_SMBIOS_BDF_EXT_TYPE 0xF8
 
+/* SMBIOS type structure length (excluding strings-set) */
+#define ATH11K_SMBIOS_BDF_EXT_LENGTH 0x9
+
+/* Offset pointing to Board Data File Name Extension */
+#define ATH11K_SMBIOS_BDF_EXT_OFFSET 0x8
+
+/* The magic used by QCA spec */
+#define ATH11K_SMBIOS_BDF_EXT_MAGIC "BDF_"
+int ath11k_core_check_smbios(struct ath11k_base *ab);
 void ath11k_core_halt(struct ath11k *ar);
 int ath11k_core_resume(struct ath11k_base *ab);
 int ath11k_core_suspend(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 25eb22cbeaeb..700a9c137018 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1991,6 +1991,10 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
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
