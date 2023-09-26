Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90715E7E64B
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rLLT8DeY/5Gm9fUz+O7bx42smffhwaiHvkBASnjXfIo=; b=HUwAAxNjlanXgw
	1WCbW8zqNKnkzRJ6+nVKGL6W6d+VBc3+yd7jsmE6FrRsdw6Ll6j5rNRffJarV3z1pjyX01BqPDDoT
	7DbgyPYGlaaYImrMy0ZDTPNFqStwMrQENyo5B3bRfh0h6TYCo/OUyu1rP3eXw8/nL8h2ktR59ZBxe
	OP9PPsS2evqdDVszF/h2oWDQ3MHfQYKS0cPqIs/+tXOiNTOy/onarTVJkbKWB7pJoNmXoGnGCDtDf
	pxoVvfRb5YyrXk1wjX9QDkIHf9ewArbhgQt/itfex5HtM6fMfdZwn+yC2Q4YyR0mc8w0EWx7eEeXH
	Rzkbv6k/MdUBD2HbmvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlB0Y-00GiqO-22;
	Tue, 26 Sep 2023 16:33:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlB0V-00Gipl-2z
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 16:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 03BB3B81155
	for <ath11k@lists.infradead.org>; Tue, 26 Sep 2023 16:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2124C433C7;
	Tue, 26 Sep 2023 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695746033;
	bh=IvKOdEnBJNQyWkBCU4bVbujBnX9sEpD8UoOjF/qG9Ww=;
	h=From:To:Cc:Subject:Date:From;
	b=UV1ZoIUAArrZkb7hQWKPAXKrQ5FSLd6Pin1aECc2JD2BcZb81TgYX026LK/4plSe9
	 xBaaP4hKE+TgUdpUu2vgoZN9RSiBrA+x476Z1B3O/ABXAwWDu2NGTHsk4qljARV44M
	 uB8kJPvu2eGd1MfQKi1tEzWnCmIOK0vpO7oJUyW2sA7hL5dQ31OGs+Z1gNtDrao3ip
	 2TrBjSnbD6WWQdBLiQIgURmRfl6yZAXtoOau5xHGOkfND8ht6z+qJA8kFGxCt5mbFI
	 xHyJa0UDN+u/uoPKFuBP6twr/iij//YsM2l5iYjaDYRONd+q4PU2+VKiv0TMY+lqS6
	 hJkRxk1nxi/WQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data handling
Date: Tue, 26 Sep 2023 19:33:50 +0300
Message-Id: <20230926163350.2641064-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_093356_272288_F4CACED0 
X-CRM114-Status: GOOD (  11.22  )
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
there's ieee80211_get_he_iftype_cap_vif() which is just we need here so use it
to get HE capabilities.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Reported-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c071bf5841af..79059c42e730 100644
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
@@ -7946,7 +7948,8 @@ ath11k_mac_bitrate_mask_get_single_nss(struct ath11k *ar,
 			return false;
 	}
 
-	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
+	he_cap = ieee80211_get_he_iftype_cap_vif(sband, arvif->vif);
+	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(he_cap));
 
 	for (i = 0; i < ARRAY_SIZE(mask->control[band].he_mcs); i++) {
 		if (mask->control[band].he_mcs[i] == 0)
@@ -8362,7 +8365,7 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 		ieee80211_iterate_stations_atomic(ar->hw,
 						  ath11k_mac_disable_peer_fixed_rate,
 						  arvif);
-	} else if (ath11k_mac_bitrate_mask_get_single_nss(ar, band, mask,
+	} else if (ath11k_mac_bitrate_mask_get_single_nss(ar, arvif, band, mask,
 							  &single_nss)) {
 		rate = WMI_FIXED_RATE_NONE;
 		nss = single_nss;

base-commit: 73e13f6a439b75a9dbc84bbfa0b0d6624b354853
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
