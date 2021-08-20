Return-Path: <SRS0=xirI=NL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A146EC4338F
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F9960FE6
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74F9960FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7n4jUpNG5nczzRzURl1l/LWnzwziKf+q6ib0yqd06I=; b=NxKTvbl0MqyloM
	sWNGSB0kKw5eBLqrIg2Q2rUsVwmZJffwJXW20SK61K1nWZ2Ep5IpRDJHMckoD+7peZcOqsedRIXiT
	SCADMP7w49CMxWTL3Lj0+S70g9ZkG97tiJH4cGrNSFHWAuqq/moo1c8d8pYX66CnpTjGeLZrl2+Y6
	W0wZ5/BLxEM6b3Nl8eoYUHS6QI7cjRcnMnYUtL4Ae9wgQK0jr8sh6iz51e5r/Rn5rhRJ7M7rVP6C1
	3r2raX2QdoWbPI5T1MkfM8d/ZIUzDWqs9F++8H5sPgb0iQh8jvBzupx2sSCO12ttsuhZk7IHohuSd
	iDZQtoCZyfq9mACQvb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3WR-00B6kr-N4; Fri, 20 Aug 2021 12:21:19 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3WF-00B6dM-4Y
 for ath11k@lists.infradead.org; Fri, 20 Aug 2021 12:21:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629462069; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JsGCfZQIQ3Z0P9pypU2AKrMWSoy/ba8cpre//PAvbvU=;
 b=nuvPpEhkaQrcTgIWYn632RXIzX5AAoH5pJNVnXs4vPzRMDaYujrDVLqSrChj0GJsdK1/Myvk
 3AMn+dBh5SEkKplOdVLHzvw2pZ4qqKh8+z0srwXw35j8sOnEeNkPI7brdGSd4F38/VmWYO8b
 uvIfR80oxQARgH84BzrqXdAG7II=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 611f9e2b34bfa769799c9b7d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 12:20:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7DF68C43616; Fri, 20 Aug 2021 12:20:59 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 13FD0C4338F;
 Fri, 20 Aug 2021 12:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 13FD0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2 7/8] mac80211: add parse transmit power envelope element
Date: Fri, 20 Aug 2021 08:20:40 -0400
Message-Id: <20210820122041.12157-8-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820122041.12157-1-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_052109_252079_798994ED 
X-CRM114-Status: GOOD (  11.19  )
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

The transmit power envelope elements in beacon is used to calculate
the power limit by lower driver, and sometimes it has more than
one elements in a beacon frame.

This is to add parse the transmit power envelope elements, then it
will be saved and transfer to lower driver to calculate the power
limit.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/ieee80211_i.h | 3 +++
 net/mac80211/util.c        | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 648696b49f89..bb62de5e3758 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1494,6 +1494,7 @@ struct ieee802_11_elems {
 	const struct ieee80211_he_spr *he_spr;
 	const struct ieee80211_mu_edca_param_set *mu_edca_param_set;
 	const struct ieee80211_he_6ghz_capa *he_6ghz_capa;
+	const struct ieee80211_tx_pwr_env *tx_pwr_env[IEEE80211_TPE_MAX_IE_COUNT];
 	const u8 *uora_element;
 	const u8 *mesh_id;
 	const u8 *peering;
@@ -1544,6 +1545,8 @@ struct ieee802_11_elems {
 	u8 perr_len;
 	u8 country_elem_len;
 	u8 bssid_index_len;
+	u8 tx_pwr_env_len[IEEE80211_TPE_MAX_IE_COUNT];
+	u8 tx_pwr_env_num;
 
 	/* whether a parse error occurred while retrieving these elements */
 	bool parse_error;
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index cb1c35d8ef48..12c70cc30461 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1336,6 +1336,15 @@ _ieee802_11_parse_elems_crc(const u8 *start, size_t len, bool action,
 			elems->rsnx = pos;
 			elems->rsnx_len = elen;
 			break;
+		case WLAN_EID_TX_POWER_ENVELOPE:
+			if (elems->tx_pwr_env_num >= ARRAY_SIZE(elems->tx_pwr_env) ||
+			    elen < 1)
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
