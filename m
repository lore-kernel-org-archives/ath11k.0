Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0CCC433F5
	for <ath11k@archiver.kernel.org>; Thu, 19 May 2022 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uzx2IOqxRkopp9Q6ACw49aA/AzAMp8jC8grhGvrGhrM=; b=MfXWp8hqaWXM/i
	r0p4r9sMIxT7y/Y6oIkkhEqqebpfHSUXUmsHqZ1Ng3+2NjKgdx4AxHEHVRLu3FjmKJpznfbCg6OsH
	ey7D+dOOq9IqthoOo+IwNUqjED8kPLNfvKj57AC1s4PGVAEG9sC5jb5R4DpuoDAauRgnF2Cgb7F5s
	imzttiPoWICeOUx9HvCICoi5tEDP8oq1QWLcAGWYlDBXfFa75pDj9H+FOZod5u6B/Y+j/Bv7IO3a9
	4QvvSQVGfRrabkhNmRCUJnIq7kK+F1WaqdZqBVTaa/CIPraSo3Od8eZaGDPN70w/A5ZOwmByp1QMN
	+AphVrnJOoZ4S0f/jyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrfnz-006rYd-EJ; Thu, 19 May 2022 13:03:03 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfjP-006ou8-8a
 for ath11k@lists.infradead.org; Thu, 19 May 2022 12:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652965099; x=1684501099;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=jYwDht3oXd+jf0z1KjRp0bFkmv9I/TqMmsa/01rrl6M=;
 b=AtGdAevyhAl+t2CQBdf1KCD0gdg4Go+3sMJGsCxJGb5YehjLXfrfMzSh
 WOpJ904IJY6OYBxGAReIonUuSkv0IXvzQDL5YTm/1BMKsYzTGSfKAjXH4
 ldcgFaRc1maZ/MQk6qDjoq3A4YwbOFaHToGJNX6OifCmqqUuxQUlXiVLI Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 19 May 2022 05:58:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 05:58:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 05:58:14 -0700
Received: from cdchalpyex0390930-lin.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 05:58:12 -0700
From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Thiraviyam Mariyappan
 <quic_tmariyap@quicinc.com>
Subject: [PATCH] ath11k: support avg signal in station dump
Date: Thu, 19 May 2022 18:27:41 +0530
Message-ID: <1652965061-30457-1-git-send-email-quic_tmariyap@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_055819_390207_3C5B00D9 
X-CRM114-Status: GOOD (  12.13  )
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

Currently mac80211 doesn't calculate average signal when RSS(Receive side
scaling) is enabled from the driver, so average signal isn't printed in
the station dump. To address this issue, calculate the average signal
from RSSI within driver and display in the station dump.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.h  | 4 ++++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +++
 drivers/net/wireless/ath/ath11k/mac.c   | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 95bca0b..ea31016 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -14,6 +14,7 @@
 #include <linux/dmi.h>
 #include <linux/ctype.h>
 #include <linux/rhashtable.h>
+#include <linux/average.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -464,6 +465,8 @@ struct ath11k_per_ppdu_tx_stats {
 	u32 retry_bytes;
 };
 
+DECLARE_EWMA(avg_rssi, 10, 8)
+
 struct ath11k_sta {
 	struct ath11k_vif *arvif;
 
@@ -482,6 +485,7 @@ struct ath11k_sta {
 	u64 rx_duration;
 	u64 tx_duration;
 	u8 rssi_comb;
+	struct ewma_avg_rssi avg_rssi;
 	s8 rssi_beacon;
 	s8 chain_signal[IEEE80211_MAX_CHAINS];
 	struct ath11k_htt_tx_stats *tx_stats;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 049774cc..e16beb9 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2765,6 +2765,9 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 	if (!rx_stats)
 		return;
 
+	arsta->rssi_comb = ppdu_info->rssi_comb;
+	ewma_avg_rssi_add(&arsta->avg_rssi, ppdu_info->rssi_comb);
+
 	num_msdu = ppdu_info->tcp_msdu_count + ppdu_info->tcp_ack_msdu_count +
 		   ppdu_info->udp_msdu_count + ppdu_info->other_msdu_count;
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ee1590b..362a07a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4479,6 +4479,7 @@ static int ath11k_mac_station_add(struct ath11k *ar,
 		}
 	}
 
+	ewma_avg_rssi_init(&arsta->avg_rssi);
 	return 0;
 
 free_tx_stats:
@@ -8161,6 +8162,9 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 		sinfo->signal = db2dbm ? signal : signal + ATH11K_DEFAULT_NOISE_FLOOR;
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 	}
+
+	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi) + ATH11K_DEFAULT_NOISE_FLOOR;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
 }
 
 #if IS_ENABLED(CONFIG_IPV6)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
