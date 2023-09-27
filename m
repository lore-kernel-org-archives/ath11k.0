Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0137E80AB0
	for <ath11k@archiver.kernel.org>; Wed, 27 Sep 2023 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2L+iZV2CN51K4bOChOHhsPigrGc5Obw7osLPMRNDZ8=; b=Qoh3O20z6R+gzk
	IM1GF2SYeap0Zbr1hNV5aNIo151pNnSVgY0VuXuW9z4EGS9VuMS6WiIQlzmklWfnA4vJF7apYDGEr
	vbYf3hjlj6KfX278p+mejvjks3bXzeV/qFKlate5EUHqrqO60ACNAyWF66O6gJKV6M1cTTHdVZwye
	HDXkvj5YZX7mF38OKdkyRkqoL5MPYB+mW8AXe1rn+rJz0Uk+q7iIUYZuFY7iq63b0lbQ7ws1pNLvZ
	J6SoNwNFhJT9KiI+8LzsOfs3KTwf70Q5NASjmIxLd7VS7dMvi/fjNGBAKhgEmBsOoC2jMCdeFBYVQ
	pcGSYWmRdnM6XEb7q0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVVX-0018RU-0D;
	Wed, 27 Sep 2023 14:27:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVVT-0018QT-1n
	for ath11k@lists.infradead.org;
	Wed, 27 Sep 2023 14:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65C17CE17EC
	for <ath11k@lists.infradead.org>; Wed, 27 Sep 2023 14:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E73C433C9;
	Wed, 27 Sep 2023 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695824832;
	bh=f+v5UowMpSo6BDqMvUCNLp85mOEj74iDaFicyPQ7Wis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzRerRnrqaK2UHiKx3wt5YowrJIudSwqP4eSeUuO0mUduLb5UmO69PeTgl5ZNW0zQ
	 5BIqMM8RLBDr9d2RCNoIopE5o73o9akyQMUQcfWXenNPzBVafOAAD5nyzDvLS7typq
	 F7li8knimDEpjmNYGTAIH4quRUBgriSwnuOZUJ6PFP9qTjX8ttW4YSs4i4fi0a2s8D
	 9XTgMFKh8vw6jdhTpnFvJCpJcrvXFPfpUmLfYPR97Ev2yPNL+XzwVZtMEnkK9RCM5L
	 9SVHmsmXM6/Le21hcC8tOfAo62EzTRD4OLhBnjdk0ahBZrjpXCTZaoeTk542DaJogz
	 nTCF+CpkROfbA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v3 1/1] wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data handling
Date: Wed, 27 Sep 2023 17:27:08 +0300
Message-Id: <20230927142708.2897504-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927142708.2897504-1-kvalo@kernel.org>
References: <20230927142708.2897504-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_072716_009239_00270805 
X-CRM114-Status: GOOD (  13.30  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Commit e8c1841278a7 ("wifi: cfg80211: annotate iftype_data pointer with
sparse") added sparse checks for struct ieee80211_sband_iftype_data handling
which immediately found an issue in ath11k:

drivers/net/wireless/ath/ath11k/mac.c:7952:22: warning: incorrect type in argument 1 (different address spaces)
drivers/net/wireless/ath/ath11k/mac.c:7952:22:    expected struct ieee80211_sta_he_cap const *he_cap
drivers/net/wireless/ath/ath11k/mac.c:7952:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *

The problem here is that we are accessing sband->iftype_data directly even
though we should use for_each_sband_iftype_data() or similar. Fortunately
there's ieee80211_get_he_iftype_cap_vif() which is just what we need here so
use it to get HE capabilities.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Reported-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c071bf5841af..19e8cb9bf728 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7910,12 +7910,14 @@ ath11k_mac_get_tx_mcs_map(const struct ieee80211_sta_he_cap *he_cap)
 
 static bool
 ath11k_mac_bitrate_mask_get_single_nss(struct ath11k *ar,
+				       struct ath11k_vif *arvif,
 				       enum nl80211_band band,
 				       const struct cfg80211_bitrate_mask *mask,
 				       int *nss)
 {
 	struct ieee80211_supported_band *sband = &ar->mac.sbands[band];
 	u16 vht_mcs_map = le16_to_cpu(sband->vht_cap.vht_mcs.tx_mcs_map);
+	const struct ieee80211_sta_he_cap *he_cap;
 	u16 he_mcs_map = 0;
 	u8 ht_nss_mask = 0;
 	u8 vht_nss_mask = 0;
@@ -7946,7 +7948,11 @@ ath11k_mac_bitrate_mask_get_single_nss(struct ath11k *ar,
 			return false;
 	}
 
-	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
+	he_cap = ieee80211_get_he_iftype_cap_vif(sband, arvif->vif);
+	if (!he_cap)
+		return false;
+
+	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(he_cap));
 
 	for (i = 0; i < ARRAY_SIZE(mask->control[band].he_mcs); i++) {
 		if (mask->control[band].he_mcs[i] == 0)
@@ -8362,7 +8368,7 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 		ieee80211_iterate_stations_atomic(ar->hw,
 						  ath11k_mac_disable_peer_fixed_rate,
 						  arvif);
-	} else if (ath11k_mac_bitrate_mask_get_single_nss(ar, band, mask,
+	} else if (ath11k_mac_bitrate_mask_get_single_nss(ar, arvif, band, mask,
 							  &single_nss)) {
 		rate = WMI_FIXED_RATE_NONE;
 		nss = single_nss;
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
