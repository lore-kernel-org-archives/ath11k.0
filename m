Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58014C43470
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B6261350
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B6261350
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BNDKfV+7GOO2lc8hC2WlZgy4utxat2q8ZlFkIAS4fRg=; b=lGJMDPrdJ191O5ZchyvivRoRn
	K0/Js49uWQa+oT1ism17hf/AcPVaAagos7tSwvPUshn3bM8EjbrU501ootzTMuTMVCw/kotOf6bR2
	g7IP+j44fs7oiG2+ZM/gSWuvrYqF6wVIUgPywkknOS2TyI9GcwfaXOlvdwDZKdKPfcyeIjBhyhufN
	2IOGSH/3MyX95AC1U5yLdgJdH9VLVMqMFY+eTnobIWAdyL+kR6b9N1zIDU6WgKVRbIQBJhSoMhF1G
	C4G3vaxX3EWiBn2qCTpOmX46FAc9Bz37l+0z01RLNaHo3pXY+RnqcO9FVCu7Nh0Jpgu2M7nlaMB40
	1+D2ievGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijj8-00G2nL-Oq; Mon, 17 May 2021 20:20:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijj0-00G2lq-5G
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GTWG3/4MZosDtfOzIi+/zkF6ycIGAAeBlvr9ZI7FFWk=; b=LlLEnIjZkGCjpXag3ySsdG7cae
 xF1u3P3xezujJ0ac41/6Xux3KG/HQfv/bPwR1c7YeuivPuuLDPvbJXe9UTFLof2v2q9MsM8roPHf9
 l8kGWgt4mF/HQK8nAvsUStgXuVgH3VP642YaORoSv7LlhuGDD4urXWhAaJiFptyRYgJrzeOe3crWX
 sSd5QSkfJdAnD9kETD7xMfmkf6vTb3gcUxpOXuJR/FFqmngcqQSoaHrXYUKeDYrh8NNYq3MCUWYZD
 k+tQ2b8qTIZrIExZjhH7xi4j8aW0FU1J4HX2Al24rnL4FHv7zV1+iSU+41geePTdTCiFU5uwuNGCc
 gjNZqAnQ==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijiw-00E7mO-R8
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282823; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GTWG3/4MZosDtfOzIi+/zkF6ycIGAAeBlvr9ZI7FFWk=;
 b=hn5I/jrpTYZVcili4VWpwyJ/ubOdnOl+7hypQ7qAWzpCRWazlJsr7vtzinPSZ/mnsz44gs4f
 fxiW39n2FJ87nwVIks5VGKtfiuvEBSEC8sFKJW9xEmuuusRpvHErZO1mNpnr+NG67/KFmOe5
 eiF07o+4ADVSX0w6o1R7zb997yc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60a2cffb2bff04e53b69308f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 844F1C43217; Mon, 17 May 2021 20:20:11 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1055BC433F1;
 Mon, 17 May 2021 20:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1055BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 5/9] cfg80211: save power spectral density(psd) of regulatory
 rule
Date: Mon, 17 May 2021 16:19:28 -0400
Message-Id: <20210517201932.8860-6-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132023_695145_329C4358 
X-CRM114-Status: GOOD (  11.83  )
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

The power spectral density(psd) of regulatory rule should be take
effect to the channels. This patch is to save the values to the
channel which has psd value.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/wireless/reg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 21536c48deec..270be66a8d3f 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -1583,6 +1583,8 @@ static u32 map_regdom_flags(u32 rd_flags)
 		channel_flags |= IEEE80211_CHAN_NO_160MHZ;
 	if (rd_flags & NL80211_RRF_NO_HE)
 		channel_flags |= IEEE80211_CHAN_NO_HE;
+	if (rd_flags & NL80211_RRF_PSD)
+		channel_flags |= IEEE80211_CHAN_PSD;
 	return channel_flags;
 }
 
@@ -1787,6 +1789,9 @@ static void handle_channel_single_rule(struct wiphy *wiphy,
 				chan->dfs_cac_ms = reg_rule->dfs_cac_ms;
 		}
 
+		if (chan->flags & IEEE80211_CHAN_PSD)
+			chan->psd = reg_rule->psd;
+
 		return;
 	}
 
@@ -1807,6 +1812,9 @@ static void handle_channel_single_rule(struct wiphy *wiphy,
 			chan->dfs_cac_ms = IEEE80211_DFS_MIN_CAC_TIME_MS;
 	}
 
+	if (chan->flags & IEEE80211_CHAN_PSD)
+		chan->psd = reg_rule->psd;
+
 	if (chan->orig_mpwr) {
 		/*
 		 * Devices that use REGULATORY_COUNTRY_IE_FOLLOW_POWER
@@ -1876,6 +1884,9 @@ static void handle_channel_adjacent_rules(struct wiphy *wiphy,
 							 rrule2->dfs_cac_ms);
 		}
 
+		if (chan->flags & IEEE80211_CHAN_PSD)
+			chan->psd = min_t(s8, rrule1->psd, rrule1->psd);
+
 		return;
 	}
 
@@ -2533,6 +2544,9 @@ static void handle_channel_custom(struct wiphy *wiphy,
 			chan->dfs_cac_ms = IEEE80211_DFS_MIN_CAC_TIME_MS;
 	}
 
+	if (chan->flags & IEEE80211_CHAN_PSD)
+		chan->psd = reg_rule->psd;
+
 	chan->max_power = chan->max_reg_power;
 }
 
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
