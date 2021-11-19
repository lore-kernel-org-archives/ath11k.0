Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97B5C433FE
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 09:08:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9516961AA2
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 09:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9516961AA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZRnrFx+L1WJxbacQakMG2JR2cRIYFbyQ3/YIbVOU6k=; b=hVATa4HslQef53
	sFS5WYzfOv4x8UQDCiltq1ZNeeoirF1qaLVAPB8A/lB74KkmlDuoIM+77fLm/iFuZFFjEEK35OweB
	gTvjN7ljnoR/aEah7xILmrTOia4gh9e5yjB+c2dhpcjTds+c5VrLEZsKE1JowSTyfWyEcFjLlW7wy
	TmROhu11Mwb8GvIRCE6uQ0Wf2o+jMkBJbBwxftjOWr8efi2+8GLiAhzDoZ9XI2dSC2AGpotJ8YvI/
	oO0iVN3Vg80uQxFBi/1I+N9qz/qm9Sb5BK5VADOoa7edY+8eXqlNk2+3bCjM7OhQIG8bkXqtCRUH0
	4/519/rA24vxXMwag/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnzss-009uWu-NS; Fri, 19 Nov 2021 09:08:38 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnzsp-009uVn-A7
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 09:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637312915; x=1668848915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EY6Hj1JcJC/1S4QuBYTIJCq9zNwJCIR2QbgZBl4ACJk=;
 b=Dk1c3/7HE2tDAEGLuf3IIdEq6Zp2gT/ck841wAzOB8EQC+5aiXDJFz7h
 iuhWYS46K/ZHOgkKZV2fghb9x2SXzaQEMhHYVG65AX4wl4kmFtHy2dxNN
 NNOAt45W9OYnlCwQNSN/5jxiUr7SFIpVlOU3ti90OQ4SExZMel3nS3vmR Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Nov 2021 01:08:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 01:08:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:08:34 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:08:32 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCHv2 2/2] ath11k: add spectral/CFR buffer validation support
Date: Fri, 19 Nov 2021 14:38:21 +0530
Message-ID: <1637312901-10279-2-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637312901-10279-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1637312901-10279-1-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_010835_408272_B717D86C 
X-CRM114-Status: GOOD (  14.66  )
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
v2:
 * Rebased on TOT

 drivers/net/wireless/ath/ath11k/dbring.c   | 32 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dbring.h   |  1 +
 drivers/net/wireless/ath/ath11k/spectral.c | 10 ++++++++++
 3 files changed, 43 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dbring.c b/drivers/net/wireless/ath/ath11k/dbring.c
index 31cf7ac..5c07442 100644
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
index 78a985f..124c7db 100644
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
