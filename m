Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6465C433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 827FB60E9B
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 827FB60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccQHngnCP/oQxgqs5/+iFUBFsqOaV8ebYbAVYNwCsEM=; b=cEdvE5renoxHv+
	PzYDm+5MeTMElmj2uETOZ3SmwmwdHxBkKFTKv2Tx8FOV5hb0e2aXQF6y4q3pJZDIalXfBxJZvL8gz
	E9RqzBRxTBqqzLaQE3caH2h4ZTymcAoqF8rLJScd74XOBp4H3B+JboXZSKouuNOwsUT6dv4qdAlLI
	xdvp7mtZw73/wy6sKS8/dbKEEB0INLNP9U63dBONCZnmVeIQ168VksgiYEqL1wWjt57Me3a6qdvXc
	D1hb/tYcZN9ZhV+9L2K3XGV2RgErX4/U7nydvoq+fwKj+LZUPXtVdado1B0H0uIGIuiqiPl2ikYOy
	gePIzw/4osQF7VqNjKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTi1j-00E1k7-LO; Fri, 24 Sep 2021 10:01:55 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTi1f-00E1ch-4i
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 10:01:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632477712; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IQMPTWqWIXYBcfS7LEpxIUssZylZMJkVLK8D6YAx7E0=;
 b=p9YwaRvKWYSzh5RK8VMX+ceTE2lUTLy0kuEU+spz2wc38zbrZd/r/l888cQCq0tzI8Zgmra3
 08O0bmDDlky6NaJsE2++r5OIRXINeHQY6bafismyhpEOdrOapa0kP6HWuWQXIPwp4vI38xu+
 YQ3pOj+ZZFEptbjkVylDJNfYHr8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 614da1f5bd6681d8ed4b8e6e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 10:01:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 89A26C4361A; Fri, 24 Sep 2021 10:01:24 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 082D3C43616;
 Fri, 24 Sep 2021 10:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 082D3C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v4 6/6] mac80211: save transmit power envelope element and
 power constraint
Date: Fri, 24 Sep 2021 06:00:52 -0400
Message-Id: <20210924100052.32029-7-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924100052.32029-1-wgong@codeaurora.org>
References: <20210924100052.32029-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_030152_553534_661CF47E 
X-CRM114-Status: GOOD (  14.75  )
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
index 8923a9fc4126..16a965262a4f 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -633,6 +633,9 @@ struct ieee80211_fils_discovery {
  * @beacon_tx_rate: The configured beacon transmit rate that needs to be passed
  *	to driver when rate control is offloaded to firmware.
  * @power_type: power type of BSS for 6 GHz
+ * @tx_pwr_env: transmit power envelope array of BSS.
+ * @tx_pwr_env_num: number of @tx_pwr_env.
+ * @pwr_reduction: power constraint of BSS.
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -704,6 +707,9 @@ struct ieee80211_bss_conf {
 	bool s1g;
 	struct cfg80211_bitrate_mask beacon_tx_rate;
 	enum ieee80211_ap_reg_power power_type;
+	struct ieee80211_tx_pwr_env tx_pwr_env[IEEE80211_TPE_MAX_IE_COUNT];
+	u8 tx_pwr_env_num;
+	u8 pwr_reduction;
 };
 
 /**
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 6e8e90ee8b6c..b72fa1f6116a 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -2258,6 +2258,7 @@ static void ieee80211_set_disassoc(struct ieee80211_sub_if_data *sdata,
 {
 	struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
 	struct ieee80211_local *local = sdata->local;
+	struct ieee80211_bss_conf *bss_conf;
 	u32 changed = 0;
 	struct ieee80211_prep_tx_info info = {
 		.subtype = stype,
@@ -2407,6 +2408,11 @@ static void ieee80211_set_disassoc(struct ieee80211_sub_if_data *sdata,
 	cancel_delayed_work_sync(&ifmgd->tx_tspec_wk);
 
 	sdata->encrypt_headroom = IEEE80211_ENCRYPT_HEADROOM;
+
+	bss_conf = &sdata->vif.bss_conf;
+	bss_conf->pwr_reduction = 0;
+	bss_conf->tx_pwr_env_num = 0;
+	memset(bss_conf->tx_pwr_env, 0, sizeof(bss_conf->tx_pwr_env));
 }
 
 static void ieee80211_reset_ap_probe(struct ieee80211_sub_if_data *sdata)
@@ -5095,6 +5101,30 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
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
 		if (!ieee80211_verify_sta_he_mcs_support(sdata, sband, he_oper))
 			ifmgd->flags |= IEEE80211_STA_DISABLE_HE;
 	}
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
