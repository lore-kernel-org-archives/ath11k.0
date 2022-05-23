Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67992C433F5
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 07:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzA7uf+9ETxTEkpbUiY4mcfhqsDWjpZsAcfnbwbdL1g=; b=UXCr+Nq2qWw06l
	FxbeOff0aGHN1QR2rX8XiTFhID9K4DqxG447xTz2NqbPXGXTS0+HpJPMJwCXWIZn9J0MgJTgNFHd+
	WmVM2fJPNr8DpmcAtDtqjYSvGpkhYnHAA4xFoY0xeuII+ChXSuzu5aY60HVMhtQ2XNA2b//GicDWi
	TzlVJo85QGPpNa7I4KzGW4jIHSlK6P4JP1id+P52D4HvACKlQ2ADtSaLg4HSVogDoHWXIWDZQBucZ
	eOAtqNjP7vGSSueqAZXfDXgjEAPDDJFUsVxHQIUc8rq/dMnyJWpEh3D1gHP5VWJ9jQZLgMYmUS5Jp
	VaQ6HQgEIbVD0fkmSiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt2oJ-002Al4-Ig; Mon, 23 May 2022 07:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2mH-002AAA-Sl
 for ath11k@bombadil.infradead.org; Mon, 23 May 2022 07:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Wm+clvYxOUYZTDvdTjXs0baQow+V2VcOboeqy51LGHw=; b=DKRxhstTKzr/JfPEczZN1cquN9
 Id9BdBtx4y+KIGcQNspHMXjWLsCJpiOY0Pkn3ZNl4IRsl/GlviJl17A2M0Z7cTZsGPszuLxcJcKwO
 gLWwKNVkXndpodq9oUur2Lx0FB9MBiAO9Gq6SWNP0slSXqD6N34BqJgBNEDBDSKl6/GekgvCZNgkB
 XpjZkir9kmSIWObhtYWfjh8NIY880FMCDznpcZJeKV5lEc2yKCzkVnJ97GvN0JkGboMVrWQ+F+o/2
 I20+WzKQOf62NaivZNAj8cqRi6yrdoA8Vu37PPLbfUGc6MoHswT2CeGs8/qMMpvDVewMf+doSBuat
 WGG7EK/Q==;
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt19M-000seF-S8
 for ath11k@lists.infradead.org; Mon, 23 May 2022 06:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653285761; x=1684821761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wm+clvYxOUYZTDvdTjXs0baQow+V2VcOboeqy51LGHw=;
 b=Cqy920l2mrkqARLJFDuXMEFVi1vGWAu3A9F5OpY0/6zN6yjJ8OrQh9Ug
 L6rPMSfjWxGFClqzYwWGubuUMHyTbbmI/aMnTvoH957Xn1o/mqIEQ75Tc
 IRtrSXeEz0+ZDdtn6O102hiHcnoqtj6isFw5WjoxBbnQRyUXPZx8jlDfR w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 May 2022 23:01:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 23:01:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:26 -0700
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:25 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>, John Crispin <john@phrozen.org>
Subject: [PATCH 1/9] mac80211: generate EMA beacons in AP mode
Date: Sun, 22 May 2022 23:01:00 -0700
Message-ID: <20220523060108.23982-2-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220523060108.23982-1-quic_alokad@quicinc.com>
References: <20220523060108.23982-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070241_899510_F346C317 
X-CRM114-Status: GOOD (  26.02  )
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

Add APIs to generate an array of beacons for an EMA AP (enhanced
multiple BSSID advertisements), each including a single MBSSID element.
EMA profile periodicity equals the count of elements.
- ieee80211_beacon_get_template_ema_list() - Generate and return all
EMA beacon templates. Drivers must call ieee80211_beacon_free_ema_list()
to free the memory. No change in the prototype for the existing API,
ieee80211_beacon_get_template(), which should be used for non-EMA AP.
- ieee80211_beacon_get_template_ema_index() - Generate a beacon which
includes the multiple BSSID element at the given index. Drivers can use
this function in a loop until NULL is returned which indicates end of
available MBSSID elements.
- ieee80211_beacon_free_ema_list() - free the memory allocated for the
list of EMA beacon templates.

Add new macro IEEE80211_MBSSID_ELEMS_ALL to be used for basic MBSSID
implementation without EMA.
Modify exsiting functions ieee80211_beacon_get_ap(),
ieee80211_get_mbssid_beacon_len() and ieee80211_beacon_add_mbssid()
to accept a new parameter for EMA index.

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Co-developed-by: John Crispin <john@phrozen.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
- This patch is the next version for the following series:
https://patchwork.kernel.org/project/linux-wireless/list/?series=558285&state=%2A&archive=both
The changes are now rebased on top of wireless-testing tree which
includes this series:
https://patchwork.kernel.org/project/linux-wireless/list/?series=617531&state=%2A&archive=both
- Replaced GFP_KERNEL with GFP_ATOMIC for the memory allocation
under RCU lock.
- CONFIG_DEBUG_ATOMIC_SLEEP, CONFIG_PROVE_LOCKING, CONFIG_PROVE_RCU
flags were enabled during compilation.

 include/net/mac80211.h     |  77 ++++++++++++++++++++++++++
 net/mac80211/cfg.c         |   9 ++-
 net/mac80211/ieee80211_i.h |   9 ++-
 net/mac80211/tx.c          | 110 +++++++++++++++++++++++++++++++++----
 4 files changed, 189 insertions(+), 16 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index ebadb2103968..ae6e50c64edb 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -5050,6 +5050,83 @@ ieee80211_beacon_get_template(struct ieee80211_hw *hw,
 			      struct ieee80211_vif *vif,
 			      struct ieee80211_mutable_offsets *offs);
 
+/**
+ * This macro should be used to get total length for all MBSSID elements
+ * in the beacon, and also to generate a single beacon template with
+ * all MBSSID elements.
+ */
+#define IEEE80211_MBSSID_ELEMS_ALL -1
+
+/**
+ * ieee80211_beacon_get_template_ema_index - EMA beacon template generation
+ *	function for drivers using the sw offload path.
+ * @hw: pointer obtained from ieee80211_alloc_hw().
+ * @vif: &struct ieee80211_vif pointer from the add_interface callback.
+ * @offs: &struct ieee80211_mutable_offsets pointer to struct that will
+ *	receive the offsets that may be updated by the driver.
+ * @ema_index: index of the beacon in the EMA set, should be more than
+ *	IEEE80211_MBSSID_ELEMS_ALL otherwise the set/get functions include all
+ *	MBSSID elements in a single beacon template.
+ *
+ * This function follows the same rules as ieee80211_beacon_get_template()
+ * but returns a beacon template which includes multiple BSSID element at the
+ * requested index.
+ *
+ * Return: The beacon template. %NULL indicates the end of EMA beacon templates.
+ */
+struct sk_buff *
+ieee80211_beacon_get_template_ema_index(struct ieee80211_hw *hw,
+					struct ieee80211_vif *vif,
+					struct ieee80211_mutable_offsets *offs,
+					u8 ema_index);
+
+/**
+ * struct ieee80211_ema_beacons - List of EMA beacons
+ * @cnt: count of EMA beacons.
+ *
+ * @bcn: array of EMA beacons.
+ * @bcn.skb: the skb containing this specific beacon
+ * @bcn.offs: &struct ieee80211_mutable_offsets pointer to struct that will
+ *	receive the offsets that may be updated by the driver.
+ */
+struct ieee80211_ema_beacons {
+	u8 cnt;
+	struct {
+		struct sk_buff *skb;
+		struct ieee80211_mutable_offsets offs;
+	} bcn[];
+};
+
+/**
+ * ieee80211_beacon_get_template_ema_list - EMA beacon template generation
+ *	function for drivers using the hw offload.
+ * @hw: pointer obtained from ieee80211_alloc_hw().
+ * @vif: &struct ieee80211_vif pointer from the add_interface callback.
+ * @ema_beacons: list of EMA beacons of type &struct ieee80211_ema_beacons.
+ *
+ * This function follows the same rules as ieee80211_beacon_get_template()
+ * but allocates and returns a pointer to list of all beacon templates required
+ * to cover all profiles in the multiple BSSID set. Each template includes only
+ * one multiple BSSID element.
+ *
+ * Driver must call ieee80211_beacon_free_ema_list() to free the memory.
+ *
+ * Return: EMA beacon templates of type struct ieee80211_ema_beacons *.
+ *	%NULL on error.
+ */
+struct ieee80211_ema_beacons *
+ieee80211_beacon_get_template_ema_list(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif);
+
+/**
+ * ieee80211_beacon_free_ema_list - free an EMA beacon template list
+ * @ema_beacons: list of EMA beacons of type &struct ieee80211_ema_beacons pointers.
+ *
+ * This function will free a list previously acquired by calling
+ * ieee80211_beacon_get_template_ema_list()
+ */
+void ieee80211_beacon_free_ema_list(struct ieee80211_ema_beacons *ema_beacons);
+
 /**
  * ieee80211_beacon_get_tim - beacon generation function
  * @hw: pointer obtained from ieee80211_alloc_hw().
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index bbec7d778084..42ea37647e5e 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1044,11 +1044,13 @@ static int ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
 	if (params->mbssid_ies) {
 		mbssid = params->mbssid_ies;
 		size += struct_size(new->mbssid_ies, elem, mbssid->cnt);
-		size += ieee80211_get_mbssid_beacon_len(mbssid);
+		size += ieee80211_get_mbssid_beacon_len(mbssid,
+							IEEE80211_MBSSID_ELEMS_ALL);
 	} else if (old && old->mbssid_ies) {
 		mbssid = old->mbssid_ies;
 		size += struct_size(new->mbssid_ies, elem, mbssid->cnt);
-		size += ieee80211_get_mbssid_beacon_len(mbssid);
+		size += ieee80211_get_mbssid_beacon_len(mbssid,
+							IEEE80211_MBSSID_ELEMS_ALL);
 	}
 
 	new = kzalloc(size, GFP_KERNEL);
@@ -3189,7 +3191,8 @@ cfg80211_beacon_dup(struct cfg80211_beacon_data *beacon)
 	len = beacon->head_len + beacon->tail_len + beacon->beacon_ies_len +
 	      beacon->proberesp_ies_len + beacon->assocresp_ies_len +
 	      beacon->probe_resp_len + beacon->lci_len + beacon->civicloc_len +
-	      ieee80211_get_mbssid_beacon_len(beacon->mbssid_ies);
+	      ieee80211_get_mbssid_beacon_len(beacon->mbssid_ies,
+					      IEEE80211_MBSSID_ELEMS_ALL);
 
 	new_beacon = kzalloc(sizeof(*new_beacon) + len, GFP_KERNEL);
 	if (!new_beacon)
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 86ef0a46a68c..c81c07c9ba3e 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1086,12 +1086,17 @@ ieee80211_vif_get_shift(struct ieee80211_vif *vif)
 }
 
 static inline int
-ieee80211_get_mbssid_beacon_len(struct cfg80211_mbssid_elems *elems)
+ieee80211_get_mbssid_beacon_len(struct cfg80211_mbssid_elems *elems, int i)
 {
-	int i, len = 0;
+	int len = 0;
 
 	if (!elems)
 		return 0;
+	else if (i < IEEE80211_MBSSID_ELEMS_ALL || i >= elems->cnt)
+		return -1;
+
+	if (i != IEEE80211_MBSSID_ELEMS_ALL)
+		return elems->elem[i].len;
 
 	for (i = 0; i < elems->cnt; i++)
 		len += elems->elem[i].len;
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 0e4efc08c762..56eb1f32a03b 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -5041,12 +5041,18 @@ ieee80211_beacon_get_finish(struct ieee80211_hw *hw,
 }
 
 static void
-ieee80211_beacon_add_mbssid(struct sk_buff *skb, struct beacon_data *beacon)
+ieee80211_beacon_add_mbssid(struct sk_buff *skb, struct beacon_data *beacon,
+			    int i)
 {
-	int i;
+	if (!beacon->mbssid_ies || !beacon->mbssid_ies->cnt ||
+	    i < IEEE80211_MBSSID_ELEMS_ALL || i >= beacon->mbssid_ies->cnt)
+		return;
 
-	if (!beacon->mbssid_ies)
+	if (i != IEEE80211_MBSSID_ELEMS_ALL) {
+		skb_put_data(skb, beacon->mbssid_ies->elem[i].data,
+			     beacon->mbssid_ies->elem[i].len);
 		return;
+	}
 
 	for (i = 0; i < beacon->mbssid_ies->cnt; i++)
 		skb_put_data(skb, beacon->mbssid_ies->elem[i].data,
@@ -5059,7 +5065,8 @@ ieee80211_beacon_get_ap(struct ieee80211_hw *hw,
 			struct ieee80211_mutable_offsets *offs,
 			bool is_template,
 			struct beacon_data *beacon,
-			struct ieee80211_chanctx_conf *chanctx_conf)
+			struct ieee80211_chanctx_conf *chanctx_conf,
+			int ema_index)
 {
 	struct ieee80211_local *local = hw_to_local(hw);
 	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
@@ -5078,7 +5085,11 @@ ieee80211_beacon_get_ap(struct ieee80211_hw *hw,
 	/* headroom, head length,
 	 * tail length, maximum TIM length and multiple BSSID length
 	 */
-	mbssid_len = ieee80211_get_mbssid_beacon_len(beacon->mbssid_ies);
+	mbssid_len = ieee80211_get_mbssid_beacon_len(beacon->mbssid_ies,
+						     ema_index);
+	if (mbssid_len == -1)
+		return NULL;
+
 	skb = dev_alloc_skb(local->tx_headroom + beacon->head_len +
 			    beacon->tail_len + 256 +
 			    local->hw.extra_beacon_tailroom + mbssid_len);
@@ -5096,7 +5107,7 @@ ieee80211_beacon_get_ap(struct ieee80211_hw *hw,
 		offs->cntdwn_counter_offs[0] = beacon->cntdwn_counter_offsets[0];
 
 		if (mbssid_len) {
-			ieee80211_beacon_add_mbssid(skb, beacon);
+			ieee80211_beacon_add_mbssid(skb, beacon, ema_index);
 			offs->mbssid_off = skb->len - mbssid_len;
 		}
 
@@ -5115,11 +5126,47 @@ ieee80211_beacon_get_ap(struct ieee80211_hw *hw,
 	return skb;
 }
 
+static void
+ieee80211_beacon_get_ap_ema_list(struct ieee80211_hw *hw,
+				 struct ieee80211_vif *vif,
+				 struct ieee80211_mutable_offsets *offs,
+				 bool is_template, struct beacon_data *beacon,
+				 struct ieee80211_chanctx_conf *chanctx_conf,
+				 struct ieee80211_ema_beacons **ema_beacons)
+{
+	struct ieee80211_ema_beacons *beacons;
+
+	*ema_beacons = NULL;
+	beacons = kzalloc(struct_size(beacons, bcn, beacon->mbssid_ies->cnt),
+			  GFP_ATOMIC);
+	if (!beacons)
+		return;
+
+	for (beacons->cnt = 0;
+	     beacons->cnt < beacon->mbssid_ies->cnt;
+	     beacons->cnt++) {
+		beacons->bcn[beacons->cnt].skb =
+			ieee80211_beacon_get_ap(hw, vif,
+						&beacons->bcn[beacons->cnt].offs,
+						is_template, beacon,
+						chanctx_conf, beacons->cnt);
+		if (!beacons->bcn[beacons->cnt].skb)
+			break;
+	}
+
+	if (!beacons->cnt || beacons->cnt < beacon->mbssid_ies->cnt)
+		ieee80211_beacon_free_ema_list(beacons);
+	else
+		*ema_beacons = beacons;
+}
+
 static struct sk_buff *
 __ieee80211_beacon_get(struct ieee80211_hw *hw,
 		       struct ieee80211_vif *vif,
 		       struct ieee80211_mutable_offsets *offs,
-		       bool is_template)
+		       bool is_template,
+		       int ema_index,
+		       struct ieee80211_ema_beacons **ema_beacons)
 {
 	struct ieee80211_local *local = hw_to_local(hw);
 	struct beacon_data *beacon = NULL;
@@ -5145,8 +5192,15 @@ __ieee80211_beacon_get(struct ieee80211_hw *hw,
 		if (!beacon)
 			goto out;
 
-		skb = ieee80211_beacon_get_ap(hw, vif, offs, is_template,
-					      beacon, chanctx_conf);
+		if (ema_beacons)
+			ieee80211_beacon_get_ap_ema_list(hw, vif, offs,
+							 is_template, beacon,
+							 chanctx_conf,
+							 ema_beacons);
+		else
+			skb = ieee80211_beacon_get_ap(hw, vif, offs,
+						      is_template, beacon,
+						      chanctx_conf, ema_index);
 	} else if (sdata->vif.type == NL80211_IFTYPE_ADHOC) {
 		struct ieee80211_if_ibss *ifibss = &sdata->u.ibss;
 		struct ieee80211_hdr *hdr;
@@ -5232,16 +5286,50 @@ ieee80211_beacon_get_template(struct ieee80211_hw *hw,
 			      struct ieee80211_vif *vif,
 			      struct ieee80211_mutable_offsets *offs)
 {
-	return __ieee80211_beacon_get(hw, vif, offs, true);
+	return __ieee80211_beacon_get(hw, vif, offs, true,
+				      IEEE80211_MBSSID_ELEMS_ALL, NULL);
 }
 EXPORT_SYMBOL(ieee80211_beacon_get_template);
 
+struct sk_buff *
+ieee80211_beacon_get_template_ema_index(struct ieee80211_hw *hw,
+					struct ieee80211_vif *vif,
+					struct ieee80211_mutable_offsets *offs,
+					u8 ema_index)
+{
+	return __ieee80211_beacon_get(hw, vif, offs, true, ema_index, NULL);
+}
+EXPORT_SYMBOL(ieee80211_beacon_get_template_ema_index);
+
+void ieee80211_beacon_free_ema_list(struct ieee80211_ema_beacons *ema_beacons)
+{
+	u8 i;
+
+	for (i = 0; i < ema_beacons->cnt; i++)
+		kfree_skb(ema_beacons->bcn[i].skb);
+
+	kfree(ema_beacons);
+}
+EXPORT_SYMBOL(ieee80211_beacon_free_ema_list);
+
+struct ieee80211_ema_beacons *
+ieee80211_beacon_get_template_ema_list(struct ieee80211_hw *hw,
+				       struct ieee80211_vif *vif)
+{
+	struct ieee80211_ema_beacons *ema_beacons = NULL;
+	(void)__ieee80211_beacon_get(hw, vif, NULL, false, 0, &ema_beacons);
+	return ema_beacons;
+}
+EXPORT_SYMBOL(ieee80211_beacon_get_template_ema_list);
+
 struct sk_buff *ieee80211_beacon_get_tim(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif,
 					 u16 *tim_offset, u16 *tim_length)
 {
 	struct ieee80211_mutable_offsets offs = {};
-	struct sk_buff *bcn = __ieee80211_beacon_get(hw, vif, &offs, false);
+	struct sk_buff *bcn = __ieee80211_beacon_get(hw, vif, &offs, false,
+						     IEEE80211_MBSSID_ELEMS_ALL,
+						     NULL);
 	struct sk_buff *copy;
 	struct ieee80211_supported_band *sband;
 	int shift;
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
