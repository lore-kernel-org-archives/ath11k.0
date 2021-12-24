Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DCEC433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Dec 2021 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3f1bscAJT3wQQSuJvoT/wAUb09R80eJJSSYcB0UIyI=; b=AhLcNDblQFf3oG
	BmcnZpwf1C3EUztZX8zGMBS2DLGVgo35q4avK6sJhSQSPOyr8lEmJNQRs6ViDGPj+SJrh5q1wgnE4
	yDo9tI4o2i7OnoNN5tFbEIlJxXrjC1Mp1juqKr19c3j+bPAhySYxJgUuQSA32VnVDupPCN4i65Hv5
	o/aiTNA4Hh3rOoTDkH7tXManK2uE71lVxk3SQ71DTIG0zYODPV4zVVooWGuH70fXHY0EW3RSfyQgs
	cJQYgawgwoPH89puxg1jNbhBt14BZeh1Es6LhmWpUaNr7eDaSpv2h9Eai+t1RKKZZv86LTGiJdpb2
	Iy0fMXHUlNlxpCTLzdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gK0-00Dxo2-Mr; Fri, 24 Dec 2021 08:53:04 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gJw-00DxlS-BZ
 for ath11k@lists.infradead.org; Fri, 24 Dec 2021 08:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640335980; x=1671871980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+HHoG+om8SqUjcuIAeqLqqgqpRgdF2U1dqsfOpZ7yc=;
 b=CZcKebAnf5508GQZvJpZpdI2C8NKBAgnZT1u4bZ6l6at9eb+Y/NFR1uf
 DE3hKxHEKdwIcKsZepYAMUmzXqvjNYoLlB+t5RMa8lVKlw4z5Olw+rkvS
 K0Jb3lF81Li2sIYCZvtTJfzXzbTT05Os2aQRhZEVDCFfMwoRzMUp/hgKn U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Dec 2021 00:53:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 00:52:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 00:52:59 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 00:52:58 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 04/15] ath11k: allow only one interface up simultaneously
 for WCN6855
Date: Fri, 24 Dec 2021 03:52:25 -0500
Message-ID: <20211224085236.9064-5-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211224085236.9064-1-quic_wgong@quicinc.com>
References: <20211224085236.9064-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_005300_460710_460F5005 
X-CRM114-Status: GOOD (  13.59  )
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

Currently ath11k support both station/AP mode for WCN6855, and it is
configured with single_pdev_only, it means it has only one ath11k
and one ieee80211_hw which registered in mac80211 and one wiphy
registered in cfg80211. Now it does not have requirement to start
up both station and AP interface simultaneously for WCN6855, this
is to disable station and AP concurrency mode.

After this patch, when station interface is up, then AP interface
can not start up. AP interface can start up after station interface
down. Also when AP interface is up, station interface can not start
up. station interface can start up after AP interface down.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hw.c  |  5 +++++
 drivers/net/wireless/ath/ath11k/hw.h  |  1 +
 drivers/net/wireless/ath/ath11k/mac.c | 17 ++++++++++++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index d503e8a73d32..712818edb4ca 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -807,6 +807,11 @@ bool ath11k_hw_supports_cc_ext(struct ath11k_base *ab)
 		test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT, ab->wmi_ab.svc_map);
 }
 
+bool ath11k_hw_supports_6g_cc_ext(struct ath11k *ar)
+{
+	return ath11k_hw_supports_cc_ext(ar->ab) && ar->supports_6ghz;
+}
+
 const struct ath11k_hw_ops ipq8074_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
 	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index b57cab2b0c7b..969d29aaee6a 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -278,6 +278,7 @@ static inline int ath11k_hw_mac_id_to_srng_id(struct ath11k_hw_params *hw,
 }
 
 bool ath11k_hw_supports_cc_ext(struct ath11k_base *ab);
+bool ath11k_hw_supports_6g_cc_ext(struct ath11k *ar);
 
 struct ath11k_fw_ie {
 	__le32 id;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 07f499d5ec92..7180ac37b327 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8218,7 +8218,22 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 
 	combinations[0].limits = limits;
 	combinations[0].n_limits = n_limits;
-	combinations[0].max_interfaces = 16;
+
+	/* When single pdev is set, there is only one ieee80211_hw/wiphy
+	 * of mac80211/cfg80211, and it has only one reg rules stored
+	 * The reg rules of 6 GHz is different for station and AP, please
+	 * refer WMI_REG_CHAN_LIST_CC_EXT_EVENTID handler.
+	 * When start station/AP simultaneously, there is not more
+	 * struct to store the second reg rules in cfg80211.
+	 * Also it does not have requirement for station/AP concurrency
+	 * for WCN6855, so disable it currently.
+	 */
+	if (ab->hw_params.single_pdev_only &&
+	    ath11k_hw_supports_6g_cc_ext(ar))
+		combinations[0].max_interfaces = 1;
+	else
+		combinations[0].max_interfaces = 16;
+
 	combinations[0].num_different_channels = 1;
 	combinations[0].beacon_int_infra_match = true;
 	combinations[0].beacon_int_min_gcd = 100;
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
