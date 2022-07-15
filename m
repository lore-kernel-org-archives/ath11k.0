Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6E0C433EF
	for <ath11k@archiver.kernel.org>; Fri, 15 Jul 2022 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nvfRJNxo8iB5XIg2r0yHoDHlGU4uBVcUdTBiU8pHCEE=; b=JraZna46z6yhc4
	IZZnviok1rWX7ENhpaCvIQYSJ1aoJL83yiiP/wfCmy/wxlyuSLg6FleYDarr37kgdkTtuhvIJRMYG
	i6UdHWMBVVjUY9O2u8tNmRHrGxWLQjFw/jAA/Gn1kkGKbofkNJnAB5g4W5XgME157+sBWqaAG6Rv8
	4xhanpAw9QMI0vDsUgTtKsClS0X0EBDB3Tx38ZtokDo3OdGSgKZnZedMcuPjRxHO6E2BdklTHsJ1z
	8eNGicYrwgf2OXuDxCQ/oqS/8Wp3wDvmQTmIAhifUHZBEQQ5ty/ayfcY+7HciY6Dko/Fqtd2pFhoj
	CogjKku8ap9TGCP9irWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOwF-0095Vu-2J; Fri, 15 Jul 2022 17:17:15 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOwC-0095T3-D6
	for ath11k@lists.infradead.org; Fri, 15 Jul 2022 17:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657905432; x=1689441432;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=oz6i7kOXp+FaJIRtu1/eZZGO8bl2r6ycbdwyVe7pjcs=;
  b=x0S4Ge+Nn3Dysmyfape2NOJWk35vj91Ao07/+jWVZRTSvM4vCaQWfpdI
   AQI9RCFdXLVdIJs8owi5jB/Vix5uF4ZngmxsGAARD2Jw2YXLZtviaMlkS
   9QxLuUt+edbw54oyy4NnGEvf5OQRu7s2RYW1eiwMQaWIr/DGbw2YjJ9/G
   g=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 15 Jul 2022 10:17:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 10:17:08 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 10:17:07 -0700
Received: from tamizhr-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 10:17:05 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Subject: [PATCH] ath11k: Add spectral scan support for 160 MHz
Date: Fri, 15 Jul 2022 22:46:48 +0530
Message-ID: <20220715171648.29787-1-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_101712_526419_4FD4143A 
X-CRM114-Status: GOOD (  15.78  )
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

There are two types of 160 MHz spectral scan support mentioned below

1. Fragmented approach
2. Single event approach

In this fragmented approach, single 160 MHz will be split as two
80 MHz buffer. First fft sample buffer will contain spectral scan
result of primary 80 MHz and the second fft sample buffer will contain
secondary 80 MHz and here cfreq1 and cfreq2 will be mentioned.
In case of 160 MHz on 36th channel will contain cfreq1 as 5210 and
cfreq2 as 5290. Chipsets which support this approach are IPQ8074/IPQ6018.

Replacing freq1 with freq2 in every secondary sepctral scan event to
distinguish between two different 80 MHz spectral event data.

In the 2nd approach each fft sample buffer will contain spectral scan
result for whole 160 MHz by mentioning cfreq1 as 5250 which is center
frequency of whole 160 MHz. Chipset which support this approach is QCN9074.

Host will receive spectral event from target for every 5 fft samples.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01120-QCAHKSWPL-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01120-QCAHKSWP

Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c     |  7 +++++++
 drivers/net/wireless/ath/ath11k/hw.h       |  1 +
 drivers/net/wireless/ath/ath11k/spectral.c | 21 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/spectral.h |  1 +
 4 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c8e0bc935838..1b1ff26cdfca 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -73,6 +73,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.summary_pad_sz = 0,
 			.fft_hdr_len = 16,
 			.max_fft_bins = 512,
+			.fragment_160mhz = true,
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
@@ -149,6 +150,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.summary_pad_sz = 0,
 			.fft_hdr_len = 16,
 			.max_fft_bins = 512,
+			.fragment_160mhz = true,
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
@@ -225,6 +227,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.summary_pad_sz = 0,
 			.fft_hdr_len = 0,
 			.max_fft_bins = 0,
+			.fragment_160mhz = false,
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
@@ -299,6 +302,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.summary_pad_sz = 16,
 			.fft_hdr_len = 24,
 			.max_fft_bins = 1024,
+			.fragment_160mhz = false,
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
@@ -375,6 +379,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.summary_pad_sz = 0,
 			.fft_hdr_len = 0,
 			.max_fft_bins = 0,
+			.fragment_160mhz = false,
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
@@ -450,6 +455,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.summary_pad_sz = 0,
 			.fft_hdr_len = 0,
 			.max_fft_bins = 0,
+			.fragment_160mhz = false,
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
@@ -524,6 +530,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 			.summary_pad_sz = 0,
 			.fft_hdr_len = 0,
 			.max_fft_bins = 0,
+			.fragment_160mhz = false,
 		},
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 77dc5c851c9b..cd0e18acc250 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -169,6 +169,7 @@ struct ath11k_hw_params {
 		u8 summary_pad_sz;
 		u8 fft_hdr_len;
 		u16 max_fft_bins;
+		bool fragment_160mhz;
 	} spectral;
 
 	u16 interface_modes;
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 516a7b4cd180..8fdcb161a1e4 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -30,6 +30,7 @@
 #define ATH11K_SPECTRAL_20MHZ			20
 #define ATH11K_SPECTRAL_40MHZ			40
 #define ATH11K_SPECTRAL_80MHZ			80
+#define ATH11K_SPECTRAL_160MHZ			160
 
 #define ATH11K_SPECTRAL_SIGNATURE		0xFA
 
@@ -183,6 +184,8 @@ static int ath11k_spectral_scan_trigger(struct ath11k *ar)
 	if (ar->spectral.mode == ATH11K_SPECTRAL_DISABLED)
 		return 0;
 
+	ar->spectral.is_primary = true;
+
 	ret = ath11k_wmi_vdev_spectral_enable(ar, arvif->vdev_id,
 					      ATH11K_WMI_SPECTRAL_TRIGGER_CMD_CLEAR,
 					      ATH11K_WMI_SPECTRAL_ENABLE_CMD_ENABLE);
@@ -585,6 +588,7 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	u8 chan_width_mhz, bin_sz;
 	int ret;
 	u32 check_length;
+	bool fragment_sample = false;
 
 	lockdep_assert_held(&ar->spectral.lock);
 
@@ -639,6 +643,13 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	case ATH11K_SPECTRAL_80MHZ:
 		fft_sample->chan_width_mhz = chan_width_mhz;
 		break;
+	case ATH11K_SPECTRAL_160MHZ:
+		if (ab->hw_params.spectral.fragment_160mhz) {
+			chan_width_mhz /= 2;
+			fragment_sample = true;
+		}
+		fft_sample->chan_width_mhz = chan_width_mhz;
+		break;
 	default:
 		ath11k_warn(ab, "invalid channel width %d\n", chan_width_mhz);
 		return -EINVAL;
@@ -663,6 +674,16 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 	freq = summary->meta.freq2;
 	fft_sample->freq2 = __cpu_to_be16(freq);
 
+	/* If freq2 is available then the spectral scan results are fragmented
+	 * as primary and secondary
+	 */
+	if (fragment_sample && freq) {
+		if (!ar->spectral.is_primary)
+			fft_sample->freq1 = freq;
+		/* We have to toggle the is_primary to handle the next report */
+		ar->spectral.is_primary = !ar->spectral.is_primary;
+	}
+
 	ath11k_spectral_parse_fft(fft_sample->data, fft_report->bins, num_bins,
 				  ab->hw_params.spectral.fft_sz);
 
diff --git a/drivers/net/wireless/ath/ath11k/spectral.h b/drivers/net/wireless/ath/ath11k/spectral.h
index 081744265f2a..96bfa16e18e9 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.h
+++ b/drivers/net/wireless/ath/ath11k/spectral.h
@@ -35,6 +35,7 @@ struct ath11k_spectral {
 	u16 count;
 	u8 fft_size;
 	bool enabled;
+	bool is_primary;
 };
 
 #ifdef CONFIG_ATH11K_SPECTRAL
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
