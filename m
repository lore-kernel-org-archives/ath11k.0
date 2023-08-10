Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C20C001B0
	for <ath11k@archiver.kernel.org>; Thu, 10 Aug 2023 09:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eo4nlErTDaPYJniDuiTNf9sbRvQOdhlnQbjY7uWTn/0=; b=0nW1q95Qv1b/+N
	h88lxvil/Q5GSoPvY5FjrlxSeWrF+9TcLe+gADaQhdycW3g/v20kYo+6NhCbpMBV62ag2C4UfE6MX
	lBRz0uiY7t/ktwIfS00NDUpDnJ2SsrbOz8Uji+uliCdyFgeWXEN8+QURxpSMS9prbOb7wccqB6/kO
	iFYJzFTnJG1+NXmFkBx0qfB8Rp8W4Oqcp0eMqmIcr5zLtqCuQuxnOdCEWsltAztB7+1IGxaLWUnIt
	BmFmB5rufsogVt8pbhpC7abaJSrRaBtGvggJX1SHeaeCN+GWhP+78D42dE5XXXaGA7XnAbylRGHxU
	ZQaIr6dswnH6djNgjbow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1id-006wkg-0U;
	Thu, 10 Aug 2023 09:12:35 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1ia-006wj8-0Q
	for ath11k@lists.infradead.org;
	Thu, 10 Aug 2023 09:12:33 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe1c285690so953986e87.3
        for <ath11k@lists.infradead.org>; Thu, 10 Aug 2023 02:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691658749; x=1692263549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4vMnao8ynro5sLCotm+nXaNSlXbnXYXpD09POJdN54=;
        b=PRSq9Xj1IwTUFdZFXwacGPyOX36KteDLnBAqQZN52uLMB7PYQf2EPsvnZVy8gGvjbz
         KVFPapCZIm9wwTvAmbRN1QYN03qcVJOOkA+tRZhFv0wKfNH6uoHZyxNWALRl9pcIek9o
         TJgsjeSHCrMGD6ZBzNcLXdiB6Pf3coayM/uku3fWcqyBmunH5meFWWQ+6KbjNdeIgM2n
         LgNwjeG/+D2cmUuILvGz1Ll9sGNZKUOG+O72D9Vaze0sB1oQ5R19ABkR2BzpbaJkKN/2
         aPm6aTaJrmhvP9MNjqsVVIAkntwOlJqyfLVzsIASNvwmN7ecd7armrAo1nfsqWXIq+pz
         4sHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658749; x=1692263549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4vMnao8ynro5sLCotm+nXaNSlXbnXYXpD09POJdN54=;
        b=CnZms7GlG/fY6/Fa154i6nTT4/ApduY2ifUUd5KmOkcfg1u60dPwtwKEF9oM9Vvmld
         C5gufS24zW03sEhwHJtz3TwRO2f+/2il37ygc8TTq9PYjqVIH+NDK7v0mOpwOVfRZ76x
         SPIDcnbsA6sqtA37ckQkaWGXEQJZ3tFk7Dxfj9VPDimhQrBFjgcXMNqPw0C9jiasHvkh
         +AdGJchuE+jDfkFS7bmN3NoaLr3CyFvu0ZuPVLrKz8RVohxLvTs8X9POsTzAuVtaswZm
         H4fG405d4k+wjnxgztD6W4GnrUZGEH3k1AHVSqbOS4gaU8UBk9ij7viaZo+1K9fmvrbH
         o5Mg==
X-Gm-Message-State: AOJu0YxStwag7uJmYF/DcF0obyqpR8j5G5u6Pk7a4bVJ9OydPHEB6Zm9
	dORNEm4uOSmngTAEQ+IZhicTrg==
X-Google-Smtp-Source: AGHT+IGm1zgOhdplBb5O86k8X1Zn50kKdJzv8/v8exGVX3ASOQXPtGqlZ9dJZM2GlvtPlOZOrjv0JA==
X-Received: by 2002:ac2:4d19:0:b0:4f8:5905:8e0a with SMTP id r25-20020ac24d19000000b004f859058e0amr1236690lfi.6.1691658748922;
        Thu, 10 Aug 2023 02:12:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id f14-20020a50ee8e000000b0051ded17b30bsm531961edr.40.2023.08.10.02.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:12:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 2/2] wifi: ath10k: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 11:12:24 +0200
Message-Id: <20230810091224.70088-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
References: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_021232_219477_A42443C5 
X-CRM114-Status: GOOD (  10.88  )
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

'hw_rev' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  ath10k/ahb.c:736:11: error: cast to smaller integer type 'enum ath10k_hw_rev' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index 4a006fb4d424..95bcf54ddc3f 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -733,7 +733,7 @@ static int ath10k_ahb_probe(struct platform_device *pdev)
 	int ret;
 	struct ath10k_bus_params bus_params = {};
 
-	hw_rev = (enum ath10k_hw_rev)of_device_get_match_data(&pdev->dev);
+	hw_rev = (uintptr_t)of_device_get_match_data(&pdev->dev);
 	if (!hw_rev) {
 		dev_err(&pdev->dev, "OF data missing\n");
 		return -EINVAL;
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
