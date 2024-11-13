Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A096D597C5
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 01:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cKEuvpNFf/QeIh3xZDN/S3fDloKooMTT24ZJGzHhNw=; b=ilTIFXQ+503kTLUCp1x5mQ1N2u
	gjIyf/+jAP2UirhXYwbj2Eq5H6VqMlBHDanXpgIhxJFlpO0R/MFvMY6QwEMyMOZL6Ivxh/gnbC/cb
	Ic33FizkWlC+Nd1aiHhT5EEGP2sQ4b6/aNWhGYn4PVka1JtVoGz+VC9fgtbc0ZISiEnfjn5TD2B9z
	bKVaFPTpzY6nBpibbuxtxLTnLIWtbKEbYufuOZNbN4CyvdsapY5Gpo9Q232lsymzMhVSdMC/6NDUC
	0phEsuo0/7DvfgI1ugUW9T1VRmJq/AwHCnDX8l1jnhLa9FCt3btEJ9m1K2sw1KLZ++dBsnUA7eZuq
	I66sqUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2cn-00000005YV0-3XRy;
	Wed, 13 Nov 2024 01:56:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2ck-00000005YRe-12uL
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 01:56:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRamd014677;
	Wed, 13 Nov 2024 01:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cKEuvpNFf/QeIh3xZDN/S3fDloKooMTT24ZJGzHhNw=; b=l1ig3b04ax5Kjiyc
	rAObSGNNbsYUtQEFcj1+PWYX7hNZ2zJk+fbtbTZC0oVjfzWtdsVgIhVYFsz3vKCt
	diBxZw1ThHC3+fXrohwqh3O4WeoTauYphfmfmDFPewgAl9v7ne28O5qepTrDyri6
	8ev2qcbmlFua4ULjpf/m3mNqR3H6SOoXVdt+ANRoxef3wTFl0mHCvS5kr8cM+JPu
	oKYuiHWzAxfitPJKsbiKxZiJpQs0bmlvtfpFmhKL+xvUvPktn33UKLBiQ9ctjQ2L
	hql/k5V5Jtmg1H/WXXoRN24uQ1Uu8tOtHmHw5bDNmg4KQIoFTw9bl9B6g8zVjzmT
	Im41iw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y2fxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD1ulZD020784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:47 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 17:56:46 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 3/6] wifi: ath11k: move some firmware stats related functions outside of debugfs
Date: Wed, 13 Nov 2024 09:56:28 +0800
Message-ID: <20241113015631.3105-4-quic_bqiang@quicinc.com>
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
X-Proofpoint-ORIG-GUID: J_L4jY48pzxJQnHEOURJ791mW5Q-91Wp
X-Proofpoint-GUID: J_L4jY48pzxJQnHEOURJ791mW5Q-91Wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_175650_463732_361E99E1 
X-CRM114-Status: GOOD (  26.20  )
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

Commit b488c766442f ("ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855")
and commit c3b39553fc77 ("ath11k: add signal report to mac80211 for QCA6390 and WCN6855")
call debugfs functions in mac ops. Those functions are no-ops if CONFIG_ATH11K_DEBUGFS is
not enabled, thus cause wrong status reported.

Move them to mac.c.

Besides, since WMI_REQUEST_RSSI_PER_CHAIN_STAT and WMI_REQUEST_VDEV_STAT stats could also
be requested via mac ops, process them directly in ath11k_update_stats_event().

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

Fixes: b488c766442f ("ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855")
Fixes: c3b39553fc77 ("ath11k: add signal report to mac80211 for QCA6390 and WCN6855")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 136 +---------------------
 drivers/net/wireless/ath/ath11k/debugfs.h |  10 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 101 +++++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.h     |   4 +-
 drivers/net/wireless/ath/ath11k/wmi.c     |  43 ++++++-
 5 files changed, 146 insertions(+), 148 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index fd0d2a057084..7f016be2881d 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -93,56 +93,14 @@ void ath11k_debugfs_add_dbring_entry(struct ath11k *ar,
 	spin_unlock_bh(&dbr_data->lock);
 }
 
-static void ath11k_debugfs_fw_stats_reset(struct ath11k *ar)
-{
-	spin_lock_bh(&ar->data_lock);
-	ar->fw_stats_done = false;
-	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
-	ath11k_fw_stats_vdevs_free(&ar->fw_stats.vdevs);
-	ar->fw_stats.num_vdev_recvd = 0;
-	ar->fw_stats.num_bcn_recvd = 0;
-	spin_unlock_bh(&ar->data_lock);
-}
-
 void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *stats)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_pdev *pdev;
 	bool is_end;
-	size_t total_vdevs_started = 0;
-	int i;
-
-	/* WMI_REQUEST_PDEV_STAT request has been already processed */
-
-	if (stats->stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
-		ar->fw_stats_done = true;
-		return;
-	}
-
-	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
-		if (list_empty(&stats->vdevs)) {
-			ath11k_warn(ab, "empty vdev stats");
-			return;
-		}
-		/* FW sends all the active VDEV stats irrespective of PDEV,
-		 * hence limit until the count of all VDEVs started
-		 */
-		for (i = 0; i < ab->num_radios; i++) {
-			pdev = rcu_dereference(ab->pdevs_active[i]);
-			if (pdev && pdev->ar)
-				total_vdevs_started += ar->num_started_vdevs;
-		}
-
-		is_end = ((++ar->fw_stats.num_vdev_recvd) == total_vdevs_started);
-
-		list_splice_tail_init(&stats->vdevs,
-				      &ar->fw_stats.vdevs);
 
-		if (is_end)
-			ar->fw_stats_done = true;
-
-		return;
-	}
+	/* WMI_REQUEST_PDEV_STAT, WMI_REQUEST_RSSI_PER_CHAIN_STAT and
+	 * WMI_REQUEST_VDEV_STAT requests have been already processed.
+	 */
 
 	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
 		if (list_empty(&stats->bcn)) {
@@ -162,88 +120,6 @@ void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *
 	}
 }
 
-static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
-					   struct stats_request_params *req_param)
-{
-	struct ath11k_base *ab = ar->ab;
-	unsigned long timeout, time_left;
-	int ret;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	/* FW stats can get split when exceeding the stats data buffer limit.
-	 * In that case, since there is no end marking for the back-to-back
-	 * received 'update stats' event, we keep a 3 seconds timeout in case,
-	 * fw_stats_done is not marked yet
-	 */
-	timeout = jiffies + msecs_to_jiffies(3 * 1000);
-
-	ath11k_debugfs_fw_stats_reset(ar);
-
-	reinit_completion(&ar->fw_stats_complete);
-
-	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
-
-	if (ret) {
-		ath11k_warn(ab, "could not request fw stats (%d)\n",
-			    ret);
-		return ret;
-	}
-
-	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
-
-	if (!time_left)
-		return -ETIMEDOUT;
-
-	for (;;) {
-		if (time_after(jiffies, timeout))
-			break;
-
-		spin_lock_bh(&ar->data_lock);
-		if (ar->fw_stats_done) {
-			spin_unlock_bh(&ar->data_lock);
-			break;
-		}
-		spin_unlock_bh(&ar->data_lock);
-
-		/* 100ms is empirical, change if required */
-		msleep(100);
-	}
-	return 0;
-}
-
-int ath11k_debugfs_get_fw_stats(struct ath11k *ar, u32 pdev_id,
-				u32 vdev_id, u32 stats_id)
-{
-	struct ath11k_base *ab = ar->ab;
-	struct stats_request_params req_param;
-	int ret;
-
-	mutex_lock(&ar->conf_mutex);
-
-	if (ar->state != ATH11K_STATE_ON) {
-		ret = -ENETDOWN;
-		goto err_unlock;
-	}
-
-	req_param.pdev_id = pdev_id;
-	req_param.vdev_id = vdev_id;
-	req_param.stats_id = stats_id;
-
-	ret = ath11k_debugfs_fw_stats_request(ar, &req_param);
-	if (ret)
-		ath11k_warn(ab, "failed to request fw stats: %d\n", ret);
-
-	ath11k_dbg(ab, ATH11K_DBG_WMI,
-		   "debug get fw stat pdev id %d vdev id %d stats id 0x%x\n",
-		   pdev_id, vdev_id, stats_id);
-
-err_unlock:
-	mutex_unlock(&ar->conf_mutex);
-
-	return ret;
-}
-
 static int ath11k_open_pdev_stats(struct inode *inode, struct file *file)
 {
 	struct ath11k *ar = inode->i_private;
@@ -269,7 +145,7 @@ static int ath11k_open_pdev_stats(struct inode *inode, struct file *file)
 	req_param.vdev_id = 0;
 	req_param.stats_id = WMI_REQUEST_PDEV_STAT;
 
-	ret = ath11k_debugfs_fw_stats_request(ar, &req_param);
+	ret = ath11k_mac_fw_stats_request(ar, &req_param);
 	if (ret) {
 		ath11k_warn(ab, "failed to request fw pdev stats: %d\n", ret);
 		goto err_free;
@@ -340,7 +216,7 @@ static int ath11k_open_vdev_stats(struct inode *inode, struct file *file)
 	req_param.vdev_id = 0;
 	req_param.stats_id = WMI_REQUEST_VDEV_STAT;
 
-	ret = ath11k_debugfs_fw_stats_request(ar, &req_param);
+	ret = ath11k_mac_fw_stats_request(ar, &req_param);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to request fw vdev stats: %d\n", ret);
 		goto err_free;
@@ -416,7 +292,7 @@ static int ath11k_open_bcn_stats(struct inode *inode, struct file *file)
 			continue;
 
 		req_param.vdev_id = arvif->vdev_id;
-		ret = ath11k_debugfs_fw_stats_request(ar, &req_param);
+		ret = ath11k_mac_fw_stats_request(ar, &req_param);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to request fw bcn stats: %d\n", ret);
 			goto err_free;
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index a39e458637b0..54dc949e4299 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _ATH11K_DEBUGFS_H_
@@ -273,8 +273,6 @@ void ath11k_debugfs_unregister(struct ath11k *ar);
 void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *stats);
 
 void ath11k_debugfs_fw_stats_init(struct ath11k *ar);
-int ath11k_debugfs_get_fw_stats(struct ath11k *ar, u32 pdev_id,
-				u32 vdev_id, u32 stats_id);
 
 static inline bool ath11k_debugfs_is_pktlog_lite_mode_enabled(struct ath11k *ar)
 {
@@ -381,12 +379,6 @@ static inline int ath11k_debugfs_rx_filter(struct ath11k *ar)
 	return 0;
 }
 
-static inline int ath11k_debugfs_get_fw_stats(struct ath11k *ar,
-					      u32 pdev_id, u32 vdev_id, u32 stats_id)
-{
-	return 0;
-}
-
 static inline void
 ath11k_debugfs_add_dbring_entry(struct ath11k *ar,
 				enum wmi_direct_buffer_module id,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f147ef960c22..318fd0bb6fe5 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8939,6 +8939,99 @@ static void ath11k_mac_put_chain_rssi(struct station_info *sinfo,
 	}
 }
 
+static void ath11k_mac_fw_stats_reset(struct ath11k *ar)
+{
+	spin_lock_bh(&ar->data_lock);
+	ar->fw_stats_done = false;
+	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
+	ath11k_fw_stats_vdevs_free(&ar->fw_stats.vdevs);
+	ar->fw_stats.num_vdev_recvd = 0;
+	ar->fw_stats.num_bcn_recvd = 0;
+	spin_unlock_bh(&ar->data_lock);
+}
+
+int ath11k_mac_fw_stats_request(struct ath11k *ar,
+				struct stats_request_params *req_param)
+{
+	struct ath11k_base *ab = ar->ab;
+	unsigned long timeout, time_left;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	/* FW stats can get split when exceeding the stats data buffer limit.
+	 * In that case, since there is no end marking for the back-to-back
+	 * received 'update stats' event, we keep a 3 seconds timeout in case,
+	 * fw_stats_done is not marked yet
+	 */
+	timeout = jiffies + msecs_to_jiffies(3 * 1000);
+
+	ath11k_mac_fw_stats_reset(ar);
+
+	reinit_completion(&ar->fw_stats_complete);
+
+	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
+
+	if (ret) {
+		ath11k_warn(ab, "could not request fw stats (%d)\n",
+			    ret);
+		return ret;
+	}
+
+	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
+
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	for (;;) {
+		if (time_after(jiffies, timeout))
+			break;
+
+		spin_lock_bh(&ar->data_lock);
+		if (ar->fw_stats_done) {
+			spin_unlock_bh(&ar->data_lock);
+			break;
+		}
+		spin_unlock_bh(&ar->data_lock);
+
+		/* 100ms is empirical, change if required */
+		msleep(100);
+	}
+	return 0;
+}
+
+static int ath11k_mac_get_fw_stats(struct ath11k *ar, u32 pdev_id,
+				   u32 vdev_id, u32 stats_id)
+{
+	struct ath11k_base *ab = ar->ab;
+	struct stats_request_params req_param;
+	int ret;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state != ATH11K_STATE_ON) {
+		ret = -ENETDOWN;
+		goto err_unlock;
+	}
+
+	req_param.pdev_id = pdev_id;
+	req_param.vdev_id = vdev_id;
+	req_param.stats_id = stats_id;
+
+	ret = ath11k_mac_fw_stats_request(ar, &req_param);
+	if (ret)
+		ath11k_warn(ab, "failed to request fw stats: %d\n", ret);
+
+	ath11k_dbg(ab, ATH11K_DBG_WMI,
+		   "debug get fw stat pdev id %d vdev id %d stats id 0x%x\n",
+		   pdev_id, vdev_id, stats_id);
+
+err_unlock:
+	mutex_unlock(&ar->conf_mutex);
+
+	return ret;
+}
+
 static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif,
 					 struct ieee80211_sta *sta,
@@ -8976,8 +9069,8 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL)) &&
 	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
 	    ar->ab->hw_params.supports_rssi_stats &&
-	    !ath11k_debugfs_get_fw_stats(ar, ar->pdev->pdev_id, 0,
-					 WMI_REQUEST_RSSI_PER_CHAIN_STAT)) {
+	    !ath11k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
+				     WMI_REQUEST_RSSI_PER_CHAIN_STAT)) {
 		ath11k_mac_put_chain_rssi(sinfo, arsta, "fw stats", true);
 	}
 
@@ -8985,8 +9078,8 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	if (!signal &&
 	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
 	    ar->ab->hw_params.supports_rssi_stats &&
-	    !(ath11k_debugfs_get_fw_stats(ar, ar->pdev->pdev_id, 0,
-					WMI_REQUEST_VDEV_STAT)))
+	    !(ath11k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
+				      WMI_REQUEST_VDEV_STAT)))
 		signal = arsta->rssi_beacon;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index f5800fbecff8..e86129763954 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_MAC_H
@@ -179,4 +179,6 @@ int ath11k_mac_vif_set_keepalive(struct ath11k_vif *arvif,
 void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
 				  struct ieee80211_vif *vif,
 				  struct ieee80211_chanctx_conf *ctx);
+int ath11k_mac_fw_stats_request(struct ath11k *ar,
+				struct stats_request_params *req_param);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 87abfa547529..641cc979589a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8157,6 +8157,11 @@ static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, struct sk_buff
 static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct ath11k_fw_stats stats = {};
+	size_t total_vdevs_started = 0;
+	struct ath11k_pdev *pdev;
+	bool is_end;
+	int i;
+
 	struct ath11k *ar;
 	int ret;
 
@@ -8183,7 +8188,8 @@ static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *sk
 
 	spin_lock_bh(&ar->data_lock);
 
-	/* WMI_REQUEST_PDEV_STAT can be requested via .get_txpower mac ops or via
+	/* WMI_REQUEST_PDEV_STAT, WMI_REQUEST_VDEV_STAT and
+	 * WMI_REQUEST_RSSI_PER_CHAIN_STAT  can be requested via mac ops or via
 	 * debugfs fw stats. Therefore, processing it separately.
 	 */
 	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
@@ -8192,9 +8198,38 @@ static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *sk
 		goto complete;
 	}
 
-	/* WMI_REQUEST_VDEV_STAT, WMI_REQUEST_BCN_STAT and WMI_REQUEST_RSSI_PER_CHAIN_STAT
-	 * are currently requested only via debugfs fw stats. Hence, processing these
-	 * in debugfs context
+	if (stats.stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
+		ar->fw_stats_done = true;
+		goto complete;
+	}
+
+	if (stats.stats_id == WMI_REQUEST_VDEV_STAT) {
+		if (list_empty(&stats.vdevs)) {
+			ath11k_warn(ab, "empty vdev stats");
+			goto complete;
+		}
+		/* FW sends all the active VDEV stats irrespective of PDEV,
+		 * hence limit until the count of all VDEVs started
+		 */
+		for (i = 0; i < ab->num_radios; i++) {
+			pdev = rcu_dereference(ab->pdevs_active[i]);
+			if (pdev && pdev->ar)
+				total_vdevs_started += ar->num_started_vdevs;
+		}
+
+		is_end = ((++ar->fw_stats.num_vdev_recvd) == total_vdevs_started);
+
+		list_splice_tail_init(&stats.vdevs,
+				      &ar->fw_stats.vdevs);
+
+		if (is_end)
+			ar->fw_stats_done = true;
+
+		goto complete;
+	}
+
+	/* WMI_REQUEST_BCN_STAT is currently requested only via debugfs fw stats.
+	 * Hence, processing it in debugfs context
 	 */
 	ath11k_debugfs_fw_stats_process(ar, &stats);
 
-- 
2.25.1


