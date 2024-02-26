Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEBDC48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 21:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLri/+mCTqTZgvVwhFdKyztQ7pBz1bs9wWlBzJYoMss=; b=OUs2x7/8KIQyu8ZoPDy2k8F0t5
	cX7m3W9uJxzbQketerj4iHqhdigVmafR+6Ht13WzPTdA4278vudus48JByuZr8MLanm+mbi44gaD7
	UXwG+FxSW9+LD4pBkhayARbdhZuZeWHAyHOKHC+84tCIyZMksfXcz5u1peqjV89Z1wh9Rz77/iR/h
	DRBxYeFKitFV7D0GpzSh1xZO6aYjvBKiwQWl7s4pfeLjDKRONEGWvBiuldb3Z2pm8mGIQLTXpCmVc
	eWyR/cKL8nqAQ0IgKQqqqolxokq4q+qp63JqB+t3rJdOWf8hYXE3+QHLpdilfpFC7dBvz9L7kmPt7
	S86Sobhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rei7L-00000002c0B-3mCg;
	Mon, 26 Feb 2024 21:02:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rei7I-00000002bzP-24ya
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 21:02:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QGhw9s010029;
	Mon, 26 Feb 2024 21:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=iLr
	i/+mCTqTZgvVwhFdKyztQ7pBz1bs9wWlBzJYoMss=; b=jUmAv6cTScKEJe7tE6e
	9L2/OqPOfnItUQpB0RtSwU7OUDK3lnEv0AB93ZC0z7jwqVd2YgwPBmg3+Kv63y2l
	zA6RDUZEmif9wWKtlMF3v2qTeBC8xtbckkygUrbkjTv1rL+a8Xa3w3FEsn+tUEnJ
	ATwxSWVI0lABJyjNlU0/pz8MSBtD5GTlVhjSVQiLvzoCddGSrNoAVNmBh2Vgh/2n
	Q6aCMl6TS2L+7VAn8Mnb6U4GbJmssJO/ihzb8AZ8sGwEfhIi29xWBAQlKztvbUvP
	ENTv3dLlS0ID0Q66sMVFfPxyZZiTL4TRVRgjbbJbqySY4z1XKjn6zOHSy/3AkOa7
	0rA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxpa2sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 21:02:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QL1ujA019544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 21:02:08 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 13:01:56 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 26 Feb 2024 13:01:56 -0800
Subject: [PATCH] wifi: ath11k: remove obsolete struct wmi_start_scan_arg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240226-ath11k-obsolete-wmi_start_scan_arg-v1-1-c0b94c6e191d@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEP83GUC/5WNSw7CIBQAr9Kw9hmgH4wr72GaBumjfdGCAlZN0
 7uLvYHLmcXMwiIGwsiOxcICzhTJuwxiVzAzajcgUJ+ZSS4rLmUDOo1CXMFfor9hQnhN1MWkQ+q
 i0a7TYQBVN6q3kltbc5ZD94CW3tvk3GYeKSYfPttzFj/7V34WIKBWtsSyVLo6NKfHkww5szd+Y
 u26rl9CPJ0A1gAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NnjY68zs3LXtfQYj2si6rPjfB-AGIKm9
X-Proofpoint-GUID: NnjY68zs3LXtfQYj2si6rPjfB-AGIKm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=707 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_130229_219656_AE774E5B 
X-CRM114-Status: GOOD (  11.14  )
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

ath11k inherited struct wmi_start_scan_arg from ath10k. However, in
ath11k, this struct is unused -- struct scan_req_params is used for
this functionality. So remove the unused struct.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index bb419e3abb00..1c980f56bc72 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_WMI_H
@@ -3444,34 +3444,6 @@ struct wmi_bssid_arg {
 	const u8 *bssid;
 };
 
-struct wmi_start_scan_arg {
-	u32 scan_id;
-	u32 scan_req_id;
-	u32 vdev_id;
-	u32 scan_priority;
-	u32 notify_scan_events;
-	u32 dwell_time_active;
-	u32 dwell_time_passive;
-	u32 min_rest_time;
-	u32 max_rest_time;
-	u32 repeat_probe_time;
-	u32 probe_spacing_time;
-	u32 idle_time;
-	u32 max_scan_time;
-	u32 probe_delay;
-	u32 scan_ctrl_flags;
-
-	u32 ie_len;
-	u32 n_channels;
-	u32 n_ssids;
-	u32 n_bssids;
-
-	u8 ie[WLAN_SCAN_PARAMS_MAX_IE_LEN];
-	u32 channels[64];
-	struct wmi_ssid_arg ssids[WLAN_SCAN_PARAMS_MAX_SSID];
-	struct wmi_bssid_arg bssids[WLAN_SCAN_PARAMS_MAX_BSSID];
-};
-
 #define WMI_SCAN_STOP_ONE       0x00000000
 #define WMI_SCN_STOP_VAP_ALL    0x01000000
 #define WMI_SCAN_STOP_ALL       0x04000000

---
base-commit: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
change-id: 20240226-ath11k-obsolete-wmi_start_scan_arg-7567df20ff50


