Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A3FC433FE
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 06:32:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A526101C
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 06:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04A526101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMbSxtrGyhxYqgaD5dmwxHDHlA1UDG31mZHtqOt03Rw=; b=NI1+tR8yC5kR7H
	7G36V3UWk1v1u5/Yt1JjW2d8IUfp4z4RUZLIJA+1U7C6E0zQrMsB1OVXvX54nBFgx1rc8iKjqqQHW
	b1IsP9lxKU1qWW4rbOnIumWQcLsZRHJOYRGbPAwF0hj8klpF7B1L6RjRTyho5bO45Z+W0WOK8amSX
	75quPiIxk9dAMc5vQ+ZAFmWbdA2TQG3rcwWkrunBO81ECEmK4+jKlhXWjVpH3R06kvR2Uk7B2NcZf
	bGa/KnpJRYaywiMk33GtGr8WfiTrDX4WYhvlLApnydvTADJQuVZRj8k/xgaKlPeWB6lbnbGJAgGMC
	7cTEAZo5Y8hrvAifop3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkKgG-000nxO-Md; Tue, 09 Nov 2021 06:32:28 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkKgD-000nwQ-Bh
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 06:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636439545; x=1667975545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=DKN3CVNkHIpjYImKJDD80xrhDAZRv6vAVHCOWCTUPJQ=;
 b=JkFHnH4eJBLMJylLX80V+CwactozAOG9YOpGnBQ6wnxhnpQMATtOiFP2
 ywKvBWFYhkQ2VizLSOXchTZNKkrF66MMr4j4+a1pLgt4gbQcO8TwdYEGL
 tC5hOSAQ/ntQSkRwbD+R8U0PkHtSj9cAZd5zQXL3v1NS+4IBmWYzP+4fk k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Nov 2021 22:32:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 22:32:21 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 8 Nov 2021 22:32:20 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 8 Nov 2021 22:32:18 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCH 2/2] ath11k: add spectral/CFR buffer validation support
Date: Tue, 9 Nov 2021 12:02:02 +0530
Message-ID: <1636439522-14509-2-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636439522-14509-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1636439522-14509-1-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_223225_473371_FC8C0334 
X-CRM114-Status: GOOD (  15.16  )
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

Currently there is no validation on the spectral/CFR report
over the db ring buffers from the hardware. Improper/incomplete
DMA by the target can result in invalid data received by host.
Due to this we may populate incorrect data to user space.

This buffer validation support fix this issues by filling some
magic value in the buffer during buffer replenish and check for
the magic value in the buffer received by the target. If host
detect magic value in the received buffer it will drop the buffer.

Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dbring.c   | 32 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dbring.h   |  1 +
 drivers/net/wireless/ath/ath11k/spectral.c | 10 ++++++++++
 3 files changed, 43 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dbring.c b/drivers/net/wireless/ath/ath11k/dbring.c
index d043f4e..ec04367 100644
--- a/drivers/net/wireless/ath/ath11k/dbring.c
+++ b/drivers/net/wireless/ath/ath11k/dbring.c
@@ -6,6 +6,37 @@
 #include "core.h"
 #include "debug.h"
 
+#define ATH11K_DB_MAGIC_VALUE 0xdeadbeaf
+
+int ath11k_dbring_validate_buffer(struct ath11k *ar, void *buffer, u32 size)
+{
+	u32 *temp;
+	int idx;
+
+	size = size >> 2;
+
+	for (idx = 0, temp = buffer; idx < size; idx++, temp++) {
+		if (*temp == ATH11K_DB_MAGIC_VALUE) {
+			ath11k_warn(ar->ab, "found magic value in the buffer\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void ath11k_dbring_fill_magic_value(struct ath11k *ar,
+					   void *buffer, u32 size)
+{
+	u32 *temp;
+	int idx;
+
+	size = size >> 2;
+
+	for (idx = 0, temp = buffer; idx < size; idx++, temp++)
+		*temp++ = ATH11K_DB_MAGIC_VALUE;
+}
+
 static int ath11k_dbring_bufs_replenish(struct ath11k *ar,
 					struct ath11k_dbring *ring,
 					struct ath11k_dbring_element *buff,
@@ -27,6 +58,7 @@ static int ath11k_dbring_bufs_replenish(struct ath11k *ar,
 
 	ptr_unaligned = buff->payload;
 	ptr_aligned = PTR_ALIGN(ptr_unaligned, ring->buf_align);
+	ath11k_dbring_fill_magic_value(ar, ptr_aligned, ring->buf_sz);
 	paddr = dma_map_single(ab->dev, ptr_aligned, ring->buf_sz,
 			       DMA_FROM_DEVICE);
 
diff --git a/drivers/net/wireless/ath/ath11k/dbring.h b/drivers/net/wireless/ath/ath11k/dbring.h
index f7fce9e..8c372d7 100644
--- a/drivers/net/wireless/ath/ath11k/dbring.h
+++ b/drivers/net/wireless/ath/ath11k/dbring.h
@@ -76,4 +76,5 @@ int ath11k_dbring_get_cap(struct ath11k_base *ab,
 			  struct ath11k_dbring_cap *db_cap);
 void ath11k_dbring_srng_cleanup(struct ath11k *ar, struct ath11k_dbring *ring);
 void ath11k_dbring_buf_cleanup(struct ath11k *ar, struct ath11k_dbring *ring);
+int ath11k_dbring_validate_buffer(struct ath11k *ar, void *data, u32 size);
 #endif /* ATH11K_DBRING_H */
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index ac4da99..b65e23d 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -581,6 +581,7 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	u16 length, freq;
 	u8 chan_width_mhz, bin_sz;
 	int ret;
+	u32 check_length;
 
 	lockdep_assert_held(&ar->spectral.lock);
 
@@ -614,6 +615,11 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 		return -EINVAL;
 	}
 
+	check_length = sizeof(*fft_report) + (num_bins * ab->hw_params.spectral.fft_sz);
+	ret = ath11k_dbring_validate_buffer(ar, data, check_length);
+	if (ret)
+		return ret;
+
 	ret = ath11k_spectral_pull_search(ar, data, &search);
 	if (ret) {
 		ath11k_warn(ab, "failed to pull search report %d\n", ret);
@@ -747,6 +753,10 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
 				goto err;
 			}
 
+			ret = ath11k_dbring_validate_buffer(ar, data, tlv_len);
+			if (ret)
+				goto err;
+
 			summary = (struct spectral_summary_fft_report *)tlv;
 			ath11k_spectral_pull_summary(ar, &param->meta,
 						     summary, &summ_rpt);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
