Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9373C6FA8E
	for <ath11k@archiver.kernel.org>; Tue, 20 Sep 2022 00:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uaaVcyBIt70h/oqQnlFGs4NDdwVOOC9KIVGni2G3N4k=; b=TXV2ZA2rA5Lzyx
	FHWJJogWk3AzRyFckqESbx0DkBiqmsLnYkNrOtxbqnZljGHxIsdnrzS0pE0a/itWoDV9pSnvQE25H
	Xm59oxlUPZXgenKCbMuSDfiLwj74h2S+ipvfx0CbIi47j4lkWTH4bGcZD+0QzPzxAS7qX4uqEocuD
	xrD/BhdFTPR+hnRzPBpAJcdM+pEq7ONKTmQB+IglvQooX1lTgpmh2Lz2lZkcGpp7GvKS/RA+xZ7iZ
	OEr/ovhI8ah2iX9kKfT3d8G+3GVuxTINbmBWMaVDHkITJzAXUULUr2hCszad+lFUr2YmI2dJEg3UR
	cWag6hXVbUy8hKmxwz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaRAg-00GjiU-CP; Tue, 20 Sep 2022 00:31:30 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaRAd-00GjhT-Lh
	for ath11k@lists.infradead.org; Tue, 20 Sep 2022 00:31:28 +0000
Received: by mail-pg1-x536.google.com with SMTP id t190so911685pgd.9
        for <ath11k@lists.infradead.org>; Mon, 19 Sep 2022 17:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3PNG2GhX9MS6pqBLx1SD4wmDS0vBOFDzpiI8k/Y1NQY=;
        b=JkkhATs/ylEliOjshIBZv+N9/k5iW7my8lvUE9I1I77Pv5bpmUCxYJeFHFzHm/9C0t
         d8AF/oT6R3kL4GlNSZuj0/srd5+xF6r+MERfgcMWzbBEdK+Ub7s2WcLu1t/vsdm7T8en
         h4UihtZ2SZA82JjnbDlOex/X7vF+i1F1XeAGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3PNG2GhX9MS6pqBLx1SD4wmDS0vBOFDzpiI8k/Y1NQY=;
        b=0mkLcsK/Zw3iP3jM0wPUTrwyPHT6Zg6RJ50KGIhE/c8LMDUCuHuqWcANQ5JJpxqZfu
         wDa3POqGfncD1xOTXdGBnNrJgVGNLnPsNrupyFZBp5vRwnsuLD2pgQG6L8OXrlt32AIx
         giEGJAbYCApeB//5elgu0PORLz1VhIVwVxTA+6HBlZrL5o7P4FgPjdatUSxPGNhHILni
         /iN4f81IvVlyCIjzPS2WtuAupL2RGIb0rRJj40xBqWNUFGC66Y+BJaa0oNK5yQJ/yJjj
         PHIJf3v3KLHHrTRMkQmgP5/48Yh0hAu8urITvhtNZf4F2jlNvZ5qla9Vq7oqLwl5F5mg
         gjaQ==
X-Gm-Message-State: ACrzQf3hqFQaoNYEYfQS2TX9PAX/Fnw1TqQs/GGR2xAH65uLAnXuYeqP
	O+nISQ7EHqHeyOvyJX2NhdqBC8r6iCXDcw==
X-Google-Smtp-Source: AMsMyM5GDRcjQxtGAMgNL3Tom47j2MIdBldFkbGeDcXaQTVDfAeG2GO9ll7QI+Ah8reV8QQQMslK+A==
X-Received: by 2002:a63:fc14:0:b0:430:d1d0:fe33 with SMTP id j20-20020a63fc14000000b00430d1d0fe33mr17757445pgi.328.1663633884836;
        Mon, 19 Sep 2022 17:31:24 -0700 (PDT)
Received: from localhost (252.157.168.34.bc.googleusercontent.com. [34.168.157.252])
        by smtp.gmail.com with UTF8SMTPSA id d2-20020a170902cec200b0015e8d4eb219sm21403855plg.99.2022.09.19.17.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 17:31:24 -0700 (PDT)
From: Jun Yu <junyuu@chromium.org>
To: ath11k@lists.infradead.org,
	quic_jjohnson@quicinc.com
Cc: linux-wireless@vger.kernel.org,
	Jun Yu <junyuu@chromium.org>
Subject: [PATCH v3] wifi: ath11k: retrieve MAC address from system firmware if provided
Date: Tue, 20 Sep 2022 00:31:17 +0000
Message-Id: <20220920003117.841442-1-junyuu@chromium.org>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_173127_748424_F5BC96DD 
X-CRM114-Status: GOOD (  12.24  )
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

Devices may provide their own MAC address via system firmware (e.g.,
device tree), especially in the case where the device doesn't have a
useful EEPROM on which to store its MAC address (e.g., for integrated
ahb WCN6750).

Use the generic device helper to retrieve the MAC address, and (if
present) honor it above the MAC address advertised by the card.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Jun Yu <junyuu@chromium.org>
---
v2 -> v3: add patch changelog
v1 -> v2: use the updated device_get_mac_address signature

 drivers/net/wireless/ath/ath11k/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7e91e347c9ff2..16a238ef713e7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8967,6 +8967,7 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	struct ath11k_pdev *pdev;
 	int i;
 	int ret;
+	u8 mac_addr[ETH_ALEN] = {0};
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -8979,13 +8980,18 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	if (ret)
 		return ret;
 
+	device_get_mac_address(ab->dev, mac_addr);
+
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
 		if (ab->pdevs_macaddr_valid) {
 			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
 		} else {
-			ether_addr_copy(ar->mac_addr, ab->mac_addr);
+			if (is_zero_ether_addr(mac_addr))
+				ether_addr_copy(ar->mac_addr, ab->mac_addr);
+			else
+				ether_addr_copy(ar->mac_addr, mac_addr);
 			ar->mac_addr[4] += i;
 		}
 
-- 
2.31.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
