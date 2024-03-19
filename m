Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E128C54E5D
	for <ath11k@archiver.kernel.org>; Tue, 19 Mar 2024 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQFx2OUsNi7a3yBPHysolSPdvNgpM939e+P8DENsLjQ=; b=meD3LJ+CQ6TKXdKKipUo4BZ8pH
	H8aZcKB5ANH4YJh9O668pi5u5fp9swnFoTbSOvem9L8rDaL8T/2T9vMm6wNTIRPyNMVswAJADejHI
	5UMyA+nCGm02aDG9IRkwlvjWfNJalIE2PgQtiUAGuPO/P17tAC++p6vmch0ZrtMMlQI7oetRJF0P+
	5Au9AmthE/D20OgN50pO/ZrbFAuRCtMBPpN34VxeJhe5L5w+ni9WtvjPtMsK+LAvxdzrYSdM3EJps
	biWT1KlGIKxAI6PFokkRu8YmhLiyKLcUx72E7vHKZ3E/hEPm4tCjPJ/zZRzw5mF/Eug/flCbZWx84
	9k/ESjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZma-0000000CqoL-0sK1;
	Tue, 19 Mar 2024 13:45:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZmV-0000000CqmC-3kJN
	for ath11k@lists.infradead.org;
	Tue, 19 Mar 2024 13:45:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J4Q8iu029011;
	Tue, 19 Mar 2024 13:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=AQFx2OU
	sNi7a3yBPHysolSPdvNgpM939e+P8DENsLjQ=; b=es/EYNT1invHP0PjeIbIXaQ
	Tb4SwLKP061k+vfQkKNs+ZnkrtrndoTLoQkyOB6Y8e8JropXzpUsnQB9A0EkOKp0
	QWcZjd+E23K3DhHQ3TFPZvm9daP3HdNWthM4XRoKxrtJKnSfTLlenuU9OuuhcKKt
	19r43z4y5ADRNppgCHhRXKbboUfYvhph+k+4DUDO0JxkfuXr6MiyHqQhWEY8ZY13
	RSg/1mbghYMIVjkjBHxtwhhZrqYTxJRPCp7fk5qpvqlFe+jBVkQquuBsmtsh5rRo
	oeLA65atoueW/BVqJqhNfKe1gPZ4AvGsQizeq30jV/n+HsbPidaxZonwUfQ9+Hg=
	=
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy2cjsbbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42JDjQhm031321;
	Tue, 19 Mar 2024 13:45:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ww4gkbf05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42JDjQSk031313;
	Tue, 19 Mar 2024 13:45:26 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-haric-blr.qualcomm.com [10.131.39.39])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42JDjPiV031311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:26 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 3844793)
	id 54F4241330; Tue, 19 Mar 2024 19:15:25 +0530 (+0530)
From: Hari Chandrakanthan <quic_haric@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>
Subject: [PATCH v2 2/2] wifi: ath12k: Add support to rx retry stats
Date: Tue, 19 Mar 2024 19:15:22 +0530
Message-Id: <20240319134522.4021062-3-quic_haric@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319134522.4021062-1-quic_haric@quicinc.com>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kycZQHAjaQyp-i0Zb1hvEJeeo0kokrvy
X-Proofpoint-GUID: kycZQHAjaQyp-i0Zb1hvEJeeo0kokrvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_03,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403140001 definitions=main-2403190105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_064532_071291_774F53D7 
X-CRM114-Status: GOOD (  15.13  )
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
v2: Rebased the patch
---
 drivers/net/wireless/ath/ath12k/core.h   | 1 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++++++
 drivers/net/wireless/ath/ath12k/hal_rx.h | 7 ++++++-
 drivers/net/wireless/ath/ath12k/mac.c    | 3 +++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 97e5a0ccd233..8ffa9feb58d9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -425,6 +425,7 @@ struct ath12k_sta {
 	struct ath12k_rx_peer_stats *rx_stats;
 	struct ath12k_wbm_tx_stats *wbm_tx_stats;
 	u32 bw_prev;
+	u32 rx_retries;
 };
 
 #define ATH12K_MIN_5G_FREQ 4150
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 2d56913a75d0..eb2f156b3e82 100644
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
@@ -785,6 +787,9 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 			ppdu_info->userid = userid;
 			ppdu_info->ampdu_id[userid] =
 				u32_get_bits(info[0], HAL_RX_MPDU_START_INFO1_PEERID);
+			ppdu_info->userstats[userid].mpdu_retry =
+				info[3] & HAL_RX_MPDU_START_INFO3_MPDU_RETRY;
+
 		}
 
 		mon_mpdu = kzalloc(sizeof(*mon_mpdu), GFP_ATOMIC);
@@ -2209,6 +2214,8 @@ static void ath12k_dp_mon_rx_update_peer_su_stats(struct ath12k *ar,
 	struct ath12k_rx_peer_stats *rx_stats = arsta->rx_stats;
 	u32 num_msdu;
 
+	arsta->rx_retries  += ppdu_info->mpdu_retry;
+
 	if (!rx_stats)
 		return;
 
@@ -2378,6 +2385,7 @@ ath12k_dp_mon_rx_update_user_stats(struct ath12k *ar,
 
 	arsta = ath12k_sta_to_arsta(peer->sta);
 	rx_stats = arsta->rx_stats;
+	arsta->rx_retries = user_stats->mpdu_retry;
 
 	if (!rx_stats)
 		return;
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index 095216eabc01..ea2b89896abd 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -143,6 +143,7 @@ struct hal_rx_user_status {
 	u32 mpdu_fcs_ok_bitmap[HAL_RX_NUM_WORDS_PER_PPDU_BITMAP];
 	u32 mpdu_ok_byte_count;
 	u32 mpdu_err_byte_count;
+	bool mpdu_retry;
 };
 
 #define HAL_MAX_UL_MU_USERS	37
@@ -230,6 +231,7 @@ struct hal_rx_mon_ppdu_info {
 	bool first_msdu_in_mpdu;
 	bool is_ampdu;
 	u8 medium_prot_type;
+	bool mpdu_retry;
 };
 
 #define HAL_RX_PPDU_START_INFO0_PPDU_ID		GENMASK(15, 0)
@@ -447,10 +449,13 @@ struct hal_rx_phyrx_rssi_legacy_info {
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
index 52a5fb8b03e9..f050c5079e80 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7467,6 +7467,9 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->txrate.flags = arsta->txrate.flags;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
 
+	sinfo->rx_retries = arsta->rx_retries;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_RETRIES);
+
 	/* TODO: Use real NF instead of default one. */
 	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
-- 
2.34.1


