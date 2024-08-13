Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8566C52D7D
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 19:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fpSg/3y828Pw97blr6HDnxsdU+5aKQgCf2MNnTGXTPg=; b=HUJ4axl1W+gblSz4lPUiAwCkAR
	CuS2qksic03nbVIorVaBbEcUSlM+yoOCiqXEju8Ha/aEnS72Xk9+piQp3aDCio+PXmX1S1OsrSCeF
	49zQ0iQKT/OIHBXuxjCrQIRow8gdYNYQIARgMcoFvhrE/zSJgkDW5s+IHo4mmZWZ/orySz31j3nnu
	U1Em6btjwQoXaKRGiwVjs+WUqR6WnZ3Qm+hDNuD8M62qVB4cL/kV9exeK6XArbfG0D0Ful9COeCXJ
	iMd5iwrC6GuL5AOk3ocUeTjwczFWVKmbBJwq2VZ8tmNBANABk70wcwALQ2bTwtOS/PxvG34EtHg+5
	C+0r8ucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdwnf-00000004haE-31Au;
	Tue, 13 Aug 2024 19:03:19 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdwnc-00000004hZX-3y3m
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 19:03:18 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so7415611e87.1
        for <ath11k@lists.infradead.org>; Tue, 13 Aug 2024 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723575794; x=1724180594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fpSg/3y828Pw97blr6HDnxsdU+5aKQgCf2MNnTGXTPg=;
        b=GahqNc2CzNOT968Z6WcDPVE/EkJa3vZv5VJB2PH+vnbKAgl4+LRK5YgwOMQ3AaAwm6
         msj87Z9owJ/tA53JIdFVOedHy/QlhcQVuGYfOlvzBP1v/rItqKxgOSf2FqpUFL0r8oTr
         uzJVug9Dd//E5ZJHvDUZh6ThH254dE3ZP4PIaZWXfFa2OPG9dBv+2Ai/932e/oYnbkWh
         nN/vqptNKzN14L+JNtq24H1gsRb1fJXDKRROx332b9KNzUjelFAOHP9md0gJZki4h8CO
         BEP3TEyYCvVFZYMVxpFk+ShzXLVLsRZUUc98Fs52U5DzfwUTiiDZK8+mp6HQSBN0W31P
         u8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723575794; x=1724180594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpSg/3y828Pw97blr6HDnxsdU+5aKQgCf2MNnTGXTPg=;
        b=P0G4bAd7JCGwOu7c3o4XstPmeh5nUhdL4l6egLgK+G4sGlwy7VnCFPaeiookoqyjyz
         pY+tmYCMvcWd+U1E6zHbaUxRRj1FHZbuB3wiD+URwRaDTBkUcEh0WRwseOIvAUfuBRaf
         l9swkI8x2+sYYlQRmIRoxEQK2ruTQOxKsLqL+34a/575JkahKPmnuCIj8FCRcqp/aqZv
         1ul1Gwf9/WyBiDiN5iHqg6LKCLUQb2EVPeLnS3/egA6JNjry6uIzJIBzWSmN1RekELDe
         SnJMUw6QYip3m68uU/6BLMx7/hFJ3R2HOz0ipWqbaRFKAyBSwHoKAoUQJxzBPTy5kqtG
         524g==
X-Forwarded-Encrypted: i=1; AJvYcCXCeKHLDNVmMzyzWEypy5JXG342QTrGfx+Ezc0Yhl0QCPq3DEScr8YwaAScTOjJl68R7GTGKUFjOVU4TKjRCD2QDLej9my52redqg==
X-Gm-Message-State: AOJu0YzVjn6R9t97rV0I1UeYfK+dO+tO6yrlqZa9RXZ0INmt+Zm4E2VP
	3v4ECIuDDu1KLQ5I2WkljledcUv03DKsMN5CA6F1YfCnETHQD2fupfsP3RhhK/4=
X-Google-Smtp-Source: AGHT+IH+VagueuQIXMxGnIX0w5CylWhKwU2nLQR+DMf+tI3DEgtgkMQnem1H9OyA00MT+ZbTBm902g==
X-Received: by 2002:a05:6512:2351:b0:52c:b479:902d with SMTP id 2adb3069b0e04-532eda5b0famr222373e87.4.1723575794356;
        Tue, 13 Aug 2024 12:03:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3979:ff54:1b42:968a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c72d8ffsm229487185e9.7.2024.08.13.12.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:03:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] dt-bindings: net: ath11k: document the inputs of the ath11k on WCN6855
Date: Tue, 13 Aug 2024 21:03:05 +0200
Message-ID: <20240813190306.154943-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_120317_009625_97AC9185 
X-CRM114-Status: UNSURE (   6.99  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the inputs from the PMU of the ath11k module on WCN6855.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/wireless/qcom,ath11k-pci.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index 8675d7d0215c..404974d77826 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -50,6 +50,9 @@ properties:
   vddrfa1p7-supply:
     description: VDD_RFA_1P7 supply regulator handle
 
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
   vddpcie0p9-supply:
     description: VDD_PCIE_0P9 supply regulator handle
 
@@ -77,6 +80,22 @@ allOf:
         - vddrfa1p7-supply
         - vddpcie0p9-supply
         - vddpcie1p8-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: pci17cb,1103
+    then:
+      required:
+        - vddrfacmn-supply
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
 
 additionalProperties: false
 
-- 
2.43.0


