Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D0FC433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:31:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CEB660EB1
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CEB660EB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uc8qLM7BWCF8npAadQ/6784jXcjNqkUPF8bfS+SYnFA=; b=fEHUzVZ98hhYDj
	BtaU7PaMVe+SEZX9ukgguVojqngFFcGecO5CouZw2DHn5I/rLNsKPP3jXkmFrbk9DmYNb7WFijqA3
	exiFqH+1RBUZPHsA0NDTsRqAdV2daNUXTCa2EoWnoMXEfcJGWE4VhXijyROSD902hIAKvW8OIGAH1
	279s05UWVXi1XbDmxJ13kTXsVkTTqHnB14dfy1Ofep9O/4p7+ZjjvgtvrdF6BhERoO/sJDOxyQWl/
	qnP+6gh54hLHclO/s221IurNVsO3Z+t3bjfC4YiF2IVqo3fEfWnHddA3gDyLg6to/7ez5pMNt2v/B
	C1oZCNJYU2GTqcE0iDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZqiq-008LBj-8g; Mon, 11 Oct 2021 08:31:48 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqc0-008IqM-I0
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 08:24:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633940684; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=XIABq1LHDIFVVelZFIGS9twDlDWU/H8kFo1zOy38pgs=;
 b=d74H8p5dE/JBpKEPxakfglQpihVjANTPkYL6lvsCOYYhr2qbtaYYZ0t9/X2H32lGYjL6wNev
 G8p7EvhImNWcAvqfOrvlbN7oBQxuGTK1jF/Pegru9yn3NK7LqHWX6pZqDabdhJW524v0I5hC
 U4LBfgQxfhKj1EzfIgUJQu+1TgU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6163f4cbab9da96e64a7d930 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 08:24:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DC758C4338F; Mon, 11 Oct 2021 08:24:42 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D90C3C43460;
 Mon, 11 Oct 2021 08:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D90C3C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH] ath11k: add read variant from SMBIOS for download board data
Date: Mon, 11 Oct 2021 04:24:33 -0400
Message-Id: <20211011082433.30415-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_012444_705778_E6E0EF91 
X-CRM114-Status: GOOD (  15.08  )
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

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 74 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h | 11 ++++
 drivers/net/wireless/ath/ath11k/qmi.c  |  4 ++
 3 files changed, 89 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 354ad84a2bb8..ae2f52b4373d 100644
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
@@ -372,6 +375,77 @@ int ath11k_core_resume(struct ath11k_base *ab)
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
index 63d569672cd2..dcc54d4cc096 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -1044,7 +1044,18 @@ int ath11k_core_fetch_board_data_api_1(struct ath11k_base *ab,
 				       char *name);
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
index d9db74e597b5..77880ddc4d77 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2089,6 +2089,10 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
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
