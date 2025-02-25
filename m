Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79322C021B2
	for <ath11k@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06mNrTcXCt7RZqY/vp9hneEG+/6i/TGPCj+Z/hxHYlA=; b=2Jufne1nTDOwjdIoawmGTg4l36
	RWTCwDpx6XpIMgHAYzAONt9P6p9IIPEh0iwb/oUS8J2W+ZsiBNqWHiHkezJjfFlON++vL0Ny9xvow
	OFBWCnZc+rX89kOLvkukbFh1jluF28RRCPIp4SZMOSy8gBmvg4jCtUvoNOqdZKGgFA2zFk28mGQcQ
	ojQ0qHz7gsmLZyJgMygUBsIZWLui/YuC1A7v63Kb3vTCi2dIg8uUmoHfR+meuBXuh/k7pOUTG7577
	i5bZpUEVVBFL9741url5njVpvlS2dmEreQEp4dVH4qSmSlhuBqZdnDhP4e+7B8muKUS/kt/9J08UR
	GE1pH+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNt-0000000GcYO-28w4;
	Tue, 25 Feb 2025 09:37:49 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsz-0000000GVkI-35Nv
	for ath11k@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:54 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abb88d2b67eso62170466b.0
        for <ath11k@lists.infradead.org>; Tue, 25 Feb 2025 01:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474352; x=1741079152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06mNrTcXCt7RZqY/vp9hneEG+/6i/TGPCj+Z/hxHYlA=;
        b=eKOmjPJfI8xw1pkIK1lhWCIMJkiwtqtD0BmekNLLEYmKhFRRYgz3pRCC1ea1FGPvsb
         a3AqpoGfNCuncZMLikJKd+0R/JcbgwuQDzK2DeApKs9bm2Zj8cs/hIRiGLIHWqQrojxT
         KniyGMSCUkjSBg29hQPiQevY/qtnOZRi/4ANVYTFfUAO7rQ3t7lTfULadqLkM5jrOs/b
         wycUCmJ1kNeU2M4OnTQxxoR1JDdpKP1VT+rqEC170TFoXhlYdfPzQ64lrTcULIan1p1K
         kZSJHflRiBNsO9yHP8YysYsAhymUJQHXlUOJvwki1l9TTlKagxNSsSbhjnICSZHoeGVd
         sCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474352; x=1741079152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06mNrTcXCt7RZqY/vp9hneEG+/6i/TGPCj+Z/hxHYlA=;
        b=naUHaa+kUuD/puzCCZQMkXrwVcyGehjN5yT9jCWQkLOMUI7o6KsI6kVXm9AibC8X6n
         dc2iaiNjtE4CbWS7DqEpeU5V3aH+UGSM7hmWMUcA4u1jsd/QGrdRcHiX2tKsXIKL2Wm9
         4G7T2WbV/Fxl8vuPJ0bnP2LT7rQlcNwe2D8lfEX1zknn86IgapbR4yo3X3boAgAZu3XA
         jjVh7FoESennkNI5URJvEcTDwcKjHux/iwvKgB16EYjAJagO4xpyYj+YOGU2IxofP8pS
         bF8FCaFO8epyXKlU+KQOOdrJKWA9hjyFJimo4Rd5LcjxBYaESzNuNDgmjb867WBZQmgU
         Xj0A==
X-Forwarded-Encrypted: i=1; AJvYcCUi97cA1BuRrHj+D212bTpuK1bEtKSN1gKFpAOuj+cXXW6zi/qI9XogzRxsam6oEasSecFCmDA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy9vZjXpf/TTamXJ2xsmfP7NQAgtdBWIXxmPjwVdN7nIGaF/Fc
	pbIorID45Xo+vWJmoF4e0N5KV78/96wSzsnC499BcuQhxvCWqcZnfBBHHSVZARQ=
X-Gm-Gg: ASbGncvyVQK82W9TiGj2W6skoeei4i5akMtjsWljqB2ifjdxEbVYwmnZQKBLnSYGpP2
	upFANjzoZEbkhJ9OGaEd/J7+E6BrgE0CydBVdJpQ8Z/mH6ErHBevHg0DQI6pwuNtBx3DpvaD4eB
	daIq509+fuKMwo1iG9ChjCKqphMA8emx5cpYL0vwiRGC2U8xYXJHJbRPZAR2mQpuTAVx4lvNwoT
	grBgBTeVdSdlHc26i631bkPvjeJgeXihhZnenwsu2bObZYj4pmQkMZkZGnQd5pTPoF+oP+VfEmH
	s5aWK43RiIV8vgqtmNmc6nhnwlMtpyBNVR4OmWde/UyhevwD5eERZ1XMU9piEGSo08B5zt7YCq4
	z
X-Google-Smtp-Source: AGHT+IEDtxGszf6g/Wz9H8n07kdbiLAguC+HTfb+C9KwF25d/EzVT9csBJyf0u8/TD2ag29O9+6D5Q==
X-Received: by 2002:a17:907:2ce3:b0:ab7:cb76:1b0f with SMTP id a640c23a62f3a-abc09c13ac8mr618915866b.12.1740474351979;
        Tue, 25 Feb 2025 01:05:51 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d58sm106681566b.148.2025.02.25.01.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:05:36 +0100
Subject: [PATCH 5/5] wifi: ath11k: Deprecate
 qcom,ath11k-calibration-variant properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b-wifi-qcom-calibration-variant-v1-5-3b2aa3f89c53@linaro.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6hubkaofZnp2cNd0Rhz1Eeg6I+8WlSTKZLkOz9iuFt0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvYfkV8bTTIfHJhKZH87D8t+BgcreXLJCy72sZ
 kr5biFJ0H+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72H5AAKCRDBN2bmhouD
 131xD/sHjN99Ymfgrof7h6Xr6tnzgJnCZgaEhjGTTNv3i80kqqMuWrb08dI1DUXY22yHravlpaC
 ZUCtjjHxy439Kos2aTAQFFLQlcjAS5Q5vyMm1C9yBba+euWva3DciwUtfp9zpCUF3din7QQDrTw
 hgqBZU9BGee9SB6ZtEAgjBbJK3ue3/zS3sBIauPN1SAnVUFW5dJvQ8lMoHYXoSVLjzyzwO1R5qU
 8858f3uRrjAfQ0oKz07UPp00NnYA6VW/UnYJkL49kKLyezNTaE/BknhTCcJ3Fphl+dGxAxtYhmD
 fkVk1cfLYOIHpAwByhlwV4GF2CM4//LpLbIFkXwYgOfWWcWWrF0qZOtg83QgTwlprop/6MU33E+
 4gm42ueJZB53b8fxQwGrKsVs3UQuB/tn9V2ob5NxCZVzT9YW7QUwNR0KPz0iBalpSKT6HnqHlPt
 tYo174NQtWATN6pPGOtdfzq+mmrSQURPu9kLUpf4TqL2w9qgUxDItvNwDozEm92nNDEKKM5KmEL
 6yqQ6r46sz8w/PLQKov5hhd0t6CqL4kOQPDZlh2LroRVS4ymjXPpJgF2Yk69RL1O13q4k7ONrnT
 1JkELXUU8ds388D2EdpyLq5ddBmUjV8L4/wRtqqn1pAt9qQJglSaO6SmFxTFBfo/1VYcmu74vI2
 vGjcKg39xJpbpmw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010553_826436_7C95277B 
X-CRM114-Status: UNSURE (   9.55  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add support for calibration-like properties without 'ath11k' prefix,
while still keeping everything backwards compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 65bba0ae69a9a8e869e72b7e6d915577c8fb27d1..3d39ff85ba94ad7229764045e7e6dcab99dd51d5 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1175,8 +1175,11 @@ int ath11k_core_check_dt(struct ath11k_base *ab)
 	if (!node)
 		return -ENOENT;
 
-	of_property_read_string(node, "qcom,ath11k-calibration-variant",
+	of_property_read_string(node, "qcom,calibration-variant",
 				&variant);
+	if (!variant)
+		of_property_read_string(node, "qcom,ath11k-calibration-variant",
+					&variant);
 	if (!variant)
 		return -ENODATA;
 

-- 
2.43.0


