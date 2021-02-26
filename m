Return-Path: <SRS0=HpXl=H4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8DAC433E0
	for <ath11k@archiver.kernel.org>; Fri, 26 Feb 2021 12:01:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC35A6186A
	for <ath11k@archiver.kernel.org>; Fri, 26 Feb 2021 12:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC35A6186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDW8UoGtb8EogBH28ITz7z5IfsGHlU1zIVIxqENzN2c=; b=bNIZ+0+oA+ntG0VcRIevJjFP3O
	2ZxiAlBbGCAHFlxxqHY8SELjfrBOgBZal3M1dmR+OimkxB+WJjy29jQ8cLGk47ezUnbV+/IUfw2qZ
	OkzPocmEK0tUOGBNP3ejSxDLw4+6KaYeP8o//I8X+n/YL0h6voxjyG4hod0QWoJIiSSiZQjXYBu5k
	XZf4q/UtYsqZAJQBvy1BFnZh/rdG7ns/02j0C90crPu2kvGMqkFfCDq+rNg5WJTyJMgchin+q62DU
	R5e4qm0+qz8s2pqYmxulpAYVfucAsCU6Kd8/KewXyMhzTXGUxbZhX6XPvQcd3zMUPSIyJkIy1H3yZ
	KWsVk2CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFboc-0002qD-Cv; Fri, 26 Feb 2021 12:01:50 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFboU-0002oq-A3
 for ath11k@lists.infradead.org; Fri, 26 Feb 2021 12:01:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614340907; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jpruO1+MevPHLMOvmxcJcR7b+FAAZIJrSGev0HKg+e8=;
 b=gWfwmzajr8C0T6K5uOyGx1ErW0u5XypwG+ITE7XdYffRLQjLXnI9Bs4Jn8FJGGmEfcHDXkSz
 bO8mhkMYqEOMg/mMvPaJVyZTt1gYd/VelU2rFKmGIG7ig8Ze9JI8CuVZpkPWRttSQ4kBGhbX
 85F54Bacvt3e8vMZmZP/vc5Jz64=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6038e3087f306299bf3f7824 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 12:01:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D6063C433CA; Fri, 26 Feb 2021 12:01:11 +0000 (UTC)
Received: from lavaks-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: lavaks)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F245BC433C6;
 Fri, 26 Feb 2021 12:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F245BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=lavaks@codeaurora.org
From: Lavanya Suresh <lavaks@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: Add support for STA to handle beacon miss
Date: Fri, 26 Feb 2021 17:30:59 +0530
Message-Id: <1614340859-28867-1-git-send-email-lavaks@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_070147_465916_D9DCFD56 
X-CRM114-Status: GOOD (  18.81  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Lavanya Suresh <lavaks@codeaurora.org>, linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

When AP goes down without any indication to STA, firmware detects
missing beacon, and sends wmi roam event with reason BEACON_MISS
to the host.

Added support for STA mode to trigger disassociation from AP,
on receiving this event from firmware.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01717-QCAHKSWPL_SILICONZ-1
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 79 +++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/mac.h  |  2 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 11 ++---
 4 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index ad8e7cf..9f4370d 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -34,6 +34,7 @@
 #define ATH11K_PRB_RSP_DROP_THRESHOLD ((ATH11K_TX_MGMT_TARGET_MAX_SUPPORT_WMI * 3) / 4)
 
 #define ATH11K_INVALID_HW_MAC_ID	0xFF
+#define ATH11K_CONNECTION_LOSS_HZ	(3 * HZ)
 
 extern unsigned int ath11k_frame_mode;
 
@@ -235,6 +236,7 @@ struct ath11k_vif {
 	u32 aid;
 	u8 bssid[ETH_ALEN];
 	struct cfg80211_bitrate_mask bitrate_mask;
+	struct delayed_work connection_loss_work;
 	int num_legacy_stations;
 	int rtscts_prot_mode;
 	int txpower;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3c1f35a..c9bd615 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -829,6 +829,75 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac vdev %d up\n", arvif->vdev_id);
 }
 
+static void ath11k_mac_handle_beacon_iter(void *data, u8 *mac,
+					  struct ieee80211_vif *vif)
+{
+	struct sk_buff *skb = data;
+	struct ieee80211_mgmt *mgmt = (void *)skb->data;
+	struct ath11k_vif *arvif = (void *)vif->drv_priv;
+
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return;
+
+	if (!ether_addr_equal(mgmt->bssid, vif->bss_conf.bssid))
+		return;
+
+	cancel_delayed_work(&arvif->connection_loss_work);
+}
+
+void ath11k_mac_handle_beacon(struct ath11k *ar, struct sk_buff *skb)
+{
+	ieee80211_iterate_active_interfaces_atomic(ar->hw,
+						   IEEE80211_IFACE_ITER_NORMAL,
+						   ath11k_mac_handle_beacon_iter,
+						   skb);
+}
+
+static void ath11k_mac_handle_beacon_miss_iter(void *data, u8 *mac,
+					       struct ieee80211_vif *vif)
+{
+	u32 *vdev_id = data;
+	struct ath11k_vif *arvif = (void *)vif->drv_priv;
+	struct ath11k *ar = arvif->ar;
+	struct ieee80211_hw *hw = ar->hw;
+
+	if (arvif->vdev_id != *vdev_id)
+		return;
+
+	if (!arvif->is_up)
+		return;
+
+	ieee80211_beacon_loss(vif);
+
+	/* Firmware doesn't report beacon loss events repeatedly. If AP probe
+	 * (done by mac80211) succeeds but beacons do not resume then it
+	 * doesn't make sense to continue operation. Queue connection loss work
+	 * which can be cancelled when beacon is received.
+	 */
+	ieee80211_queue_delayed_work(hw, &arvif->connection_loss_work,
+				     ATH11K_CONNECTION_LOSS_HZ);
+}
+
+void ath11k_mac_handle_beacon_miss(struct ath11k *ar, u32 vdev_id)
+{
+	ieee80211_iterate_active_interfaces_atomic(ar->hw,
+						   IEEE80211_IFACE_ITER_NORMAL,
+						   ath11k_mac_handle_beacon_miss_iter,
+						   &vdev_id);
+}
+
+static void ath11k_mac_vif_sta_connection_loss_work(struct work_struct *work)
+{
+	struct ath11k_vif *arvif = container_of(work, struct ath11k_vif,
+						connection_loss_work.work);
+	struct ieee80211_vif *vif = arvif->vif;
+
+	if (!arvif->is_up)
+		return;
+
+	ieee80211_connection_loss(vif);
+}
+
 static void ath11k_peer_assoc_h_basic(struct ath11k *ar,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_sta *sta,
@@ -1760,7 +1829,7 @@ static void ath11k_bss_disassoc(struct ieee80211_hw *hw,
 
 	arvif->is_up = false;
 
-	/* TODO: cancel connection_loss_work */
+	cancel_delayed_work_sync(&arvif->connection_loss_work);
 }
 
 static u32 ath11k_mac_get_rate_hw_value(int bitrate)
@@ -4615,10 +4684,8 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	arvif->vif = vif;
 
 	INIT_LIST_HEAD(&arvif->list);
-
-	/* Should we initialize any worker to handle connection loss indication
-	 * from firmware in sta mode?
-	 */
+	INIT_DELAYED_WORK(&arvif->connection_loss_work,
+			  ath11k_mac_vif_sta_connection_loss_work);
 
 	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
 		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
@@ -4827,6 +4894,8 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	int ret;
 	int i;
 
+	cancel_delayed_work_sync(&arvif->connection_loss_work);
+
 	mutex_lock(&ar->conf_mutex);
 
 	ath11k_dbg(ab, ATH11K_DBG_MAC, "mac remove interface (vdev %d)\n",
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 4555779..4bc59bd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -150,4 +150,6 @@ int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
 enum ath11k_supported_bw ath11k_mac_mac80211_bw_to_ath11k_bw(enum rate_info_bw bw);
 enum hal_encrypt_type ath11k_dp_tx_get_encrypt_type(u32 cipher);
+void ath11k_mac_handle_beacon(struct ath11k *ar, struct sk_buff *skb);
+void ath11k_mac_handle_beacon_miss(struct ath11k *ar, u32 vdev_id);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index ca5cda8..5ca2d80 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6171,10 +6171,8 @@ static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 		}
 	}
 
-	/* TODO: Pending handle beacon implementation
-	 *if (ieee80211_is_beacon(hdr->frame_control))
-	 *	ath11k_mac_handle_beacon(ar, skb);
-	 */
+	if (ieee80211_is_beacon(hdr->frame_control))
+		ath11k_mac_handle_beacon(ar, skb);
 
 	ath11k_dbg(ab, ATH11K_DBG_MGMT,
 		   "event mgmt rx skb %pK len %d ftype %02x stype %02x\n",
@@ -6393,10 +6391,7 @@ static void ath11k_roam_event(struct ath11k_base *ab, struct sk_buff *skb)
 
 	switch (roam_ev.reason) {
 	case WMI_ROAM_REASON_BEACON_MISS:
-		/* TODO: Pending beacon miss and connection_loss_work
-		 * implementation
-		 * ath11k_mac_handle_beacon_miss(ar, vdev_id);
-		 */
+		ath11k_mac_handle_beacon_miss(ar, roam_ev.vdev_id);
 		break;
 	case WMI_ROAM_REASON_BETTER_AP:
 	case WMI_ROAM_REASON_LOW_RSSI:
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
