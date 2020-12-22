Return-Path: <SRS0=oWPw=F2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A377C433DB
	for <ath11k@archiver.kernel.org>; Tue, 22 Dec 2020 02:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B2B22ADC
	for <ath11k@archiver.kernel.org>; Tue, 22 Dec 2020 02:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B2B22ADC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K9P1/8UvtmuI8hQDm5X59okXwaU67M6hyPHvaojxAeQ=; b=wKtbTjopNOAGqN5Ek937NPWfx/
	ksGwdf2Z8sVpd9e+Dva4qkXhJs44jsywM6zUW2i/j+zxj2kCQgouCNojHmsn8LGEC9BJbYIUtZhgA
	W2uUALxQdCCNWdPjiMeHFf7EI8eS/1HoHxPiRmYKYQjlmsJcpdgh4K8eFItQIzXumWqKjqALSIG8i
	uA7E94c1hyateg5AKBIEJWA+tDt0Dq1Hil8dbgQVKCc6BwqeMfLBw9z1MaUihvVV1HQjLfsru0EEB
	Utc+eynxzPUln1n8mD93d0S90TfjW2wzkoIplCslGt1M95/A+GdS89JgkRSSqpqDcOxiIEPgyoeC3
	jI1GQ3Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krXOD-0006rB-4D; Tue, 22 Dec 2020 02:27:05 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krXOA-0006qk-C6
 for ath11k@lists.infradead.org; Tue, 22 Dec 2020 02:27:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608604022; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=yOchlnpNYr67GsiYuaVSqpbZs4sc6kIGULM4MU1LXME=;
 b=PXfBBLLD847KaGAta05hmKzxQvyWwK7E/MH/NZMC7jg0zVmB8NFbQut+ZZgZn+tMwY8lSGJG
 REtob2iPDH0GVDEV08NERzbX0lpCKv2HEbHk607AV0WjmblLHv9035YVtSE6bnQvxsMXS4NJ
 iIlE4vsH5TRwGNOJDwzz0LERF0A=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fe15975cfe5dd67db1a0b0e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 02:27:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E45DAC43461; Tue, 22 Dec 2020 02:27:00 +0000 (UTC)
Received: from gongwen-ThinkPad-T420.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E1C03C433CA;
 Tue, 22 Dec 2020 02:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1C03C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Subject: [PATCH] mac80211: do intersection with he mcs and nss set of peer and
 own
Date: Tue, 22 Dec 2020 10:28:08 +0800
Message-Id: <1608604088-15546-1-git-send-email-wgong@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_212702_674109_A9EA09C2 
X-CRM114-Status: GOOD (  14.55  )
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
 net/mac80211/he.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

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
-- 
2.23.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
