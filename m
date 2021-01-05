Return-Path: <SRS0=Iy3B=GI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C0AC433E6
	for <ath11k@archiver.kernel.org>; Tue,  5 Jan 2021 03:08:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665C122573
	for <ath11k@archiver.kernel.org>; Tue,  5 Jan 2021 03:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 665C122573
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IneeaGn/y025f2itXemOdGym7U7DHQp97Raz6CDC4Y=; b=Ug6eHEW2KtJjpF31ks/rhL5L+Q
	hz21R6kkg92oUiIKjH6rd9TD+07wfEd3aO5hAkZtKMET5kBALbhmUjp8t4bhl3d8seQt7VylxpsZA
	W82xg0KvOUmiGVwRCZqN0OFqjnNWQJPlxL9Di/8aDf/ruLKzigf4fVe2644n6dEfjptyQkI6oRogk
	a4v7+aotNavkVXCdvqNdaq9//6Ic/R83IeX5b17TECeTNV5Pxm0EDRhN0XKI4/MFFM88MPE1/Uk1Q
	DeMFIvyH6o2y2EmrmAtU6H2N2QhuJjZ1aKzmVYDC27DlwOhdJoBSKc+O9bSSeiLNXu8j3yflDyWDe
	CI9wZMSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwcho-0008Oz-Nu; Tue, 05 Jan 2021 03:08:20 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwchG-0007zu-52
 for ath11k@lists.infradead.org; Tue, 05 Jan 2021 03:07:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609816066; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=T3sRsCklDqwEnhFENfjHn40k0ckNHWhDRrRwtrFF/hc=;
 b=clRdVpomT/tE/QshLr+dp5YgAiCicOY/ezgTQqNZuIhG4TE/encpoqyMaplKAtQaxN4irEQ7
 4lD3jhD55j81hNKX6eyWYWJh9SQqyzvwR0p5e9ByEZ4nVL+KNZCpIabW7i5YFmPMJQJRG8Xn
 WqmWCj2CLmGGa2T9h5Su62VREqU=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ff3d8013d84969114d32dda (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 03:07:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7698AC43461; Tue,  5 Jan 2021 03:07:45 +0000 (UTC)
Received: from gongwen-ThinkPad-T420.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 855AAC433C6;
 Tue,  5 Jan 2021 03:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 855AAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Subject: [PATCH v3 2/2] mac80211: do intersection with he mcs and nss set of
 peer and own
Date: Tue,  5 Jan 2021 11:08:40 +0800
Message-Id: <1609816120-9411-3-git-send-email-wgong@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
References: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_220746_298865_3FD3E7B1 
X-CRM114-Status: GOOD (  15.47  )
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
 net/mac80211/he.c          | 94 ++++++++++++++++++++++++++++++++++++++
 net/mac80211/ieee80211_i.h |  5 ++
 2 files changed, 99 insertions(+)

diff --git a/net/mac80211/he.c b/net/mac80211/he.c
index cc26f239838b..1850f9899726 100644
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
 
@@ -101,6 +156,45 @@ ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 
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
+		he_cap->he_cap_elem.phy_cap_info[0] &=
+			~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
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
+		he_cap->he_cap_elem.phy_cap_info[0] &=
+			~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
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
