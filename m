Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E307C3DA79
	for <ath11k@archiver.kernel.org>; Mon, 15 Jan 2024 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=atlEj+PzljHFeiNDOtXU/bwhsHPVfdma3zGILln3RrY=; b=chUYXNgiW9K+pa4TxLrm9fk0u4
	aMRfN+LuJvM4tEbyTe+6V86infKkQ5voTMCVriHleK7l0nWFLZG8mKIK0U9sFu1+dylAFHuPyS/Wb
	MUKzPF8ot28BXA3d6FtZrJz7Fwi0+YfSEnFzDQy8SOZ7+Z77BUWC8b9vK1grtgW+KFV6e8dXNLfOL
	ANEoXTicjcQote0mWs62EPzXwWhlDLzLUwDpATjCQBpL13/dKlhrwI2iOoYiV+rwm3jvNbbSzCWef
	wB8wTTcdc4YC+XpNZTeNUrHAzBYNMCZO4fN9BdqlnDUo8F40U4gs7/fnSLAa8NpLCviiAWlcksqXU
	aTZukpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJyq-008Y9u-2a;
	Mon, 15 Jan 2024 10:14:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJyn-008Y8I-0P
	for ath11k@lists.infradead.org;
	Mon, 15 Jan 2024 10:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=atlEj+PzljHFeiNDOtXU/bwhsHPVfdma3zGILln3RrY=; t=1705313640; x=1706523240; 
	b=Ac4ON8ic2gqpldlaVq3XbrCstOQepNzZezySLZpLLlkUCHxZdSKQuG42Gy3ts4pUEYWZpkiSao/
	cSDBktCL7ZIUqvUWctuNmqCUGp8/riOKPy6n/Rwrr45I6XJed0uFUsT2MbDB+WfgbUQTVk/VC89yx
	JiU27w+5bgx6IDyZBM0qh1R+w2U4giMx8lWDXdxmhmckJFHBPN3FDgtuzm0U6iTD7cjX6OT/kKrAk
	ufCptRHxVvGHQlANnD6WS6EA7UqVrIhFVGox83sthzVsp2nOPREVSkNr4oi3RX0wxbFDau86DWwoa
	Gs4QtCZmJIuzrtV6SP9ipbbrGekZXDQpx5lA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1rPJyf-00000003OTd-3KW5;
	Mon, 15 Jan 2024 11:13:58 +0100
From: benjamin@sipsolutions.net
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH v2] wifi: ath11k: rely on mac80211 debugfs handling for vif
Date: Mon, 15 Jan 2024 11:13:49 +0100
Message-ID: <20240115101349.1276608-1-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_021405_161240_9991AF05 
X-CRM114-Status: GOOD (  16.22  )
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

From: Benjamin Berg <benjamin.berg@intel.com>

mac80211 started to delete debugfs entries in certain cases, causing a
ath11k to crash when it tried to delete the entries later. Fix this by
relying on mac80211 to delete the entries when appropriate and adding
them from the vif_add_debugfs handler.

Fixes: 0a3d898ee9a8 ("wifi: mac80211: add/remove driver debugfs entries as appropriate")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218364
Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>

---

v2:
 * Adjust commit message to say that this caused crashes
 * Fix function name to match mac80211 op
---
 drivers/net/wireless/ath/ath11k/core.h    |  4 ----
 drivers/net/wireless/ath/ath11k/debugfs.c | 25 +++++++++--------------
 drivers/net/wireless/ath/ath11k/debugfs.h | 12 ++---------
 drivers/net/wireless/ath/ath11k/mac.c     | 12 +----------
 4 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 7e3b6779f4e9..02e160d831be 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -368,10 +368,6 @@ struct ath11k_vif {
 	struct ieee80211_chanctx_conf chanctx;
 	struct ath11k_arp_ns_offload arp_ns_offload;
 	struct ath11k_rekey_data rekey_data;
-
-#ifdef CONFIG_ATH11K_DEBUGFS
-	struct dentry *debugfs_twt;
-#endif /* CONFIG_ATH11K_DEBUGFS */
 };
 
 struct ath11k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index a847bc0d50c0..f53b712e169f 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -1894,35 +1894,30 @@ static const struct file_operations ath11k_fops_twt_resume_dialog = {
 	.open = simple_open
 };
 
-void ath11k_debugfs_add_interface(struct ath11k_vif *arvif)
+void ath11k_debugfs_op_vif_add_debugfs(struct ieee80211_hw *hw,
+				      struct ieee80211_vif *vif)
 {
+	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ath11k_base *ab = arvif->ar->ab;
+	struct dentry *debugfs_twt;
 
 	if (arvif->vif->type != NL80211_IFTYPE_AP &&
 	    !(arvif->vif->type == NL80211_IFTYPE_STATION &&
 	      test_bit(WMI_TLV_SERVICE_STA_TWT, ab->wmi_ab.svc_map)))
 		return;
 
-	arvif->debugfs_twt = debugfs_create_dir("twt",
-						arvif->vif->debugfs_dir);
-	debugfs_create_file("add_dialog", 0200, arvif->debugfs_twt,
+	debugfs_twt = debugfs_create_dir("twt",
+					 arvif->vif->debugfs_dir);
+	debugfs_create_file("add_dialog", 0200, debugfs_twt,
 			    arvif, &ath11k_fops_twt_add_dialog);
 
-	debugfs_create_file("del_dialog", 0200, arvif->debugfs_twt,
+	debugfs_create_file("del_dialog", 0200, debugfs_twt,
 			    arvif, &ath11k_fops_twt_del_dialog);
 
-	debugfs_create_file("pause_dialog", 0200, arvif->debugfs_twt,
+	debugfs_create_file("pause_dialog", 0200, debugfs_twt,
 			    arvif, &ath11k_fops_twt_pause_dialog);
 
-	debugfs_create_file("resume_dialog", 0200, arvif->debugfs_twt,
+	debugfs_create_file("resume_dialog", 0200, debugfs_twt,
 			    arvif, &ath11k_fops_twt_resume_dialog);
 }
 
-void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif)
-{
-	if (!arvif->debugfs_twt)
-		return;
-
-	debugfs_remove_recursive(arvif->debugfs_twt);
-	arvif->debugfs_twt = NULL;
-}
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index 44d15845f39a..d6e38988fecf 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -307,8 +307,8 @@ static inline int ath11k_debugfs_rx_filter(struct ath11k *ar)
 	return ar->debug.rx_filter;
 }
 
-void ath11k_debugfs_add_interface(struct ath11k_vif *arvif);
-void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif);
+void ath11k_debugfs_op_vif_add_debugfs(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif);
 void ath11k_debugfs_add_dbring_entry(struct ath11k *ar,
 				     enum wmi_direct_buffer_module id,
 				     enum ath11k_dbg_dbr_event event,
@@ -387,14 +387,6 @@ static inline int ath11k_debugfs_get_fw_stats(struct ath11k *ar,
 	return 0;
 }
 
-static inline void ath11k_debugfs_add_interface(struct ath11k_vif *arvif)
-{
-}
-
-static inline void ath11k_debugfs_remove_interface(struct ath11k_vif *arvif)
-{
-}
-
 static inline void
 ath11k_debugfs_add_dbring_entry(struct ath11k *ar,
 				enum wmi_direct_buffer_module id,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index db241589424d..b980680e0d9c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6756,13 +6756,6 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 		goto err;
 	}
 
-	/* In the case of hardware recovery, debugfs files are
-	 * not deleted since ieee80211_ops.remove_interface() is
-	 * not invoked. In such cases, try to delete the files.
-	 * These will be re-created later.
-	 */
-	ath11k_debugfs_remove_interface(arvif);
-
 	memset(arvif, 0, sizeof(*arvif));
 
 	arvif->ar = ar;
@@ -6939,8 +6932,6 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 
 	ath11k_dp_vdev_tx_attach(ar, arvif);
 
-	ath11k_debugfs_add_interface(arvif);
-
 	if (vif->type != NL80211_IFTYPE_MONITOR &&
 	    test_bit(ATH11K_FLAG_MONITOR_CONF_ENABLED, &ar->monitor_flags)) {
 		ret = ath11k_mac_monitor_vdev_create(ar);
@@ -7056,8 +7047,6 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	/* Recalc txpower for remaining vdev */
 	ath11k_mac_txpower_recalc(ar);
 
-	ath11k_debugfs_remove_interface(arvif);
-
 	/* TODO: recal traffic pause state based on the available vdevs */
 
 	mutex_unlock(&ar->conf_mutex);
@@ -9153,6 +9142,7 @@ static const struct ieee80211_ops ath11k_ops = {
 #endif
 
 #ifdef CONFIG_ATH11K_DEBUGFS
+	.vif_add_debugfs		= ath11k_debugfs_op_vif_add_debugfs,
 	.sta_add_debugfs		= ath11k_debugfs_sta_op_add,
 #endif
 
-- 
2.43.0


