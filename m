Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AC0C43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 05:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pa7wm3z9ZWeRMVubLP8kE2OHiXyHAuOvaxKyc/bRGyo=; b=ySRYMu+wsSd56T
	/TBCMQ636weYWty/4KTDJm5+CC7mQuyBR2I/qPZM2RmHQlhZsfvC0/UMrV7C9ck3bTa6H6OtY7w3A
	5SyZRzTmaVyBcrRGa/CcAlK6Oc1hM7wX+QSW3Ty0Wz1GFvUYsSKMv0eF0ka2hyZ5AXOVMXtuQMWi2
	hcQoFxfZKgl3M41oYPMSHi01Tob1EEvydCQhiGock4JQ2P6Wr2EXhYloSD0uSdpwFajfBtYueING/
	LJ6TAf7lIldsOw6oC3R2Suyl0Le+1vn+ogqWXzP1Gx1RJw5/cFg99xgPZtwQA2a5fy9WO/yVeio2F
	fOPvhShQN+rWX0E0VyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwzpx-005u6E-8z; Fri, 03 Jun 2022 05:27:05 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwzpt-005u4x-FY
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 05:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654234021; x=1685770021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=tyKGTOB4hjAoVvOl6wC6d5VV/XZXfBGWbFlLeE7f+20=;
  b=Kd0Gkz3Rv8nkCTe8KQIARF56D2uc0qBNRUwV1f5F/AdARxlAwPsup0hm
   h+lb1NUbAyEgtwq74NSdMCDyv+a1Ex1V67pLA+PCuHrTdJjIPm/lXNx6A
   2fKkL+KeCqKbkh7MF/fkPpyLSRPVSR6kPSNIjQJmzbpUV4uKIeQWWIy6T
   E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Jun 2022 22:26:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 22:26:54 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 22:26:54 -0700
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 22:26:52 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH v2 1/2] ath11k: move firmware stats out of debugfs
Date: Fri, 3 Jun 2022 10:56:35 +0530
Message-ID: <20220603052636.22854-2-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220603052636.22854-1-quic_adisi@quicinc.com>
References: <20220603052636.22854-1-quic_adisi@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_222701_602325_02FEA7B5 
X-CRM114-Status: GOOD (  20.11  )
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

Currently, firmware stats, comprising pdev, vdev and beacon stats are
part of debugfs. In firmware pdev stats, firmware reports the final
Tx power used to transmit each packet. If driver wants to know the
final Tx power being used at firmware level, it can leverage from
firmware pdev stats.

Move firmware stats out of debugfs context in order to leverage
the final Tx power reported in it even when debugfs is disabled.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c    |  46 ++++++++
 drivers/net/wireless/ath/ath11k/core.h    |  12 +-
 drivers/net/wireless/ath/ath11k/debugfs.c | 137 +++++-----------------
 drivers/net/wireless/ath/ath11k/debugfs.h |   6 +-
 drivers/net/wireless/ath/ath11k/wmi.c     |  48 +++++++-
 5 files changed, 137 insertions(+), 112 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index ca6fadd64b43..07a299a2e213 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -570,6 +570,52 @@ static inline struct ath11k_pdev *ath11k_core_get_single_pdev(struct ath11k_base
 	return &ab->pdevs[0];
 }
 
+void ath11k_fw_stats_pdevs_free(struct list_head *head)
+{
+	struct ath11k_fw_stats_pdev *i, *tmp;
+
+	list_for_each_entry_safe(i, tmp, head, list) {
+		list_del(&i->list);
+		kfree(i);
+	}
+}
+
+void ath11k_fw_stats_vdevs_free(struct list_head *head)
+{
+	struct ath11k_fw_stats_vdev *i, *tmp;
+
+	list_for_each_entry_safe(i, tmp, head, list) {
+		list_del(&i->list);
+		kfree(i);
+	}
+}
+
+void ath11k_fw_stats_bcn_free(struct list_head *head)
+{
+	struct ath11k_fw_stats_bcn *i, *tmp;
+
+	list_for_each_entry_safe(i, tmp, head, list) {
+		list_del(&i->list);
+		kfree(i);
+	}
+}
+
+void ath11k_fw_stats_init(struct ath11k *ar)
+{
+	INIT_LIST_HEAD(&ar->fw_stats.pdevs);
+	INIT_LIST_HEAD(&ar->fw_stats.vdevs);
+	INIT_LIST_HEAD(&ar->fw_stats.bcn);
+
+	init_completion(&ar->fw_stats_complete);
+}
+
+void ath11k_fw_stats_free(struct ath11k_fw_stats *stats)
+{
+	ath11k_fw_stats_pdevs_free(&stats->pdevs);
+	ath11k_fw_stats_vdevs_free(&stats->vdevs);
+	ath11k_fw_stats_bcn_free(&stats->bcn);
+}
+
 int ath11k_core_suspend(struct ath11k_base *ab)
 {
 	int ret;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 65d54e9c15d9..672701f40a6b 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -545,9 +545,6 @@ struct ath11k_debug {
 	struct dentry *debugfs_pdev;
 	struct ath11k_dbg_htt_stats htt_stats;
 	u32 extd_tx_stats;
-	struct ath11k_fw_stats fw_stats;
-	struct completion fw_stats_complete;
-	bool fw_stats_done;
 	u32 extd_rx_stats;
 	u32 pktlog_filter;
 	u32 pktlog_mode;
@@ -712,6 +709,9 @@ struct ath11k {
 	u8 twt_enabled;
 	bool nlo_enabled;
 	u8 alpha2[REG_ALPHA2_LEN + 1];
+	struct ath11k_fw_stats fw_stats;
+	struct completion fw_stats_complete;
+	bool fw_stats_done;
 };
 
 struct ath11k_band_cap {
@@ -1117,6 +1117,12 @@ struct ath11k_fw_stats_bcn {
 	u32 tx_bcn_outage_cnt;
 };
 
+void ath11k_fw_stats_init(struct ath11k *ar);
+void ath11k_fw_stats_pdevs_free(struct list_head *head);
+void ath11k_fw_stats_vdevs_free(struct list_head *head);
+void ath11k_fw_stats_bcn_free(struct list_head *head);
+void ath11k_fw_stats_free(struct ath11k_fw_stats *stats);
+
 extern const struct ce_pipe_config ath11k_target_ce_config_wlan_ipq8074[];
 extern const struct service_to_pipe ath11k_target_service_to_ce_map_wlan_ipq8074[];
 extern const struct service_to_pipe ath11k_target_service_to_ce_map_wlan_ipq6018[];
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 0d4843ef9dd1..daab31eff50e 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -93,91 +93,36 @@ void ath11k_debugfs_add_dbring_entry(struct ath11k *ar,
 	spin_unlock_bh(&dbr_data->lock);
 }
 
-static void ath11k_fw_stats_pdevs_free(struct list_head *head)
-{
-	struct ath11k_fw_stats_pdev *i, *tmp;
-
-	list_for_each_entry_safe(i, tmp, head, list) {
-		list_del(&i->list);
-		kfree(i);
-	}
-}
-
-static void ath11k_fw_stats_vdevs_free(struct list_head *head)
-{
-	struct ath11k_fw_stats_vdev *i, *tmp;
-
-	list_for_each_entry_safe(i, tmp, head, list) {
-		list_del(&i->list);
-		kfree(i);
-	}
-}
-
-static void ath11k_fw_stats_bcn_free(struct list_head *head)
-{
-	struct ath11k_fw_stats_bcn *i, *tmp;
-
-	list_for_each_entry_safe(i, tmp, head, list) {
-		list_del(&i->list);
-		kfree(i);
-	}
-}
 
 static void ath11k_debugfs_fw_stats_reset(struct ath11k *ar)
 {
 	spin_lock_bh(&ar->data_lock);
-	ar->debug.fw_stats_done = false;
-	ath11k_fw_stats_pdevs_free(&ar->debug.fw_stats.pdevs);
-	ath11k_fw_stats_vdevs_free(&ar->debug.fw_stats.vdevs);
+	ar->fw_stats_done = false;
+	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
+	ath11k_fw_stats_vdevs_free(&ar->fw_stats.vdevs);
 	spin_unlock_bh(&ar->data_lock);
 }
 
-void ath11k_debugfs_fw_stats_process(struct ath11k_base *ab, struct sk_buff *skb)
+void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *stats)
 {
-	struct ath11k_fw_stats stats = {};
-	struct ath11k *ar;
+	struct ath11k_base *ab = ar->ab;
 	struct ath11k_pdev *pdev;
 	bool is_end;
 	static unsigned int num_vdev, num_bcn;
 	size_t total_vdevs_started = 0;
-	int i, ret;
-
-	INIT_LIST_HEAD(&stats.pdevs);
-	INIT_LIST_HEAD(&stats.vdevs);
-	INIT_LIST_HEAD(&stats.bcn);
-
-	ret = ath11k_wmi_pull_fw_stats(ab, skb, &stats);
-	if (ret) {
-		ath11k_warn(ab, "failed to pull fw stats: %d\n", ret);
-		goto free;
-	}
-
-	rcu_read_lock();
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, stats.pdev_id);
-	if (!ar) {
-		rcu_read_unlock();
-		ath11k_warn(ab, "failed to get ar for pdev_id %d: %d\n",
-			    stats.pdev_id, ret);
-		goto free;
-	}
-
-	spin_lock_bh(&ar->data_lock);
+	int i;
 
-	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
-		list_splice_tail_init(&stats.pdevs, &ar->debug.fw_stats.pdevs);
-		ar->debug.fw_stats_done = true;
-		goto complete;
-	}
+	/* WMI_REQUEST_PDEV_STAT request has been already processed */
 
-	if (stats.stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
-		ar->debug.fw_stats_done = true;
-		goto complete;
+	if (stats->stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
+		ar->fw_stats_done = true;
+		return;
 	}
 
-	if (stats.stats_id == WMI_REQUEST_VDEV_STAT) {
-		if (list_empty(&stats.vdevs)) {
+	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
+		if (list_empty(&stats->vdevs)) {
 			ath11k_warn(ab, "empty vdev stats");
-			goto complete;
+			return;
 		}
 		/* FW sends all the active VDEV stats irrespective of PDEV,
 		 * hence limit until the count of all VDEVs started
@@ -190,43 +135,34 @@ void ath11k_debugfs_fw_stats_process(struct ath11k_base *ab, struct sk_buff *skb
 
 		is_end = ((++num_vdev) == total_vdevs_started);
 
-		list_splice_tail_init(&stats.vdevs,
-				      &ar->debug.fw_stats.vdevs);
+		list_splice_tail_init(&stats->vdevs,
+				      &ar->fw_stats.vdevs);
 
 		if (is_end) {
-			ar->debug.fw_stats_done = true;
+			ar->fw_stats_done = true;
 			num_vdev = 0;
 		}
-		goto complete;
+		return;
 	}
 
-	if (stats.stats_id == WMI_REQUEST_BCN_STAT) {
-		if (list_empty(&stats.bcn)) {
+	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
+		if (list_empty(&stats->bcn)) {
 			ath11k_warn(ab, "empty bcn stats");
-			goto complete;
+			return;
 		}
 		/* Mark end until we reached the count of all started VDEVs
 		 * within the PDEV
 		 */
 		is_end = ((++num_bcn) == ar->num_started_vdevs);
 
-		list_splice_tail_init(&stats.bcn,
-				      &ar->debug.fw_stats.bcn);
+		list_splice_tail_init(&stats->bcn,
+				      &ar->fw_stats.bcn);
 
 		if (is_end) {
-			ar->debug.fw_stats_done = true;
+			ar->fw_stats_done = true;
 			num_bcn = 0;
 		}
 	}
-complete:
-	complete(&ar->debug.fw_stats_complete);
-	rcu_read_unlock();
-	spin_unlock_bh(&ar->data_lock);
-
-free:
-	ath11k_fw_stats_pdevs_free(&stats.pdevs);
-	ath11k_fw_stats_vdevs_free(&stats.vdevs);
-	ath11k_fw_stats_bcn_free(&stats.bcn);
 }
 
 static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
@@ -247,7 +183,7 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
 
 	ath11k_debugfs_fw_stats_reset(ar);
 
-	reinit_completion(&ar->debug.fw_stats_complete);
+	reinit_completion(&ar->fw_stats_complete);
 
 	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
 
@@ -257,9 +193,8 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
 		return ret;
 	}
 
-	time_left =
-	wait_for_completion_timeout(&ar->debug.fw_stats_complete,
-				    1 * HZ);
+	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
+
 	if (!time_left)
 		return -ETIMEDOUT;
 
@@ -268,7 +203,7 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
 			break;
 
 		spin_lock_bh(&ar->data_lock);
-		if (ar->debug.fw_stats_done) {
+		if (ar->fw_stats_done) {
 			spin_unlock_bh(&ar->data_lock);
 			break;
 		}
@@ -340,8 +275,7 @@ static int ath11k_open_pdev_stats(struct inode *inode, struct file *file)
 		goto err_free;
 	}
 
-	ath11k_wmi_fw_stats_fill(ar, &ar->debug.fw_stats, req_param.stats_id,
-				 buf);
+	ath11k_wmi_fw_stats_fill(ar, &ar->fw_stats, req_param.stats_id, buf);
 
 	file->private_data = buf;
 
@@ -412,8 +346,7 @@ static int ath11k_open_vdev_stats(struct inode *inode, struct file *file)
 		goto err_free;
 	}
 
-	ath11k_wmi_fw_stats_fill(ar, &ar->debug.fw_stats, req_param.stats_id,
-				 buf);
+	ath11k_wmi_fw_stats_fill(ar, &ar->fw_stats, req_param.stats_id, buf);
 
 	file->private_data = buf;
 
@@ -490,14 +423,13 @@ static int ath11k_open_bcn_stats(struct inode *inode, struct file *file)
 		}
 	}
 
-	ath11k_wmi_fw_stats_fill(ar, &ar->debug.fw_stats, req_param.stats_id,
-				 buf);
+	ath11k_wmi_fw_stats_fill(ar, &ar->fw_stats, req_param.stats_id, buf);
 
 	/* since beacon stats request is looped for all active VDEVs, saved fw
 	 * stats is not freed for each request until done for all active VDEVs
 	 */
 	spin_lock_bh(&ar->data_lock);
-	ath11k_fw_stats_bcn_free(&ar->debug.fw_stats.bcn);
+	ath11k_fw_stats_bcn_free(&ar->fw_stats.bcn);
 	spin_unlock_bh(&ar->data_lock);
 
 	file->private_data = buf;
@@ -1055,7 +987,7 @@ void ath11k_debugfs_fw_stats_init(struct ath11k *ar)
 	struct dentry *fwstats_dir = debugfs_create_dir("fw_stats",
 							ar->debug.debugfs_pdev);
 
-	ar->debug.fw_stats.debugfs_fwstats = fwstats_dir;
+	ar->fw_stats.debugfs_fwstats = fwstats_dir;
 
 	/* all stats debugfs files created are under "fw_stats" directory
 	 * created per PDEV
@@ -1067,11 +999,6 @@ void ath11k_debugfs_fw_stats_init(struct ath11k *ar)
 	debugfs_create_file("beacon_stats", 0600, fwstats_dir, ar,
 			    &fops_bcn_stats);
 
-	INIT_LIST_HEAD(&ar->debug.fw_stats.pdevs);
-	INIT_LIST_HEAD(&ar->debug.fw_stats.vdevs);
-	INIT_LIST_HEAD(&ar->debug.fw_stats.bcn);
-
-	init_completion(&ar->debug.fw_stats_complete);
 }
 
 static ssize_t ath11k_write_pktlog_filter(struct file *file,
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index 8fc125a71943..e45dc874ff23 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -271,7 +271,7 @@ int ath11k_debugfs_pdev_create(struct ath11k_base *ab);
 void ath11k_debugfs_pdev_destroy(struct ath11k_base *ab);
 int ath11k_debugfs_register(struct ath11k *ar);
 void ath11k_debugfs_unregister(struct ath11k *ar);
-void ath11k_debugfs_fw_stats_process(struct ath11k_base *ab, struct sk_buff *skb);
+void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *stats);
 
 void ath11k_debugfs_fw_stats_init(struct ath11k *ar);
 int ath11k_debugfs_get_fw_stats(struct ath11k *ar, u32 pdev_id,
@@ -352,8 +352,8 @@ static inline void ath11k_debugfs_unregister(struct ath11k *ar)
 {
 }
 
-static inline void ath11k_debugfs_fw_stats_process(struct ath11k_base *ab,
-						   struct sk_buff *skb)
+static inline void ath11k_debugfs_fw_stats_process(struct ath11k *ar,
+						   struct ath11k_fw_stats *stats)
 {
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 84d1c7054013..9c7a0a438b12 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7412,7 +7412,53 @@ static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, struct sk_buff
 
 static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
-	ath11k_debugfs_fw_stats_process(ab, skb);
+	struct ath11k_fw_stats stats = {};
+	struct ath11k *ar;
+	int ret;
+
+	INIT_LIST_HEAD(&stats.pdevs);
+	INIT_LIST_HEAD(&stats.vdevs);
+	INIT_LIST_HEAD(&stats.bcn);
+
+	ret = ath11k_wmi_pull_fw_stats(ab, skb, &stats);
+	if (ret) {
+		ath11k_warn(ab, "failed to pull fw stats: %d\n", ret);
+		goto free;
+	}
+
+	rcu_read_lock();
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, stats.pdev_id);
+	if (!ar) {
+		rcu_read_unlock();
+		ath11k_warn(ab, "failed to get ar for pdev_id %d: %d\n",
+			    stats.pdev_id, ret);
+		goto free;
+	}
+
+	spin_lock_bh(&ar->data_lock);
+
+	/* WMI_REQUEST_PDEV_STAT can be requested via .get_txpower mac ops or via
+	 * debugfs fw stats. Therefore, processing it separately.
+	 */
+	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
+		list_splice_tail_init(&stats.pdevs, &ar->fw_stats.pdevs);
+		ar->fw_stats_done = true;
+		goto complete;
+	}
+
+	/* WMI_REQUEST_VDEV_STAT, WMI_REQUEST_BCN_STAT and WMI_REQUEST_RSSI_PER_CHAIN_STAT
+	 * are currently requested only via debugfs fw stats. Hence, processing these
+	 * in debugfs context
+	 */
+	ath11k_debugfs_fw_stats_process(ar, &stats);
+
+complete:
+	complete(&ar->fw_stats_complete);
+	rcu_read_unlock();
+	spin_unlock_bh(&ar->data_lock);
+
+free:
+	ath11k_fw_stats_free(&stats);
 }
 
 /* PDEV_CTL_FAILSAFE_CHECK_EVENT is received from FW when the frequency scanned
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
