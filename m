Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03227C636C9
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4D16113C
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA4D16113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ht+cerzwrpIFQnzdZW97E00XpYJ4kc5W9pjb5iKVdf4=; b=Xu1xpqId7SoISI
	F0PWXrDXJqCAZt8+/v+v79LsW/ylUFoEQON2lZ5BiNO2nfTzXVtZcFC2wnNdMsDGr99yENPUFSmsW
	gRT6VHJolJxM3e0Idr1yUfl/EZ3g7k3FZX/EAxt5pQQtguQzfFBeO1IwpLeMYFLJLNwBlJobD9oZ/
	JTcHqCeBZljOTew8pfEUgIp3/ZR1HUDEY9z/lPGHhss87hUh9Y1QCLo65o2TcnOLqK4pNtibb+2j+
	CinBBHQounAuB/PQTeoLR9bZeDCbKadX3e0cBQIvXtbhaMnDJHRm0z0wbLqTNvrjJBk902JDrGtlG
	BNKvWHTiuOl5K0DrXmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6GeH-00GnoJ-KL; Wed, 21 Jul 2021 18:08:49 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ge8-00Gnm1-PS
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 18:08:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626890926; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pa930ByGaNBYDxHUkpCnsttA7x9eewXwjb2aQJd3G1s=;
 b=fR+kgONovRp5rP9RRNOdFn4XS2HMgbANSeItBFa9WL+XOcKFYj7PeSXmcjG9uqVJ1AD5/DG5
 FBETjvY7gjC/DZuWIk2Jx9zhR9L9sfkBx90InhBWXIgVxIBpGAyuboNSYs+I+aREiWpCJt3K
 P8ZjVqtneXe5oXFjS9LV++Y/oeE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60f8629d290ea35ee68c338a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 18:08:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 452E3C43460; Wed, 21 Jul 2021 18:08:28 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34FC4C43217;
 Wed, 21 Jul 2021 18:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34FC4C43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/4] ath11k: Introduce spectral hw configurable param
Date: Wed, 21 Jul 2021 21:08:07 +0300
Message-Id: <20210721180809.90960-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721180809.90960-1-jouni@codeaurora.org>
References: <20210721180809.90960-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_110847_024004_0F21CC7E 
X-CRM114-Status: GOOD (  19.60  )
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

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Below parameters have been identified as configurable across the platforms.
So to scale the spectral across the platforms, move these parameter
into hw param.

	1. Maximum FFT bins
	2. Summary report pad size
	3. FFT report header length

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.4.0.1-00330-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c     | 12 +++++++++
 drivers/net/wireless/ath/ath11k/hw.h       |  3 +++
 drivers/net/wireless/ath/ath11k/spectral.c | 29 +++++++++++-----------
 drivers/net/wireless/ath/spectral_common.h |  1 -
 4 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2a81a544b6a9..08b2e67c8e19 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -65,6 +65,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			 * so added pad size as 2 bytes to compensate the BIN size
 			 */
 			.fft_pad_sz = 2,
+			.summary_pad_sz = 0,
+			.fft_hdr_len = 16,
+			.max_fft_bins = 512,
 		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
@@ -109,6 +112,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.spectral = {
 			.fft_sz = 4,
 			.fft_pad_sz = 0,
+			.summary_pad_sz = 0,
+			.fft_hdr_len = 16,
+			.max_fft_bins = 512,
 		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
@@ -153,6 +159,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.spectral = {
 			.fft_sz = 0,
 			.fft_pad_sz = 0,
+			.summary_pad_sz = 0,
+			.fft_hdr_len = 0,
+			.max_fft_bins = 0,
 		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP),
@@ -235,6 +244,9 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.spectral = {
 			.fft_sz = 0,
 			.fft_pad_sz = 0,
+			.summary_pad_sz = 0,
+			.fft_hdr_len = 0,
+			.max_fft_bins = 0,
 		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP),
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index f0349c277026..5d150cd793b2 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -157,6 +157,9 @@ struct ath11k_hw_params {
 	struct {
 		u8 fft_sz;
 		u8 fft_pad_sz;
+		u8 summary_pad_sz;
+		u8 fft_hdr_len;
+		u16 max_fft_bins;
 	} spectral;
 
 	u16 interface_modes;
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 11b9fec746a2..aca3c523632e 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -11,20 +11,20 @@
 #define ATH11K_SPECTRAL_EVENT_TIMEOUT_MS	1
 
 #define ATH11K_SPECTRAL_DWORD_SIZE		4
-#define ATH11K_SPECTRAL_ATH11K_MIN_BINS		64
-#define ATH11K_SPECTRAL_ATH11K_MIN_IB_BINS	32
-#define ATH11K_SPECTRAL_ATH11K_MAX_IB_BINS	256
+#define ATH11K_SPECTRAL_MIN_BINS		64
+#define ATH11K_SPECTRAL_MIN_IB_BINS	(ATH11K_SPECTRAL_MIN_BINS >> 1)
+#define ATH11K_SPECTRAL_MAX_IB_BINS(x)	((x)->hw_params.spectral.max_fft_bins >> 1)
 
 #define ATH11K_SPECTRAL_SCAN_COUNT_MAX		4095
 
 /* Max channel computed by sum of 2g and 5g band channels */
 #define ATH11K_SPECTRAL_TOTAL_CHANNEL		41
 #define ATH11K_SPECTRAL_SAMPLES_PER_CHANNEL	70
-#define ATH11K_SPECTRAL_PER_SAMPLE_SIZE		(sizeof(struct fft_sample_ath11k) + \
-						 ATH11K_SPECTRAL_ATH11K_MAX_IB_BINS)
+#define ATH11K_SPECTRAL_PER_SAMPLE_SIZE(x)	(sizeof(struct fft_sample_ath11k) + \
+						 ATH11K_SPECTRAL_MAX_IB_BINS(x))
 #define ATH11K_SPECTRAL_TOTAL_SAMPLE		(ATH11K_SPECTRAL_TOTAL_CHANNEL * \
 						 ATH11K_SPECTRAL_SAMPLES_PER_CHANNEL)
-#define ATH11K_SPECTRAL_SUB_BUFF_SIZE		ATH11K_SPECTRAL_PER_SAMPLE_SIZE
+#define ATH11K_SPECTRAL_SUB_BUFF_SIZE(x)	ATH11K_SPECTRAL_PER_SAMPLE_SIZE(x)
 #define ATH11K_SPECTRAL_NUM_SUB_BUF		ATH11K_SPECTRAL_TOTAL_SAMPLE
 
 #define ATH11K_SPECTRAL_20MHZ			20
@@ -442,8 +442,8 @@ static ssize_t ath11k_write_file_spectral_bins(struct file *file,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	if (val < ATH11K_SPECTRAL_ATH11K_MIN_BINS ||
-	    val > SPECTRAL_ATH11K_MAX_NUM_BINS)
+	if (val < ATH11K_SPECTRAL_MIN_BINS ||
+	    val > ar->ab->hw_params.spectral.max_fft_bins)
 		return -EINVAL;
 
 	if (!is_power_of_2(val))
@@ -594,7 +594,7 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	tlv_len = FIELD_GET(SPECTRAL_TLV_HDR_LEN, __le32_to_cpu(tlv->header));
 	/* convert Dword into bytes */
 	tlv_len *= ATH11K_SPECTRAL_DWORD_SIZE;
-	bin_len = tlv_len - (sizeof(*fft_report) - sizeof(*tlv));
+	bin_len = tlv_len - ab->hw_params.spectral.fft_hdr_len;
 
 	if (data_len < (bin_len + sizeof(*fft_report))) {
 		ath11k_warn(ab, "mismatch in expected bin len %d and data len %d\n",
@@ -607,8 +607,8 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	/* Only In-band bins are useful to user for visualize */
 	num_bins >>= 1;
 
-	if (num_bins < ATH11K_SPECTRAL_ATH11K_MIN_IB_BINS ||
-	    num_bins > ATH11K_SPECTRAL_ATH11K_MAX_IB_BINS ||
+	if (num_bins < ATH11K_SPECTRAL_MIN_IB_BINS ||
+	    num_bins > ATH11K_SPECTRAL_MAX_IB_BINS(ab) ||
 	    !is_power_of_2(num_bins)) {
 		ath11k_warn(ab, "Invalid num of bins %d\n", num_bins);
 		return -EINVAL;
@@ -689,7 +689,7 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
 		goto unlock;
 	}
 
-	sample_sz = sizeof(*fft_sample) + ATH11K_SPECTRAL_ATH11K_MAX_IB_BINS;
+	sample_sz = sizeof(*fft_sample) + ATH11K_SPECTRAL_MAX_IB_BINS(ab);
 	fft_sample = kmalloc(sample_sz, GFP_ATOMIC);
 	if (!fft_sample) {
 		ret = -ENOBUFS;
@@ -737,7 +737,8 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
 			 * is 4 DWORD size (16 bytes).
 			 * Need to remove this workaround once HW bug fixed
 			 */
-			tlv_len = sizeof(*summary) - sizeof(*tlv);
+			tlv_len = sizeof(*summary) - sizeof(*tlv) +
+				  ab->hw_params.spectral.summary_pad_sz;
 
 			if (tlv_len < (sizeof(*summary) - sizeof(*tlv))) {
 				ath11k_warn(ab, "failed to parse spectral summary at bytes %d tlv_len:%d\n",
@@ -900,7 +901,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
 
 	ar->spectral.rfs_scan = relay_open("spectral_scan",
 					   ar->debug.debugfs_pdev,
-					   ATH11K_SPECTRAL_SUB_BUFF_SIZE,
+					   ATH11K_SPECTRAL_SUB_BUFF_SIZE(ar->ab),
 					   ATH11K_SPECTRAL_NUM_SUB_BUF,
 					   &rfs_scan_cb, NULL);
 	if (!ar->spectral.rfs_scan) {
diff --git a/drivers/net/wireless/ath/spectral_common.h b/drivers/net/wireless/ath/spectral_common.h
index 9c2e5458e425..e14f374f97d4 100644
--- a/drivers/net/wireless/ath/spectral_common.h
+++ b/drivers/net/wireless/ath/spectral_common.h
@@ -24,7 +24,6 @@
  * could be acquired so far.
  */
 #define SPECTRAL_ATH10K_MAX_NUM_BINS		256
-#define SPECTRAL_ATH11K_MAX_NUM_BINS		512
 
 /* FFT sample format given to userspace via debugfs.
  *
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
