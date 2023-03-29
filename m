Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF1C74A5B
	for <ath11k@archiver.kernel.org>; Wed, 29 Mar 2023 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oj1ZQ/YVGFgcm1IATvnTlaekZmm57PwoRliQXdL9aIA=; b=R6+Y7QS7/n5Kyg
	0Kaq6YIGSadkJXYkdJHXpNSX3YrBz50FbWpZF6QQfIJAxhdQBoR8dEzLtB4u/YhXYwQRNeJoMnc9K
	y43yXlj8tJ9Aqz2DqhxNxD9GEjuxeD5T6NgTcIoaehc11qv4mz/CkWRdbD7XCTEAO+wMbFI9Af6Gr
	3XPG4m5/9HSFgFRGSZ2uNsse7L4EnH8AiYJV4dKol7FI1KzjZZySz2+DN2ICBuR9ht8VSLZqWqQ7z
	AcdWTUW9zainhReWOtnQcKu7efwzSZ48lx4R5sjZsKZl0klHElaYWO1jI5TXolPdD11VN7YvaGBlD
	U5kdjoMAOkjfW5umnY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRrX-00HIAJ-0V;
	Wed, 29 Mar 2023 09:12:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRrU-00HI9T-0u
	for ath11k@lists.infradead.org;
	Wed, 29 Mar 2023 09:12:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T9CXPf021689;
	Wed, 29 Mar 2023 09:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=wNuUFpWVe90Fwa3+DHD/Rdj8zic+ItLMg5WPK8WRZo8=;
 b=KaaM+UHhCU7KF9hjQF8R/nCAtCsiH3Jc7H6X2j4av8toIeHZepS7HQf25tknOwL/jI/k
 IA+FJXG5sFutxSqaFXxDIPxXwswSwSbdAb9trCSiEL/lCCgnxnac1D6qD3p0HmVaiODc
 rf5YJvXcSBzyy2FnK785QG+fCMl/49I6yOjtZF8HQj4A8k/VQkO3iUhMf4qRTvA40De8
 vnnEMwZYb/zvLt90aWIP9WjmBKhEjAV76wqQ2a7P0XhYV2kW3wqRdgz6fJonBJM1z64d
 b2DhD33dJnzBubiApSZiaURi/s7IIuJbi/V70iy7IhlPV/pALO8+VQgYK/hwSBlfRTVz Yg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkv45kb30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 09:12:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32T9Cs7R021008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 09:12:54 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 29 Mar 2023 02:12:52 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 2/2] wifi: ath11k: move udpate channel list to worker for wait flag
Date: Wed, 29 Mar 2023 05:12:34 -0400
Message-ID: <20230329091235.19500-3-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230329091235.19500-1-quic_wgong@quicinc.com>
References: <20230329091235.19500-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f0yaqiEwITVBxk75xfMNoll5kFis3UH-
X-Proofpoint-ORIG-GUID: f0yaqiEwITVBxk75xfMNoll5kFis3UH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_02,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_021256_436952_1C86278D 
X-CRM114-Status: GOOD (  24.69  )
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

When wait flag is set for ath11k_reg_update_chan_list(), it maybe wait
the completion of 11d/hw scan if 11d/hw scan are running, and now after
the previous patch "wifi: ath11k: move update channel list from update
reg worker to reg notifier", ath11k_reg_update_chan_list() is called by
ath11k_reg_notifier() which is running in the reg_work of cfg80211, the
reg_work is running with rtnl_lock() which is a global lock, if the wait
of completion of 11d/hw scan happened in ath11k_reg_update_chan_list(),
it will increase the time of occupy the rtnl_lock by reg_work, and then
increase the wait time of the rtnl_lock for other threads.

Move update channel list operation in ath11k_reg_update_chan_list() to
a worker of ath11k, then the wait of completion of 11d/hw scan will not
happen in reg_work and not increase the time of occupy the rtnl_lock by
reg_work.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/core.h |  4 ++
 drivers/net/wireless/ath/ath11k/mac.c  | 13 ++++
 drivers/net/wireless/ath/ath11k/reg.c  | 82 +++++++++++++++++---------
 drivers/net/wireless/ath/ath11k/reg.h  |  1 +
 drivers/net/wireless/ath/ath11k/wmi.h  |  1 +
 6 files changed, 74 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 75fdbe4ef83a..650e6744923c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1702,6 +1702,7 @@ void ath11k_core_halt(struct ath11k *ar)
 	ath11k_mac_scan_finish(ar);
 	ath11k_mac_peer_cleanup_all(ar);
 	cancel_delayed_work_sync(&ar->scan.timeout);
+	cancel_work_sync(&ar->channel_update_work);
 	cancel_work_sync(&ar->regd_update_work);
 	cancel_work_sync(&ab->update_11d_work);
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 0830276e5028..97712814e4cf 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -694,6 +694,10 @@ struct ath11k {
 	struct completion bss_survey_done;
 
 	struct work_struct regd_update_work;
+	struct work_struct channel_update_work;
+	struct list_head channel_update_queue;
+	/* protects channel_update_queue data */
+	spinlock_t channel_update_lock;
 
 	struct work_struct wmi_mgmt_tx_work;
 	struct sk_buff_head wmi_mgmt_tx_queue;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 110a38cce0a7..1a0c597e03bc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5962,6 +5962,7 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw)
 {
 	struct ath11k *ar = hw->priv;
 	struct htt_ppdu_stats_info *ppdu_stats, *tmp;
+	struct scan_chan_list_params *params, *tmp_ch;
 	int ret;
 
 	ath11k_mac_drain_tx(ar);
@@ -5977,6 +5978,7 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw)
 	mutex_unlock(&ar->conf_mutex);
 
 	cancel_delayed_work_sync(&ar->scan.timeout);
+	cancel_work_sync(&ar->channel_update_work);
 	cancel_work_sync(&ar->regd_update_work);
 	cancel_work_sync(&ar->ab->update_11d_work);
 
@@ -5992,6 +5994,13 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw)
 	}
 	spin_unlock_bh(&ar->data_lock);
 
+	spin_lock_bh(&ar->channel_update_lock);
+	list_for_each_entry_safe(params, tmp_ch, &ar->channel_update_queue, list) {
+		list_del(&params->list);
+		kfree(params);
+	}
+	spin_unlock_bh(&ar->channel_update_lock);
+
 	rcu_assign_pointer(ar->ab->pdevs_active[ar->pdev_idx], NULL);
 
 	synchronize_rcu();
@@ -8924,6 +8933,7 @@ static const struct wiphy_iftype_ext_capab ath11k_iftypes_ext_capa[] = {
 
 static void __ath11k_mac_unregister(struct ath11k *ar)
 {
+	cancel_work_sync(&ar->channel_update_work);
 	cancel_work_sync(&ar->regd_update_work);
 
 	ieee80211_unregister_hw(ar->hw);
@@ -9315,6 +9325,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		INIT_DELAYED_WORK(&ar->scan.timeout, ath11k_scan_timeout_work);
 		INIT_WORK(&ar->regd_update_work, ath11k_regd_update_work);
+		INIT_WORK(&ar->channel_update_work, ath11k_regd_update_chan_list_work);
+		INIT_LIST_HEAD(&ar->channel_update_queue);
+		spin_lock_init(&ar->channel_update_lock);
 
 		INIT_WORK(&ar->wmi_mgmt_tx_work, ath11k_mgmt_over_wmi_tx_work);
 		skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index f50740219202..79d074455196 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -123,32 +123,7 @@ int ath11k_reg_update_chan_list(struct ath11k *ar, bool wait)
 	struct channel_param *ch;
 	enum nl80211_band band;
 	int num_channels = 0;
-	int i, ret, left;
-
-	if (wait && ar->state_11d != ATH11K_11D_IDLE) {
-		left = wait_for_completion_timeout(&ar->completed_11d_scan,
-						   ATH11K_SCAN_TIMEOUT_HZ);
-		if (!left) {
-			ath11k_dbg(ar->ab, ATH11K_DBG_REG,
-				   "failed to receive 11d scan complete: timed out\n");
-			ar->state_11d = ATH11K_11D_IDLE;
-		}
-		ath11k_dbg(ar->ab, ATH11K_DBG_REG,
-			   "reg 11d scan wait left time %d\n", left);
-	}
-
-	if (wait &&
-	    (ar->scan.state == ATH11K_SCAN_STARTING ||
-	    ar->scan.state == ATH11K_SCAN_RUNNING)) {
-		left = wait_for_completion_timeout(&ar->scan.completed,
-						   ATH11K_SCAN_TIMEOUT_HZ);
-		if (!left)
-			ath11k_dbg(ar->ab, ATH11K_DBG_REG,
-				   "failed to receive hw scan complete: timed out\n");
-
-		ath11k_dbg(ar->ab, ATH11K_DBG_REG,
-			   "reg hw scan wait left time %d\n", left);
-	}
+	int i, ret = 0;
 
 	if (ar->state == ATH11K_STATE_RESTARTING)
 		return 0;
@@ -230,8 +205,15 @@ int ath11k_reg_update_chan_list(struct ath11k *ar, bool wait)
 		}
 	}
 
-	ret = ath11k_wmi_send_scan_chan_list_cmd(ar, params);
-	kfree(params);
+	if (wait) {
+		spin_lock_bh(&ar->channel_update_lock);
+		list_add_tail(&params->list, &ar->channel_update_queue);
+		spin_unlock_bh(&ar->channel_update_lock);
+		queue_work(ar->ab->workqueue, &ar->channel_update_work);
+	} else {
+		ret = ath11k_wmi_send_scan_chan_list_cmd(ar, params);
+		kfree(params);
+	}
 
 	return ret;
 }
@@ -728,6 +710,50 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 	return new_regd;
 }
 
+void ath11k_regd_update_chan_list_work(struct work_struct *work)
+{
+	struct ath11k *ar = container_of(work, struct ath11k,
+					 channel_update_work);
+	struct scan_chan_list_params *params, *tmp;
+	int left;
+
+	spin_lock_bh(&ar->channel_update_lock);
+
+	list_for_each_entry_safe(params, tmp, &ar->channel_update_queue, list) {
+		list_del(&params->list);
+		spin_unlock_bh(&ar->channel_update_lock);
+
+		if (ar->state_11d != ATH11K_11D_IDLE) {
+			left = wait_for_completion_timeout(&ar->completed_11d_scan,
+							   ATH11K_SCAN_TIMEOUT_HZ);
+			if (!left) {
+				ath11k_dbg(ar->ab, ATH11K_DBG_REG,
+					   "failed to receive 11d scan complete: timed out\n");
+				ar->state_11d = ATH11K_11D_IDLE;
+			}
+			ath11k_dbg(ar->ab, ATH11K_DBG_REG,
+				   "reg 11d scan wait left time %d\n", left);
+		}
+
+		if ((ar->scan.state == ATH11K_SCAN_STARTING ||
+		     ar->scan.state == ATH11K_SCAN_RUNNING)) {
+			left = wait_for_completion_timeout(&ar->scan.completed,
+							   ATH11K_SCAN_TIMEOUT_HZ);
+			if (!left)
+				ath11k_dbg(ar->ab, ATH11K_DBG_REG,
+					   "failed to receive hw scan complete: timed out\n");
+
+			ath11k_dbg(ar->ab, ATH11K_DBG_REG,
+				   "reg hw scan wait left time %d\n", left);
+		}
+
+		ath11k_wmi_send_scan_chan_list_cmd(ar, params);
+		kfree(params);
+		spin_lock_bh(&ar->channel_update_lock);
+	}
+	spin_unlock_bh(&ar->channel_update_lock);
+}
+
 void ath11k_regd_update_work(struct work_struct *work)
 {
 	struct ath11k *ar = container_of(work, struct ath11k,
diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
index 2f284f26378d..13751fab06c4 100644
--- a/drivers/net/wireless/ath/ath11k/reg.h
+++ b/drivers/net/wireless/ath/ath11k/reg.h
@@ -28,6 +28,7 @@ enum ath11k_dfs_region {
 void ath11k_reg_init(struct ath11k *ar);
 void ath11k_reg_free(struct ath11k_base *ab);
 void ath11k_regd_update_work(struct work_struct *work);
+void ath11k_regd_update_chan_list_work(struct work_struct *work);
 struct ieee80211_regdomain *
 ath11k_reg_build_regd(struct ath11k_base *ab,
 		      struct cur_regulatory_info *reg_info, bool intersect);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 2273d885f7fa..be324be080be 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3685,6 +3685,7 @@ struct wmi_stop_scan_cmd {
 };
 
 struct scan_chan_list_params {
+	struct list_head list;
 	u32 pdev_id;
 	u16 nallchans;
 	struct channel_param ch_param[];
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
