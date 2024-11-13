Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8D5D597C4
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 01:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tWNYjb8lTxgjvBsDwRedBB1sgZ15OT3vnMQVN8ceIg=; b=Vt/jGNPoWrfSzC9tQj920aSMGZ
	c1g6WS07Wa0Q7QGKzwl1l4Jto207wM8LwLwsfeCHuAlTksHCPNsNPeowmrzgNIiFOJmWyHGatlI0b
	YCR4d6YhOif+XvkvyQI3NJr5OgVXhohWLQi/JKfAMsWbTMMgJIZ672j2bqgzfQGfJP/UAtZm07MrY
	sRdBCs4IgxWT96F6A4K0GKP2C0rRAe9lwwo9qVQAzqFiq5vpgAkvWe47rPpjnmhx/yJiOoAGGnmLM
	fX0mG2y6xpl/9Jq8WghVbdl6cOduhisRKI3MaCMbRrdlWsoKWLzUnIMMPbB9lNQMl4jiddW2EgOsj
	bmm1n7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2cq-00000005YWn-0o9K;
	Wed, 13 Nov 2024 01:56:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2cn-00000005YUA-0jJ7
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 01:56:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMS3Mq019315;
	Wed, 13 Nov 2024 01:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/tWNYjb8lTxgjvBsDwRedBB1sgZ15OT3vnMQVN8ceIg=; b=lQ49Ni8bBqnX4qRr
	dQugvAU1Z2JwNzp97PFzYrRtQg+mSxkoHkcV/Pwba/xGqXSoOg0Z0ITHBXuhR4Cz
	3OxA0W4Qa3eOaPbMWDEn9fCDRMfm/eISLUp4RyWQbUtefytQhKyzIpGTho4vkpEV
	PVGz5GwETpd062K/r7XtNqZLLi788BifTjQy/NDQOwu8YHy9S6N5Koph85QcRlha
	0TYUhAxZxTnFd4biJ0rmMi0hh2dbFMcOt/lEDo6BuyWjCvo/Zp68PQGH/cTxlwVh
	b0WnqjLOMq7NDtnYh0iiDSPO77EYCa1gNtYfUX81IblqWMr9R+bbLBBZ/MRdB4vD
	cQlWSg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v4kqtdj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD1uqEP013062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:52 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 17:56:50 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 6/6] wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
Date: Wed, 13 Nov 2024 09:56:31 +0800
Message-ID: <20241113015631.3105-7-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113015631.3105-1-quic_bqiang@quicinc.com>
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BZ87jUhc7SORhcQWlbvItyKAyd0Hdsw7
X-Proofpoint-GUID: BZ87jUhc7SORhcQWlbvItyKAyd0Hdsw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_175653_315689_9E8E56E2 
X-CRM114-Status: GOOD (  13.33  )
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
index 0ff430931bfd..ab94261f7b0e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9412,47 +9412,12 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
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
-	ar->fw_stats_done = false;
-	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
-	ar->fw_stats.num_vdev_recvd = 0;
-	ar->fw_stats.num_bcn_recvd = 0;
-	spin_unlock_bh(&ar->data_lock);
-
-	reinit_completion(&ar->fw_stats_complete);
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
 				     int *dbm)
 {
 	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
-	struct stats_request_params req_param = {0};
 	struct ath11k_fw_stats_pdev *pdev;
 	int ret;
 
@@ -9464,9 +9429,6 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	 */
 	mutex_lock(&ar->conf_mutex);
 
-	if (ar->state != ATH11K_STATE_ON)
-		goto err_fallback;
-
 	/* Firmware doesn't provide Tx power during CAC hence no need to fetch
 	 * the stats.
 	 */
@@ -9475,10 +9437,8 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
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


