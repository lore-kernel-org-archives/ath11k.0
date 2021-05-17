Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF41C433B4
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1609E61350
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1609E61350
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ErOm8unnclzMrd6xbNywcWLikz916nEc6Z+xdERhacc=; b=n+G200qAz/o1EN8BrERzX1B5A
	PtVvKFSyAKNP4qSN/sVjKdcECx6gzkss/4HblKw837jiLtWRvaRtZcf2E/fLnhxSKs8/BcfVpZ/DI
	1l6ORchuKrjn4P22YW0a/vzukluTJaigIdIOwXJughXtoMz8rBQlDnagUApgc9JFNRC4exxjlI89c
	HejCuc6yXrLZ5hDOxhnXwT2sjJdnvyHNG+O3lRnHQ13l0nCN5w9ugSs+Jgq1cv9WfJ/Pq5KDXcWGA
	ho1dT/TWxHlGJJat99cYd972Cu6w1yByI/QmC7DOzP2eOeBgL3VqYqw1TYDBVAInhcPWhj02JvI/r
	fLeIakigQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijiv-00G2kk-Jq; Mon, 17 May 2021 20:20:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijit-00G2ia-N8
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=evetBr2LoPcsAtJOO4x2/sHwtO2JekH1EHkfeEUO7ms=; b=qr+2gJF7/33CWe5thLz7KZlFQG
 EIVhDGTdBcJj9ojbuFV35HJGtrv3hmBxZoWNvYUtmfFlEypEtE8x7h8wpzDiY+FRQIfM8RYOuqeST
 HormGtwdKWOGnr73OvNWBskXSe1AZwwSjMHLnQul3MvzCfI0nrAi9399pkkVOG3+6dJ8TulR9MYHn
 QYayfzkLDcUTkNi/EslCQbwSIdCbk6ygOrJU1hpXanJI9L28H0wjborXQUxicEY30GgpK4hr47nqL
 6mwKITkidjEXl9bjm7MHBfg45mywymDX17f6SiN617mCcBcXebrCpM342E+yvUNWQdbdjC+RuSj2w
 G+EBW25A==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijir-00E7mP-1C
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282817; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=evetBr2LoPcsAtJOO4x2/sHwtO2JekH1EHkfeEUO7ms=;
 b=t5Io/KGwVs1uslX6Yycn07sIMGNw6pkXlNZvFCw2pV+lD2sdQ8XHpBasyYlCXsSONW7bfeNW
 UwZi9Y3Ulo9Swc2rQEPi0DilDESYyzqkPwmeqQ21CH637KwXITa1FyCeLDcCut5MvuoSoEnr
 QC5paZit3a6mO0KkX5aj8DEjeiU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60a2d0005f788b52a5431145 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 82043C433F1; Mon, 17 May 2021 20:20:16 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DA4F9C43460;
 Mon, 17 May 2021 20:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA4F9C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 8/9] mac80211: add transmit power envelope element and power
 constraint in bss_conf
Date: Mon, 17 May 2021 16:19:31 -0400
Message-Id: <20210517201932.8860-9-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132017_394176_B63D3B8D 
X-CRM114-Status: GOOD (  10.10  )
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

This patch is to add definition of transmit power envelope element and
power constraint in struct ieee80211_bss_conf for 6GHz.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 include/net/mac80211.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 2d1d629e5d14..1e9d3650fbc4 100644
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
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
