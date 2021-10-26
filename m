Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C23DC433FE
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19C060232
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D19C060232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eLawyHYKNlwxvSfulhYFBP6w9t2DFUCJAaogoKpTJw=; b=2TnDTuSSwWd/JX
	shisK+1ZtBKPSOvQgdDf3hhJoBeavpljtm+SB3yq6m9btjcZ5wgxEp6oEWTGFuuHDdj3ofmzuy+OZ
	+FZ6Tyz71snavg3+ufteSbYZuawBzFEVD9xgDLBxK8ckxIXfx1M9KhYO/LGJV7z67waQrqSZJa0jX
	uh8dXvl6uDgQLAE+H/3WUMHJCh11UiIGby5qWn26GjLHpQxfr+8v5vdZw/5jc1VFThO57mw5l1ku8
	bD5FgMU8o+BHGQjsgvIQ+zrJgVtjAZljl4FpCXqd3uTj6Av6yxRcuUmqYIt+6OJymGGxxe65rWhew
	JnpzF66z/zjqB12ZMmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfKV5-001ce6-96; Tue, 26 Oct 2021 11:20:15 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfKUw-001cRx-Kl
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 11:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635247206; x=1666783206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N4FQ+ESHIEwX2dIl8VLFLizSBZV3arl7rG3DDOVO4+Y=;
 b=C0/Cu6X6etolGoN7X+pVq+X/43CfLt2hLcgZ/uEIFU9wU05SV5UY1ehs
 sei6WAw67zfjAeCBFcVB8V038GJ2Da9qkpfcasCrWB+gCx349qxrALd8h
 i68+TUD6lWAddO80dpy451yIp4aFLfeQ3bsgWdhl8zfDls3ZpKeu5+s5s g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 04:20:06 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 04:20:07 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 26 Oct 2021 04:20:04 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 13/15] ath11k: discard BSS_CHANGED_TXPOWER when
 EXT_TPC_REG_SUPPORT for 6 GHz
Date: Tue, 26 Oct 2021 07:19:11 -0400
Message-ID: <20211026111913.7346-14-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026111913.7346-1-quic_wgong@quicinc.com>
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_042006_765852_36548E27 
X-CRM114-Status: GOOD (  14.12  )
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

When station is connected to a 6 GHz AP, it has 2 way to configure
the power limit to firmware. The first way is to send 2 wmi command
WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
firmware which include more parameters for power control.

When firmware support SERVICE_EXT_TPC_REG, it means firmware support
the second way for WMI_VDEV_SET_TPC_POWER_CMDID, then ath11k discard
BSS_CHANGED_TXPOWER flag from mac80211 which is used to the first way
for 6 GHz band in this patch and select the second way in the subsequent
patch.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.h |  6 ++++++
 drivers/net/wireless/ath/ath11k/mac.c  | 19 +++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 6969e0a6fc7b..6ef639975725 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -1017,4 +1017,10 @@ static inline bool ath11k_support_6G_cc_ext(struct ath11k *ar)
 	return ath11k_support_cc_ext(ar->ab) && ar->supports_6ghz;
 }
 
+static inline bool ath11k_support_tpc_ext(struct ath11k *ar)
+{
+	return ath11k_support_6G_cc_ext(ar) &&
+	       test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map);
+}
+
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ed2dc4c81de8..301e08a85f47 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2170,6 +2170,16 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
 	return 0;
 }
 
+static bool ath11k_mac_station_support_tpc(struct ath11k *ar,
+					   struct ath11k_vif *arvif,
+					   struct cfg80211_chan_def *chandef)
+{
+	return ath11k_support_tpc_ext(ar) &&
+	       arvif->vdev_type == WMI_VDEV_TYPE_STA &&
+	       chandef->chan &&
+	       chandef->chan->band == NL80211_BAND_6GHZ;
+}
+
 static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 					   struct ieee80211_vif *vif,
 					   struct ieee80211_bss_conf *info,
@@ -2353,8 +2363,13 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac vdev_id %i txpower %d\n",
 			   arvif->vdev_id, info->txpower);
 
-		arvif->txpower = info->txpower;
-		ath11k_mac_txpower_recalc(ar);
+		if (ath11k_mac_station_support_tpc(ar, arvif, &info->chandef)) {
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "discard tx power, change to set TPC power\n");
+		} else {
+			arvif->txpower = info->txpower;
+			ath11k_mac_txpower_recalc(ar);
+		}
 	}
 
 	if (changed & BSS_CHANGED_MCAST_RATE &&
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
