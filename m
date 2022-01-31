Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B5DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 31 Jan 2022 03:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eT8TdnHMWINUCNqND+n0pXlt252Ptz6HFWyg4mig0ZI=; b=1nYxUbMbN6IIJZ
	/DgPFyD8R+oS85C4n/Sk8TmZqyB6nBXK+cjyh8Pc+d/cHwOb78QMRGh+fWBmw9AGQM0NKRE/bscYm
	imKuRWU107cDpsdJQDP/uPBHYNc4eUQxwkdSYWIZf9vEeOBuNRjEs8X4hzjguND7Vlk4xi2yZbUJN
	InenEnMYDAnLW+D5o2eMEdvXCrgTSx83yC0Uk7XCfSRl3IQJYz9Ij33jmLPjp5ZikX4+VEsFShPQ0
	t/317Rx9U9i5cfUEVGCt2sVH5xe8J4lXZdGOjNxws/S+Kp/eT42kwmm9nfRox0cdsGdkf767I5wj0
	gszK1+HGQAxDFa8YSmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEN5n-007uN6-Nl; Mon, 31 Jan 2022 03:10:59 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEN5k-007uMD-1W
 for ath11k@lists.infradead.org; Mon, 31 Jan 2022 03:10:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1643598654; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: To: From: Sender;
 bh=AX7p6BCpCGF77htI4K5ou5wEjjtcO8PI4Wk7f9NoHio=;
 b=eMhIomaoSUAirQsaN3lX+JCmqNL1cFIuTWkck5aAz+j7G2y7qfgrGJFGm90MWlx4ahTlxkT7
 Oeu8In2gpctwxF3HXDu1gy9f8QGF5FOnurQj0fYSMHDhxKGqbJcrylQQO+dXhKHJpErezNWf
 0h6bJhr0yIpL4og+oso/wk86hFk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61f7533de46e09ccb6b95031 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 Jan 2022 03:10:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C14D8C4360C; Mon, 31 Jan 2022 03:10:52 +0000 (UTC)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alokad)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E254C4360C;
 Mon, 31 Jan 2022 03:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7E254C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Aloka Dixit <alokad@codeaurora.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH V8 2/2] ath11k: add debugfs for TWT debug calls
Date: Sun, 30 Jan 2022 19:10:43 -0800
Message-Id: <20220131031043.1295-2-alokad@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220131031043.1295-1-alokad@codeaurora.org>
References: <20220131031043.1295-1-alokad@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_191056_270334_63679E57 
X-CRM114-Status: GOOD (  19.47  )
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

From: John Crispin <john@phrozen.org>

New debugfs files to manually add/delete/pause/resume TWT
dialogs for test/debug purposes.

The debugfs files expect the following parameters
- Add dialog
echo '<Peer_MAC> <Dialog_ID> <Wake_Interval_Usec> <Wake_Interval_Mantis>
 <Wake_Duration_Usec> <First_SP_Offset> <TWT_Command>
 <1:Broadcast /0:Individual> <1:Triggered / 0:Untriggered>
 <1:Unannounced /0:Announced> <1:Protected / 0:Unprotected>' >
 /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/twt/add_dialog

Example (Non-triggered and un-announced):
echo '00:03:7F:20:13:52 1 102400 100 30720 20480 4 0 0 1 0' >
 /sys/kernel/debug/ieee80211/phy0/netdev:wlan0/twt/add_dialog

- Delete dialog
echo '<Peer_MAC> <Dialog_ID>' >
 /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/twt/del_dialog

- Pause dialog
echo '<Peer_MAC> <Dialog_ID>' >
 /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/twt/pause_dialog

- Resume dialog
echo '<Peer_MAC> <Dialog_ID> <SP_Offset_Usec> <Next_TWT_Size>' >
 /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/twt/resume_dialog

Example:
echo '00:03:7F:20:13:52 1 2000000 3' >
 /sys/kernel/debug/ieee80211/phy0/netdev:wlan0/twt/resume_dialog

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01179-QCAHKSWPL_SILICONZ-1
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
---
Changes in V8
- No functional changes from V6/V7, only rebased.

Changes in V7
- No functional changes from V6, only rebased.

Changes in V6
- Moved all functions from debug.c to debugfs.c
- ath11k_debugfs_add_interface() returns int instead of void

Changes in V5
- TWT directory created during ath11k_mac_op_add_interface() instead
  of during TWT enable command.
- File write operation check for twt_enabled.
- Used CONFIG_ATH11K_DEBUGFS instead of CONFIG_MAC80211_DEBUGFS.
- Example commands in commit description.

 drivers/net/wireless/ath/ath11k/core.h    |   3 +
 drivers/net/wireless/ath/ath11k/debugfs.c | 222 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/debugfs.h |  14 +-
 drivers/net/wireless/ath/ath11k/mac.c     |   7 +
 4 files changed, 245 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e89beff4f6ce..b080d535e578 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -263,6 +263,9 @@ struct ath11k_vif {
 	bool bcca_zero_sent;
 	bool do_not_send_tmpl;
 	struct ieee80211_chanctx_conf chanctx;
+#ifdef CONFIG_ATH11K_DEBUGFS
+	struct dentry *debugfs_twt;
+#endif /* CONFIG_ATH11K_DEBUGFS */
 };
 
 struct ath11k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 215b6014c0ef..cd6d27787154 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -1158,3 +1158,225 @@ int ath11k_debugfs_register(struct ath11k *ar)
 void ath11k_debugfs_unregister(struct ath11k *ar)
 {
 }
+
+static ssize_t ath11k_write_twt_add_dialog(struct file *file,
+					   const char __user *ubuf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath11k_vif *arvif = file->private_data;
+	struct wmi_twt_add_dialog_params params = { 0 };
+	u8 buf[128] = {0};
+	int ret;
+
+	if (arvif->ar->twt_enabled == 0) {
+		ath11k_err(arvif->ar->ab, "twt support is not enabled\n");
+		return -EOPNOTSUPP;
+	}
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+	ret = sscanf(buf,
+		     "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u %u %u %u %u %hhu %hhu %hhu %hhu %hhu",
+		     &params.peer_macaddr[0],
+		     &params.peer_macaddr[1],
+		     &params.peer_macaddr[2],
+		     &params.peer_macaddr[3],
+		     &params.peer_macaddr[4],
+		     &params.peer_macaddr[5],
+		     &params.dialog_id,
+		     &params.wake_intvl_us,
+		     &params.wake_intvl_mantis,
+		     &params.wake_dura_us,
+		     &params.sp_offset_us,
+		     &params.twt_cmd,
+		     &params.flag_bcast,
+		     &params.flag_trigger,
+		     &params.flag_flow_type,
+		     &params.flag_protection);
+	if (ret != 16)
+		return -EINVAL;
+
+	params.vdev_id = arvif->vdev_id;
+
+	ret = ath11k_wmi_send_twt_add_dialog_cmd(arvif->ar, &params);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t ath11k_write_twt_del_dialog(struct file *file,
+					   const char __user *ubuf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath11k_vif *arvif = file->private_data;
+	struct wmi_twt_del_dialog_params params = { 0 };
+	u8 buf[64] = {0};
+	int ret;
+
+	if (arvif->ar->twt_enabled == 0) {
+		ath11k_err(arvif->ar->ab, "twt support is not enabled\n");
+		return -EOPNOTSUPP;
+	}
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u",
+		     &params.peer_macaddr[0],
+		     &params.peer_macaddr[1],
+		     &params.peer_macaddr[2],
+		     &params.peer_macaddr[3],
+		     &params.peer_macaddr[4],
+		     &params.peer_macaddr[5],
+		     &params.dialog_id);
+	if (ret != 7)
+		return -EINVAL;
+
+	params.vdev_id = arvif->vdev_id;
+
+	ret = ath11k_wmi_send_twt_del_dialog_cmd(arvif->ar, &params);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t ath11k_write_twt_pause_dialog(struct file *file,
+					     const char __user *ubuf,
+					     size_t count, loff_t *ppos)
+{
+	struct ath11k_vif *arvif = file->private_data;
+	struct wmi_twt_pause_dialog_params params = { 0 };
+	u8 buf[64] = {0};
+	int ret;
+
+	if (arvif->ar->twt_enabled == 0) {
+		ath11k_err(arvif->ar->ab, "twt support is not enabled\n");
+		return -EOPNOTSUPP;
+	}
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u",
+		     &params.peer_macaddr[0],
+		     &params.peer_macaddr[1],
+		     &params.peer_macaddr[2],
+		     &params.peer_macaddr[3],
+		     &params.peer_macaddr[4],
+		     &params.peer_macaddr[5],
+		     &params.dialog_id);
+	if (ret != 7)
+		return -EINVAL;
+
+	params.vdev_id = arvif->vdev_id;
+
+	ret = ath11k_wmi_send_twt_pause_dialog_cmd(arvif->ar, &params);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t ath11k_write_twt_resume_dialog(struct file *file,
+					      const char __user *ubuf,
+					      size_t count, loff_t *ppos)
+{
+	struct ath11k_vif *arvif = file->private_data;
+	struct wmi_twt_resume_dialog_params params = { 0 };
+	u8 buf[64] = {0};
+	int ret;
+
+	if (arvif->ar->twt_enabled == 0) {
+		ath11k_err(arvif->ar->ab, "twt support is not enabled\n");
+		return -EOPNOTSUPP;
+	}
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0';
+	ret = sscanf(buf, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx %u %u %u",
+		     &params.peer_macaddr[0],
+		     &params.peer_macaddr[1],
+		     &params.peer_macaddr[2],
+		     &params.peer_macaddr[3],
+		     &params.peer_macaddr[4],
+		     &params.peer_macaddr[5],
+		     &params.dialog_id,
+		     &params.sp_offset_us,
+		     &params.next_twt_size);
+	if (ret != 9)
+		return -EINVAL;
+
+	params.vdev_id = arvif->vdev_id;
+
+	ret = ath11k_wmi_send_twt_resume_dialog_cmd(arvif->ar, &params);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static const struct file_operations ath11k_fops_twt_add_dialog = {
+	.write = ath11k_write_twt_add_dialog,
+	.open = simple_open
+};
+
+static const struct file_operations ath11k_fops_twt_del_dialog = {
+	.write = ath11k_write_twt_del_dialog,
+	.open = simple_open
+};
+
+static const struct file_operations ath11k_fops_twt_pause_dialog = {
+	.write = ath11k_write_twt_pause_dialog,
+	.open = simple_open
+};
+
+static const struct file_operations ath11k_fops_twt_resume_dialog = {
+	.write = ath11k_write_twt_resume_dialog,
+	.open = simple_open
+};
+
+int ath11k_debugfs_add_interface(struct ath11k_vif *arvif)
+{
+	if (arvif->vif->type == NL80211_IFTYPE_AP && !arvif->debugfs_twt) {
+		arvif->debugfs_twt = debugfs_create_dir("twt",
+							arvif->vif->debugfs_dir);
+		if (!arvif->debugfs_twt || IS_ERR(arvif->debugfs_twt)) {
+			ath11k_warn(arvif->ar->ab,
+				    "failed to create directory %p\n",
+				    arvif->debugfs_twt);
+			arvif->debugfs_twt = NULL;
+			return -1;
+		}
+
+		debugfs_create_file("add_dialog", 0200, arvif->debugfs_twt,
+				    arvif, &ath11k_fops_twt_add_dialog);
+
+		debugfs_create_file("del_dialog", 0200, arvif->debugfs_twt,
+				    arvif, &ath11k_fops_twt_del_dialog);
+
+		debugfs_create_file("pause_dialog", 0200, arvif->debugfs_twt,
+				    arvif, &ath11k_fops_twt_pause_dialog);
+
+		debugfs_create_file("resume_dialog", 0200, arvif->debugfs_twt,
+				    arvif, &ath11k_fops_twt_resume_dialog);
+	}
+	return 0;
+}
+
+void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif)
+{
+	debugfs_remove_recursive(arvif->debugfs_twt);
+	arvif->debugfs_twt = NULL;
+}
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index 4c0740394c95..8ee5759fadf8 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -151,6 +151,9 @@ static inline int ath11k_debugfs_rx_filter(struct ath11k *ar)
 	return ar->debug.rx_filter;
 }
 
+int ath11k_debugfs_add_interface(struct ath11k_vif *arvif);
+void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif);
+
 #else
 static inline int ath11k_debugfs_soc_create(struct ath11k_base *ab)
 {
@@ -224,6 +227,15 @@ static inline int ath11k_debugfs_get_fw_stats(struct ath11k *ar,
 	return 0;
 }
 
-#endif /* CONFIG_MAC80211_DEBUGFS*/
+static inline int ath11k_debugfs_add_interface(struct ath11k_vif *arvif)
+{
+	return 0;
+}
+
+static inline void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif)
+{
+}
+
+#endif /* CONFIG_ATH11K_DEBUGFS*/
 
 #endif /* _ATH11K_DEBUGFS_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 90fcd6adf2d5..ed899055944e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6354,6 +6354,10 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 		}
 	}
 
+	ret = ath11k_debugfs_add_interface(arvif);
+	if (ret)
+		goto err_peer_del;
+
 	mutex_unlock(&ar->conf_mutex);
 
 	return 0;
@@ -6388,6 +6392,7 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->data_lock);
 
 err:
+	ath11k_debugfs_remove_interface(arvif);
 	mutex_unlock(&ar->conf_mutex);
 
 	return ret;
@@ -6486,6 +6491,8 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	/* Recalc txpower for remaining vdev */
 	ath11k_mac_txpower_recalc(ar);
 
+	ath11k_debugfs_remove_interface(arvif);
+
 	/* TODO: recal traffic pause state based on the available vdevs */
 
 	mutex_unlock(&ar->conf_mutex);
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
