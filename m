Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45131C6FA82
	for <ath11k@archiver.kernel.org>; Wed, 14 Sep 2022 21:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K8nMPne5FncWswsTFB/CiRk2t50AZNBGPMT7VfRUAv8=; b=NEocpx78i8mSHR
	wxjLsxgZHgrzTieHSOC25HuNmHXAe56g1poQCyXl6a5sQYpe80UATzxFbw2znDVYbDNA0PyHVNw9C
	qeGFBGO7A1autI15uto7fAozAnK0DDbokXv4WgqBez0zmsrEV7cnldQ3DuFY4OSQAlUykFr+NqOF+
	Pz1MRN6JImZX2/or+JTj7V0Z1oR8RawLF764kYnTtbbdqwfiuxs8BUKqmFpfprfF/aVEEmEFtL04L
	F9dVSprfvjgiIU7uANSzmk5uMJwDswWpqVjcFfWDy8qd0tTmRA3fAZvu4zH46u+CNumyZvN1acXXO
	mCvPAmLCPfeFwHIA38BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYaLX-00AqLq-6d; Wed, 14 Sep 2022 21:55:03 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYaLR-00AqD1-SD
	for ath11k@lists.infradead.org; Wed, 14 Sep 2022 21:54:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id n23-20020a17090a091700b00202a51cc78bso14147973pjn.2
        for <ath11k@lists.infradead.org>; Wed, 14 Sep 2022 14:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=J7CDL9lle37BJBHK8KbYdH5/36p6tFHxGpB6pf/8hl8=;
        b=Zm7e6V3orV2XO7UZsEKPCSvTmmFt4sWoifcuIn92eHvnWqkUkMpyoaVnihEE8UZiCX
         8QT8s2xCQSAWkdaVy86ZAndjSYyRj1pFwruvLE1KpWRi91z+fmdcps7sX1w9TAeV2wnF
         QHw2gtNCdCMOXABwyPd12u+RYW49M0l9HRcjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=J7CDL9lle37BJBHK8KbYdH5/36p6tFHxGpB6pf/8hl8=;
        b=dOgmPwvyheMNVzzj4ZtmAhve5muA4lOh47nDPlG4BEyNL5jPloi1LfLm6fLiECH09K
         /9n+3nWFzqb4Rx6e5YOB8cUJqpoY+ICN/wiuE6ExewZqaBtdPcNZeOBs7sHmmoZft364
         b9HaRtmYLOUS5IqQnIYaIttxHnBaaJyPilmVI2PMglBw/elPa1mOEGfjcJGvl8AfpK5D
         MZgME5PIgl/29qERqVhfNt+nSW793GqVMFQEB9whaSObWOlnXIezmNGASd9LEEpxC/Zq
         tYpbyoxoPF0fltxw4B8gIKJSGeoz0ndnqQ0e54sNjcF5YL93GCGl+Uub5H2jBWKihTdD
         TYKg==
X-Gm-Message-State: ACrzQf1irvqABecWJocIGnrgjgzilk+9UupAWrB/0YnYaowP/d3BEesL
	o+toyQ90iRs6N4Lx8MHq1n6TjWFWfAHaVQ==
X-Google-Smtp-Source: AMsMyM5iHfh7Ryf7S125IAf1xHDJpQPJYCqZRiNfAqzIhUSj8M1Rk/BeXxgAmgMGcsB6pqGkf4f3zA==
X-Received: by 2002:a17:90b:3ec9:b0:203:246e:4370 with SMTP id rm9-20020a17090b3ec900b00203246e4370mr3318541pjb.221.1663192492996;
        Wed, 14 Sep 2022 14:54:52 -0700 (PDT)
Received: from localhost (139.69.82.34.bc.googleusercontent.com. [34.82.69.139])
        by smtp.gmail.com with UTF8SMTPSA id u8-20020a170902e5c800b001725d542190sm10927467plf.181.2022.09.14.14.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 14:54:52 -0700 (PDT)
From: Jun Yu <junyuu@chromium.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Jun Yu <junyuu@chromium.org>
Subject: [PATCH] wifi: ath11k: retrieve MAC address from system firmware if provided
Date: Wed, 14 Sep 2022 21:54:08 +0000
Message-Id: <20220914215408.372520-1-junyuu@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_145457_990244_47282341 
X-CRM114-Status: GOOD (  12.52  )
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
 drivers/net/wireless/ath/ath11k/mac.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7e91e347c9ff2..591b2b97ca818 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8,6 +8,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/inetdevice.h>
+#include <linux/property.h>
 #include <net/if_inet6.h>
 #include <net/ipv6.h>
 
@@ -8967,6 +8968,7 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	struct ath11k_pdev *pdev;
 	int i;
 	int ret;
+	u8 mac_addr[ETH_ALEN] = {0};
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -8979,13 +8981,18 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	if (ret)
 		return ret;
 
+	device_get_mac_address(ab->dev, mac_addr, sizeof(ab->mac_addr));
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
2.37.2.789.g6183377224-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
