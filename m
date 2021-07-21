Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D709C6377B
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C677E61208
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C677E61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjy5n3ZwBriHmPul0xErY/xLZvlrEdQmh0xllr3dbP0=; b=OQy03uyCaaHQ6C
	vbsxkMMniZZcWiEAH5yWMNAr6H3Uxn+uPzssHkpDgf6dsvm3uY3L59c8am1r5CP+CQqw5Ai3H69s7
	Egp7cE9J6l69iTZ646fypkN1ZlOKjy0kCsGQuCdvw4qk0ZnRC+uRpab+In2gRGti3O7nCd7dcUbdC
	vNZ5E44HmQRGeAnTG3h7rsCi3QkiW3Nx/vct0Gw8OK2krTPaMf2GP1Ju8WXGwUm9sEvYrsskCjzax
	kdomK1/yPkl2CuyVtFX48yPE7yQbeIKu0P1EeWlPs2J0EUtx9rqo6miw5diSxg9QtI+FRBBV1idkB
	qT0m5aCh/Dwuuc4nAHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6JeJ-00HIRQ-FS; Wed, 21 Jul 2021 21:21:03 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6JeG-00HIP5-4m
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 21:21:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626902460; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rv28mMf7EAoTf+QMmrPQVfxSE7SmZkAx/KPPUeILmv8=;
 b=AP///0t9Mg4/NuvXmecrjsG22TwI7jrDE5Cix0ewHy0aRShhyrYUQ/flauXAB/kdrGfZ8wtv
 gPvyQiNAbGnv1pR+peuzYmr0cLIRIGSKS6r0gcLDtWoQEgNEfcCZLX/4PTaMIMlBrbuPt7ax
 dh8u2MYQetcBsDlj9+zUh0MekJE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60f88fb84815712f3ad51333 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 21:20:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 212ACC433D3; Wed, 21 Jul 2021 21:20:56 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3650AC43460;
 Wed, 21 Jul 2021 21:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3650AC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 06/12] ath11k: Assign free_vdev_map value before
 ieee80211_register_hw
Date: Thu, 22 Jul 2021 00:20:23 +0300
Message-Id: <20210721212029.142388-6-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721212029.142388-1-jouni@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_142101_125249_E5375F3C 
X-CRM114-Status: GOOD (  12.95  )
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

From: Seevalamuthu Mariappan <seevalam@codeaurora.org>

Firmware crash is seen randomly, because of sending wrong vdev_id
in vdev_create command. This is due to free_vdev_map value being 0.
free_vdev_map is getting assigned after ieee80211_register_hw. In
some race conditions, add_interface api is getting called before
assigning value to free_vdev_map. Fix this by assigning free_vdev_map
before ieee80211_register_hw.

Also, moved ar->cc_freq_hz and ar->txmgmt_idr initialization before
ieee80211_register_hw to avoid such race conditions.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00948-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1

Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7751ecb2ad81..20121479af6e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7599,6 +7599,10 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
 
+	/* Initialize channel counters frequency value in hertz */
+	ab->cc_freq_hz = IPQ8074_CC_FREQ_HERTZ;
+	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
@@ -7609,18 +7613,14 @@ int ath11k_mac_register(struct ath11k_base *ab)
 			ar->mac_addr[4] += i;
 		}
 
+		idr_init(&ar->txmgmt_idr);
+		spin_lock_init(&ar->txmgmt_idr_lock);
+
 		ret = __ath11k_mac_register(ar);
 		if (ret)
 			goto err_cleanup;
-
-		idr_init(&ar->txmgmt_idr);
-		spin_lock_init(&ar->txmgmt_idr_lock);
 	}
 
-	/* Initialize channel counters frequency value in hertz */
-	ab->cc_freq_hz = IPQ8074_CC_FREQ_HERTZ;
-	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS)) - 1;
-
 	return 0;
 
 err_cleanup:
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
