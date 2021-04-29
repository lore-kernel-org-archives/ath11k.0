Return-Path: <SRS0=MWox=J2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E2CC433B4
	for <ath11k@archiver.kernel.org>; Thu, 29 Apr 2021 11:48:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CBA610FA
	for <ath11k@archiver.kernel.org>; Thu, 29 Apr 2021 11:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3CBA610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/VpW9+LSSWDw/8FEsYPikclGqdKMOoIQnvtGgyqB6E=; b=jQwmkU5IAau3DIo1OhB8UoTIzv
	E2psdlviDHv2LyusbFNNWi4PjtYIGhr/NfoQ9KoguMB8VZWe7+rOlcA2tRjhkW9WgJnguPGkv2yr8
	KeZxpMZIjuUOA2w3qRGfRBHiKMyszD2Vf/A4RJnF8w4jImr9W21RLXHmXwxpCxGIOb7KCZX/a8zct
	IxQ3/m5m0svwDwZacj842/jPWIGNBCUdMtyz6nV75hioGTsRWc9vgKstfudkvfwkEjjboSgWNU23B
	4eyu1PTxIKfyYlhOqb7B5XrSsUOHhdrSB5jzcZyBzcOP/jTTIyFwN+DmiEmxTb8bGgRxoeN+SdTym
	5RFQAngA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc59n-005Ze0-Tk; Thu, 29 Apr 2021 11:48:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc59l-005ZdT-36
 for ath11k@desiato.infradead.org; Thu, 29 Apr 2021 11:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+JlSXk5CnPW6EBvkfwHFnyWHDN78GV2P2av+La/x6TY=; b=1juWcpX/WSgSXnXP9Jf5jJ6tnN
 Ons38XxFYqAP6vtCc17tcgHPbJ6Gc99lHos/jUX1aveQpMMVrUq5wqaVMYdJtq8TXnBthJyeWaAc3
 Xl1IeTP42gIrhAjoxWUUp93umaXat+CVcEa5/JpR0qxz+RCFw+xMbpSwQz2Q9B7zpmDWvDgFZvYb3
 7uAiqpeU1LJYAN/8DlTqxWJDaLBmCAcgkB9alLSux6xaFtDv+JfRhE0YvVY76qQgytlg9APUy7FvJ
 yC1JnibSA4QfxyLY2/nG7czKHbjIYKwKhEHyLpleVZSBElc6o3CBvbX0j/fBntehxY/E0yYIjTMWI
 KUiEoDvQ==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc59g-000bE4-RV
 for ath11k@lists.infradead.org; Thu, 29 Apr 2021 11:48:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619696910; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+JlSXk5CnPW6EBvkfwHFnyWHDN78GV2P2av+La/x6TY=;
 b=PC6+ZUnHCxdh6Ufij6L6Uu3y5uchI+vva9LyLQvS1mBinzT8pYpayl+pZVkrJ8JSr6ebyFjp
 om84/Vw88VknzbB1ur2i/42RkXu/uIyZsEy/1a8l9Lf5SoNQn58ZSmcqVoOSmrq811dsh0yv
 40Fccnosv8dmmBbrNUyBYMFZvho=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 608a9d042cc44d3aeac06c3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 11:48:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 57E20C43460; Thu, 29 Apr 2021 11:48:20 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 64E60C4323A;
 Thu, 29 Apr 2021 11:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64E60C4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=mkenna@codeaurora.org
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH v2 2/3] mac80211: Add support for beacon tx mode
Date: Thu, 29 Apr 2021 17:17:53 +0530
Message-Id: <1619696874-30072-3-git-send-email-mkenna@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
References: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_044830_714990_8A3D732B 
X-CRM114-Status: GOOD (  11.81  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Pass the beacon tx mode value from the nl80211/cfg80211
layer to the driver via ieee80211_ops and driver ops.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00480-QCAHKSWPL_SILICONZ-1

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 include/net/mac80211.h | 2 ++
 net/mac80211/cfg.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 445b66c..ff0e51e 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -631,6 +631,7 @@ struct ieee80211_fils_discovery {
  * @s1g: BSS is S1G BSS (affects Association Request format).
  * @beacon_tx_rate: The configured beacon transmit rate that needs to be passed
  *	to driver when rate control is offloaded to firmware.
+ * @beacon_tx_mode: Beacon Tx Mode setting.
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -700,6 +701,7 @@ struct ieee80211_bss_conf {
 	u32 unsol_bcast_probe_resp_interval;
 	bool s1g;
 	struct cfg80211_bitrate_mask beacon_tx_rate;
+	enum nl80211_beacon_tx_mode beacon_tx_mode;
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 7a99892..18e0d98 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1063,6 +1063,7 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 
 	prev_beacon_int = sdata->vif.bss_conf.beacon_int;
 	sdata->vif.bss_conf.beacon_int = params->beacon_interval;
+	sdata->vif.bss_conf.beacon_tx_mode = params->beacon_tx_mode;
 
 	if (params->he_cap && params->he_oper) {
 		sdata->vif.bss_conf.he_support = true;
@@ -2094,6 +2095,7 @@ static int copy_mesh_setup(struct ieee80211_if_mesh *ifmsh,
 
 	sdata->vif.bss_conf.beacon_int = setup->beacon_interval;
 	sdata->vif.bss_conf.dtim_period = setup->dtim_period;
+	sdata->vif.bss_conf.beacon_tx_mode = setup->beacon_tx_mode;
 
 	sdata->beacon_rate_set = false;
 	if (wiphy_ext_feature_isset(sdata->local->hw.wiphy,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
