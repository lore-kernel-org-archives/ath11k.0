Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B7DC7618B
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=51v3wiDctZKcWzFEnZQ/ABugBZTqp1zIjVEcjbgP8wc=; b=bQePDre49A1mFn
	MH37OqHWhWqgcREsDUnDD6NVlh1QVdwreeZ/TOr0w+sLP1WZkvu3pv/kKCK2rZH+sEQ3wPRuQZ/me
	eqBSPj+Q3UyrxQ9M/XVKi22D+3c0IehjHHs9egRBwebreUubtm8l5UOZUbjGikxruQv0/H6taCPOZ
	rLNxB+QNv3APf9n4HR5owHfgiPniiU1rfXk1ebFZHn8p094cJMNV5voTFMQ6xNO6O8OWTq7qEa28V
	/nDCfr2uxLaCosEnv0jWkkr8IvsTHqApXbommLeI3jlCqy4EbFNkHqDhU3VxHXr19DJYgZj4LrUkH
	iqEbnvVPzBZmPdP6T9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPCB-00DB5m-17;
	Wed, 15 Mar 2023 11:21:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPC8-00DB4m-2f
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 11:21:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FALWEN020426;
	Wed, 15 Mar 2023 11:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=mk0gViEScbC7HRTZi71iZA9jTnxSr2RtgBhSccdKyV0=;
 b=h/LlMfeFd5GaN4q2rMQYA8TmoEmGyFG2dwA+G6tz6F26hFt6Ua7kgaJR2juoxdWlbMot
 ZWHNnz5fHNTG2nQwf8hDy2/oUeNcIJeJsil0+/V4hS2Qe8Y8VAPpA75HfzIifEvhmbZL
 VdlyiTvMqPojgEgWFgfq7HUFFy9zkflcu0CyC/lpak4Gybs6vTYAk5yAFfSpYHII2qUh
 Zbz8SelxTWz+oDzMbx7jXktDnHNPJjzOvFlx7e010E+wHKanrbjbW2rPpKDrspXpUwXt
 LrYdKxmkOyeGug12oE7BOgkhBa24cZ6pXVdvd4p+F/EDjj20HoCOexOmCvLpNzWWP8Lh JA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pb2c5sar7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 11:21:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32FBLN4C025353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 11:21:23 GMT
Received: from hu-mpubbise-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 04:21:21 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH v3] wifi: ath11k: Optimize 6 GHz scan time
Date: Wed, 15 Mar 2023 16:51:03 +0530
Message-ID: <20230315112103.18426-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zNVjKvB6kUm7DWQIRqyqvWyiZw1m_3vJ
X-Proofpoint-GUID: zNVjKvB6kUm7DWQIRqyqvWyiZw1m_3vJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_05,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_042124_887032_FF7F80B7 
X-CRM114-Status: GOOD (  23.65  )
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

Currently, time taken to scan all supported channels on WCN6750
is ~8 seconds and connection time is almost 10 seconds. WCN6750
supports three Wi-Fi bands (i.e., 2.4/5/6 GHz) and the numbers of
channels for scan come around ~100 channels (default case).
Since the chip doesn't have support for DBS (Dual Band Simultaneous),
scans cannot be parallelized resulting in longer scan times.

Among the 100 odd channels, ~60 channels are in 6 GHz band. Therefore,
optimizing the scan for 6 GHz channels will bring down the overall
scan time.

WCN6750 firmware has support to scan a 6 GHz channel based on co-located
AP information i.e., RNR IE which is found in the legacy 2.4/5 GHz scan
results. When a scan request with all supported channel list is enqueued
to the firmware, then based on WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND
scan channel flag, firmware will scan only those 6 GHz channels for which
RNR IEs are found in the legacy scan results.

In the proposed design, based on NL80211_SCAN_FLAG_COLOCATED_6GHZ scan
flag, driver will set the WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND flag
for non-PSC channels. Since there is high probability to find 6 GHz APs
on PSC channels, these channels are always scanned. Only non-PSC channels
are selectively scanned based on cached RNR information from the legacy
scan results.

If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set in the scan flags,
then scan will happen on all supported channels (default behavior).

With these optimizations, scan time is improved by 1.5-1.8 seconds on
WCN6750. Similar savings have been observed on WCN6855.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
V3:
 - Rebased on ToT

V2:
 - Rebased on ToT

 drivers/net/wireless/ath/ath11k/mac.c | 25 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.h |  4 ++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cad832e0e6b8..ce5a7a912a10 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3819,8 +3819,29 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 			goto exit;
 		}
 
-		for (i = 0; i < arg->num_chan; i++)
-			arg->chan_list[i] = req->channels[i]->center_freq;
+		for (i = 0; i < arg->num_chan; i++) {
+			if (test_bit(WMI_TLV_SERVICE_SCAN_CONFIG_PER_CHANNEL,
+				     ar->ab->wmi_ab.svc_map)) {
+				arg->chan_list[i] =
+					u32_encode_bits(req->channels[i]->center_freq,
+							WMI_SCAN_CONF_PER_CH_CHANNEL_MASK);
+
+				/* If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set in scan
+				 * flags, then scan all PSC channels in 6 GHz band and
+				 * those non-PSC channels where RNR IE is found during
+				 * the legacy 2.4/5 GHz scan.
+				 * If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set,
+				 * then all channels in 6 GHz will be scanned.
+				 */
+				if (req->channels[i]->band == NL80211_BAND_6GHZ &&
+				    req->flags & NL80211_SCAN_FLAG_COLOCATED_6GHZ &&
+				    !cfg80211_channel_is_psc(req->channels[i]))
+					arg->chan_list[i] |=
+						WMI_SCAN_CH_FLAG_SCAN_ONLY_IF_RNR_FOUND;
+			} else {
+				arg->chan_list[i] = req->channels[i]->center_freq;
+			}
+		}
 	}
 
 	if (req->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b23b7a22bc9a..dddd279233ec 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2100,6 +2100,7 @@ enum wmi_tlv_service {
 
 	/* The second 128 bits */
 	WMI_MAX_EXT_SERVICE = 256,
+	WMI_TLV_SERVICE_SCAN_CONFIG_PER_CHANNEL = 265,
 	WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT = 281,
 	WMI_TLV_SERVICE_BIOS_SAR_SUPPORT = 326,
 
@@ -3249,6 +3250,9 @@ struct  wmi_start_scan_cmd {
 #define WMI_SCAN_DWELL_MODE_SHIFT        21
 #define WMI_SCAN_FLAG_EXT_PASSIVE_SCAN_START_TIME_ENHANCE   0x00000800
 
+#define WMI_SCAN_CONF_PER_CH_CHANNEL_MASK	GENMASK(19, 0)
+#define WMI_SCAN_CH_FLAG_SCAN_ONLY_IF_RNR_FOUND	BIT(20)
+
 enum {
 	WMI_SCAN_DWELL_MODE_DEFAULT      = 0,
 	WMI_SCAN_DWELL_MODE_CONSERVATIVE = 1,

base-commit: 3df3715e556027e94246b2cb30986563362a65f4
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
