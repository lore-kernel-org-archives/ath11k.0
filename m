Return-Path: <SRS0=cAg3=F5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09077C433DB
	for <ath11k@archiver.kernel.org>; Fri, 25 Dec 2020 03:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC1922E02
	for <ath11k@archiver.kernel.org>; Fri, 25 Dec 2020 03:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC1922E02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yz18GGe4+mKTCQxhgb4pLXdHWwjqAmXF6qYOGqhl2lY=; b=s3tDzgIFtia5aGaNxg2DMP60dT
	yuPrpJrfdOXI9WG+4j9weMca7JvOA+xWWkPFJ2q4UQXMQC1lgPhteGOJrgUayuo9Tieqgvnpl3ueu
	k4V16d+EGe1CnGzA1IB9m3UHn0+pa0ds0umoc0MeBJboC4x+0oC8moxllIGj2UkS6DlYGGz14q9Bh
	T/NNCitFS8sQdtR/kLA/TQYnXwrsMz9w7VancZZPwwSci0BlhgtcRI3tJctds7B3HvDTtgWYoogIC
	c1HHQKSHsAIaGOLgTEypWRV1MI4wa3LUC4W3B+nzTficlBCUkYXdBBCcPj+xapYx60doTsbRVJ3V1
	B8JtvvVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksdvh-0005RW-VD; Fri, 25 Dec 2020 03:38:14 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksdvf-0005R3-8v
 for ath11k@lists.infradead.org; Fri, 25 Dec 2020 03:38:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608867488; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=E8vYsKkq6BnmzpdLh4XgJlLYhEAxDx1Uw9LKb+ohQHA=;
 b=r9JKjAxYqxCcoaDkS92tAQ7lQS/KM0yKU/iaViOy9So+nywAfDJq7w/lF+7/WQyjWwEcJpJw
 pu2poTsZk+wwWCRk8kE85qcn8ykUA045t3Gyf1+0FAx7JyMS84GmAXnYRCc03seN04aPIXiR
 jVuvCb+Qiq0nqPwcF+zFEeYirfo=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fe55e9fda471981883376cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Dec 2020 03:38:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C41CC433ED; Fri, 25 Dec 2020 03:38:07 +0000 (UTC)
Received: from gongwen-ThinkPad-T420.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 50BC3C433CA;
 Fri, 25 Dec 2020 03:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50BC3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Subject: [PATCH v2] mac80211: do intersection with he mcs and nss set of peer
 and own
Date: Fri, 25 Dec 2020 11:39:14 +0800
Message-Id: <1608867554-8838-1-git-send-email-wgong@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_223811_460457_AB17A1CE 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

For VHT capbility, it has intersection of mcs and nss for peer in
function ieee80211_vht_cap_ie_to_sta_vht_cap. For HE capbility,
it does not have intersection.

This patch is do intersection for HE capbility.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v2: fix build warning
 net/mac80211/he.c          | 90 ++++++++++++++++++++++++++++++++++++++
 net/mac80211/ieee80211_i.h |  5 +++
 2 files changed, 95 insertions(+)

diff --git a/net/mac80211/he.c b/net/mac80211/he.c
index cc26f239838b..9a6562e324cb 100644
--- a/net/mac80211/he.c
+++ b/net/mac80211/he.c
@@ -52,6 +52,59 @@ ieee80211_update_from_he_6ghz_capa(const struct ieee80211_he_6ghz_capa *he_6ghz_
 	sta->sta.he_6ghz_capa = *he_6ghz_capa;
 }
 
+void
+ieee80211_he_mcs_disable(u16 *he_mcs)
+{
+	u32 i;
+
+	for (i = 0; i < 8; i++)
+		*he_mcs |= cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << i * 2);
+}
+
+void
+ieee80211_he_mcs_intersection(u16 *he_own_rx, u16 *he_peer_rx,
+			      u16 *he_own_tx, u16 *he_peer_tx)
+{
+	u32 i;
+	u16 own_rx, own_tx, peer_rx, peer_tx;
+
+	for (i = 0; i < 8; i++) {
+		own_rx = le16_to_cpu(*he_own_rx);
+		own_rx = (own_rx >> i * 2) & IEEE80211_HE_MCS_NOT_SUPPORTED;
+
+		own_tx = le16_to_cpu(*he_own_tx);
+		own_tx = (own_tx >> i * 2) & IEEE80211_HE_MCS_NOT_SUPPORTED;
+
+		peer_rx = le16_to_cpu(*he_peer_rx);
+		peer_rx = (peer_rx >> i * 2) & IEEE80211_HE_MCS_NOT_SUPPORTED;
+
+		peer_tx = le16_to_cpu(*he_peer_tx);
+		peer_tx = (peer_tx >> i * 2) & IEEE80211_HE_MCS_NOT_SUPPORTED;
+
+		if (peer_tx != IEEE80211_HE_MCS_NOT_SUPPORTED) {
+			if (own_rx == IEEE80211_HE_MCS_NOT_SUPPORTED)
+				peer_tx = IEEE80211_HE_MCS_NOT_SUPPORTED;
+			else if (own_rx < peer_tx)
+				peer_tx = own_rx;
+		}
+
+		if (peer_rx != IEEE80211_HE_MCS_NOT_SUPPORTED) {
+			if (own_tx == IEEE80211_HE_MCS_NOT_SUPPORTED)
+				peer_rx = IEEE80211_HE_MCS_NOT_SUPPORTED;
+			else if (own_tx < peer_rx)
+				peer_rx = own_tx;
+		}
+
+		*he_peer_rx &=
+			~cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << i * 2);
+		*he_peer_rx |= cpu_to_le16(peer_rx << i * 2);
+
+		*he_peer_tx &=
+			~cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED << i * 2);
+		*he_peer_tx |= cpu_to_le16(peer_tx << i * 2);
+	}
+}
+
 void
 ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 				  struct ieee80211_supported_band *sband,
@@ -60,10 +113,12 @@ ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 				  struct sta_info *sta)
 {
 	struct ieee80211_sta_he_cap *he_cap = &sta->sta.he_cap;
+	struct ieee80211_sta_he_cap own_he_cap = sband->iftype_data->he_cap;
 	struct ieee80211_he_cap_elem *he_cap_ie_elem = (void *)he_cap_ie;
 	u8 he_ppe_size;
 	u8 mcs_nss_size;
 	u8 he_total_size;
+	bool own_160, peer_160, own_80p80, peer_80p80;
 
 	memset(he_cap, 0, sizeof(*he_cap));
 
@@ -101,6 +156,41 @@ ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 
 	if (sband->band == NL80211_BAND_6GHZ && he_6ghz_capa)
 		ieee80211_update_from_he_6ghz_capa(he_6ghz_capa, sta);
+
+	ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80,
+				      &he_cap->he_mcs_nss_supp.rx_mcs_80,
+				      &own_he_cap.he_mcs_nss_supp.tx_mcs_80,
+				      &he_cap->he_mcs_nss_supp.tx_mcs_80);
+
+	own_160 = !!(own_he_cap.he_cap_elem.phy_cap_info[0] &
+		  IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G);
+	peer_160 = !!(he_cap->he_cap_elem.phy_cap_info[0] &
+		  IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G);
+
+	if (peer_160 && own_160) {
+		ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_160,
+					      &he_cap->he_mcs_nss_supp.rx_mcs_160,
+					      &own_he_cap.he_mcs_nss_supp.tx_mcs_160,
+					      &he_cap->he_mcs_nss_supp.tx_mcs_160);
+	} else if (peer_160 && !own_160) {
+		ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_160);
+		ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_160);
+	}
+
+	own_80p80 = !!(own_he_cap.he_cap_elem.phy_cap_info[0] &
+		  IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G);
+	peer_80p80 = !!(he_cap->he_cap_elem.phy_cap_info[0] &
+		  IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G);
+
+	if (peer_80p80 && own_80p80) {
+		ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80p80,
+					      &he_cap->he_mcs_nss_supp.rx_mcs_80p80,
+					      &own_he_cap.he_mcs_nss_supp.tx_mcs_80p80,
+					      &he_cap->he_mcs_nss_supp.tx_mcs_80p80);
+	} else if (peer_80p80 && !own_80p80) {
+		ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_80p80);
+		ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_80p80);
+	}
 }
 
 void
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 2a21226fb518..93c8e8d0b9e3 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1915,6 +1915,11 @@ ieee80211_sta_rx_bw_to_chan_width(struct sta_info *sta);
 
 /* HE */
 void
+ieee80211_he_mcs_disable(u16 *he_mcs);
+void
+ieee80211_he_mcs_intersection(u16 *he_own_rx, u16 *he_peer_rx,
+			      u16 *he_own_tx, u16 *he_peer_tx);
+void
 ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 				  struct ieee80211_supported_band *sband,
 				  const u8 *he_cap_ie, u8 he_cap_len,
-- 
2.23.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
