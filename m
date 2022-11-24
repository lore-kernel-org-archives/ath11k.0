Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C058C433FE
	for <ath11k@archiver.kernel.org>; Thu, 24 Nov 2022 07:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VGwQxku4aGwnAVgcJjPjbAt771NpvMuL2qD5v2xTOms=; b=ikY8kBQjOk3EeI
	nBPkjIg7Vz9oQ4sL4eCNWzTbhGXuN6e+8Oz4Sk8uOa6wixF3FcTQZeuwcDnrTziART+BRAYM1TXom
	mY+524AbzrX3Jh//tim433ycjy7bJtNEf+Egv11WAwHomgSLHyibPUNpWm/TWFzuTjlk/9zR6kNGs
	QwkLS3M8YeDUTZrqXC0n3au9XeMxzhqsTRyKjUm9ZIYyOq9AhPaTQ4qXLqveybDFWh0H2dRnudZG2
	vkfVj5kljEui1MDf+efZKnLgYlfEk2lFGyyttlPftHnioqkk6mGU4d32X7r8Z8b3NwNslW28BOqIY
	a8zp0eteZWO0zuvHMqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy6OV-0061Q0-2K; Thu, 24 Nov 2022 07:11:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy6OR-0061Mt-IG
	for ath11k@lists.infradead.org; Thu, 24 Nov 2022 07:11:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO50vce002619;
	Thu, 24 Nov 2022 07:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=fUML10oIFcsrJ9IIruiSHpVcKJrFxMy4Kjx2DgB0DpE=;
 b=iIjpGg9OzLAjQsupkv+u4sL6CRDDUMWgvXE5k92AROdr+pi+sReDKWdArMARBQqPFEAm
 +yTFKn5swopUlUPxdVGJ4eXQOzMIbfgsGOLcgCqoV+dytDV8ajr2R5sTfscc5PkZnW+K
 DyLupJlkItNjh7QOwUXZeNMzilMqGKSSUJySGUcc8lKVAm0wg0mf/gKprZdUV9xfcc0V
 uGWihGWiVZbk4JDwecgDTrap+Kzql7xejztZJKykBYvhq47WrMMZHLNwz9H7+stfJdlR
 eSUMeSIeKdzzbRs2JVaCJpq31Bj2ffkEZJ380frpFRIgSu4Gr+fngQd1GTN7EQ4N5PAS fQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m15sechnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 07:11:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AO7BS0o017864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 07:11:28 GMT
Received: from kathirve-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 23 Nov 2022 23:11:26 -0800
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Govindaraj Saminathan
	<quic_gsaminat@quicinc.com>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
Subject: [PATCHv2] wifi: ath11k: Fix race condition with htt_ppdu_stats_info
Date: Thu, 24 Nov 2022 12:41:04 +0530
Message-ID: <20221124071104.22506-1-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _7b0VElMQ9MKOQf7OcKUdb_TmW64jJVs
X-Proofpoint-GUID: _7b0VElMQ9MKOQf7OcKUdb_TmW64jJVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_04,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 clxscore=1015 mlxlogscore=959 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_231131_748756_DCBC1F55 
X-CRM114-Status: GOOD (  16.57  )
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

From: Govindaraj Saminathan <quic_gsaminat@quicinc.com>

The below crash happens when running the traffic with multiple clients

Crash Signature : Unable to handle kernel paging request at
virtual address ffffffd700970918 During the crash, PC points to
"ieee80211_tx_rate_update+0x30/0x68 [mac80211]"
LR points to "ath11k_dp_htt_htc_t2h_msg_handler+0x5a8/0x8a0 [ath11k]".

ppdu_stats_info is allocated and accessed from event callback via copy
engine tasklet, this has a problem when freeing it from ath11k_mac_op_stop.

Add spin lock to protect htt_ppdu_stats_info and to avoid race condition
when accessing it from ath11k_mac_op_stop.

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
v2:
	Rebased and Modified the author details

 drivers/net/wireless/ath/ath11k/dp_rx.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c5a4c34d7749..2384c8c3c55c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1535,11 +1535,11 @@ struct htt_ppdu_stats_info *ath11k_dp_htt_get_ppdu_desc(struct ath11k *ar,
 {
 	struct htt_ppdu_stats_info *ppdu_info;
 
-	spin_lock_bh(&ar->data_lock);
+	lockdep_assert_held(&ar->data_lock);
+
 	if (!list_empty(&ar->ppdu_stats_info)) {
 		list_for_each_entry(ppdu_info, &ar->ppdu_stats_info, list) {
 			if (ppdu_info->ppdu_id == ppdu_id) {
-				spin_unlock_bh(&ar->data_lock);
 				return ppdu_info;
 			}
 		}
@@ -1553,16 +1553,13 @@ struct htt_ppdu_stats_info *ath11k_dp_htt_get_ppdu_desc(struct ath11k *ar,
 			kfree(ppdu_info);
 		}
 	}
-	spin_unlock_bh(&ar->data_lock);
 
 	ppdu_info = kzalloc(sizeof(*ppdu_info), GFP_ATOMIC);
 	if (!ppdu_info)
 		return NULL;
 
-	spin_lock_bh(&ar->data_lock);
 	list_add_tail(&ppdu_info->list, &ar->ppdu_stats_info);
 	ar->ppdu_stat_list_depth++;
-	spin_unlock_bh(&ar->data_lock);
 
 	return ppdu_info;
 }
@@ -1586,16 +1583,17 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, pdev_id);
 	if (!ar) {
 		ret = -EINVAL;
-		goto exit;
+		goto out;
 	}
 
 	if (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar))
 		trace_ath11k_htt_ppdu_stats(ar, skb->data, len);
 
+	spin_lock_bh(&ar->data_lock);
 	ppdu_info = ath11k_dp_htt_get_ppdu_desc(ar, ppdu_id);
 	if (!ppdu_info) {
 		ret = -EINVAL;
-		goto exit;
+		goto out_unlock_data;
 	}
 
 	ppdu_info->ppdu_id = ppdu_id;
@@ -1604,10 +1602,13 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 				     (void *)ppdu_info);
 	if (ret) {
 		ath11k_warn(ab, "Failed to parse tlv %d\n", ret);
-		goto exit;
+		goto out_unlock_data;
 	}
 
-exit:
+out_unlock_data:
+	spin_unlock_bh(&ar->data_lock);
+
+out:
 	rcu_read_unlock();
 
 	return ret;

base-commit: d87a77cb16ca7c51f5ea67f345137ade24245153
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
