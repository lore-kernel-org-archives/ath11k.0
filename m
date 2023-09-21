Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FBDCD5BD5
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TEYkkJLnLjOwVb9ooIoELMbvLmvDucFmoA/MztY6fMA=; b=uEstCwWe3ZFVrs
	RKB1k/sCDLsoQICp6n7TXsd03FIlSK5sp/ce5/mxMb7q7yNChL7EWeqP7DZ7eqGYXwdRkGXFhRcPR
	kCLkdSfEfJqnb8nC4hadpdjBaDfE6DiiSI5IB6oKYC7IVfTKDytvvrmiLlJncVNAxol4GlB7xAC4v
	Yw+M3xvk14TweiDh5HZ1t9dwUJZ+9ebk0AYoOrKo6pw6wIJQaiyF7RUm49GWl5hktHbuNAzvDrvQl
	w4pTWRm9PCnnZ67Axa9nqbyj/Sn2jR8ZLSC+hqZnv1mCwPWC1fBOo1wbK3a5sukGjC9s1t8qQweVv
	kM2chSMpq5qZx+lMxd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEWQ-005PWg-2h;
	Thu, 21 Sep 2023 07:54:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEWO-005PV9-0E
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 07:54:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7635261E6D
	for <ath11k@lists.infradead.org>; Thu, 21 Sep 2023 07:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A390C116A5;
	Thu, 21 Sep 2023 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695282882;
	bh=KuqXgftjmuAxTqekmIMDq5iGa9Zxo5uom8X16GT8vtk=;
	h=From:To:Cc:Subject:Date:From;
	b=mnmYyyN+Fy4rtsBvsXCBdhCtsG8IaNBjpo+s0mxhVffLHPNiLfi7SSMH0fIG+jMqN
	 8P7XSnI5GW92wygSnHKY84WLwnsLdXu4jFVjDgbuYIM5jI0wQCxzsenw56OjLTrOTw
	 F2rcyqA1Z04+8SkfpBuHZv5Pvz2DbrinVcPR6LhbObaIrBDZ6yrKPClX9zJ6or59WS
	 KOMgJXvENMBxWQRqt5vP7NegFogv4mcffLeKa7X6csmZAEN/f0Lb7LE40EtICjdpUu
	 e2mv6kPgFwYc6i2XQTHRYR/aoGmrr9ailRwTOt4XFv4jOKnMpGvBX1geEPM8nbIYX/
	 jbHW81hMhk2UQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data handling
Date: Thu, 21 Sep 2023 10:54:40 +0300
Message-Id: <20230921075440.1539515-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_005448_192626_432A14F8 
X-CRM114-Status: GOOD (  13.92  )
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
though we should use for_each_sband_iftype_data(). Now we iterate over each
item in the array and use the correct vif type which this vif is using.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Reported-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6ed036b51dba..4bf302a43b0c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7913,11 +7913,13 @@ ath11k_mac_get_tx_mcs_map(const struct ieee80211_sta_he_cap *he_cap)
 
 static bool
 ath11k_mac_bitrate_mask_get_single_nss(struct ath11k *ar,
+				       struct ath11k_vif *arvif,
 				       enum nl80211_band band,
 				       const struct cfg80211_bitrate_mask *mask,
 				       int *nss)
 {
 	struct ieee80211_supported_band *sband = &ar->mac.sbands[band];
+	const struct ieee80211_sband_iftype_data *iftd, *iftype_data = NULL;
 	u16 vht_mcs_map = le16_to_cpu(sband->vht_cap.vht_mcs.tx_mcs_map);
 	u16 he_mcs_map = 0;
 	u8 ht_nss_mask = 0;
@@ -7949,7 +7951,17 @@ ath11k_mac_bitrate_mask_get_single_nss(struct ath11k *ar,
 			return false;
 	}
 
-	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
+	for_each_sband_iftype_data(sband, i, iftd) {
+		if (iftd->types_mask & BIT(arvif->vif->type)) {
+			iftype_data = iftd;
+			break;
+		}
+	}
+
+	if (iftype_data == NULL)
+		return false;
+
+	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(&iftype_data->he_cap));
 
 	for (i = 0; i < ARRAY_SIZE(mask->control[band].he_mcs); i++) {
 		if (mask->control[band].he_mcs[i] == 0)
@@ -8365,7 +8377,7 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 		ieee80211_iterate_stations_atomic(ar->hw,
 						  ath11k_mac_disable_peer_fixed_rate,
 						  arvif);
-	} else if (ath11k_mac_bitrate_mask_get_single_nss(ar, band, mask,
+	} else if (ath11k_mac_bitrate_mask_get_single_nss(ar, arvif, band, mask,
 							  &single_nss)) {
 		rate = WMI_FIXED_RATE_NONE;
 		nss = single_nss;

base-commit: f00928012886a07ca6817ea70eb4856ce280ce05
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
