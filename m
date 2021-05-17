Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE58CC433B4
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 702E361350
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 702E361350
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LxsBkSrLbtlyd6ZXV/6OOyXnleufLrfBS6E89H/rY/s=; b=JMl5oF50ot16fVNwNv7GdIYiD
	wf9ZbbFpRF5r0uHMz0M5iXs2jk7VpVSDzBA4AxXiitX50h2/cqEg8nr491uABhVXOPcIsaZpLw32J
	lRzJWFGz4cj7x3AKxWS74fZsl2TUUoOcCBmebdKthEsKRQ3OW4gfo9zdbUd3RlKW7emQoCT3w03A9
	V7RMqig7w9O0auqw5ZYHvb0q3VD6xs9CAJuwKCAmoh/v5SorSZcZ6GGuN76Ku0QRQjsVNY5axjGb4
	RxPSe46h9Gt+R5lCOVP/1oa747NjXpd0r/JjiqsZkQu3x6bK0m9F+Rosnd35TyjMToXk6oAuc5wtY
	NsLGU5Y/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijiy-00G2lT-5x; Mon, 17 May 2021 20:20:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijiv-00G2kd-Oo
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VK4UK5kSffOJbSxn2oczi2SPdI/m1A68RieCMNy/ETY=; b=lBX/G/oDBXGDv9vcEiNOKFlNYj
 8Xek3+OdUrjpYZTwcSrUAxHQ9tfgSbbTobCB1l3m/8LtKclnDMqN2rLjVI7TmChkXTbgEwPg6yK+z
 PNSLRwJKUr+lwWbOLUkkHbldj3nn8TaXKoZzwoEEa1BmPhNTkHn+RuDyUhpyihOmKgdRsQXr0ghLe
 8R3yuFtZkrIrC4LAzGnGra0yHsV79h9BtAaAMB6eYhqZoVsaJC3ngjGhnJT0fYeqmAJte/GgvOyDu
 qcVcb7hnjPutXUDz9NTdOvBRkPI2Q4dH22m3EcUhvU0awJSJkGZZifnPOl6QYotNO9v6y86XzYJlk
 06HLXeEw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijit-00E7mB-7Q
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282819; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=VK4UK5kSffOJbSxn2oczi2SPdI/m1A68RieCMNy/ETY=;
 b=TBfft33oicrDrY7JcmuisYWZye60Emy80Biy+eE+h5cfMg3ZWDDVQjfulv8zh4fs3XFVGD3T
 pznfwgnxP3uqIWqAud/4Atnhb04G3zR+J5QxjOR1NIhT1mqtAGBSWtB+caJwYWbTc5ykImj9
 9T879klLDg3EbQXidVgmhitPZ0I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60a2d002063320cd131010ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F0B14C4323A; Mon, 17 May 2021 20:20:17 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 72C77C43217;
 Mon, 17 May 2021 20:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72C77C43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 9/9] mac80211: save transmit power envelope element and power
 constraint
Date: Mon, 17 May 2021 16:19:32 -0400
Message-Id: <20210517201932.8860-10-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132019_350067_73775444 
X-CRM114-Status: GOOD (  12.71  )
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

This patch is to save the transmit power envelope element and power
constraint in struct ieee80211_bss_conf for 6GHz.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/mlme.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 2e33a1263518..5b02d78bd934 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -5076,6 +5076,27 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 		else
 			he_oper = NULL;
 
+		if (is_6ghz) {
+			struct ieee802_11_elems elems;
+			struct ieee80211_bss_conf *bss_conf;
+			u8 i, n;
+
+			ieee802_11_parse_elems(ies->data, ies->len, false, &elems,
+					       NULL, NULL);
+			bss_conf = &sdata->vif.bss_conf;
+			bss_conf->pwr_reduction = 0;
+			if (elems.pwr_constr_elem)
+				bss_conf->pwr_reduction = *elems.pwr_constr_elem;
+
+			memset(bss_conf->tx_pwr_env, 0, sizeof(bss_conf->tx_pwr_env));
+			bss_conf->tx_pwr_env_num = elems.tx_pwr_env_num;
+			n = min_t(u8, elems.tx_pwr_env_num,
+				  ARRAY_SIZE(elems.tx_pwr_env));
+			for (i = 0; i < n; i++)
+				memcpy(&bss_conf->tx_pwr_env[i], elems.tx_pwr_env[i],
+				       elems.tx_pwr_env_len[i]);
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
