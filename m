Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE40C4829F
	for <ath11k@archiver.kernel.org>; Mon, 12 Feb 2024 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8soSSzkgxzMOtfDPGq+qqFXZ3HwUjc8P5QzDgdW/wU=; b=sXrexFgMdmlvKvQ/qiyIjSxWec
	sIBlJkV1rZOswQN37uD1OrQMAIk2ODWvyJXyJM4FswAesTU9e5ux8w1IPtORNMvmrncNgzv2dFxL4
	muYeMQzu50xFJAjmiQR+ZKBRwWKF/8W5SN1TdOa7kECV/L1/9PcUIz41aWAmHYxgbcWmoakgnIko0
	iXsHoFfB+/jlIJOKx191yjzo1sdQtHsrflhQaejDcV+xRz8n+c4+nvI2YZR0bU+GZbyl62YUJKw4d
	NXi4J2wurbGYTCHqUAMBd+YmkI64pORjaWILEcEYIPrbpHMVh7XJfii5aQXV9fRJrjipfU5n3N9RG
	0yxZ3wBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVEh-00000005Elm-0kUg;
	Mon, 12 Feb 2024 12:16:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVEd-00000005EkT-3GmX
	for ath11k@lists.infradead.org;
	Mon, 12 Feb 2024 12:16:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41C8P6Af022995;
	Mon, 12 Feb 2024 12:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=h8soSSz
	kgxzMOtfDPGq+qqFXZ3HwUjc8P5QzDgdW/wU=; b=FB7AIb3KWUtAcw6MJUfd9pa
	rj47Y4OCRq+MPVJe/nRdJHtydqe5uhaUxBXMgTxRGvhAFasShFa+D12N2HhOgIIk
	v6BuRTAeAnbKMjGnxzXb36ZUzmbpL0H2WwSFSSGZqijO6E2L9A/STsQkiu2SO0zq
	B64VgnBBtaKdLcHFEuGg4/Z7fae6bofyW3FnUlY/TcgClaFcqJtNLA18dmVV8dUV
	U/Rp2sdqrezWlpwGM7qki3g5VAx5J/GTCHQJ/ruYVOX1OFwDepzF+t9YyIkMGVwi
	1R1cYxr4kOZSSA+nET9v7f5bI0PqgEli6zzSY9e9tgGj4mCZQ47mK/N+R6tJAEg=
	=
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62n038mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:16:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 41CCGRUh002191;
	Mon, 12 Feb 2024 12:16:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3w627kpp89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:16:27 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41CCGRgQ002185;
	Mon, 12 Feb 2024 12:16:27 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-haric-blr.qualcomm.com [10.131.39.39])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41CCGRsS002184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:16:27 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 3844793)
	id 777FF41211; Mon, 12 Feb 2024 17:46:26 +0530 (+0530)
From: Hari Chandrakanthan <quic_haric@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: Add support to rx retry stats
Date: Mon, 12 Feb 2024 17:46:16 +0530
Message-Id: <20240212121616.3683197-3-quic_haric@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212121616.3683197-1-quic_haric@quicinc.com>
References: <20240212121616.3683197-1-quic_haric@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9kvly-GOMiBgrRci8xiFzI9FC8Ykaq98
X-Proofpoint-ORIG-GUID: 9kvly-GOMiBgrRci8xiFzI9FC8Ykaq98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_09,2024-02-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_041631_851383_6A5FFFB2 
X-CRM114-Status: GOOD (  14.38  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add support to count station level rx retries.
It denotes the number of data frames(MPDUs) received with rx retry bit
set.

The rx retry stats helps in understanding the medium during
UL transmission.

Tested-on: QCN9274 hw1.0 PCI WLAN.WBE.1.2.1-00148-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h   | 1 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 7 +++++++
 drivers/net/wireless/ath/ath12k/hal_rx.h | 7 ++++++-
 drivers/net/wireless/ath/ath12k/mac.c    | 3 +++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 6dbe817d2ec7..9a73c90818a0 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -415,6 +415,7 @@ struct ath12k_sta {
 	struct ath12k_rx_peer_stats *rx_stats;
 	struct ath12k_wbm_tx_stats *wbm_tx_stats;
 	u32 bw_prev;
+	u32 rx_retries;
 };
 
 #define ATH12K_MIN_5G_FREQ 4150
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f44bc5494ce7..aa46661bc1c0 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -774,9 +774,11 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 		u16 peer_id;
 
 		info[1] = __le32_to_cpu(mpdu_start->info1);
+		info[3] = __le32_to_cpu(mpdu_start->info3);
 		peer_id = u32_get_bits(info[1], HAL_RX_MPDU_START_INFO1_PEERID);
 		if (peer_id)
 			ppdu_info->peer_id = peer_id;
+		ppdu_info->mpdu_retry = info[3] & HAL_RX_MPDU_START_INFO3_MPDU_RETRY;
 
 		ppdu_info->mpdu_len += u32_get_bits(info[1],
 						    HAL_RX_MPDU_START_INFO2_MPDU_LEN);
@@ -785,6 +787,8 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 			ppdu_info->userid = userid;
 			ppdu_info->ampdu_id[userid] =
 				u32_get_bits(info[0], HAL_RX_MPDU_START_INFO1_PEERID);
+			ppdu_info->userstats[userid].mpdu_retry = info[3] & HAL_RX_MPDU_START_INFO3_MPDU_RETRY;
+
 		}
 
 		mon_mpdu = kzalloc(sizeof(*mon_mpdu), GFP_ATOMIC);
@@ -2207,6 +2211,8 @@ static void ath12k_dp_mon_rx_update_peer_su_stats(struct ath12k *ar,
 	struct ath12k_rx_peer_stats *rx_stats = arsta->rx_stats;
 	u32 num_msdu;
 
+	arsta->rx_retries  += ppdu_info->mpdu_retry;
+
 	if (!rx_stats)
 		return;
 
@@ -2376,6 +2382,7 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k *ar,
 
 	arsta = ath12k_sta_to_arsta(peer->sta);
 	rx_stats = arsta->rx_stats;
+	arsta->rx_retries = user_stats->mpdu_retry;
 
 	if (!rx_stats)
 		return;
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index fcfb6c819047..da195c815db8 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -142,6 +142,7 @@ struct hal_rx_user_status {
 	u32 mpdu_fcs_ok_bitmap[HAL_RX_NUM_WORDS_PER_PPDU_BITMAP];
 	u32 mpdu_ok_byte_count;
 	u32 mpdu_err_byte_count;
+	bool mpdu_retry;
 };
 
 #define HAL_MAX_UL_MU_USERS	37
@@ -229,6 +230,7 @@ struct hal_rx_mon_ppdu_info {
 	bool first_msdu_in_mpdu;
 	bool is_ampdu;
 	u8 medium_prot_type;
+	bool mpdu_retry;
 };
 
 #define HAL_RX_PPDU_START_INFO0_PPDU_ID		GENMASK(15, 0)
@@ -446,10 +448,13 @@ struct hal_rx_phyrx_rssi_legacy_info {
 #define HAL_RX_MPDU_START_INFO0_PPDU_ID	GENMASK(31, 16)
 #define HAL_RX_MPDU_START_INFO1_PEERID	GENMASK(31, 16)
 #define HAL_RX_MPDU_START_INFO2_MPDU_LEN GENMASK(13, 0)
+#define HAL_RX_MPDU_START_INFO3_MPDU_RETRY	BIT(19)
 struct hal_rx_mpdu_start {
 	__le32 info0;
 	__le32 info1;
-	__le32 rsvd1[11];
+	__le32 rsvd1[8];
+	__le32 info3;
+	__le32 rsvd3[2];
 	__le32 info2;
 	__le32 rsvd2[9];
 } __packed;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index fc0d14ea328e..fed46b9fdd72 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7078,6 +7078,9 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	/* TODO: Use real NF instead of default one. */
 	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
+
+	sinfo->rx_retries = arsta->rx_retries;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_RETRIES);
 }
 
 static const struct ieee80211_ops ath12k_ops = {
-- 
2.34.1


