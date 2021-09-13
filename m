Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA31C433F5
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 17:55:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC570610CE
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 17:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC570610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KiTUXf2MzeHtuOdI0L+nTOMwa4MwwWgDRjLQDeSUV4U=; b=yQqKiPc7QOJ0Wq
	gMHrMnFhm07O6GjdtBMQmAp+WAcxvvCLRUSzAqtjGBtzxe5IkKylZjbKC6wBM9DL//Y8kGPzXHTgz
	ketuuDhOkhhxIQLbCesyLDQzUcC+DdXQt4RG+bOsmAwG7L+HMZk2Z4nmpGl3pQmONmWEhFREy/Ozr
	rve8YJVDYoAI88SKfQ1weP8Lh33NWSU9auU42kp9kOsKEXaQQJLLt9yKmceTzS59m9NMYTx1d3ww/
	34xQ6ozFodZoAU25ATMQ3IThnwULcxBC4pzJwBnu5SrdbGYfm8SEY+e9prCEq3P9IkT9pYlCu3+/E
	Cnug/dN7ztT6JJbtpQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqB6-002rA4-Cd; Mon, 13 Sep 2021 17:55:36 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqB3-002r8x-Kt
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 17:55:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631555731; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=x4JYpC4AekhJRX+KOkQHy1gLl2sQLOisRGN89DCrN/I=;
 b=wGX4u3tAc+2f0uEb+Ip06mOecW+2Gxqei2oghPdo5QgdKYhG78GYb2W+DRh8mvF4NCayrZ7Y
 cO+Jr/ksXw4HZa4b6lu8qvPJLnxrulJXFrITdcFMv2eSjUoaKopcMNH/BVu48E6JKK+T2iX0
 rQAGhQlRwZNY/S/ZU7EuWpyX28Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 613f9092ec62f57c9a248540 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 17:55:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E5A49C43616; Mon, 13 Sep 2021 17:55:29 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D89E3C4338F;
 Mon, 13 Sep 2021 17:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D89E3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/3] ieee80211: Add new A-MPDU factor macro for HE 6 GHz peer
 caps
Date: Mon, 13 Sep 2021 20:55:08 +0300
Message-Id: <20210913175510.193005-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_105533_771126_D41AD92C 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Add IEEE80211_HE_6GHZ_MAX_AMPDU_FACTOR as per IEEE Std 802.11ax-2021,
9.4.2.263 to use for peer max A-MPDU factor in 6 GHz band.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 include/linux/ieee80211.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 694264503119..a1a7eda35cb5 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -2084,6 +2084,7 @@ int ieee80211_get_vht_max_nss(struct ieee80211_vht_cap *cap,
 
 #define IEEE80211_HE_VHT_MAX_AMPDU_FACTOR	20
 #define IEEE80211_HE_HT_MAX_AMPDU_FACTOR	16
+#define IEEE80211_HE_6GHZ_MAX_AMPDU_FACTOR	13
 
 /* 802.11ax HE PHY capabilities */
 #define IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G		0x02
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
