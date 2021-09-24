Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A22EC433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:02:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0D4E60E9B
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0D4E60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5AtdjROcefI1SUfojJrHPNvfRiqg2QAEtizL6xDbCo=; b=szE3mIw4vuNUUf
	ozCn086YGAmbyGuE6YOCOz5v8o26EubpSWTj09jPLoDnBtKRC25OeR+MOFNfmkAfiKUfQKAIdt2nP
	F4WmjwLIIRFaI9pzlKggeaJ+d1N4HTRBCG9L2MISNFAROdNsjAmA5X/4bIZUvFaBoxKgLCAAQbk2C
	KSZRhXnwOPyItAlAdDBQIR00Pqu6j+peDnT9FoQriGZs9oUKwuRonPLl8QyQP7Snuxnm/vdrlS9Ma
	c4VQNJbOj6BgqUfmNC7YEW8l9HPpZlorLP6ddnuapOicdsJ63tZJgzu8Z+LSe5hX17Op6ADUMabr4
	Xe0A0ccp4KktOrWPoLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTi25-00E1qN-5K; Fri, 24 Sep 2021 10:02:17 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTi1x-00E1mj-LO
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 10:02:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632477734; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Q413KGta+k7TOYtIZAnM1PSYQsRqqLvaq1zUGokFF+k=;
 b=QZRE7d3wMJqkqy5gZJPIq/NOnhJyWMxfOLP6IvsR5LbP6zFVjzJ/nPghKsWblvXRPlt3PbTm
 TE62nb9dgcriptGTsxfYHMEHT+UE7N3BxvpFIG4jg63jTad7yaTe0/c01gx9LrlmWugQJYRB
 KM9Mrs8mmov9lfess3blYepKRrY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 614da1f3b585cc7d24816cf2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 10:01:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 59327C43618; Fri, 24 Sep 2021 10:01:23 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 75A6CC43460;
 Fri, 24 Sep 2021 10:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 75A6CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v4 5/6] mac80211: use ieee802_11_parse_elems() to find ies
 instead of ieee80211_bss_get_ie()
Date: Fri, 24 Sep 2021 06:00:51 -0400
Message-Id: <20210924100052.32029-6-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924100052.32029-1-wgong@codeaurora.org>
References: <20210924100052.32029-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_030214_754482_E7D2C7B8 
X-CRM114-Status: GOOD (  14.86  )
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

In function ieee80211_prep_channel(), it has some ieee80211_bss_get_ie()
and cfg80211_find_ext_ie() to get the IE, this is to use another
function ieee802_11_parse_elems() to get all the IEs in one time.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/mlme.c | 52 +++++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index e80f3388b0c5..6e8e90ee8b6c 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -4998,10 +4998,22 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 	bool is_6ghz = cbss->channel->band == NL80211_BAND_6GHZ;
 	bool is_5ghz = cbss->channel->band == NL80211_BAND_5GHZ;
 	struct ieee80211_bss *bss = (void *)cbss->priv;
+	struct ieee802_11_elems *elems;
+	const struct cfg80211_bss_ies *ies;
 	int ret;
 	u32 i;
 	bool have_80mhz;
 
+	rcu_read_lock();
+
+	ies = rcu_dereference(cbss->ies);
+	elems = ieee802_11_parse_elems(ies->data, ies->len, false,
+				       NULL, NULL);
+	if (!elems) {
+		rcu_read_unlock();
+		return -EINVAL;
+	}
+
 	sband = local->hw.wiphy->bands[cbss->channel->band];
 
 	ifmgd->flags &= ~(IEEE80211_STA_DISABLE_40MHZ |
@@ -5024,16 +5036,18 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 					 ieee80211_vif_type_p2p(&sdata->vif)))
 		ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
 
-	rcu_read_lock();
-
 	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HT) && !is_6ghz) {
 		const u8 *ht_oper_ie, *ht_cap_ie;
 
-		ht_oper_ie = ieee80211_bss_get_ie(cbss, WLAN_EID_HT_OPERATION);
+		ht_oper_ie = elems->ht_operation ?
+			((const u8 *)elems->ht_operation) - 2 :
+			NULL;
 		if (ht_oper_ie && ht_oper_ie[1] >= sizeof(*ht_oper))
 			ht_oper = (void *)(ht_oper_ie + 2);
 
-		ht_cap_ie = ieee80211_bss_get_ie(cbss, WLAN_EID_HT_CAPABILITY);
+		ht_cap_ie = elems->ht_cap_elem ?
+			((const u8 *)elems->ht_cap_elem) - 2 :
+			NULL;
 		if (ht_cap_ie && ht_cap_ie[1] >= sizeof(*ht_cap))
 			ht_cap = (void *)(ht_cap_ie + 2);
 
@@ -5046,8 +5060,9 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_VHT) && !is_6ghz) {
 		const u8 *vht_oper_ie, *vht_cap;
 
-		vht_oper_ie = ieee80211_bss_get_ie(cbss,
-						   WLAN_EID_VHT_OPERATION);
+		vht_oper_ie = elems->vht_operation ?
+			((const u8 *)elems->vht_operation) - 2 :
+			NULL;
 		if (vht_oper_ie && vht_oper_ie[1] >= sizeof(*vht_oper))
 			vht_oper = (void *)(vht_oper_ie + 2);
 		if (vht_oper && !ht_oper) {
@@ -5059,7 +5074,9 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 			ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
 		}
 
-		vht_cap = ieee80211_bss_get_ie(cbss, WLAN_EID_VHT_CAPABILITY);
+		vht_cap = elems->vht_cap_elem ?
+			((const u8 *)elems->vht_cap_elem) - 2 :
+			NULL;
 		if (!vht_cap || vht_cap[1] < sizeof(struct ieee80211_vht_cap)) {
 			ifmgd->flags |= IEEE80211_STA_DISABLE_VHT;
 			vht_oper = NULL;
@@ -5067,12 +5084,11 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 	}
 
 	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HE)) {
-		const struct cfg80211_bss_ies *ies;
 		const u8 *he_oper_ie;
 
-		ies = rcu_dereference(cbss->ies);
-		he_oper_ie = cfg80211_find_ext_ie(WLAN_EID_EXT_HE_OPERATION,
-						  ies->data, ies->len);
+		he_oper_ie = elems->he_operation ?
+			((const u8 *)elems->he_operation) - 3 :
+			NULL;
 		if (he_oper_ie &&
 		    he_oper_ie[1] >= ieee80211_he_oper_size(&he_oper_ie[3]))
 			he_oper = (void *)(he_oper_ie + 3);
@@ -5100,8 +5116,9 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 	if (sband->band == NL80211_BAND_S1GHZ) {
 		const u8 *s1g_oper_ie;
 
-		s1g_oper_ie = ieee80211_bss_get_ie(cbss,
-						   WLAN_EID_S1G_OPERATION);
+		s1g_oper_ie = elems->s1g_oper ?
+			((const u8 *)elems->s1g_oper) - 2 :
+			NULL;
 		if (s1g_oper_ie && s1g_oper_ie[1] >= sizeof(*s1g_oper))
 			s1g_oper = (void *)(s1g_oper_ie + 2);
 		else
@@ -5123,7 +5140,8 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 
 	if (ifmgd->flags & IEEE80211_STA_DISABLE_HE && is_6ghz) {
 		sdata_info(sdata, "Rejecting non-HE 6/7 GHz connection");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_no_lock;
 	}
 
 	/* will change later if needed */
@@ -5141,15 +5159,17 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 	/* don't downgrade for 5 and 10 MHz channels, though. */
 	if (chandef.width == NL80211_CHAN_WIDTH_5 ||
 	    chandef.width == NL80211_CHAN_WIDTH_10)
-		goto out;
+		goto out_lock;
 
 	while (ret && chandef.width != NL80211_CHAN_WIDTH_20_NOHT) {
 		ifmgd->flags |= ieee80211_chandef_downgrade(&chandef);
 		ret = ieee80211_vif_use_channel(sdata, &chandef,
 						IEEE80211_CHANCTX_SHARED);
 	}
- out:
+ out_lock:
 	mutex_unlock(&local->mtx);
+ out_no_lock:
+	kfree(elems);
 	return ret;
 }
 
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
