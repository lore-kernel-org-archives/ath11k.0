Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDDFECAAA1
	for <ath11k@archiver.kernel.org>; Mon, 19 Sep 2022 18:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZXiI0IJCypzRYJ5SXcURffuTkKUDWrOXYNLHX0bV/5Q=; b=lra/Dce1m5PYA0
	V3eMz4RtPtv0OYpghdrT7XTe+JnnMI+/dAVs7JBqKT+jhTGyzyRy7XhQEfqFjoxAk3AKCxPKQ87D4
	PmyNhtuddGuYLICrmHjB3ip7XTAN9Vneh2Dlmo1+E25k5roKKnvZVrdc+KcwzD9wO71Qillg5fkkq
	UbiCC+MHCephdV/sZWITrKPX6+zIHpGAikwtjPzHDThGEhw+ljYBbHXfSclqGssoNe6tYNxssk6r4
	lzn6FWsNrbqXcF6Sz1atNJgM1EGP006ANhvmzxRYlo+dLSWADSpc9ZyGBGO6VkEz6B/MC4kY6BRzr
	o+AWdGQV8yIGH6oSgDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaLv3-00DyTD-If; Mon, 19 Sep 2022 18:55:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaLv0-00DyRg-3Y
	for ath11k@lists.infradead.org; Mon, 19 Sep 2022 18:54:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so125967pjh.3
        for <ath11k@lists.infradead.org>; Mon, 19 Sep 2022 11:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=LHt2asP7IS39+HUdIYEAweJxqFZWBJgPF+CNSEdqcO8=;
        b=WiQw1fEwVz1wsac4d7nmD7OuORFCn2snakK0+6I6Z/OXWqZMmpSKVdYRsRtKO+2xOm
         B+MLUNb5DYPux8X3IhnjNc2VPaYGLsmxGwKxZfq0ImkZrBNBd0WR9W9stYxmwdY89Dyg
         nYYLkktQuJEUKyvwJobmeZDJGM64gGp0pjcZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=LHt2asP7IS39+HUdIYEAweJxqFZWBJgPF+CNSEdqcO8=;
        b=B8jSnVjqjW/wtE7vuRQH/Mof+agRCQfjLVkwbvufR9DJraiyaRYXIS4OTjg2RbpOfE
         ADNbZQ5kIRwV92oK6N9xkRuU3YFT/+pKTBoXHXkLrN5CJ4xOdQmxKQ9DrUmNmhKkX4Hq
         DoYQvMMjGhWv7lJogTyiAnDRDunVIwYRRkkrD2N7bNjQPO6K5J3ynPlndVr7f732rck1
         ICJrO/eQmHsQMpIEWiic2mG77nl5BKYeQowk2JUE/MdftryDOlSaYyBW7BSzs95+2Dgz
         XWy0iRiSwSfZiIc3HbCl6TaQcEWNYc0XEHfTXwNNLq4LAOo/szLcHExkDt47vatL5vg4
         QvKA==
X-Gm-Message-State: ACrzQf08CSWRXL058bXGuh8Wju52fdzPoQhQ2jm0TQk8SDEKwRY+jGL3
	FF7K7bJIYK+0XfXVOLqCiNmTgfHFBfL/GA==
X-Google-Smtp-Source: AMsMyM6X5DXgNLS/Eq9ke3FGhQ1UwUPCegmw6Ux0BObi1EdyMkhlWSeIxqlu+DKO+XfDPFQVFc2Pxw==
X-Received: by 2002:a17:903:284:b0:178:2a94:9b6a with SMTP id j4-20020a170903028400b001782a949b6amr1126189plr.135.1663613695340;
        Mon, 19 Sep 2022 11:54:55 -0700 (PDT)
Received: from localhost (57.92.83.34.bc.googleusercontent.com. [34.83.92.57])
        by smtp.gmail.com with UTF8SMTPSA id p14-20020a170902e74e00b00177324a7862sm21354709plf.45.2022.09.19.11.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 11:54:54 -0700 (PDT)
From: Jun Yu <junyuu@chromium.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Jun Yu <junyuu@chromium.org>
Subject: [PATCH v2] wifi: ath11k: retrieve MAC address from system firmware if provided
Date: Mon, 19 Sep 2022 18:54:48 +0000
Message-Id: <20220919185448.545399-1-junyuu@chromium.org>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_115458_188830_0A3ED74F 
X-CRM114-Status: GOOD (  12.22  )
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
