Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8E0C87FDD
	for <ath11k@archiver.kernel.org>; Thu,  8 Jun 2023 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mcy8ZI63HhjA1dDFx7Z0TWLaFVETFsuiIZZ2bZg8TKg=; b=2/Kx9/KLJRmsZd
	woB4pj9b7pL/HjBru5qnp4ETERAcmdFRBQ1a/c6/SV7Z61Kr0WsdUdmdotnJAOzsaWBOx1YAO2RfI
	qc/gOHBj509+OMg8OWK8IpliSNmuD5d4q78H7TsMBgTLOJ6NMPGZlf7ifOmw7yklLX/El/qrYXv0p
	5XCqKmdfqUfGTWQRhWEmOMjwVB8x/QhhGpzOPVER+e0PEyMkY8Um6UENHMFY/57wVk1iTC9AAa407
	kriwNnI9i5BZmy3YCJe/8eNlZWPPko2a8ppe2/O4iU5+ZXRQTsmQS1Bj20dm4fSA7AQhYh9nHh1Pv
	NnXEyhwaf2C6f9WJG7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q79lA-008LzK-1s;
	Thu, 08 Jun 2023 07:08:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q79l5-008Lvp-1l
	for ath11k@lists.infradead.org;
	Thu, 08 Jun 2023 07:08:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3584xTD8027888;
	Thu, 8 Jun 2023 07:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=BB3+lszmKQtAlx4U5sSVdW+Zu5pz4AUF2nLwLE014z4=;
 b=UjM8gulsTI7yVlJzxAifmiHnpWadWCBpiRwuhUtyp2HuvBZ8axjbvrk7+qpD9HKspois
 qvvhHTFYTIkYSTlxLe6t/CBExbYn2MApzGBx/QbzJ7xMXzdGgZ5NfUYbbiSLI2PvmLaf
 4lT3PejGAf2qd8RahLZepxEr3GIMv5okj9RnI/d1779/HPkeAoYacD7nS6bDEedMACSI
 CZY3TOopwK3Wz4JkXj4ajUi/y3VNh4gtaT5XZQkB4BGQHrdM3TIbxz14v21SRXxVlP/Y
 H+oVeyOnolrlkt8RgyMwT9fBgQldo6MACoWgUNIQjXUfBp83RxvEE7cA/kcxepVSMI9y gQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r36pdrbns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jun 2023 07:08:25 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35878OnE022291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Jun 2023 07:08:24 GMT
Received: from aarasahu-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 8 Jun 2023 00:08:22 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sathishkumar Muruganandam
	<quic_murugana@quicinc.com>,
        Aaradhana Sahu <quic_aarasahu@quicinc.com>
Subject: [PATCH v2 3/3] wifi: ath11k: add 802.3 undecap support to fix TKIP MIC error reporting
Date: Thu, 8 Jun 2023 12:37:54 +0530
Message-ID: <20230608070754.7161-4-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230608070754.7161-1-quic_aarasahu@quicinc.com>
References: <20230608070754.7161-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZF9eAxh2szP4A8ET45KbWwkdrmWrOexV
X-Proofpoint-ORIG-GUID: ZF9eAxh2szP4A8ET45KbWwkdrmWrOexV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_04,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306080058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_000835_695227_BB62FDE4 
X-CRM114-Status: GOOD (  16.73  )
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

From: Sathishkumar Muruganandam <quic_murugana@quicinc.com>

Currently DECAP_TYPE_8023 frames with TKIP MIC error is not undecaped
and hence fails to do TKIP MIC error reporting in ieee80211_rx_napi()
path.

Fix this by adding undecap support for ieee80211_rx_napi() to process
these frames and perform TKIP counter-measures when there is MIC error
reported.

Tested with STA triggering TKIP MIC error frames (using debugfs
"tkip_mic_test" in SW encryption mode) twice within a minute and
verify TKIP counter-measures are performed as expected.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 39 ++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 03eeb3dfbb15..ce14cb09b9c1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2143,6 +2143,42 @@ static void ath11k_dp_rx_h_undecap_eth(struct ath11k *ar,
 	ether_addr_copy(ieee80211_get_SA(hdr), sa);
 }
 
+static void ath11k_dp_rx_h_undecap_snap(struct ath11k *ar,
+					struct sk_buff *msdu,
+					u8 *first_hdr,
+					enum hal_encrypt_type enctype,
+					struct ieee80211_rx_status *status)
+{
+	struct ieee80211_hdr *hdr;
+	size_t hdr_len;
+	u8 l3_pad_bytes;
+	struct hal_rx_desc *rx_desc;
+
+	/* Delivered decapped frame:
+	 * [amsdu header] <-- replaced with 802.11 hdr
+	 * [rfc1042/llc]
+	 * [payload]
+	 */
+
+	rx_desc = (void *)msdu->data - sizeof(*rx_desc);
+	l3_pad_bytes = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
+
+	skb_put(msdu, l3_pad_bytes);
+	skb_pull(msdu, sizeof(struct ath11k_dp_amsdu_subframe_hdr) + l3_pad_bytes);
+
+	hdr = (struct ieee80211_hdr *)first_hdr;
+	hdr_len = ieee80211_hdrlen(hdr->frame_control);
+
+	if (!(status->flag & RX_FLAG_IV_STRIPPED)) {
+		memcpy(skb_push(msdu,
+				ath11k_dp_rx_crypto_param_len(ar, enctype)),
+		       (void *)hdr + hdr_len,
+			ath11k_dp_rx_crypto_param_len(ar, enctype));
+	}
+
+	memcpy(skb_push(msdu, hdr_len), hdr, hdr_len);
+}
+
 static void ath11k_dp_rx_h_undecap(struct ath11k *ar, struct sk_buff *msdu,
 				   struct hal_rx_desc *rx_desc,
 				   enum hal_encrypt_type enctype,
@@ -2189,7 +2225,8 @@ static void ath11k_dp_rx_h_undecap(struct ath11k *ar, struct sk_buff *msdu,
 						   enctype, status);
 		break;
 	case DP_RX_DECAP_TYPE_8023:
-		/* TODO: Handle undecap for these formats */
+		ath11k_dp_rx_h_undecap_snap(ar, msdu, first_hdr,
+					    enctype, status);
 		break;
 	}
 }
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
