Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C8DC433EF
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:20:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B56E660238
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B56E660238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgxuUOkHIf6eaqRQsgqlIfdh7V1VF4cA6FOG05WI7e8=; b=UTyYE0T95lqeaC
	fdbOq3jnps+fEr51fWzGHRJAXW3Jwnp3x7TKb4ikvplvnwUPT8iSnfzKbS506yG0C6cIQuIAxld+s
	0eUyq7EIpREiMR0+swEm24h1QSi+Zhhq1W6t5ANDuRQIX/3nD3GqD3+h5UGLVtXp3tAse90E2UNNG
	nWw8yhe7jsuJkSsBm3VupzcIbPjeBuGxg4m1i9QoB4wTxYnkbTxoTLVQmrcv29pQ3i2zZfO+EqYLL
	TOCG8Yf03+7AOTuBUvmrw7CFVjk/I1aUKWDadanGiO0Soz5m/QvnBdgJ4IEUT2R686uxaMw/ftv52
	9SVUINCxiuC3OrJ+YXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfKUw-001cTI-08; Tue, 26 Oct 2021 11:20:06 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfKUp-001cGS-D3
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 11:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635247199; x=1666783199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t46YeLoXPPPhCcwTGbgxwYSI/kDyb8WxpLpPJ3sV0v0=;
 b=pBtDq+B3552bYG00L2XgX0eY5xk5ixLruWMia6MXIAqcKPYrEKx+GCDs
 XIewtfwv0Ud9u90JDoBJqeB8ZviNmwRreWbwslJl9YyK+fNzDFaB/nIvD
 bR82qHYhbHa4LAlHtU/fdepZlwbioxJq8QQr1j/x1+DniG14yTcFy4DsM 4=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 04:19:59 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 04:19:59 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 26 Oct 2021 04:19:57 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 08/15] ath11k: save power spectral density(psd) of regulatory
 rule
Date: Tue, 26 Oct 2021 07:19:06 -0400
Message-ID: <20211026111913.7346-9-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026111913.7346-1-quic_wgong@quicinc.com>
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_041959_547034_5E77FC41 
X-CRM114-Status: GOOD (  11.17  )
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

Save the power spectral density(psd) report from firmware to struct
ieee80211_reg_rule.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/reg.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 4992f498c8a7..30cd2f81f89e 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -392,6 +392,10 @@ static void ath11k_reg_intersect_rules(struct ieee80211_reg_rule *rule1,
 
 	/* Use the flags of both the rules */
 	new_rule->flags = rule1->flags | rule2->flags;
+	if ((rule1->flags & NL80211_RRF_PSD) && (rule2->flags & NL80211_RRF_PSD))
+		new_rule->psd = min_t(s8, rule1->psd, rule2->psd);
+	else
+		new_rule->flags &= ~NL80211_RRF_PSD;
 
 	/* To be safe, lts use the max cac timeout of both rules */
 	new_rule->dfs_cac_ms = max_t(u32, rule1->dfs_cac_ms,
@@ -490,13 +494,14 @@ ath11k_reg_adjust_bw(u16 start_freq, u16 end_freq, u16 max_bw)
 static void
 ath11k_reg_update_rule(struct ieee80211_reg_rule *reg_rule, u32 start_freq,
 		       u32 end_freq, u32 bw, u32 ant_gain, u32 reg_pwr,
-		       u32 reg_flags)
+		       s8 psd, u32 reg_flags)
 {
 	reg_rule->freq_range.start_freq_khz = MHZ_TO_KHZ(start_freq);
 	reg_rule->freq_range.end_freq_khz = MHZ_TO_KHZ(end_freq);
 	reg_rule->freq_range.max_bandwidth_khz = MHZ_TO_KHZ(bw);
 	reg_rule->power_rule.max_antenna_gain = DBI_TO_MBI(ant_gain);
 	reg_rule->power_rule.max_eirp = DBM_TO_MBM(reg_pwr);
+	reg_rule->psd = psd;
 	reg_rule->flags = reg_flags;
 }
 
@@ -518,7 +523,7 @@ ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
 	ath11k_reg_update_rule(regd->reg_rules + i, reg_rule->start_freq,
 			       ETSI_WEATHER_RADAR_BAND_LOW, bw,
 			       reg_rule->ant_gain, reg_rule->reg_power,
-			       flags);
+			       reg_rule->psd_eirp, flags);
 
 	ath11k_dbg(ab, ATH11K_DBG_REG,
 		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
@@ -540,7 +545,7 @@ ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
 	ath11k_reg_update_rule(regd->reg_rules + i,
 			       ETSI_WEATHER_RADAR_BAND_LOW, end_freq, bw,
 			       reg_rule->ant_gain, reg_rule->reg_power,
-			       flags);
+			       reg_rule->psd_eirp, flags);
 
 	regd->reg_rules[i].dfs_cac_ms = ETSI_WEATHER_RADAR_BAND_CAC_TIMEOUT;
 
@@ -565,7 +570,7 @@ ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
 	ath11k_reg_update_rule(regd->reg_rules + i, ETSI_WEATHER_RADAR_BAND_HIGH,
 			       reg_rule->end_freq, bw,
 			       reg_rule->ant_gain, reg_rule->reg_power,
-			       flags);
+			       reg_rule->psd_eirp, flags);
 
 	ath11k_dbg(ab, ATH11K_DBG_REG,
 		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
@@ -689,6 +694,8 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 			reg_rule = reg_rule_6g + k++;
 			max_bw = min_t(u16, reg_rule->max_bw, max_bw_6g);
 			flags = NL80211_RRF_AUTO_BW;
+			if (reg_rule->psd_flag)
+				flags |= NL80211_RRF_PSD;
 		} else {
 			break;
 		}
@@ -699,7 +706,7 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 				       reg_rule->start_freq,
 				       reg_rule->end_freq, max_bw,
 				       reg_rule->ant_gain, reg_rule->reg_power,
-				       flags);
+				       reg_rule->psd_eirp, flags);
 
 		/* Update dfs cac timeout if the dfs domain is ETSI and the
 		 * new rule covers weather radar band.
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
