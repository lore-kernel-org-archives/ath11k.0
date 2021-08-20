Return-Path: <SRS0=xirI=NL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E234C4338F
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48F7560F45
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48F7560F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEkuGB133d4sBUqbWOHJbn33UJVXGeXm5iQE+Z5VHao=; b=RzZlPsMqNWHmIX
	nY8rweyQ+AVH3SSc6Wtz4+/clEz0IWXDxuwqSSpp3fHxFu6lGkKfJpu3tFuzstVUkfDMx7sIxM/JC
	/MckaK5smkmZoaKi6hQRlO7TfFUQpQhmMyimBWTSsF1ERcvy8MIKAnIcE34kv4yHOgFtpoUDIVO7t
	I07T7Gw52mOjc/8wnsw0WEUYYofc7QaK27G+yS1T5vFeRzVoJrcfVIDXSaQSJp/3DzRvb/42msGwP
	Np2uwWGhZBuhAhoYoMUeCf5m9YSHAeA/WNWlUtddHrI6icKvqveh7ne6TCwBY1KKhtApcpF409wJa
	NYPz9BY+rzq52eEsKCSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3WI-00B6fR-PA; Fri, 20 Aug 2021 12:21:10 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3WB-00B6cF-3N
 for ath11k@lists.infradead.org; Fri, 20 Aug 2021 12:21:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629462063; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=x/Cgq183T9f89XOOcwri40VOSTuVlC/dB43M5oaeiNc=;
 b=nfcqpsv3TA710TWsdcKPrtzV8vNkRzeLYQKasljZMECyilk4f7Luml4wis/u+j8XNAwx/UaS
 9DCSoXOJSBll2/f8NpJgJ/LDDeD7zRMEmlZO4nirgyU+x4D8vjKKV1WCsjvzEDs6akPQ+T0L
 BLu7iXRSYW0xa3HRwbPNcVTf87A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 611f9e2d89fbdf3ffe7ba132 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 12:21:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1E180C4338F; Fri, 20 Aug 2021 12:21:01 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9CEC0C43460;
 Fri, 20 Aug 2021 12:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9CEC0C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
Date: Fri, 20 Aug 2021 08:20:41 -0400
Message-Id: <20210820122041.12157-9-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820122041.12157-1-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_052103_492809_CCA3CA11 
X-CRM114-Status: GOOD (  14.85  )
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
 net/mac80211/chan.c    |  9 +++++++++
 net/mac80211/mlme.c    | 26 ++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index e89530d0d9c6..6e11e122e364 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -631,6 +631,9 @@ struct ieee80211_fils_discovery {
  * @s1g: BSS is S1G BSS (affects Association Request format).
  * @beacon_tx_rate: The configured beacon transmit rate that needs to be passed
  *	to driver when rate control is offloaded to firmware.
+ * @tx_pwr_env: transmit power envelope array of BSS.
+ * @tx_pwr_env_num: number of @tx_pwr_env.
+ * @pwr_reduction: power constraint of BSS.
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -700,6 +703,9 @@ struct ieee80211_bss_conf {
 	u32 unsol_bcast_probe_resp_interval;
 	bool s1g;
 	struct cfg80211_bitrate_mask beacon_tx_rate;
+	struct ieee80211_tx_pwr_env tx_pwr_env[IEEE80211_TPE_MAX_IE_COUNT];
+	u8 tx_pwr_env_num;
+	u8 pwr_reduction;
 };
 
 /**
diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index 907bb1f748a1..149d4ac798f6 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -721,6 +721,15 @@ static int ieee80211_assign_vif_chanctx(struct ieee80211_sub_if_data *sdata,
 					 lockdep_is_held(&local->chanctx_mtx));
 
 	if (conf) {
+		if (conf->def.chan->band == NL80211_BAND_6GHZ) {
+			struct ieee80211_bss_conf *bss_conf;
+
+			bss_conf = &sdata->vif.bss_conf;
+			bss_conf->pwr_reduction = 0;
+			bss_conf->tx_pwr_env_num = 0;
+			memset(bss_conf->tx_pwr_env, 0, sizeof(bss_conf->tx_pwr_env));
+		}
+
 		curr_ctx = container_of(conf, struct ieee80211_chanctx, conf);
 
 		drv_unassign_vif_chanctx(local, sdata, curr_ctx);
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 2480bd0577bb..a6d66b4ad7ee 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -5070,6 +5070,7 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 
 	if (!(ifmgd->flags & IEEE80211_STA_DISABLE_HE)) {
 		const struct cfg80211_bss_ies *ies;
+		struct ieee80211_bss_conf *bss_conf;
 		const u8 *he_oper_ie;
 
 		ies = rcu_dereference(cbss->ies);
@@ -5081,6 +5082,31 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 		else
 			he_oper = NULL;
 
+		if (is_6ghz) {
+			struct ieee802_11_elems elems;
+			u8 i, j = 0;
+
+			ieee802_11_parse_elems(ies->data, ies->len, false, &elems,
+					       NULL, NULL);
+
+			if (elems.pwr_constr_elem)
+				bss_conf->pwr_reduction = *elems.pwr_constr_elem;
+
+			BUILD_BUG_ON(ARRAY_SIZE(bss_conf->tx_pwr_env) !=
+				     ARRAY_SIZE(elems.tx_pwr_env));
+
+			for (i = 0; i < elems.tx_pwr_env_num; i++) {
+				if (elems.tx_pwr_env_len[i] >
+				    sizeof(bss_conf->tx_pwr_env[j]))
+					continue;
+
+				bss_conf->tx_pwr_env_num++;
+				memcpy(&bss_conf->tx_pwr_env[j], elems.tx_pwr_env[i],
+				       elems.tx_pwr_env_len[i]);
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
