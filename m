Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F46C433FE
	for <ath11k@archiver.kernel.org>; Fri, 25 Mar 2022 06:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeiC+S4nV2xrUmr0bnVNaLM4PLdNS4H5vNaPWJbPABA=; b=rr4DFsJ05xxVdB
	3HwR75BMyJuhxG0BRyoVMQ2+IISN9voFUxAjphKIwIbXmSh+letnueiszbKlxRnHziXOKohU57I0X
	mCquI9Duxq585CyuhNWLPTbxTTePRKxyD/QlOIf75dokX3Em5gD2ybKu9jUirvxvqANV6VbkDnsn3
	3m6HFb9BhiZA1W1mbW3fMv4QJGC7ZWeWBEYttkokQbo3Y3YFB2tMyifBVPiUEv5a8kK1mK25iHI9t
	lXpEtn0GLiLnbPw/sbH5eLtdd1gv+9c99T/NpYCXfN18iMxyvLw9gT8fuA5ZTzj5AeCU3s8KBUJUp
	RYGXPMen7OpCyNY/sXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXczj-001EIP-5J; Fri, 25 Mar 2022 06:00:19 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXczg-001EHA-Qi
 for ath11k@lists.infradead.org; Fri, 25 Mar 2022 06:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648188016; x=1679724016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=beTOa7QdjKZ5Ywt9VErYX4lAZHPF7tifsDmxNSyC5OA=;
 b=HMwzVcwqKNWyMMk9Wzcz2tRqZcrP9gb1XdyKR2GqwSU7orwLu0zB1L4f
 ahhFZSNaveAZx5ula5fhZUyqB8LGpog3Ao0JjckYFx0ZyJiZOLKPQ7nct
 Rj4uLimYp6kB4LHJTM3695BTq70WfqTRNShXAozJ7BVv2Gzh6gJlPd23w E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2022 23:00:14 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 23:00:14 -0700
Received: from che-siroccolnx03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 24 Mar 2022 23:00:13 -0700
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
To: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Subject: [PATCH v6 2/3] mac80211: Add support for beacon tx mode
Date: Fri, 25 Mar 2022 11:29:48 +0530
Message-ID: <20220325055949.3035053-3-quic_mkenna@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325055949.3035053-1-quic_mkenna@quicinc.com>
References: <20220325055949.3035053-1-quic_mkenna@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_230016_916744_BD3CAE24 
X-CRM114-Status: GOOD (  10.04  )
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

Pass the beacon tx mode value from the nl80211/cfg80211
layer to the driver via ieee80211_ops and driver ops.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00480-QCAHKSWPL_SILICONZ-1

Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
---
 include/net/mac80211.h | 2 ++
 net/mac80211/cfg.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 382ebb862ea8..de6bce88f4fb 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -637,6 +637,7 @@ struct ieee80211_fils_discovery {
  * @tx_pwr_env_num: number of @tx_pwr_env.
  * @pwr_reduction: power constraint of BSS.
  * @eht_support: does this BSS support EHT
+ * @beacon_tx_mode: Beacon Tx Mode setting.
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -712,6 +713,7 @@ struct ieee80211_bss_conf {
 	u8 tx_pwr_env_num;
 	u8 pwr_reduction;
 	bool eht_support;
+	enum nl80211_beacon_tx_mode beacon_tx_mode;
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index ba752539d1d9..522bf71db850 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1162,6 +1162,7 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 
 	prev_beacon_int = sdata->vif.bss_conf.beacon_int;
 	sdata->vif.bss_conf.beacon_int = params->beacon_interval;
+	sdata->vif.bss_conf.beacon_tx_mode = params->beacon_tx_mode;
 
 	if (params->he_cap && params->he_oper) {
 		sdata->vif.bss_conf.he_support = true;
@@ -2237,6 +2238,7 @@ static int copy_mesh_setup(struct ieee80211_if_mesh *ifmsh,
 
 	sdata->vif.bss_conf.beacon_int = setup->beacon_interval;
 	sdata->vif.bss_conf.dtim_period = setup->dtim_period;
+	sdata->vif.bss_conf.beacon_tx_mode = setup->beacon_tx_mode;
 
 	sdata->beacon_rate_set = false;
 	if (wiphy_ext_feature_isset(sdata->local->hw.wiphy,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
