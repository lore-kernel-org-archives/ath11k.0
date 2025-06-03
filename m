Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF5EC5AD49
	for <ath11k@archiver.kernel.org>; Tue,  3 Jun 2025 02:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vj1k61r/rKkCnbDgTyGOAryQPdF7b2vebfxYw9m7RGo=; b=iUHS640N64FIOr18/VR2tOpSZN
	NUvODn4mIlYZ43zVrj7/tU2Pd7XXW0E7aOS/n6JZo6snHwF6vPCHfDstAqKuSP4oFGy/jpY/gKMLG
	CYVBgzKJJh+Oy+L3h5KzeO8mpsA4jJZ+dfqSpG05TzcJOes5NWq6/X3qMwuAtRpYxhJMqi09j7QxU
	qafrIbtu3+X2phsjAD0ta/jmEc+Gm0Khs/4r6mXzYYUsUsNwqS5QBPwKMYJPTpLW20xuuYc2BGCqp
	4p++Ovj2GycToumrwhY9EvjmOkdv6ONcxa/3rsLEsK0ZJG1REpXNCpiBGbUxyQvYjQYqhNyxqdyWy
	sU8FiYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMHLx-00000009X1g-2dGt;
	Tue, 03 Jun 2025 02:26:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMHLv-00000009X1J-0jRU
	for ath11k@lists.infradead.org;
	Tue, 03 Jun 2025 02:26:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HKV1s012543;
	Tue, 3 Jun 2025 02:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vj1k61r/rKkCnbDgTyGOAr
	yQPdF7b2vebfxYw9m7RGo=; b=GQpxs7X0h87cRA9GhtgdfgyLyzDOPywYM38P2r
	FUf8WIJWekiqJmgRl3Yjv9pEWomA64TMl/yC2dYamijX0t8wyiptdzmv2LSTUEw6
	32gkcfjBUfbgtLXEQxJeWBPy5Bc2Hf9wgpjB+pQy3q6BjdFT5TX5LcZ9W9qANUZG
	LVek7nwAFj2NFZKkJ/bzN5QJAysVzPahZxXpCKIXsBQo9U8FMldOUDjLhCDc64pP
	eQH5fpuYwn4xwYtamm8SzPAjYsF/X6e9o39YgUx4fJQm2kZQI4soHoQaVXxJMV7+
	UZZSQVvlUQfU7PzkxxR4u6p1RR0riykKFqpMSmXNQTHCAQ2g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ss29f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 02:26:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5532Q6Oo019045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 02:26:06 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Jun 2025
 19:26:04 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Tue, 3 Jun 2025 10:25:28 +0800
Subject: [PATCH ath-next] wifi: ath11k: fix sleeping-in-atomic in
 ath11k_mac_op_set_bitrate_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-ath11k-use-non-atomic-iterator-v1-1-d75762068d56@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABddPmgC/5XNQQ6CMBAF0KuYrh3TFinUlfcwLmgZZGJotQWiM
 dzdCUvd6G5+Jv/9l8iYCLM4bF4i4UyZYuCgthvh+yZcEKjlLLTUpSwLCc3YK3WFKSOEGDjGgTz
 QiInPBK62lbRt6bt9LRi5JezosQ6cBHch4GMUZ/70lLnwXJdntf5/HZkVKDDWKYMNSpT6eJ/IU
 /A7H4cVn/V/oGZw3zrjnTSIpvwGi//AgsHCVbarKqtb9QEuy/IG+v6SIXoBAAA=
X-Change-ID: 20250530-ath11k-use-non-atomic-iterator-b89709d5cf48
To: Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yEYEXMIcVbDkkv04F8yM7rgx7GQ3DfxV
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=683e5d3f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=VvPa7mMQmCZPogn7yUkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yEYEXMIcVbDkkv04F8yM7rgx7GQ3DfxV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyMCBTYWx0ZWRfXxap40OA2TFd1
 k/uf2ZEgQfIRk+yrWykL9UBgGAqF648o8eecLgWZUjYsPQ59Af4Kj9GY7NCnSzMSgHLoxW1BZVJ
 64PEpYcR8RpvCt78HLllMZTVeOZf3Rrdg5Z5aslUjM+gpC3YH46PXAnROldCZYlQxUtgdEFSvVN
 E4ANr9AaZ888dHU+pZXwpjhf1B40ZNxNYbDDoCHT+dDfcUPsJ1C3d5/Cv09xaEDQZGQiagEKCUv
 vMLwj/0iMJV/xZZIdQJCq1rNJbh8tdmVu/Oco+9X9TS7PEMKk7fP1D8fHy1WeJeWpdbx5QSV347
 TTS2ZhgJBaHE5NXv8QqWvA3C3cNz3OfNRARTQVc5l7LHZc3B69YWrk9XMrDaMZPVvU9JQgUgTD2
 qs3okn5N7sDOH7dAMLadWYapCsyi3kBoFra7qfLMPbVOrdN4zq3HlUNhqKcFfuS++UO4rVOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=810 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_192611_283891_AB74BFD6 
X-CRM114-Status: GOOD (  10.80  )
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

ath11k_mac_disable_peer_fixed_rate() is passed as the iterator to
ieee80211_iterate_stations_atomic(). Note in this case the iterator is
required to be atomic, however ath11k_mac_disable_peer_fixed_rate() does
not follow it as it might sleep. Consequently below warning is seen:

BUG: sleeping function called from invalid context at wmi.c:304
Call Trace:
 <TASK>
 dump_stack_lvl
 __might_resched.cold
 ath11k_wmi_cmd_send
 ath11k_wmi_set_peer_param
 ath11k_mac_disable_peer_fixed_rate
 ieee80211_iterate_stations_atomic
 ath11k_mac_op_set_bitrate_mask.cold

Change to ieee80211_iterate_stations_mtx() to fix this issue.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 08d7b136851fabb0a1c1032abcf9c01550e9f4f5..068805daf5fa4e0894be4ea4e8f2e9f756cfdcd3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8740,9 +8740,9 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 			return ret;
 		}
-		ieee80211_iterate_stations_atomic(ar->hw,
-						  ath11k_mac_disable_peer_fixed_rate,
-						  arvif);
+		ieee80211_iterate_stations_mtx(ar->hw,
+					       ath11k_mac_disable_peer_fixed_rate,
+					       arvif);
 	} else if (ath11k_mac_bitrate_mask_get_single_nss(ar, arvif, band, mask,
 							  &single_nss)) {
 		rate = WMI_FIXED_RATE_NONE;
@@ -8809,9 +8809,9 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 		}
 
 		mutex_lock(&ar->conf_mutex);
-		ieee80211_iterate_stations_atomic(ar->hw,
-						  ath11k_mac_disable_peer_fixed_rate,
-						  arvif);
+		ieee80211_iterate_stations_mtx(ar->hw,
+					       ath11k_mac_disable_peer_fixed_rate,
+					       arvif);
 
 		arvif->bitrate_mask = *mask;
 		ieee80211_iterate_stations_atomic(ar->hw,

---
base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
change-id: 20250530-ath11k-use-non-atomic-iterator-b89709d5cf48

Best regards,
-- 
Baochen Qiang <quic_bqiang@quicinc.com>


