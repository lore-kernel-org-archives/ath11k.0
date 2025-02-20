Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FBDC021B4
	for <ath11k@archiver.kernel.org>; Thu, 20 Feb 2025 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqIiKVYS1YFt8+CblG/fCe/DL1AJ6zdydoaH0Wk2/Ak=; b=OgwZLsUjN9TnSc3tkRd72g08gZ
	+rfTpu/36XuBpVF7f2zd047jer+CyOQbN7X6aSiDarqj2kiIN0hAG+QYU7Ry0sSpEn2kRDfF56kdc
	g+TnRqxeii1wkk4W73h2XxP4YA8GE7E2g8gD9qpPjVCl45Mw2tCzHMVD/ZxAXnm2nqQNWQFidNDYB
	1d5PqKxdgtXKaEEy/Qvu2jAUY65KnzQaHhnSdXbYbtbL3Enb5mTIAkrFWxtGZhqZyJl5eIynxB0ew
	s9fidFNMUmsEkEg4AInMyd+1XWbB6tuYNRCL+z5fKP98mX+WwW77z9d0XcefDERJmB6T0YkPfq6ty
	digwFwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1ru-0000000HLx6-2nBD;
	Thu, 20 Feb 2025 08:25:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1rs-0000000HLuT-2BsP
	for ath11k@lists.infradead.org;
	Thu, 20 Feb 2025 08:25:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6SSFJ026275;
	Thu, 20 Feb 2025 08:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lqIiKVYS1YFt8+CblG/fCe/DL1AJ6zdydoaH0Wk2/Ak=; b=Es4uKzfWPz0g4skq
	qy51iJNk6b2zn5UxtTlABGuIyZd86ggWN8DsvNTUEulP5kWHK9FAt+tsH4QcKPln
	Wp0l5TuG2JblfRtltBQmx3zEIUPwxlIGb0vuAtRjEGuMlxi8pP7d2ZrJsn6C2CNb
	oVXUSQN6ELM2+jJ+uX79DIMgPfkEJpEgFLg8np+lpax/1fKtyNSAR8appVrgqcgP
	A9S4KBKEpiAOsrYkWjCPZJL7jWkuNAIQhJHyk/JPI3zfPVOBPukRSrQFcAt1ZBLh
	etBnzrMNQKRGozn5r+uxIz8SdDLjkbtY+rtSQNS+hoMZ7upcj/3BK1R9eNKaOb/U
	LEpgAg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0neuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:25:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K8PBtk003977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:25:11 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 00:25:09 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2 7/7] wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
Date: Thu, 20 Feb 2025 16:24:48 +0800
Message-ID: <20250220082448.31039-8-quic_bqiang@quicinc.com>
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
X-Proofpoint-GUID: GGeqEypYO-pGmYT0DNVRncB-2jD5BtVq
X-Proofpoint-ORIG-GUID: GGeqEypYO-pGmYT0DNVRncB-2jD5BtVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_002512_601080_45B9CEB3 
X-CRM114-Status: GOOD (  13.72  )
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

Currently to get firmware stats, ath11k_mac_op_get_txpower() calls
ath11k_fw_stats_request() and ath11k_mac_op_sta_statistics() calls
ath11k_mac_get_fw_stats(). Those two helpers are basically doing
the same, except for:

1. ath11k_mac_get_fw_stats() verifies ar->state inside itself.
2. ath11k_mac_get_fw_stats() calls ath11k_mac_fw_stats_request()
   which then calls ath11k_mac_fw_stats_reset() to free pdev/vdev
   stats whereas only pdev stats are freed by ath11k_fw_stats_request().
3. ath11k_mac_get_fw_stats() waits for ar->fw_stats_complete and
   ar->fw_stats_done, whereas ath11k_fw_stats_request() only waits for
   ar->fw_stats_complete.

Change to call ath11k_mac_get_fw_stats() in ath11k_mac_op_get_txpower().
This is valid because:

1. ath11k_mac_op_get_txpower() also has the same request on ar->state.
2. it is harmless to call ath11k_fw_stats_vdevs_free() since
   ar->fw_stats.vdevs should be empty and there should be no one
   expecting it at that time.
3. ath11k_mac_op_get_txpower() only needs pdev stats. For pdev stats,
   ar->fw_stats_done is set to true whenever ar->fw_stats_complete is
   set to true in ath11k_update_stats_event(). So additional wait on
   ar->fw_stats_done does not wast any time.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 44 ++-------------------------
 1 file changed, 2 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 8a01eb6c53d0..c31cec0897d5 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9452,40 +9452,6 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static int ath11k_fw_stats_request(struct ath11k *ar,
-				   struct stats_request_params *req_param)
-{
-	struct ath11k_base *ab = ar->ab;
-	unsigned long time_left;
-	int ret;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	spin_lock_bh(&ar->data_lock);
-	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
-	ar->fw_stats.num_vdev_recvd = 0;
-	ar->fw_stats.num_bcn_recvd = 0;
-	spin_unlock_bh(&ar->data_lock);
-
-	reinit_completion(&ar->fw_stats_complete);
-	reinit_completion(&ar->fw_stats_done);
-
-	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
-	if (ret) {
-		ath11k_warn(ab, "could not request fw stats (%d)\n",
-			    ret);
-		return ret;
-	}
-
-	time_left = wait_for_completion_timeout(&ar->fw_stats_complete,
-						1 * HZ);
-
-	if (!time_left)
-		return -ETIMEDOUT;
-
-	return 0;
-}
-
 static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 				     struct ieee80211_vif *vif,
 				     unsigned int link_id,
@@ -9493,7 +9459,6 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
-	struct stats_request_params req_param = {0};
 	struct ath11k_fw_stats_pdev *pdev;
 	int ret;
 
@@ -9505,9 +9470,6 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	 */
 	mutex_lock(&ar->conf_mutex);
 
-	if (ar->state != ATH11K_STATE_ON)
-		goto err_fallback;
-
 	/* Firmware doesn't provide Tx power during CAC hence no need to fetch
 	 * the stats.
 	 */
@@ -9516,10 +9478,8 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 		return -EAGAIN;
 	}
 
-	req_param.pdev_id = ar->pdev->pdev_id;
-	req_param.stats_id = WMI_REQUEST_PDEV_STAT;
-
-	ret = ath11k_fw_stats_request(ar, &req_param);
+	ret = ath11k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
+				      WMI_REQUEST_PDEV_STAT);
 	if (ret) {
 		ath11k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
 		goto err_fallback;
-- 
2.25.1


