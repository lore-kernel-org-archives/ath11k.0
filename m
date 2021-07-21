Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9750EC636C9
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:09:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6052560551
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6052560551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15HwHwKCezuIQ/TlaMd5rimz0g91ftIW5GmGxjkwRBo=; b=GSCrirvV1H7eBJ
	KVwWxUizd/L5lxcKDNLnL0zLpw08nc5laxvGJkzFjB42AeAp6eRm6AfC/BH7bNnPg05C1XiW7UE/Y
	Phln2C4hM4WoFW2ngFBFzQOljOSNWKd54xl2+VCGv+XTTKBt5E9i2dIRtRUdjxRtdnkvX/FtoqBSI
	Zlw0shUh2tIe9m92HX2ezjimqESeQgFO5BJokbmi6B9Hq9r4oBqmbzXrlGT9p8jplETQko5D0rWzQ
	eRQ5+34G9MdpAfj1XFcK60i8e/NranvgFdyAp7tq2ntuQQEvUEVuJEroWR8azIFdj3299qobO1ypb
	gozNvCocE+xFhYtT6KMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6GeT-00Gntr-B4; Wed, 21 Jul 2021 18:09:01 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6GeF-00GnnO-6a
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 18:09:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626890939; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SmmwzoTmZI/1BU/aqczY9ODMTOjzYuvMsMug9RsqBYY=;
 b=AeRVYnz3Qtx5i4u9HNfpSWJSivT6PGT45wU3gnF+bitvYEPtz2jqa/lAzcns1CCK8MjJS90W
 eIvCX8J/yPQ+Y5DwJ3Y74ifkJxxgkvsUr7xTLzNIQleVqrkdsNT3XiCTsYZqObr6DGNu+Pft
 7NXcVoD0dDI/1L+77oXccwyiWf4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60f8629a1dd16c878846201a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 18:08:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BC7F1C433D3; Wed, 21 Jul 2021 18:08:25 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C3BAFC433F1;
 Wed, 21 Jul 2021 18:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3BAFC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/4] ath11k: Refactor spectral FFT bin size
Date: Wed, 21 Jul 2021 21:08:06 +0300
Message-Id: <20210721180809.90960-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721180809.90960-1-jouni@codeaurora.org>
References: <20210721180809.90960-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_110859_366194_EA5C6CA4 
X-CRM114-Status: GOOD (  19.73  )
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

In IPQ8074, actual FFT bin size is two bytes but hardware reports it
with extra pad size of two bytes for each FFT bin. So finally each FFT
bin advertise as four bytes size in the collected data. This FFT pad is
not advertised in IPQ6018 platform. To accommodate this different
behavior across the platforms, introduce the hw param fft_pad_sz and use
it in spectral process. Also group all the spectral params under the new
structure in hw param structure for scalable in future.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.4.0.1-00330-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c     | 27 +++++++++++++++-------
 drivers/net/wireless/ath/ath11k/hw.h       |  6 ++++-
 drivers/net/wireless/ath/ath11k/spectral.c | 13 +++++------
 3 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 3179495cb3c9..2a81a544b6a9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -59,8 +59,13 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.vdev_start_delay = false,
 		.htt_peer_map_v2 = true,
 		.tcl_0_only = false,
-		.spectral_fft_sz = 2,
-
+		.spectral = {
+			.fft_sz = 2,
+			/* HW bug, expected BIN size is 2 bytes but HW report as 4 bytes.
+			 * so added pad size as 2 bytes to compensate the BIN size
+			 */
+			.fft_pad_sz = 2,
+		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
 					BIT(NL80211_IFTYPE_MESH_POINT),
@@ -101,8 +106,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.vdev_start_delay = false,
 		.htt_peer_map_v2 = true,
 		.tcl_0_only = false,
-		.spectral_fft_sz = 4,
-
+		.spectral = {
+			.fft_sz = 4,
+			.fft_pad_sz = 0,
+		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
 					BIT(NL80211_IFTYPE_MESH_POINT),
@@ -143,8 +150,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.vdev_start_delay = true,
 		.htt_peer_map_v2 = false,
 		.tcl_0_only = true,
-		.spectral_fft_sz = 0,
-
+		.spectral = {
+			.fft_sz = 0,
+			.fft_pad_sz = 0,
+		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP),
 		.supports_monitor = false,
@@ -223,8 +232,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.vdev_start_delay = true,
 		.htt_peer_map_v2 = false,
 		.tcl_0_only = true,
-		.spectral_fft_sz = 0,
-
+		.spectral = {
+			.fft_sz = 0,
+			.fft_pad_sz = 0,
+		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP),
 		.supports_monitor = false,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 5b7ce4c7e489..f0349c277026 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -153,7 +153,11 @@ struct ath11k_hw_params {
 	bool vdev_start_delay;
 	bool htt_peer_map_v2;
 	bool tcl_0_only;
-	u8 spectral_fft_sz;
+
+	struct {
+		u8 fft_sz;
+		u8 fft_pad_sz;
+	} spectral;
 
 	u16 interface_modes;
 	bool supports_monitor;
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 1afe67759659..11b9fec746a2 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -11,8 +11,6 @@
 #define ATH11K_SPECTRAL_EVENT_TIMEOUT_MS	1
 
 #define ATH11K_SPECTRAL_DWORD_SIZE		4
-/* HW bug, expected BIN size is 2 bytes but HW report as 4 bytes */
-#define ATH11K_SPECTRAL_BIN_SIZE		4
 #define ATH11K_SPECTRAL_ATH11K_MIN_BINS		64
 #define ATH11K_SPECTRAL_ATH11K_MIN_IB_BINS	32
 #define ATH11K_SPECTRAL_ATH11K_MAX_IB_BINS	256
@@ -581,12 +579,12 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	struct spectral_tlv *tlv;
 	int tlv_len, bin_len, num_bins;
 	u16 length, freq;
-	u8 chan_width_mhz;
+	u8 chan_width_mhz, bin_sz;
 	int ret;
 
 	lockdep_assert_held(&ar->spectral.lock);
 
-	if (!ab->hw_params.spectral_fft_sz) {
+	if (!ab->hw_params.spectral.fft_sz) {
 		ath11k_warn(ab, "invalid bin size type for hw rev %d\n",
 			    ab->hw_rev);
 		return -EINVAL;
@@ -604,7 +602,8 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 		return -EINVAL;
 	}
 
-	num_bins = bin_len / ATH11K_SPECTRAL_BIN_SIZE;
+	bin_sz = ab->hw_params.spectral.fft_sz + ab->hw_params.spectral.fft_pad_sz;
+	num_bins = bin_len / bin_sz;
 	/* Only In-band bins are useful to user for visualize */
 	num_bins >>= 1;
 
@@ -654,7 +653,7 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	fft_sample->freq2 = __cpu_to_be16(freq);
 
 	ath11k_spectral_parse_fft(fft_sample->data, fft_report->bins, num_bins,
-				  ab->hw_params.spectral_fft_sz);
+				  ab->hw_params.spectral.fft_sz);
 
 	fft_sample->max_exp = ath11k_spectral_get_max_exp(fft_sample->max_index,
 							  search.peak_mag,
@@ -962,7 +961,7 @@ int ath11k_spectral_init(struct ath11k_base *ab)
 		      ab->wmi_ab.svc_map))
 		return 0;
 
-	if (!ab->hw_params.spectral_fft_sz)
+	if (!ab->hw_params.spectral.fft_sz)
 		return 0;
 
 	for (i = 0; i < ab->num_radios; i++) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
