Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4557ACA5FDD
	for <ath11k@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xH6S5OjKbYJWdEh8nIEtHsohRD3NkPr2SaIOuoY0sS0=; b=08qgUht+2zgpvAfcjY1w3otiUs
	jFqJsoRdoMAP+s/2EGSD8pOSfHTXwGi0Z2iZWhaP7Wx0XyeCX04PsZVE3ld+ijCyn5TciHisXdRk7
	Qwj+UE29tEm4GW9yeMeYPBCk+Oye9UKnglvamozmGp2qqa8EcskTYuzxy1xloqcjYCNw2sO2Y9zYE
	2T/YObCAr7cpASrxkeDJKx+3RwGaLZDZV0Cr5c3vMH8walNn86V7AtTN99GJ8EXP+WB3nlfX1MBB8
	mPtpvrUjPcUTlD+GImBMxNmc4DJGekw+ja++3zZkUPwsHlgL8uztfxOHef7nc6p1H7//MAf6JZYr0
	Qs/1OssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD25k-0000000Diqt-1urd;
	Sat, 03 Oct 2026 15:56:04 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD25g-0000000DioU-2Zz3
	for ath11k@lists.infradead.org;
	Sat, 03 Oct 2026 15:56:02 +0000
Received: from MAILGW-BIG.big.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 05334E0FD;
	Sat, 03 Oct 2026 18:55:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=xH6S5OjKbYJWdEh8nIEt
	HsohRD3NkPr2SaIOuoY0sS0=; b=VkE64RAYclEf2U+VzYPXalWPPzEQpNtisb6M
	7UINDJrMZL7OpDd+qLF9CQi8UaOva3cfzDTtcQS/n80CJ0Wddl8leLPCouW07E+h
	620stUz3ejZj1ir6TPlyDJUb74HQuNymb9T9RNayt1Xl0R2FOALgff8NHpbTSgHW
	aKX20sOgMz8PDm5J87casI2FJN/RSCtJS9W/xxxaG5hUgBqVsvM+BUCe60QR9C38
	fq1MkyX1DiA55viBgzsNrVa/0Y7NOM76Nl4p/EOJtthvTJlnRH22VSea8DRD/807
	rIiKlek115h2xgro0S5NYG5MvPDvdDdf/LQtOnAgGp1cahMOmQ==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 40B6DE1C2;
	Sat, 03 Oct 2026 18:55:48 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 18:55:48 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 3/4] wifi: mac80211: notify driver on airtime weight changes
Date: Sat, 3 Oct 2026 18:55:41 +0300
Message-ID: <20261003155542.96363-4-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003155542.96363-1-me@andrei-z.com>
References: <20261003155542.96363-1-me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_085600_862956_AE915F80 
X-CRM114-Status: GOOD (  19.45  )
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

From: Felix Fietkau <nbd@nbd.name>

Add a new sta_set_airtime_weight driver op so drivers can program the
airtime fairness weight into hardware. The op is called when the weight
is updated via sta_apply_parameters, and on station upload if a
non-default weight is already set.

Signed-off-by: Felix Fietkau <nbd@nbd.name>

Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 include/net/mac80211.h    |  5 +++++
 net/mac80211/cfg.c        |  6 +++++-
 net/mac80211/driver-ops.c |  4 ++++
 net/mac80211/driver-ops.h | 19 +++++++++++++++++++
 net/mac80211/sta_info.c   |  7 ++++++-
 net/mac80211/trace.h      | 27 +++++++++++++++++++++++++++
 6 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index cb9f8e14b..aab98d92e 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4694,6 +4694,8 @@ struct ieee80211_prep_tx_info {
  * @set_sar_specs: Update the SAR (TX power) settings.
  * @sta_set_decap_offload: Called to notify the driver when a station is allowed
  *	to use rx decapsulation offload
+ * @sta_set_airtime_weight: Called to notify the driver of a change to a
+ *	station's airtime fairness weight, so it can be programmed in hardware.
  * @add_twt_setup: Update hw with TWT agreement parameters received from the peer.
  *	This callback allows the hw to check if requested parameters
  *	are supported and if there is enough room for a new agreement.
@@ -5108,6 +5110,9 @@ struct ieee80211_ops {
 	void (*sta_set_decap_offload)(struct ieee80211_hw *hw,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_sta *sta, bool enabled);
+	void (*sta_set_airtime_weight)(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif,
+				       struct ieee80211_sta *sta, u16 weight);
 	void (*add_twt_setup)(struct ieee80211_hw *hw,
 			      struct ieee80211_sta *sta,
 			      struct ieee80211_twt_setup *twt);
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index bd1a857c8..28f99a8f8 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2616,8 +2616,12 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 	if (ieee80211_vif_is_mesh(&sdata->vif))
 		sta_apply_mesh_params(local, sta, params);
 
-	if (params->airtime_weight)
+	if (params->airtime_weight) {
 		sta->airtime_weight = params->airtime_weight;
+		if (sta->uploaded)
+			drv_sta_set_airtime_weight(local, sdata, &sta->sta,
+						   sta->airtime_weight);
+	}
 
 	if (params->nmi_mac) {
 		struct ieee80211_sub_if_data *nmi =
diff --git a/net/mac80211/driver-ops.c b/net/mac80211/driver-ops.c
index 49753b73a..083c26517 100644
--- a/net/mac80211/driver-ops.c
+++ b/net/mac80211/driver-ops.c
@@ -157,6 +157,10 @@ int drv_sta_state(struct ieee80211_local *local,
 			sta->uploaded = true;
 			if (rcu_access_pointer(sta->sta.rates))
 				drv_sta_rate_tbl_update(local, sdata, &sta->sta);
+			if (sta->airtime_weight != IEEE80211_DEFAULT_AIRTIME_WEIGHT)
+				drv_sta_set_airtime_weight(local, sdata,
+							   &sta->sta,
+							   sta->airtime_weight);
 		}
 	} else if (old_state == IEEE80211_STA_ASSOC &&
 		   new_state == IEEE80211_STA_AUTH) {
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index f1c0b87fd..bd5c9d1ed 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1633,6 +1633,25 @@ static inline void drv_sta_set_decap_offload(struct ieee80211_local *local,
 	trace_drv_return_void(local);
 }
 
+static inline void drv_sta_set_airtime_weight(struct ieee80211_local *local,
+					      struct ieee80211_sub_if_data *sdata,
+					      struct ieee80211_sta *sta,
+					      u16 weight)
+{
+	sdata = get_bss_sdata(sdata);
+
+	might_sleep();
+	lockdep_assert_wiphy(local->hw.wiphy);
+	if (!check_sdata_in_driver(sdata))
+		return;
+
+	trace_drv_sta_set_airtime_weight(local, sdata, sta, weight);
+	if (local->ops->sta_set_airtime_weight)
+		local->ops->sta_set_airtime_weight(&local->hw, &sdata->vif, sta,
+						   weight);
+	trace_drv_return_void(local);
+}
+
 static inline void drv_add_twt_setup(struct ieee80211_local *local,
 				     struct ieee80211_sub_if_data *sdata,
 				     struct ieee80211_sta *sta,
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index e81cd1551..2ce3ef905 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -872,8 +872,13 @@ static int sta_info_insert_drv_state(struct ieee80211_local *local,
 		 * Drivers using legacy sta_add/sta_remove callbacks only
 		 * get uploaded set to true after sta_add is called.
 		 */
-		if (!local->ops->sta_add)
+		if (!local->ops->sta_add) {
 			sta->uploaded = true;
+			if (sta->airtime_weight != IEEE80211_DEFAULT_AIRTIME_WEIGHT)
+				drv_sta_set_airtime_weight(local, sdata,
+							   &sta->sta,
+							   sta->airtime_weight);
+		}
 		return 0;
 	}
 
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 562a4964a..3ae7e78de 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -2462,6 +2462,33 @@ DEFINE_EVENT(sta_flag_evt, drv_sta_set_decap_offload,
 	TP_ARGS(local, sdata, sta, enabled)
 );
 
+TRACE_EVENT(drv_sta_set_airtime_weight,
+	TP_PROTO(struct ieee80211_local *local,
+		 struct ieee80211_sub_if_data *sdata,
+		 struct ieee80211_sta *sta, u16 weight),
+
+	TP_ARGS(local, sdata, sta, weight),
+
+	TP_STRUCT__entry(
+		LOCAL_ENTRY
+		VIF_ENTRY
+		STA_ENTRY
+		__field(u16, weight)
+	),
+
+	TP_fast_assign(
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		STA_ASSIGN;
+		__entry->weight = weight;
+	),
+
+	TP_printk(
+		LOCAL_PR_FMT  VIF_PR_FMT  STA_PR_FMT " weight:%u",
+		LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG, __entry->weight
+	)
+);
+
 TRACE_EVENT(drv_add_twt_setup,
 	TP_PROTO(struct ieee80211_local *local,
 		 struct ieee80211_sta *sta,


