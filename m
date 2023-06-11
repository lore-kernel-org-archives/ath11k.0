Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04751C7EE2E
	for <ath11k@archiver.kernel.org>; Sun, 11 Jun 2023 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qMIIsiPzKw9URvUDOCc+DPlUlXTf/Bp+/yROF8vyZA=; b=yH8dUF89dLcZCU
	EdnY/n9MnA6/OgAKoYOVy9KEQVmaO/kyp+oUGPINPMVRBN9gjb/WcrZNTKNn7Bx71F0P+sk85pkyZ
	sn8V7CG69wMi5YYncCFhQcUo+qPbvX8af3hACx1mv2L+XHc2eR3irLV+fQjlQA/ab6Bnn6X6NG5Ru
	Oh5RUeOxCl4pfjlZWePXJjOoavvajaJdoHD4Zopr5p6yWWG3pEHe0Qpu4HtvvRJ309cifokB+4LBg
	fAXN5c4Tww3Rgp8bPEdZOr1sIbhmjuvO6x/tjL3SFkZ4mOr0YOtKm07kspQS+1CgLGdzAj382jLTY
	0QyXxLI9d4uZdRSquD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8KKE-000uCg-1o;
	Sun, 11 Jun 2023 12:37:42 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8KKB-000uAk-37
	for ath11k@lists.infradead.org;
	Sun, 11 Jun 2023 12:37:41 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so4735100a12.2
        for <ath11k@lists.infradead.org>; Sun, 11 Jun 2023 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686487055; x=1689079055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV5kS4uFTylsIKBTpLATpLjmqF+bm2uJbZFR1pKIFFU=;
        b=cF6z1xdITZwBuJSfEmjH/z+MYgQa6wthMLGjBetd3+r+x+rszQ+Rm9mZozEEA9cHR7
         2chTWTmNsABqQmt99SjzmNhB5X4R0F/0QIj0/7D558ncNVgwKZwzDuFgzA5U4AdxJsTL
         4S8JPhYcuGHxn1NNbL7+t/QHJTKg0gYiAyDhM7tZ1/Tb9nRsv1RM87ySMLs5kbpulmEH
         Utga4iCqqyo263e32Up7YU2oMkVFX+I1T9KimFgLCDXkJLWm8xYDIAJOFEREkO5/08UO
         n5/9qrB7yxoeu8COJ29bHPXmKtxM+chHgyjz7KlO2IZgkvrkQfa8cj4TG7E3ZynmZQl8
         bfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686487055; x=1689079055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sV5kS4uFTylsIKBTpLATpLjmqF+bm2uJbZFR1pKIFFU=;
        b=lKNHPywK+jqVnYeNjGOce51Pc34BfgsdiLAT7jG+KmpGYZdxaDdC7HnDu7tm0D4WQg
         DOnCjzSY3ZFf10m1XV/tE71hDwVEzYMGw2rV24arfBpgJ/Qdfd1xDzbp3kLtNgcpNrlf
         rcDvk3X9Is3NCdBoNYbiESh5j3PGdHiwm8RKhcW7nAckcl2R3Vk3/vlxPgNJOoN1N0Ke
         ftuezsgQJaY6e/1B2J+20E6jarEtXhBbqj/hfWj+Mhnwv5wZON6Qyy16IMnGYn/aHIQ6
         hRsW77SblzHBaCl0G0fd1ZdtgD9nclsx6EIP6MrvY/anOqkd3rGey//wVa1H3wA7Sdia
         j9Ow==
X-Gm-Message-State: AC+VfDxlCFZQ4VrHJo3alteWxQ23kUsQfsjnPf1+8DMcnN7KTFBGsu7j
	H30GnpUrTpBj7zCjjrfCVoY=
X-Google-Smtp-Source: ACHHUZ5VWP0NHERLXgSX8/htApGTFSp4xIZ43YimlNMEmqPkZyr/BbV5qoFPogbWxjoMRvXLVK0GgA==
X-Received: by 2002:a17:907:a0d:b0:978:6fbf:869c with SMTP id bb13-20020a1709070a0d00b009786fbf869cmr7003552ejc.16.1686487054755;
        Sun, 11 Jun 2023 05:37:34 -0700 (PDT)
Received: from shift.daheim (p4fd09ff6.dip0.t-ipconnect.de. [79.208.159.246])
        by smtp.gmail.com with ESMTPSA id dx15-20020a170906a84f00b0097bb01516c2sm2738842ejb.0.2023.06.11.05.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 05:37:33 -0700 (PDT)
Received: from chuck by shift.daheim with local (Exim 4.96)
	(envelope-from <chuck@shift.daheim>)
	id 1q8KK4-000LN5-2Z;
	Sun, 11 Jun 2023 14:37:32 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: kvalo@kernel.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: [PATCH v2 2/2] wifi: ath11k: add support DT ieee80211-freq-limit
Date: Sun, 11 Jun 2023 14:37:32 +0200
Message-Id: <ed266944c721de8dbf0fe35f387a3a71b2c84037.1686486468.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com>
References: <fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_053740_000781_B3AB4CA7 
X-CRM114-Status: UNSURE (   8.92  )
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

The common DT property can be used to limit the available
channels/frequencies. But ath11k has to manually call
wiphy_read_of_freq_limits().

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
compile-tested only.
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c947d1c8d8c1..7e43f2770f27 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9414,6 +9414,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (ret)
 		goto err;
 
+	wiphy_read_of_freq_limits(ar->hw->wiphy);
 	ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
 	ath11k_mac_setup_he_cap(ar, cap);
 
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
