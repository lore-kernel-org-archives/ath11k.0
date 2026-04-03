Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED736E8536E
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=; b=SFisuM32+bzFizJMrBthpQZsdp
	DfT6dHcYv9tZ0xqoFmbqRQgTHB/+gJv+3r+Qjg+Ewi0m8FHVXe+J66stoi1jmMxmgfG53BE6KSKGq
	oBf0IWjdPwi8TM6SnCPzO0b79EWu5J8Wz0k8+vgSjuV4nA8TfdBECxY3TLK0PXzIzl1V00mza8QPt
	yYj/3V52UXZmqCK2caWy8ZbUN/Y8TjiJrhIZ99MPrQhQyoNMFgw95y4RXFBFXKRi2DY/n2hOJJrbh
	Q/HDY6gjPt/U56bxGcnJTc+CwvfU8mAFpRqxCuBpCGgcy7gf0vhxyDikXIH5OLFS1KfcJY5kFC8nh
	qVzQuAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezX-000000026Kd-0R9u;
	Fri, 03 Apr 2026 13:55:19 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezU-000000026JP-1GzW
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 13:55:17 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b97f9587e6eso263019866b.3
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224514; x=1775829314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=;
        b=n2DKSKqkIzQK6VV/5KgC5gifGPlq12iIVUoFIGemik8E0PvW6AB68bx86HNzbmLVIS
         uG76VcvtpYJ8ysIzB+pFIc8/PlrbdAhgM92nPsiA5sQ3ncEBQIVMYEV/+zgbmAh1Uext
         5M375bUf4GAVzpJeYu0qh/1Pq/h8arN+qWP+VppuDNFyyWy+jq3b9GTZS9HU/ulnj7UI
         8cxusM2MO/4aaQ6LYiPtITn5eitg2EFqF2xzShZh7eWIDTiiFrOpo3+hQKx674JVX4e1
         Ap5A8p9r42fc4i0Hg7yW5vFVY91IzSE0LAmS1JtPxtKM2Ffz7HUN+qzNLc/mJiHAdwDl
         L3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224514; x=1775829314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m83BxTeATfqd1UWKENZnthRfrI/lStR1Bw2POp0MJqM=;
        b=D2Bj8+BI0qN17bGHhFc0P+UFzpLlxuCgDqPGfyRSujAnRr1Q1qSX1x/9RFNQMWWd4o
         vZOI07Y1f2pJkXVKZzIDRGst/bNW78SMtFG/EWTYWwuEZz4bEFpj0OQNlZyfTDCHx5zC
         sXOh48weKbut2Ye1S/dvPpHm1cZaaHGaRUFXDUQ5JSgXF0gAudzaDII9Y3uaIUZsp99a
         0vbn8+fbnWbmC2MnABhivPCcRqS0y/i521iqyY8P8EBP6fNqKSeOMPjiXl83UM22K/HO
         fshZEj0v3ifhVpIC7mIe0vFcOuGC0ptwYeOqZRDVNdg7GOsmi7mrPVz+N30kZNUIj4tY
         kcqg==
X-Forwarded-Encrypted: i=1; AJvYcCXSojWiJDkzfK+KTwSAK04Gh88Ifkcwp324Ocks+wBdQ9/OVuX3PsN0L73P6TbDV0lcUDXwXc0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5ihE7ZRrR0P7XL6IlXsP+wyUp954g0a1ics498MWVh+W/SPVN
	5qDm15o7NAr3mpZq8ib+ju3o4Wxu6Ryx0kf0J8aF2a+tUKbup4eUZtLbihqjW1uF1Hs=
X-Gm-Gg: AeBDiev6OD94zNhT0adluTBSLP3TfLcUXhiyurhy0qoyyrGCP4zIKrbBi2jGHJH+9Za
	IchNbkoiR4g2HXk7xC+TkIMwU7hvJy72ib43ZVGn6RYoTKoHXi4VZHQ95hpcUFOn2xc7IEx8xKg
	yl4nMlysXO5PuwH41t7ySZkXisqeh85O4QTDv/8WHg1Ts+rq3E7qEU1Ww/dfjwuMipZnVkyeR7n
	KrcVBdK53WdFv4y+WpTfqGqE01D+BhvT6Kr6KxmNb9VqcGTDE0k0be46PdgTHWzhhqLmmmNPhgv
	wqWI23F41BOgyC5TVrLIuoG32rM+wa1UAq3Ap+jwfbRsABtPUk1QXzPqfAuMc+/qtJIKtcE5pW2
	1/9vgtLqvkZtGAEg8xbr+MrfrkEhJvii95mc2nVrJjvGlWFIZiPgLfi57vwJSChcFrnXE0cj2Y/
	U7u2YPTED5kFYZXZ5cdfms9dY1d5DlkqzEcB7w0ID9zwXG5pIVp1lQxepDJKHKg5Jgkv2nHM+Vr
	2bvYctemw/rm2jiMTfBD8A7muiTOV342O7WAA==
X-Received: by 2002:a17:907:d08f:b0:b9c:10c4:e708 with SMTP id a640c23a62f3a-b9c67a34a9dmr143022066b.42.1775224514386;
        Fri, 03 Apr 2026 06:55:14 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:47 +0200
Subject: [PATCH v2 1/7] regulator: dt-bindings: qcom,qca6390-pmu: Document
 WCN6755 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-1-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1270;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v0N8xo6MFWIwVEW8StRaWQk6fHZBEqBZmxy286b/97Y=;
 b=lmSluzrxl2IvHohqbLRwM8ZeK0TA0Y4HsWh+y4B3jOfVOirTRYkehiK7ceZ42CboR9e5Ts5BN
 rMEWV8MPDVyDP+/ux64qnG2NCnxwOhrrXEqE51f24EPFDrswFgQmVZA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_065516_359405_85DD8051 
X-CRM114-Status: UNSURE (   9.79  )
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

Document the WCN6755 PMU using a fallback to WCN6750 since the two chips
seem to be completely pin and software compatible. In fact the original
downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/regulator/qcom,qca6390-pmu.yaml  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 47c425c9fff1..105174df7df2 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -16,11 +16,17 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,qca6390-pmu
-      - qcom,wcn6750-pmu
-      - qcom,wcn6855-pmu
-      - qcom,wcn7850-pmu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-pmu
+          - const: qcom,wcn6750-pmu
+
+      - enum:
+          - qcom,qca6390-pmu
+          - qcom,wcn6750-pmu
+          - qcom,wcn6855-pmu
+          - qcom,wcn7850-pmu
 
   vdd-supply:
     description: VDD supply regulator handle

-- 
2.53.0


