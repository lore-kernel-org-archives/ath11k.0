Return-Path: <SRS0=PCnT=O4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC06C433F5
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 14:40:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E608D60F5C
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 14:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E608D60F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Y85vOnMxn29UAj/8L9AvxrCCZWBaryYNDM08S/nau8=; b=tRLyf6XV1RftA5
	PiZD83icwm7b5UWJVkFgSbEpd/gPEsbqY61qj/5EAR+VSVVzV6rRwTJ2Pfp71sqvfpsBEHwP1rzQk
	67xNEZzmtWoUI3A2WL6x71xVU8Cpf06Y0gn66Grz986ymgAtqY0E4mBULlmq6OT/OjywpsXGfhQQR
	30uunB96l9DkDfD9ZZE24SKISjOcgJk2TpkicRrYHYkB/XreJT4Skp4GZ9Yku0YGYbKIrI5nLoWeA
	U50h21JxnjsGnDn2tQE0e9ZfHTk7Rniy6HxrW5z+BmZ4GZGLQ2RMG63ixzb6EcWAyVmJxd1QSdqQY
	oztFjsSwE5m2OUwerZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYr2T-0037XY-DJ; Fri, 08 Oct 2021 14:39:57 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYr2N-0037UY-HX
 for ath11k@lists.infradead.org; Fri, 08 Oct 2021 14:39:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633703994; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=sSLRHtqNzXBreWBcXMWeuNEstLNC79jQk6EwiNmqJ8A=;
 b=Gn6ChtXAzvHoHLxA0AFuJgTLuV1kHmTNTIPLh18Tmh8mUD+wxdf3LUO90xQYrTWvj/V9KfSm
 0hIlC3C8CHj3A7u+rsl+euDkUbILjCNjmvPVmY9E2QY4CIqzKMv8xyPtQ+L68K0IArouLy7U
 Fv+IQ7WA3Uz0pHZ9GHrc9iKLE88=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6160582cf3e5b80f1f021899 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:39:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7F277C4360D; Fri,  8 Oct 2021 14:39:40 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B997C4360C;
 Fri,  8 Oct 2021 14:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1B997C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: netdev@vger.kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 sfr@canb.auug.org.au, geert@linux-m68k.org
Subject: [PATCH net-next] ath11k: fix m68k and xtensa build failure in
 ath11k_peer_assoc_h_smps()
Date: Fri,  8 Oct 2021 17:39:32 +0300
Message-Id: <20211008143932.23884-1-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_073954_206150_BCBDE834 
X-CRM114-Status: GOOD (  14.39  )
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

Stephen reported that ath11k was failing to build on m68k and xtensa:

In file included from <command-line>:0:0:
In function 'ath11k_peer_assoc_h_smps',
    inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:2362:2:
include/linux/compiler_types.h:317:38: error: call to '__compiletime_assert_650' declared with attribute error: FIELD_GET: type of reg too small for mask
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:298:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^
include/linux/compiler_types.h:317:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/bitfield.h:52:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,  \
   ^
include/linux/bitfield.h:108:3: note: in expansion of macro '__BF_FIELD_CHECK'
   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
   ^
drivers/net/wireless/ath/ath11k/mac.c:2079:10: note: in expansion of macro 'FIELD_GET'
   smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,

Fix the issue by using le16_get_bits() to specify the size explicitly.

Fixes: 6f4d70308e5e ("ath11k: support SMPS configuration for 6 GHz")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---

Dave & Jakub, as this fixes a build issue in net-next can you take this
directly to net-next? But if you prefer, I can also send this in a pull
request.

 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 89ab2fa7557c..160740c45dd7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2076,8 +2076,8 @@ static void ath11k_peer_assoc_h_smps(struct ieee80211_sta *sta,
 		smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
 		smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
 	} else {
-		smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,
-				 le16_to_cpu(sta->he_6ghz_capa.capa));
+		smps = le16_get_bits(sta->he_6ghz_capa.capa,
+				     IEEE80211_HE_6GHZ_CAP_SM_PS);
 	}
 
 	switch (smps) {
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
