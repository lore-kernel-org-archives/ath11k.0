Return-Path: <SRS0=YLPq=NZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F829C4332F
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:49:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1873D60FDC
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1873D60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObX1ocXbTa4Z6P0IJUbIgb0d1QQ5+3yHMTJ44mRpTC8=; b=sXxUBBJEtA5e97
	a+b2ViAlvOYRIgXg0uYEJgOjNOOAIEMsYlEeG7tNVZLxpVWgM2zeVENsdpbDcLqv48hZg3IWvUDed
	vAx7sP6+i1BlyNps9j9WvZ+zdehvU0QhpB/nEbulr9LY5tK6y+khAPLI0ouMCORTgToJF2eaDGOJM
	KxgjSVrdokaR7K34rYMljAOMTboQ9lO6zimDM/l4gdZsnkgY00AnUF9CyHPMDpjzwUiDLQy2fhqPd
	utiua7BTQBwtZN8EgnFCSBUAnskY0uHxi+C+YmcI7mk2aL4V+/Tp2sZs3l4vLJnrlZ0rJlD+cm5PW
	Gjw6dJbfOgQFYi5QOtiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM7gw-00Bpkp-0K; Fri, 03 Sep 2021 11:49:06 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM7gr-00BpOT-5U
 for ath11k@lists.infradead.org; Fri, 03 Sep 2021 11:49:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630669742; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MII1jvCgs+l0Vv+ZFpi/PRCGlZgAoEL+LQqoA/PUiCE=;
 b=F4ubLwyo7Q8/j0rVk27Mydze5P0vVN1cwj+uT7WCbFFEUTgOt1RN19wl3FX743IWv2Jsn8px
 qJUjHLPelh3wtyGsaAXcYZ+95Loe+XYOZnHXRcPnqKEob2EdndbwyoLBvQD0MlcMwkYYykah
 NDEU55K+qpa8ZLCqo9dRJobtn4U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61320b9a1567234b8c8feb56 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 11:48:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31011C4338F; Fri,  3 Sep 2021 11:48:42 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BBED6C4360C;
 Fri,  3 Sep 2021 11:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BBED6C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v3 9/9] mac80211: save transmit power envelope element and
 power constraint
Date: Fri,  3 Sep 2021 07:48:21 -0400
Message-Id: <20210903114821.23346-10-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903114821.23346-1-wgong@codeaurora.org>
References: <20210903114821.23346-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_044902_437730_074FE1AF 
X-CRM114-Status: GOOD (  15.21  )
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

This is to save the transmit power envelope element and power
constraint in struct ieee80211_bss_conf for 6 GHz. Lower driver
will use this info to calculate the power limit.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 include/net/mac80211.h |  6 ++++++
 net/mac80211/mlme.c    | 30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index d0522d7f3351..0ac6fe7b8f99 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -632,6 +632,9 @@ struct ieee80211_fils_discovery {
  * @beacon_tx_rate: The configured beacon transmit rate that needs to be passed
  *	to driver when rate control is offloaded to firmware.
  * @power_type: power type of BSS for 6 GHz
+ * @tx_pwr_env: transmit power envelope array of BSS.
+ * @tx_pwr_env_num: number of @tx_pwr_env.
+ * @pwr_reduction: power constraint of BSS.
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -702,6 +705,9 @@ struct ieee80211_bss_conf {
 	bool s1g;
 	struct cfg80211_bitrate_mask beacon_tx_rate;
 	enum ieee80211_ap_reg_power power_type;
+	struct ieee80211_tx_pwr_env tx_pwr_env[IEEE80211_TPE_MAX_IE_COUNT];
+	u8 tx_pwr_env_num;
+	u8 pwr_reduction;
 };
 
 /**
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 6b32cdd590cd..cda28ec58a31 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -2340,6 +2340,7 @@ static void ieee80211_set_disassoc(struct ieee80211_sub_if_data *sdata,
 {
 	struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
 	struct ieee80211_local *local = sdata->local;
+	struct ieee80211_bss_conf *bss_conf;
 	u32 changed = 0;
 
 	sdata_assert_lock(sdata);
@@ -2483,6 +2484,11 @@ static void ieee80211_set_disassoc(struct ieee80211_sub_if_data *sdata,
 	cancel_delayed_work_sync(&ifmgd->tx_tspec_wk);
 
 	sdata->encrypt_headroom = IEEE80211_ENCRYPT_HEADROOM;
+
+	bss_conf = &sdata->vif.bss_conf;
+	bss_conf->pwr_reduction = 0;
+	bss_conf->tx_pwr_env_num = 0;
+	memset(bss_conf->tx_pwr_env, 0, sizeof(bss_conf->tx_pwr_env));
 }
 
 static void ieee80211_reset_ap_probe(struct ieee80211_sub_if_data *sdata)
@@ -5087,6 +5093,30 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 		else
 			he_oper = NULL;
 
+		if (is_6ghz) {
+			struct ieee80211_bss_conf *bss_conf;
+			u8 i, j = 0;
+
+			bss_conf = &sdata->vif.bss_conf;
+
+			if (elems->pwr_constr_elem)
+				bss_conf->pwr_reduction = *elems->pwr_constr_elem;
+
+			BUILD_BUG_ON(ARRAY_SIZE(bss_conf->tx_pwr_env) !=
+				     ARRAY_SIZE(elems->tx_pwr_env));
+
+			for (i = 0; i < elems->tx_pwr_env_num; i++) {
+				if (elems->tx_pwr_env_len[i] >
+				    sizeof(bss_conf->tx_pwr_env[j]))
+					continue;
+
+				bss_conf->tx_pwr_env_num++;
+				memcpy(&bss_conf->tx_pwr_env[j], elems->tx_pwr_env[i],
+				       elems->tx_pwr_env_len[i]);
+				j++;
+			}
+		}
+
 		if (!ieee80211_verify_sta_he_mcs_support(sband, he_oper))
 			ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
 	}
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
