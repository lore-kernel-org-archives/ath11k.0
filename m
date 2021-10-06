Return-Path: <SRS0=PBC3=O2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AD9C433EF
	for <ath11k@archiver.kernel.org>; Wed,  6 Oct 2021 08:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E1A610A8
	for <ath11k@archiver.kernel.org>; Wed,  6 Oct 2021 08:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70E1A610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U/qHyyRWtlitBfK5Xc3HEfV5eEqQv71A3IwvT6mhLDs=; b=MeaZQb3tw/pir+
	GdOoDyAH/PMFzpuu2ylEWaWYikLfbcUZdCxMZRa/5H4qwaZvcdWk5TibgqeJ36GUCm1xbJNQpeRax
	op2k3oxL7gVrTtQcaVd6zN64TXCznQTSIzjJzzNF9i/OaJvzEkBsgzOT7Ugcz2/vAgk19DzOkejhS
	Jt2WTX49u4D/1tDh7J3/GEBsADNQ1Y/0okxieW8Hn1ZPenEl30IV3erQCrf/7B+UmqWLKexLE7IAO
	Cmn942R1HCl3qhXXs70BS+ItLo+lNz/CBaXSHuugYTOiyM70DlEiRqj7V5hWwi/TabZQLQ9F/RFXt
	brgB/2LtRg63/H0hOGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY2Lj-00DU88-Oj; Wed, 06 Oct 2021 08:32:27 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY2Lg-00DU5y-Uc
 for ath11k@lists.infradead.org; Wed, 06 Oct 2021 08:32:26 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2ACBA3F045; 
 Wed,  6 Oct 2021 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633509138;
 bh=i7pqd94h/7qZqSjsnCqUp64WqQ62M3udKtVgH1QlXY0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=fIGo8D9Wb4Jk7Owrre+K9F6b7d8Zg67da3as0qK6DmFvoeQTgboIWbLvh3a+Owdrq
 XQ0L2XFdeNcV7jJRshKfACKxnoEV5hlB2PlqTxJcPkOZfsvivT5QV/Bt7szVwaSeb+
 /6g8cbSOfjLNQCDmRZP7gnjSULaF/SX5Dg+cNcSsX2W+2CYH8HVlWwzFAE3XLhyFsT
 MGA6siYJP6QJNG+PTD2hNOdfn1kbkx2CfEKaE1xVAcID0EY5jbEuVyTAAzqnwNekSc
 FbB0qWUYlsdTgzxG/TcVJWfnGHZcQZeazFoJfv4/viEcfeBBBXaaFxQV3N8x4Zz9Fz
 7bsmBI6NgyIhA==
From: Colin King <colin.king@canonical.com>
To: Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ath11k: Fix spelling mistake "incompaitiblity" ->
 "incompatibility"
Date: Wed,  6 Oct 2021 09:32:17 +0100
Message-Id: <20211006083217.349596-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_013225_168147_17993439 
X-CRM114-Status: UNSURE (   9.29  )
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an ath11k_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 31f0cfba5bf5..89ab2fa7557c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7081,7 +7081,7 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 
 		if (!ath11k_mac_validate_vht_he_fixed_rate_settings(ar, band, mask))
 			ath11k_warn(ar->ab,
-				    "could not update fixed rate settings to all peers due to mcs/nss incompaitiblity\n");
+				    "could not update fixed rate settings to all peers due to mcs/nss incompatibility\n");
 		nss = min_t(u32, ar->num_tx_chains,
 			    max(max(ath11k_mac_max_ht_nss(ht_mcs_mask),
 				    ath11k_mac_max_vht_nss(vht_mcs_mask)),
-- 
2.32.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
