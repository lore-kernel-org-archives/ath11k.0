Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C9EC433ED
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47AF760FEB
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47AF760FEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D/EU6SAnx0Q+d1MZoMLiaU8z5srB0QVlVu8cpYZP7Ws=; b=l84BjqH2LRAVzrZh7sYYJI3s1
	LRNqomouLQzFyxyaaUSiI++PTlUuXdsor9nh+Wbs1uMNL015c3eUozBqTp+weLpn9burXW67KzszX
	0cuM7hDYCSxK3NBKPQKOKIcYoPWR48WkX74O+CANuGSvbWZgwfJQLoI/RCb60+Eu1TYQ5V2dSS79L
	tonisoy1gXuvojSKauGzX0QRDxuy608f0YOzUWi0Ou5kJIo7YW1mK1bIj3pym4pp1Ev12yO3LiEkz
	2TNk0P+z6tqv4VCjaO/K9JZUBwz9Qx1cbb8PcBGS7y00RFc9fjjpPvrjUIhEk2BNTSiN15pwGudGn
	Pi7WJTS7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijjB-00G2oH-Q8; Mon, 17 May 2021 20:20:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijj5-00G2mS-7o
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uuIAjdRE0Ti40fZg9EfjVcWG1MGHeEI07hq4NN2t540=; b=sWr1biDTzorh5Z5G90ueY2YJEB
 U6l6gsor4e3vGXCl/CxlIovrIkraQcvp/Gdwog9aD++/xxhmiFR8tvhUV8kF/UJyYMXWB+hS5lk1O
 VXJO8UmjntBsRjsS2go+xtj1SRDfg01DPFJZqE37UC0UBmQDWsPYPX9pDfPJ4+mptRsIVSE6/D18Y
 diSCv/awBA9MKViTJZEH4dgPb8JHw2fP1ATeIvNQF+OTJ2jXYiIwZ6zHv1vU/hk59P0hPKV1VPboN
 F/yaBc5tdwkrhJxu+pWL4CuMI9PlOxBG/S7SUQpkZ+ZGVhIRPGztzEKxV6YM89CuNxAW2kZ6vYj0x
 BKAmx3gg==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijj1-00E7mO-5J
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282828; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=uuIAjdRE0Ti40fZg9EfjVcWG1MGHeEI07hq4NN2t540=;
 b=PjXstLwRyBDUHIcWn/uZ3KC8uCceFOCe6wfoIJrExf0XUN0Oq99+SYFnWyDMZkV2vq6GZsvd
 GRAubquVGsarZ+2taknGPKCtce95X+SC6uQlOKQpmWYonK2PAW1NKnqoPknYP1tkGb7n3yct
 rofTpJuI9Vd71uA+Vm+xzJ+zi58=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60a2cff95f788b52a542ff72 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8C4A3C433F1; Mon, 17 May 2021 20:20:09 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D1DF5C433D3;
 Mon, 17 May 2021 20:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D1DF5C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 3/9] mac80211: add parse regulatory info in 6G Hz operation
 information
Date: Mon, 17 May 2021 16:19:26 -0400
Message-Id: <20210517201932.8860-4-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132028_868192_F78F2C44 
X-CRM114-Status: GOOD (  10.07  )
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

This patch is to convert the regulatory info subfield in HE operation
element to power type and save in struct cfg80211_chan_def.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/util.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index f080fcf60e45..f58136e844a7 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -3405,6 +3405,16 @@ bool ieee80211_chandef_he_6ghz_oper(struct ieee80211_sub_if_data *sdata,
 					      NL80211_BAND_6GHZ);
 	he_chandef.chan = ieee80211_get_channel(sdata->local->hw.wiphy, freq);
 
+	switch (u8_get_bits(he_6ghz_oper->control,
+			    IEEE80211_HE_6GHZ_OPER_CTRL_REG_INFO)) {
+	case IEEE80211_6GHZ_CTRL_REG_LPI_AP:
+		he_chandef.power_type = NL80211_REG_LPI_AP;
+		break;
+	case IEEE80211_6GHZ_CTRL_REG_SP_AP:
+		he_chandef.power_type = NL80211_REG_SP_AP;
+		break;
+	}
+
 	switch (u8_get_bits(he_6ghz_oper->control,
 			    IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH)) {
 	case IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH_20MHZ:
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
