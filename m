Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4167C54E5D
	for <ath11k@archiver.kernel.org>; Tue, 19 Mar 2024 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMFBeZQTuSPsgqZSPdzjXle+l2WA8LLIZJdlK1WSXaU=; b=LXhhI+m2q2AZz4sp8yD5kl4Nwj
	WOykW5M7xcD874rP0jN8/JCl6n8+tVbDQV6WQ5V117zHAQlIi6glc17dKoZCLgckfIIY51ORxvaga
	Q39gz3TGw82t4OFSGE06a8A/NZjKxviXuMfE4jlVcfTDa1UB71JnfZNT6m0kcKOnhYUVzz3sXRA5G
	ozpbyC1SBxSPiwfRN/N2jSQU0prFi/P3U50yRXPqlWIJ1OFP8nq2JgS+SGKY3EaxyQ41lWQUOz5LQ
	BqhBToO0vO7XEfx+EimKrD6VMciYqtC7TfmI4rBWiDI0tna24gNbqilPxeGSQ40W73jbt/X6c0WaE
	tiHFMX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZmX-0000000CqnC-0tmM;
	Tue, 19 Mar 2024 13:45:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZmV-0000000Cqm8-0erj
	for ath11k@lists.infradead.org;
	Tue, 19 Mar 2024 13:45:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J4sZml025022;
	Tue, 19 Mar 2024 13:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=iMFBeZQ
	TuSPsgqZSPdzjXle+l2WA8LLIZJdlK1WSXaU=; b=N84lw45rZoT7hICvlb1US9Z
	uHJwkjfAX1T2XLfppJu7Vaj3Xq73/YsypaZ9sK3+rlplSjso5zRz/7xlzwjdDd5L
	S1oqby27FsHMcH6Nt5y8GgK2Uf8tCekhKe2FWL8oTEGCimQvPJBQr6RUKQJMgU4g
	cTBqnsUnrvy/mXdyp6OpK1nGZXSfjdBLlbwkhzmajAcwUx7+v1uBwJgVmPiAVPfn
	mBnvJ3g0DaZl8TNIZ8tlOTR00dTlMxuDz54s/tnSCRCD7KJ/ouURPHQyRGtgEvCF
	ORfHk/JD4MwgHGY2yP5qLkX4vsznbQR0aeCEWl0vOL5HaZ/sG4h1Nv5yJ9+CqnQ=
	=
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy2ea19rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42JDjPDY031303;
	Tue, 19 Mar 2024 13:45:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ww4gkbeyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42JDjPtd031286;
	Tue, 19 Mar 2024 13:45:25 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-haric-blr.qualcomm.com [10.131.39.39])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42JDjPZL031282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 13:45:25 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 3844793)
	id 6D1B341355; Tue, 19 Mar 2024 19:15:24 +0530 (+0530)
From: Hari Chandrakanthan <quic_haric@quicinc.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>
Subject: [PATCH v2 1/2] wifi: cfg80211/mac80211: Add support to rx retry stats
Date: Tue, 19 Mar 2024 19:15:21 +0530
Message-Id: <20240319134522.4021062-2-quic_haric@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319134522.4021062-1-quic_haric@quicinc.com>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oJMTSvl3IaeLMe3OHZm3bkVLuwyRrNZv
X-Proofpoint-GUID: oJMTSvl3IaeLMe3OHZm3bkVLuwyRrNZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_03,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_064531_229241_9AAB7A7D 
X-CRM114-Status: GOOD (  14.98  )
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
It denotes the number of data frames(MPDUs) with rx retry bit set.

The rx retry stats helps in understanding the medium
during UL transmission.

The counting logic of rx retry stats in the mac80211 rx path accounts the
data frames for which decap is not offloaded.

Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
---
v2:
Added mac80211 support to count the rx retry stats
---
 include/net/cfg80211.h       | 2 ++
 include/uapi/linux/nl80211.h | 3 +++
 net/mac80211/rx.c            | 6 ++++++
 net/mac80211/sta_info.c      | 5 +++++
 net/mac80211/sta_info.h      | 1 +
 net/wireless/nl80211.c       | 1 +
 6 files changed, 18 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 2e2be4fd2bb6..21400bcc0646 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -2049,6 +2049,7 @@ struct cfg80211_tid_stats {
  * @rxrate: current unicast bitrate to this station
  * @rx_packets: packets (MSDUs & MMPDUs) received from this station
  * @tx_packets: packets (MSDUs & MMPDUs) transmitted to this station
+ * @rx_retries: number of rx packets(MPDUs) from this station with retry bit set.
  * @tx_retries: cumulative retry counts (MPDUs)
  * @tx_failed: number of failed transmissions (MPDUs) (retries exceeded, no ACK)
  * @rx_dropped_misc:  Dropped for un-specified reason.
@@ -2129,6 +2130,7 @@ struct station_info {
 	struct rate_info rxrate;
 	u32 rx_packets;
 	u32 tx_packets;
+	u32 rx_retries;
 	u32 tx_retries;
 	u32 tx_failed;
 	u32 rx_dropped_misc;
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index f23ecbdd84a2..2e31909bf8af 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -3885,6 +3885,8 @@ enum nl80211_sta_bss_param {
  *	of STA's association
  * @NL80211_STA_INFO_CONNECTED_TO_AS: set to true if STA has a path to a
  *	authentication server (u8, 0 or 1)
+ * @NL80211_STA_INFO_RX_RETRIES: number of rx packets(MPDUs) from this station
+ *	with retry bit set (u32)
  * @__NL80211_STA_INFO_AFTER_LAST: internal
  * @NL80211_STA_INFO_MAX: highest possible station info attribute
  */
@@ -3933,6 +3935,7 @@ enum nl80211_sta_info {
 	NL80211_STA_INFO_AIRTIME_LINK_METRIC,
 	NL80211_STA_INFO_ASSOC_AT_BOOTTIME,
 	NL80211_STA_INFO_CONNECTED_TO_AS,
+	NL80211_STA_INFO_RX_RETRIES,
 
 	/* keep last */
 	__NL80211_STA_INFO_AFTER_LAST,
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index c1f850138405..f8d408ac6742 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3191,6 +3191,9 @@ ieee80211_rx_h_data(struct ieee80211_rx_data *rx)
 	if (!ieee80211_frame_allowed(rx, fc))
 		return RX_DROP_MONITOR;
 
+	if (ieee80211_has_retry(hdr->frame_control) && rx->sta)
+		rx->link_sta->rx_stats.rx_retries++;
+
 	/* directly handle TDLS channel switch requests/responses */
 	if (unlikely(((struct ethhdr *)rx->skb->data)->h_proto ==
 						cpu_to_be16(ETH_P_TDLS))) {
@@ -4976,6 +4979,9 @@ static bool ieee80211_invoke_fast_rx(struct ieee80211_rx_data *rx,
 		goto drop;
 	}
 
+	if (ieee80211_has_retry(hdr->frame_control) && rx->sta)
+		rx->link_sta->rx_stats.rx_retries++;
+
 	ieee80211_rx_8023(rx, fast_rx, orig_len);
 
 	return true;
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index da5fdd6f5c85..b04092b6ea64 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -2653,6 +2653,11 @@ void sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
 	}
 
+	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_RX_RETRIES))) {
+		sinfo->rx_retries = sta->deflink.rx_stats.rx_retries;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_RETRIES);
+	}
+
 	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_TX_FAILED))) {
 		sinfo->tx_failed = sta->deflink.status_stats.retry_failed;
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
diff --git a/net/mac80211/sta_info.h b/net/mac80211/sta_info.h
index a52fb76386d0..a4c47e3f0d5a 100644
--- a/net/mac80211/sta_info.h
+++ b/net/mac80211/sta_info.h
@@ -436,6 +436,7 @@ struct ieee80211_sta_rx_stats {
 	struct u64_stats_sync syncp;
 	u64 bytes;
 	u64 msdu[IEEE80211_NUM_TIDS + 1];
+	u32 rx_retries;
 };
 
 /*
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index b4edba6b0b7b..fb643d3061c5 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -6626,6 +6626,7 @@ static int nl80211_send_station(struct sk_buff *msg, u32 cmd, u32 portid,
 
 	PUT_SINFO(RX_PACKETS, rx_packets, u32);
 	PUT_SINFO(TX_PACKETS, tx_packets, u32);
+	PUT_SINFO(RX_RETRIES, rx_retries, u32);
 	PUT_SINFO(TX_RETRIES, tx_retries, u32);
 	PUT_SINFO(TX_FAILED, tx_failed, u32);
 	PUT_SINFO(EXPECTED_THROUGHPUT, expected_throughput, u32);
-- 
2.34.1


