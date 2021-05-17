Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2857C433B4
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2867060FEB
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2867060FEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6OlIPfh3wjsoMI6QO+VJKc6yinsDoGjT+TDIVt+8QBc=; b=JWzDACdMS524NHPsKcWYmGD+N
	+9nJjSwrNZmqRo4syIukpDrTGxjRlEBEL1z/7P89NqXpJetgdc3kLLp21g/9yc8RglUeIRcuRITbW
	7WcU5XNVuCHm2gknRE9dGjEbtNEt7RoiT+Xe4UtRPMzLfAODl4JRETxOUq7YrL8N98tgGeZeK25TT
	F6bmxq6XDlvMNKNf7gwMfQ3Ti57wVI+nC/l4rIVnZDmI3kd4gtk3xlVIE24YyGR/ZoAY2yPq1sLCi
	ZTZj6MGPzyK8J3d/xlYbtG6F84i1gUDhx0DiJaWJdpbO3enJFji8ulHJ2bSeTW7gjuSc+/Ufk8oXz
	whfo4yuCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijjD-00G2ox-Ja; Mon, 17 May 2021 20:20:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijj9-00G2nN-KM
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ZIRPdDZjGJ+2ToIHbKisNfBP5ceXAdpdv2UyXjRMqpM=; b=0fQniISC6ZL3jihoHqtZT1Kzww
 Uiv5QrK91aIjyhi4SdRlBr2eEO2SmZ+biw56BQ03OWMbNrsyPfMxgFXZle+bp1QAMShQptqCIW5zs
 UuILnOf87I6sjsnyA53IDEjtmNWN9bYRAEf4T+bOrqCNrTFmhOz70axRlWZqW77JR0Y/5fhGbyk/F
 H3AV0bLaDX0GLYoe8Hqs7XdWAGqs1xSRg6swHxNgGTQvDfiXzYqM1lQklLvLARWcdWt06NldHNd9c
 iV6TzguVKmEvArg7Nt3Oz46v/JLgvVvgv9LMkdzk04xtQbdVQrAE8lsiJIO9kU3y/8BPp5gvrmIhu
 4LBRkUaw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijj4-00E7mB-Fe
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282833; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZIRPdDZjGJ+2ToIHbKisNfBP5ceXAdpdv2UyXjRMqpM=;
 b=SkjoaD/kP2CwJkdkAJP8USIgi4CDVyTqBX8goMIdiYAIeNVU7uPm1FVZ6H65Ao0SNyZmVvnC
 G4oNzeLvp0sd4cJCjzDGy7iPCqw1cAUEGm9ZeoinrX3T7h6o/nEWLFu8F2UTONPRGc2A3x5x
 IQOnnDS7abSK8wC/serM/zKSRnU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60a2cfff5f788b52a5430d29 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EE617C433F1; Mon, 17 May 2021 20:20:14 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D380C433F1;
 Mon, 17 May 2021 20:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D380C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 7/9] mac80211: add parse transmit power envelope element
Date: Mon, 17 May 2021 16:19:30 -0400
Message-Id: <20210517201932.8860-8-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132033_208707_F26B68D1 
X-CRM114-Status: GOOD (  12.38  )
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

This patch is to add the transmit power envelope element parse in
_ieee802_11_parse_elems_crc(), it maybe have more than one transmit
power envelope element in a beacon.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/ieee80211_i.h | 3 +++
 net/mac80211/util.c        | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index ecda126a7026..22220e8dfdc7 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1507,6 +1507,7 @@ struct ieee802_11_elems {
 	const struct ieee80211_he_spr *he_spr;
 	const struct ieee80211_mu_edca_param_set *mu_edca_param_set;
 	const struct ieee80211_he_6ghz_capa *he_6ghz_capa;
+	const struct ieee80211_tx_pwr_env *tx_pwr_env[IEEE80211_TPE_MAX_IE_COUNT];
 	const u8 *uora_element;
 	const u8 *mesh_id;
 	const u8 *peering;
@@ -1557,6 +1558,8 @@ struct ieee802_11_elems {
 	u8 perr_len;
 	u8 country_elem_len;
 	u8 bssid_index_len;
+	u8 tx_pwr_env_len[IEEE80211_TPE_MAX_IE_COUNT];
+	u8 tx_pwr_env_num;
 
 	/* whether a parse error occurred while retrieving these elements */
 	bool parse_error;
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index f58136e844a7..585d2eeb4470 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1344,6 +1344,14 @@ _ieee802_11_parse_elems_crc(const u8 *start, size_t len, bool action,
 			elems->rsnx = pos;
 			elems->rsnx_len = elen;
 			break;
+		case WLAN_EID_TX_POWER_ENVELOPE:
+			if (elems->tx_pwr_env_num >= ARRAY_SIZE(elems->tx_pwr_env))
+				break;
+
+			elems->tx_pwr_env[elems->tx_pwr_env_num] = (void *)pos;
+			elems->tx_pwr_env_len[elems->tx_pwr_env_num] = elen;
+			elems->tx_pwr_env_num++;
+			break;
 		case WLAN_EID_EXTENSION:
 			ieee80211_parse_extension_element(calc_crc ?
 								&crc : NULL,
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
