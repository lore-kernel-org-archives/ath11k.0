Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C27C433F5
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 17:55:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B50610CE
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 17:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00B50610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT/cQLG4WwaYX5yAaBhTJspfNDvLVyuzs4kYd6NJ6WY=; b=aycq7gYQr4Bzul
	HMDk4SEdxZ0zKDl8DID0vLBC6LUuLr44NnCJZ6kTlo4gWTYN/umihkyO7ahYSc4Dn3sx6ak4jPfis
	IrZ4I6ICiKkuCQzQaa6ef24+LR4j4AyQ/dKkStTw+ffawr3VINdfsM386JgeTHXL1q3RSLvD3pu9R
	Qmszt8/dUE/0kyNJMItD0fcsNGFJBOID5Hljf4x3uDY1ocq1AB3mIWC7uAptedCZsCJcDiSSAzHg0
	uv4IM8XQlJi57FD7hGwayY4rgJCyP1VBTr5w/Xci4WmndquBEiIr+1ttqubHzYCXzlciKnzUyhDud
	M1TWAtIidnWiyQFGNnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqBI-002rEZ-05; Mon, 13 Sep 2021 17:55:48 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqBC-002r8x-Pd
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 17:55:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631555745; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jHdzBSk4cdbPQS53S9z++PaBwDY9pMm0fESyUzRwxzk=;
 b=GRaYjpD/N2B4CIlRWs6O9Ms2ZG+VxV6xg2R3Z4ylEo7b18csO15ikrdmRENZ9U/5awhzDQIE
 xda0Xe9UtrLCNnyuINoFsfVf2qk19StJ0CtVV0cPArQ46mxX341nQtoXnk2CulaWwfBNfGji
 SqkVQGB7Mpn6DFVVHOPcfg23osA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 613f9094648642cc1c69234a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 17:55:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 06863C4360D; Mon, 13 Sep 2021 17:55:32 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D69D6C43460;
 Mon, 13 Sep 2021 17:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D69D6C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/3] ath11k: add 6 GHz params in peer assoc command
Date: Mon, 13 Sep 2021 20:55:09 +0300
Message-Id: <20210913175510.193005-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913175510.193005-1-jouni@codeaurora.org>
References: <20210913175510.193005-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_105545_684974_2F3A3FAC 
X-CRM114-Status: GOOD (  15.26  )
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

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Currently A-MPDU aggregation parameters are not being configured
during peer association for 6 GHz band. Hence, extract these
parameters from station's capabilities received in association
request and send to firmware. Without this, A-MPDU aggregation
is not happening in 6 GHz band.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01386-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 50 ++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 04a8f82e3a17..aba005241095 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1959,6 +1959,53 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 		   arg->peer_bw_rxnss_override);
 }
 
+static void ath11k_peer_assoc_h_he_6ghz(struct ath11k *ar,
+					struct ieee80211_vif *vif,
+					struct ieee80211_sta *sta,
+					struct peer_assoc_params *arg)
+{
+	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
+	struct cfg80211_chan_def def;
+	enum nl80211_band band;
+	u8  ampdu_factor;
+
+	if (WARN_ON(ath11k_mac_vif_chan(vif, &def)))
+		return;
+
+	band = def.chan->band;
+
+	if (!arg->he_flag || band != NL80211_BAND_6GHZ || !sta->he_6ghz_capa.capa)
+		return;
+
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
+		arg->bw_80 = true;
+
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
+		arg->bw_160 = true;
+
+	arg->peer_he_caps_6ghz = le16_to_cpu(sta->he_6ghz_capa.capa);
+	arg->peer_mpdu_density =
+		ath11k_parse_mpdudensity(FIELD_GET(IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START,
+						   arg->peer_he_caps_6ghz));
+
+	/* From IEEE Std 802.11ax-2021 - Section 10.12.2: An HE STA shall be capable of
+	 * receiving A-MPDU where the A-MPDU pre-EOF padding length is up to the value
+	 * indicated by the Maximum A-MPDU Length Exponent Extension field in the HE
+	 * Capabilities element and the Maximum A-MPDU Length Exponent field in HE 6 GHz
+	 * Band Capabilities element in the 6 GHz band.
+	 *
+	 * Here, we are extracting the Max A-MPDU Exponent Extension from HE caps and
+	 * factor is the Maximum A-MPDU Length Exponent from HE 6 GHZ Band capability.
+	 */
+	ampdu_factor = FIELD_GET(IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_MASK,
+				 he_cap->he_cap_elem.mac_cap_info[3]) +
+			FIELD_GET(IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP,
+				  arg->peer_he_caps_6ghz);
+
+	arg->peer_max_mpdu = (1u << (IEEE80211_HE_6GHZ_MAX_AMPDU_FACTOR +
+				     ampdu_factor)) - 1;
+}
+
 static void ath11k_peer_assoc_h_smps(struct ieee80211_sta *sta,
 				     struct peer_assoc_params *arg)
 {
@@ -2248,6 +2295,7 @@ static void ath11k_peer_assoc_prepare(struct ath11k *ar,
 	ath11k_peer_assoc_h_ht(ar, vif, sta, arg);
 	ath11k_peer_assoc_h_vht(ar, vif, sta, arg);
 	ath11k_peer_assoc_h_he(ar, vif, sta, arg);
+	ath11k_peer_assoc_h_he_6ghz(ar, vif, sta, arg);
 	ath11k_peer_assoc_h_qos(ar, vif, sta, arg);
 	ath11k_peer_assoc_h_smps(sta, arg);
 
@@ -7496,7 +7544,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (cap->nss_ratio_enabled)
 		ieee80211_hw_set(ar->hw, SUPPORTS_VHT_EXT_NSS_BW);
 
-	if (ht_cap & WMI_HT_CAP_ENABLED) {
+	if ((ht_cap & WMI_HT_CAP_ENABLED) || ar->supports_6ghz) {
 		ieee80211_hw_set(ar->hw, AMPDU_AGGREGATION);
 		ieee80211_hw_set(ar->hw, TX_AMPDU_SETUP_IN_HW);
 		ieee80211_hw_set(ar->hw, SUPPORTS_REORDERING_BUFFER);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
