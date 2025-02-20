Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132F9C021B3
	for <ath11k@archiver.kernel.org>; Thu, 20 Feb 2025 08:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1iFork7j2hg7VLmFMpe/3lFQMlw/jVPX9BgSr0jDd4=; b=Rx5NrBV323n7R/7o65Jz9lx1Nm
	sOzYpoakslUuwzDV/Lf0xEK0k91+gtzjjosolLXnvHExxv4LYh0dNTRHHCtAgSRw9cMeilg9M78yL
	fZBLpstz0uFIZW9v4x/kVmO/07OYP6/j8Sl2AlvVJzUPQqOdwQaRzJPtdR72Gi1DOyPqQgy/2UJgh
	XJLMv+ts07KlubJPL2PIKA2O4+WCT1U02OkXlSkzDTZAdAUZgR7MBPLzr4rrMHgAkoR4WnNBDT50s
	YezkXBCLSxR8pbkS+lehngLUFSrCO+LonUON3v7SeYiksRgMiyUyLa5ZxObumOeDGNDd6YVCe1oKh
	TpbGX28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1rk-0000000HLmj-31S3;
	Thu, 20 Feb 2025 08:25:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1rh-0000000HLlp-3pfY
	for ath11k@lists.infradead.org;
	Thu, 20 Feb 2025 08:25:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6i04j001826;
	Thu, 20 Feb 2025 08:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1iFork7j2hg7VLmFMpe/3lFQMlw/jVPX9BgSr0jDd4=; b=cvvfDpy+toMOQoVL
	oobbmK21Qx0BWTREF0NGTRSj1y+y96seAGR2Myyt+wxSbZY/yHLP8XwGZZA+bRS3
	2FrgVHudbWyyv585aTzM+7uKlkRWKz27cbtN67aKnQIaHFYb6OOCiHyar8/tgGV5
	QYr8F5VL1yg/8Qb92ZtOBRPgzpqXeJ1Ytj5MsmpVVBltBBKSm9LzCCmCNhXmMqzd
	YJQk4v6leU0eAvmSwCQS1pah2A96Ampor7bObH3v+/6JmqSqJ9x+6xkG1nDbjgwc
	SNEZDPepZ0X5rLPAg2cSgLeI8VNLIFy2I8lr3n1ZyB+Hn15jXMXXnEgNpC5r6EN3
	7oNKbg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2deew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:25:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K8P0Dm030679
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:25:00 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 00:24:59 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2 1/7] wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
Date: Thu, 20 Feb 2025 16:24:42 +0800
Message-ID: <20250220082448.31039-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220082448.31039-1-quic_bqiang@quicinc.com>
References: <20250220082448.31039-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: p8fUBRvSE68Rd3kOqsqs2ZktvrUiOwlG
X-Proofpoint-GUID: p8fUBRvSE68Rd3kOqsqs2ZktvrUiOwlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_002501_961285_2EBC6D47 
X-CRM114-Status: GOOD (  21.89  )
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

We get report [1] that CPU is running a hot loop in
ath11k_debugfs_fw_stats_request():

94.60%     0.00%  i3status         [kernel.kallsyms]                 [k] do_syscall_64
        |
         --94.60%--do_syscall_64
                   |
                    --94.55%--__sys_sendmsg
                              ___sys_sendmsg
                              ____sys_sendmsg
                              netlink_sendmsg
                              netlink_unicast
                              genl_rcv
                              netlink_rcv_skb
                              genl_rcv_msg
                              |
                               --94.55%--genl_family_rcv_msg_dumpit
                                         __netlink_dump_start
                                         netlink_dump
                                         genl_dumpit
                                         nl80211_dump_station
                                         |
                                          --94.55%--ieee80211_dump_station
                                                    sta_set_sinfo
                                                    |
                                                     --94.55%--ath11k_mac_op_sta_statistics
                                                               ath11k_debugfs_get_fw_stats
                                                               |
                                                                --94.55%--ath11k_debugfs_fw_stats_request
                                                                          |
                                                                          |--41.73%--_raw_spin_lock_bh
                                                                          |
                                                                          |--22.74%--__local_bh_enable_ip
                                                                          |
                                                                          |--9.22%--_raw_spin_unlock_bh
                                                                          |
                                                                           --6.66%--srso_alias_safe_ret

This is because, if for whatever reason ar->fw_stats_done is not set by
ath11k_update_stats_event(), ath11k_debugfs_fw_stats_request() won't yield
CPU before an up to 3s timeout.

Change to completion mechanism to avoid CPU burning.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Reported-by: Yury Vostrikov <mon@unformed.ru>
Closes: https://lore.kernel.org/all/7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com/ # [1]
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c    |  1 +
 drivers/net/wireless/ath/ath11k/core.h    |  2 +-
 drivers/net/wireless/ath/ath11k/debugfs.c | 38 +++++++++--------------
 drivers/net/wireless/ath/ath11k/mac.c     |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c     |  2 +-
 5 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 65bba0ae69a9..251c20148ab2 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -951,6 +951,7 @@ void ath11k_fw_stats_init(struct ath11k *ar)
 	INIT_LIST_HEAD(&ar->fw_stats.bcn);
 
 	init_completion(&ar->fw_stats_complete);
+	init_completion(&ar->fw_stats_done);
 }
 
 void ath11k_fw_stats_free(struct ath11k_fw_stats *stats)
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 1a3d0de4afde..6abbb29034f0 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -783,7 +783,7 @@ struct ath11k {
 	u8 alpha2[REG_ALPHA2_LEN + 1];
 	struct ath11k_fw_stats fw_stats;
 	struct completion fw_stats_complete;
-	bool fw_stats_done;
+	struct completion fw_stats_done;
 
 	/* protected by conf_mutex */
 	bool ps_state_enable;
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index bf192529e3fe..1d03e3aab011 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/vmalloc.h>
@@ -96,7 +96,6 @@ void ath11k_debugfs_add_dbring_entry(struct ath11k *ar,
 static void ath11k_debugfs_fw_stats_reset(struct ath11k *ar)
 {
 	spin_lock_bh(&ar->data_lock);
-	ar->fw_stats_done = false;
 	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
 	ath11k_fw_stats_vdevs_free(&ar->fw_stats.vdevs);
 	spin_unlock_bh(&ar->data_lock);
@@ -114,7 +113,7 @@ void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *
 	/* WMI_REQUEST_PDEV_STAT request has been already processed */
 
 	if (stats->stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
-		ar->fw_stats_done = true;
+		complete(&ar->fw_stats_done);
 		return;
 	}
 
@@ -138,7 +137,7 @@ void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *
 				      &ar->fw_stats.vdevs);
 
 		if (is_end) {
-			ar->fw_stats_done = true;
+			complete(&ar->fw_stats_done);
 			num_vdev = 0;
 		}
 		return;
@@ -158,7 +157,7 @@ void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *
 				      &ar->fw_stats.bcn);
 
 		if (is_end) {
-			ar->fw_stats_done = true;
+			complete(&ar->fw_stats_done);
 			num_bcn = 0;
 		}
 	}
@@ -168,21 +167,15 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
 					   struct stats_request_params *req_param)
 {
 	struct ath11k_base *ab = ar->ab;
-	unsigned long timeout, time_left;
+	unsigned long time_left;
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	/* FW stats can get split when exceeding the stats data buffer limit.
-	 * In that case, since there is no end marking for the back-to-back
-	 * received 'update stats' event, we keep a 3 seconds timeout in case,
-	 * fw_stats_done is not marked yet
-	 */
-	timeout = jiffies + secs_to_jiffies(3);
-
 	ath11k_debugfs_fw_stats_reset(ar);
 
 	reinit_completion(&ar->fw_stats_complete);
+	reinit_completion(&ar->fw_stats_done);
 
 	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
 
@@ -193,21 +186,18 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
 	}
 
 	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
-
 	if (!time_left)
 		return -ETIMEDOUT;
 
-	for (;;) {
-		if (time_after(jiffies, timeout))
-			break;
+	/* FW stats can get split when exceeding the stats data buffer limit.
+	 * In that case, since there is no end marking for the back-to-back
+	 * received 'update stats' event, we keep a 3 seconds timeout in case,
+	 * fw_stats_done is not marked yet
+	 */
+	time_left = wait_for_completion_timeout(&ar->fw_stats_done, 3 * HZ);
+	if (!time_left)
+		return -ETIMEDOUT;
 
-		spin_lock_bh(&ar->data_lock);
-		if (ar->fw_stats_done) {
-			spin_unlock_bh(&ar->data_lock);
-			break;
-		}
-		spin_unlock_bh(&ar->data_lock);
-	}
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 14ed53836589..d35250f4570d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9385,11 +9385,11 @@ static int ath11k_fw_stats_request(struct ath11k *ar,
 	lockdep_assert_held(&ar->conf_mutex);
 
 	spin_lock_bh(&ar->data_lock);
-	ar->fw_stats_done = false;
 	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
 	spin_unlock_bh(&ar->data_lock);
 
 	reinit_completion(&ar->fw_stats_complete);
+	reinit_completion(&ar->fw_stats_done);
 
 	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index d7f852bebf4a..27cb0bb06b93 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8189,7 +8189,7 @@ static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *sk
 	 */
 	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
 		list_splice_tail_init(&stats.pdevs, &ar->fw_stats.pdevs);
-		ar->fw_stats_done = true;
+		complete(&ar->fw_stats_done);
 		goto complete;
 	}
 
-- 
2.25.1


