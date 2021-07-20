Return-Path: <SRS0=yaCs=MM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B2CC07E95
	for <ath11k@archiver.kernel.org>; Tue, 20 Jul 2021 21:32:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D63D60FD7
	for <ath11k@archiver.kernel.org>; Tue, 20 Jul 2021 21:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D63D60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pGq6LmNVlgAohZxeCreS3L0U0tQK6++klX9TmUtoZsM=; b=5FS4v3InXBeg7f
	3NVJqlgzlDS31ftMgGpWEUXjcs6RmXH3QrOxTqd05zkJpP2KoNveMcGhZJTOlhaXytr7046XdRKsp
	A4NRAIBcqVe4/iJf+JgNGtvz7KgYgARbuxfOGQUdiuNLznT6+aSZ6uL1ops58t47v9+0m1RO+3cM9
	Q7RE3/m1LZias2Bsu//fU26zEy2DJeSP69ue4IuFxRg0ZnXP4QmZof5Yfy+c8Na6t1AS6I+SJJ/Xo
	1iz8/1i1GCWaL66DQL7eRg3/+vMHc4UT89rLZrL2DorzMMz4Sg4Ix1BvZm4EmfGUNNylEhx4rY88h
	UNIt7wXMNhKj70+68LfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5xLV-00Dyji-Dj; Tue, 20 Jul 2021 21:32:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5xLS-00DyiW-82
 for ath11k@lists.infradead.org; Tue, 20 Jul 2021 21:32:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626816725; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=0NKtP900YLYCGbw3/GGjWWripcJNlTdjFgNVgginJt0=;
 b=kZ2465McJ1KtGW5U3/EaouYQ6o/dbH6+OLrs0Bs0fNa2FSIU9dvjfpowXRGdGxVh8Jc/L6WM
 Q7Jkhu3aW8GHnd9ymitV/HWVQsvogwRuHcOKZ5gF944cK6KldWh2WqTajrw3O78pDj71ylPC
 djXRwu+qmXmV5lG0J4FAPhxacHA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60f740d3e31d882d187599b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 21:32:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0D71FC433D3; Tue, 20 Jul 2021 21:32:03 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 07C11C433F1;
 Tue, 20 Jul 2021 21:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07C11C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sathishkumar Muruganandam <murugana@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/2] ath11k: fix 4-addr tx failure for AP and STA modes
Date: Wed, 21 Jul 2021 00:31:46 +0300
Message-Id: <20210720213147.90042-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_143206_420025_52D10A33 
X-CRM114-Status: GOOD (  18.95  )
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

From: Sathishkumar Muruganandam <murugana@codeaurora.org>

Ath11k FW requires peer parameter WMI_PEER_USE_4ADDR to be set for
4-addr peers allowing 4-address frame transmission to those peers.

Add ath11k driver callback for sta_set_4addr() to queue new workq
set_4addr_wk only once based on new boolean, use_4addr_set.

sta_set_4addr() will be called during 4-addr STA association cases
applicable for both AP and STA modes.

In ath11k_sta_set_4addr_wk(),

AP mode:
        WMI_PEER_USE_4ADDR will be set for the corresponding
        associated 4-addr STA(s)

STA mode:
        WMI_PEER_USE_4ADDR will be set for the AP to which the
        4-addr STA got associated.

Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h |  3 ++
 drivers/net/wireless/ath/ath11k/mac.c  | 48 ++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 018fb2385f2a..11c8dffd0236 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -362,6 +362,7 @@ struct ath11k_sta {
 	enum hal_pn_type pn_type;
 
 	struct work_struct update_wk;
+	struct work_struct set_4addr_wk;
 	struct rate_info txrate;
 	struct rate_info last_txrate;
 	u64 rx_duration;
@@ -374,6 +375,8 @@ struct ath11k_sta {
 	/* protected by conf_mutex */
 	bool aggr_mode;
 #endif
+
+	bool use_4addr_set;
 };
 
 #define ATH11K_MIN_5G_FREQ 4150
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index e9b3689331ec..d42637ecbf1e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3155,6 +3155,31 @@ static void ath11k_sta_rc_update_wk(struct work_struct *wk)
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static void ath11k_sta_set_4addr_wk(struct work_struct *wk)
+{
+	struct ath11k *ar;
+	struct ath11k_vif *arvif;
+	struct ath11k_sta *arsta;
+	struct ieee80211_sta *sta;
+	int ret = 0;
+
+	arsta = container_of(wk, struct ath11k_sta, set_4addr_wk);
+	sta = container_of((void *)arsta, struct ieee80211_sta, drv_priv);
+	arvif = arsta->arvif;
+	ar = arvif->ar;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+		   "setting USE_4ADDR for peer %pM\n", sta->addr);
+
+	ret = ath11k_wmi_set_peer_param(ar, sta->addr,
+					arvif->vdev_id,
+					WMI_PEER_USE_4ADDR, 1);
+
+	if (ret)
+		ath11k_warn(ar->ab, "failed to set peer %pM 4addr capability: %d\n",
+			    sta->addr, ret);
+}
+
 static int ath11k_mac_inc_num_stations(struct ath11k_vif *arvif,
 				       struct ieee80211_sta *sta)
 {
@@ -3234,11 +3259,13 @@ static int ath11k_mac_station_add(struct ath11k *ar,
 	}
 
 	if (ieee80211_vif_is_mesh(vif)) {
+		ath11k_dbg(ab, ATH11K_DBG_MAC,
+			   "setting USE_4ADDR for mesh STA %pM\n", sta->addr);
 		ret = ath11k_wmi_set_peer_param(ar, sta->addr,
 						arvif->vdev_id,
 						WMI_PEER_USE_4ADDR, 1);
 		if (ret) {
-			ath11k_warn(ab, "failed to STA %pM 4addr capability: %d\n",
+			ath11k_warn(ab, "failed to set mesh STA %pM 4addr capability: %d\n",
 				    sta->addr, ret);
 			goto free_tx_stats;
 		}
@@ -3291,8 +3318,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 
 	/* cancel must be done outside the mutex to avoid deadlock */
 	if ((old_state == IEEE80211_STA_NONE &&
-	     new_state == IEEE80211_STA_NOTEXIST))
+	     new_state == IEEE80211_STA_NOTEXIST)) {
 		cancel_work_sync(&arsta->update_wk);
+		cancel_work_sync(&arsta->set_4addr_wk);
+	}
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -3301,6 +3330,7 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		memset(arsta, 0, sizeof(*arsta));
 		arsta->arvif = arvif;
 		INIT_WORK(&arsta->update_wk, ath11k_sta_rc_update_wk);
+		INIT_WORK(&arsta->set_4addr_wk, ath11k_sta_set_4addr_wk);
 
 		ret = ath11k_mac_station_add(ar, vif, sta);
 		if (ret)
@@ -3395,6 +3425,19 @@ static int ath11k_mac_op_sta_set_txpwr(struct ieee80211_hw *hw,
 	return ret;
 }
 
+static void ath11k_mac_op_sta_set_4addr(struct ieee80211_hw *hw,
+					struct ieee80211_vif *vif,
+					struct ieee80211_sta *sta, bool enabled)
+{
+	struct ath11k *ar = hw->priv;
+	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+
+	if (enabled && !arsta->use_4addr_set) {
+		ieee80211_queue_work(ar->hw, &arsta->set_4addr_wk);
+		arsta->use_4addr_set = true;
+	}
+}
+
 static void ath11k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 					struct ieee80211_vif *vif,
 					struct ieee80211_sta *sta,
@@ -6180,6 +6223,7 @@ static const struct ieee80211_ops ath11k_ops = {
 	.cancel_hw_scan                 = ath11k_mac_op_cancel_hw_scan,
 	.set_key                        = ath11k_mac_op_set_key,
 	.sta_state                      = ath11k_mac_op_sta_state,
+	.sta_set_4addr                  = ath11k_mac_op_sta_set_4addr,
 	.sta_set_txpwr			= ath11k_mac_op_sta_set_txpwr,
 	.sta_rc_update			= ath11k_mac_op_sta_rc_update,
 	.conf_tx                        = ath11k_mac_op_conf_tx,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
